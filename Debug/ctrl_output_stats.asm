	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stats.c
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
PUBLIC	_ctrl_calc_output_fieldval_tooltip
EXTRN	_mem_free:NEAR
EXTRN	_put_value_fmt:NEAR
EXTRN	_html_tooltip:BYTE
EXTRN	_dynbuf_add:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_DATA	SEGMENT
$SG70217 DB	'[', 00H
	ORG $+2
$SG70219 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70223 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70226 DB	'=', 00H
	ORG $+2
$SG70228 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70233 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70237 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70240 DB	']', 00H
	ORG $+2
$SG70242 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70244 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG70245 DB	'ctrl_calc_output_fieldval_tooltip', 00H
	ORG $+2
$SG70247 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG70248 DB	'ctrl_calc_output_fieldval_tooltip', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pvf$ = 12
_i$ = 16
_tmp$ = -8
_html$ = -4
_ctrl_calc_output_fieldval_tooltip PROC NEAR

; 27   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 28   : 	DynBuffer *tmp = NULL;

	mov	DWORD PTR _tmp$[ebp], 0

; 29   : 	DynBuffer **html = cntxt->form->html;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR _html$[ebp], edx

; 30   : 
; 31   : 	DYNBUF_ADD_STR(html, "[");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70217
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70216
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70219
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 31		; 0000001fH
	jmp	$eva_err$70220
$L70216:

; 32   : 	DYNBUF_ADD(html, pvf->label, 0, HTML_TOOLTIP);

	push	1
	push	OFFSET FLAT:_html_tooltip
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70221
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70223
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 32		; 00000020H
	jmp	$eva_err$70220
$L70221:

; 33   : 	DYNBUF_ADD_STR(html, "=");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70226
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70225
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70228
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 33		; 00000021H
	jmp	$eva_err$70220
$L70225:

; 34   : 	if(dyntab_sz(&pvf->labels, i, 0))

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70229

; 36   : 		if(put_value_fmt(cntxt, &tmp, DYNTAB_VAL_SZ(&pvf->labels, i, 0), pvf->dispfmt)) STACK_ERROR;

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+304]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _tmp$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_value_fmt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70230
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 36		; 00000024H
	jmp	$eva_err$70220
$L70230:

; 37   : 		DYNBUF_ADD_BUF(html, tmp, HTML_TOOLTIP);

	cmp	DWORD PTR _tmp$[ebp], 0
	je	SHORT $L70231
	push	1
	push	OFFSET FLAT:_html_tooltip
	mov	ecx, DWORD PTR _tmp$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _tmp$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70231
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70233
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 37		; 00000025H
	jmp	$eva_err$70220
$L70231:

; 39   : 	else

	jmp	SHORT $L70235
$L70229:

; 40   : 		DYNBUF_ADD_CELL(html, &pvf->emptyval, 0, 0, HTML_TOOLTIP);

	push	1
	push	OFFSET FLAT:_html_tooltip
	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 492				; 000001ecH
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 492				; 000001ecH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70235
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70237
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 40		; 00000028H
	jmp	SHORT $eva_err$70220
$L70235:

; 41   : 	DYNBUF_ADD_STR(html, "]");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70240
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70239
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70242
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 41		; 00000029H
	jmp	SHORT $eva_err$70220
$L70239:
$eva_noerr$70243:

; 42   : 
; 43   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70244
	push	OFFSET FLAT:$SG70245
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70220:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70246
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70247
	push	OFFSET FLAT:$SG70248
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70246:
	mov	edx, DWORD PTR _tmp$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _tmp$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 44   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_calc_output_fieldval_tooltip ENDP
_TEXT	ENDS
PUBLIC	_ctrl_calc_output_pvt_val
EXTRN	_number_space_thousands:NEAR
EXTRN	_human_filesize:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_strtoul:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_put_showhelp:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
$SG70274 DB	01H DUP (?)
	ALIGN	4

$SG70343 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70277 DB	'_EVA_PVTLIST_ALWAYS', 00H
$SG70280 DB	'&nbsp;', 00H
	ORG $+1
$SG70282 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70286 DB	' fiche', 00H
	ORG $+1
$SG70287 DB	'<a title=''', 00H
	ORG $+1
$SG70289 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70293 DB	's', 00H
	ORG $+2
$SG70295 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70298 DB	' ', 00H
	ORG $+2
$SG70300 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70305 DB	' ', 0a4H, ' ', 00H
$SG70307 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70311 DB	0aH, 00H
	ORG $+2
$SG70313 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70317 DB	'Cliquez pour ouvrir la fiche', 00H
	ORG $+3
$SG70319 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70323 DB	'Cliquez pour voir la liste des fiches', 00H
	ORG $+2
$SG70325 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70328 DB	'''', 00H
	ORG $+2
$SG70330 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70340 DB	'PVTLIST=%lu,%ld,%ld,%ld,%lu,%lu', 00H
$SG70344 DB	'B$#.OPENOBJ=', 00H
	ORG $+3
$SG70346 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70350 DB	'");''>', 00H
	ORG $+2
$SG70351 DB	' href=''javascript:cb("', 00H
	ORG $+1
$SG70353 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70355 DB	'_EVA_FILESIZE', 00H
	ORG $+2
$SG70359 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70363 DB	'_EVA_SINGLE', 00H
$SG70366 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70370 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70374 DB	'</a>', 00H
	ORG $+3
$SG70376 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70379 DB	'&nbsp;', 00H
	ORG $+1
$SG70381 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70383 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG70384 DB	'ctrl_calc_output_pvt_val', 00H
	ORG $+3
$SG70386 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG70387 DB	'ctrl_calc_output_pvt_val', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_pv$ = 16
_i$ = 20
_j$ = 24
_form$ = -16
_ctrl$ = -40
_name$ = -36
_c$ = -28
_html$ = -24
_b_vallinks$ = -12
_b_row$ = -20
_b_col$ = -8
_fmt$ = -4
_always_list$ = -32
_rc$70334 = -104
_ctrl_calc_output_pvt_val PROC NEAR

; 60   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 144				; 00000090H

; 61   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 62   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 63   : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 64   : 	DynTableCell *c = dyntab_cell(pv->res, i, j);

	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$[ebp], eax

; 65   : 	DynBuffer **html = form->html;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR _html$[ebp], ecx

; 66   : 	int b_vallinks = pv->clicmode[0] &&	c && c->IdObj > 0 && !pv->exportparams;

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+128]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L73065
	cmp	DWORD PTR _c$[ebp], 0
	je	SHORT $L73065
	mov	edx, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [edx+20], 0
	jbe	SHORT $L73065
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+94136], 0
	jne	SHORT $L73065
	mov	DWORD PTR -108+[ebp], 1
	jmp	SHORT $L73066
$L73065:
	mov	DWORD PTR -108+[ebp], 0
$L73066:
	mov	ecx, DWORD PTR -108+[ebp]
	mov	DWORD PTR _b_vallinks$[ebp], ecx

; 67   : 	int b_row = i < ROWCNT;

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L73067
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -112+[ebp], edx
	jmp	SHORT $L73068
$L73067:
	mov	DWORD PTR -112+[ebp], 0
$L73068:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR -112+[ebp]
	sbb	ecx, ecx
	neg	ecx
	mov	DWORD PTR _b_row$[ebp], ecx

; 68   : 	int b_col = j < COLCNT;

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+204], 0
	je	SHORT $L73069
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -116+[ebp], edx
	jmp	SHORT $L73070
$L73069:
	mov	DWORD PTR -116+[ebp], 0
$L73070:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR -116+[ebp]
	sbb	ecx, ecx
	neg	ecx
	mov	DWORD PTR _b_col$[ebp], ecx

; 69   : 	char *fmt = pv->data ? pv->data->dispfmt : "";

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+208], 0
	je	SHORT $L73071
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	mov	edx, DWORD PTR [ecx+304]
	mov	DWORD PTR -120+[ebp], edx
	jmp	SHORT $L73072
$L73071:
	mov	DWORD PTR -120+[ebp], OFFSET FLAT:$SG70274
$L73072:
	mov	eax, DWORD PTR -120+[ebp]
	mov	DWORD PTR _fmt$[ebp], eax

; 70   : 	int always_list = DYNTAB_FIELD_CELL(pv->srcdata, PVTLIST_ALWAYS) != NULL;

	push	0
	push	-1
	push	OFFSET FLAT:$SG70277
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _always_list$[ebp], eax

; 71   : 
; 72   : 	DYNBUF_ADD_STR(html, "&nbsp;");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70280
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70279
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70282
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 72		; 00000048H
	jmp	$eva_err$70283
$L70279:

; 73   : 	if(b_vallinks)

	cmp	DWORD PTR _b_vallinks$[ebp], 0
	je	$L70349

; 75   : 
; 76   : 		/* Prepare title for link to objects list */
; 77   : 		DYNBUF_ADD3_INT(html, "<a title='", c->IdObj, " fiche");

	push	6
	push	OFFSET FLAT:$SG70286
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70287
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70285
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70289
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 77		; 0000004dH
	jmp	$eva_err$70283
$L70285:

; 78   : 		if(c->IdObj > 1) DYNBUF_ADD_STR(html, "s");

	mov	edx, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [edx+20], 1
	jbe	SHORT $L70292
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70293
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70292
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70295
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 78		; 0000004eH
	jmp	$eva_err$70283
$L70292:

; 79   : 		DYNBUF_ADD_STR(html, " ");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70298
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70297
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70300
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 79		; 0000004fH
	jmp	$eva_err$70283
$L70297:

; 80   : 		if(b_row && ctrl_calc_output_fieldval_tooltip(cntxt, pv->row, i)) STACK_ERROR;

	cmp	DWORD PTR _b_row$[ebp], 0
	je	SHORT $L70301
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_calc_output_fieldval_tooltip
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70301
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 80		; 00000050H
	jmp	$eva_err$70283
$L70301:

; 81   : 		if(b_row && b_col) DYNBUF_ADD_STR(html, " ¤ ");

	cmp	DWORD PTR _b_row$[ebp], 0
	je	SHORT $L70304
	cmp	DWORD PTR _b_col$[ebp], 0
	je	SHORT $L70304
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70305
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70304
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70307
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 81		; 00000051H
	jmp	$eva_err$70283
$L70304:

; 82   : 		if(b_col && ctrl_calc_output_fieldval_tooltip(cntxt, pv->col, j)) STACK_ERROR;

	cmp	DWORD PTR _b_col$[ebp], 0
	je	SHORT $L70308
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_calc_output_fieldval_tooltip
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70308
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 82		; 00000052H
	jmp	$eva_err$70283
$L70308:

; 83   : 		DYNBUF_ADD_STR(html, "\n");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70311
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70310
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70313
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 83		; 00000053H
	jmp	$eva_err$70283
$L70310:

; 84   : 		if(c->IdObj == 1&& !always_list)

	mov	ecx, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [ecx+20], 1
	jne	SHORT $L70314
	cmp	DWORD PTR _always_list$[ebp], 0
	jne	SHORT $L70314

; 86   : 			DYNBUF_ADD_STR(html, "Cliquez pour ouvrir la fiche");

	push	0
	push	0
	push	28					; 0000001cH
	push	OFFSET FLAT:$SG70317
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70316
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70319
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 86		; 00000056H
	jmp	$eva_err$70283
$L70316:

; 88   : 		else

	jmp	SHORT $L70322
$L70314:

; 89   : 			DYNBUF_ADD_STR(html, "Cliquez pour voir la liste des fiches");

	push	0
	push	0
	push	37					; 00000025H
	push	OFFSET FLAT:$SG70323
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70322
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70325
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 89		; 00000059H
	jmp	$eva_err$70283
$L70322:

; 90   : 		DYNBUF_ADD_STR(html, "'");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70328
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70327
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70330
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 90		; 0000005aH
	jmp	$eva_err$70283
$L70327:

; 91   : 		if(put_showhelp(cntxt, html)) STACK_ERROR;

	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_showhelp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70331
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 91		; 0000005bH
	jmp	$eva_err$70283
$L70331:

; 92   : 
; 93   : 		/* Prepare button name for link to objects list */
; 94   : 		if(c->IdObj > 1 || always_list)

	mov	edx, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [edx+20], 1
	ja	SHORT $L70333
	cmp	DWORD PTR _always_list$[ebp], 0
	je	$L70332
$L70333:

; 96   : 			char rc[64];
; 97   : 			if(ctrl_cgi_name(cntxt, ctrl, NULL, 1, &name, 'B',
; 98   : 					rc, sprintf(rc, "PVTLIST=%lu,%ld,%ld,%ld,%lu,%lu",
; 99   : 									pv->srcdata->cell->IdObj,
; 100  : 									(long int)(pv->data ? pv->data - pv->datas : 0),
; 101  : 									(long int)(pv->row ? pv->row - pv->rows : 0),
; 102  : 									(long int)(pv->col ? pv->col - pv->cols : 0),
; 103  : 									i, j)))

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+204], 0
	je	SHORT $L73073
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 78704				; 00013370H
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	sub	eax, ecx
	cdq
	mov	ecx, 616				; 00000268H
	idiv	ecx
	mov	DWORD PTR -124+[ebp], eax
	jmp	SHORT $L73074
$L73073:
	mov	DWORD PTR -124+[ebp], 0
$L73074:
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L73075
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 60216				; 0000eb38H
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	sub	edx, eax
	mov	eax, edx
	cdq
	mov	ecx, 616				; 00000268H
	idiv	ecx
	mov	DWORD PTR -128+[ebp], eax
	jmp	SHORT $L73076
$L73075:
	mov	DWORD PTR -128+[ebp], 0
$L73076:
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+208], 0
	je	SHORT $L73077
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 81792				; 00013f80H
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+208]
	sub	edx, eax
	mov	eax, edx
	cdq
	mov	ecx, 616				; 00000268H
	idiv	ecx
	mov	DWORD PTR -132+[ebp], eax
	jmp	SHORT $L73078
$L73077:
	mov	DWORD PTR -132+[ebp], 0
$L73078:
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR -124+[ebp]
	push	ecx
	mov	edx, DWORD PTR -128+[ebp]
	push	edx
	mov	eax, DWORD PTR -132+[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	push	OFFSET FLAT:$SG70340
	lea	edx, DWORD PTR _rc$70334[ebp]
	push	edx
	call	_sprintf
	add	esp, 32					; 00000020H
	push	eax
	lea	eax, DWORD PTR _rc$70334[ebp]
	push	eax
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70339

; 104  : 				STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 104		; 00000068H
	jmp	$eva_err$70283
$L70339:

; 106  : 		else

	jmp	SHORT $L70342
$L70332:

; 107  : 			DYNBUF_ADD3_INT(&name, "B$#.OPENOBJ=", c->IdValObj, "");

	push	0
	push	OFFSET FLAT:$SG70343
	mov	edx, DWORD PTR _c$[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70344
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70342
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70346
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 107		; 0000006bH
	jmp	$eva_err$70283
$L70342:

; 108  : 		DYNBUF_ADD3_BUF(html, " href='javascript:cb(\"", name, NO_CONV, "\");'>");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L73079
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -136+[ebp], edx
	jmp	SHORT $L73080
$L73079:
	mov	DWORD PTR -136+[ebp], 0
$L73080:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L73081
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	mov	DWORD PTR -140+[ebp], eax
	jmp	SHORT $L73082
$L73081:
	mov	DWORD PTR -140+[ebp], 0
$L73082:
	push	5
	push	OFFSET FLAT:$SG70350
	push	0
	push	0
	mov	ecx, DWORD PTR -136+[ebp]
	push	ecx
	mov	edx, DWORD PTR -140+[ebp]
	push	edx
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70351
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70349
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70353
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 108		; 0000006cH
	jmp	$eva_err$70283
$L70349:

; 110  : 
; 111  : 	/* Output cell value & footer */
; 112  : 	if(!strcmp(fmt, "_EVA_FILESIZE"))

	push	OFFSET FLAT:$SG70355
	mov	eax, DWORD PTR _fmt$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70354

; 114  : 		DYNBUF_ADD(html, human_filesize(strtoul(dyntab_val(pv->res, i, j), NULL, 10)), 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	call	_human_filesize
	add	esp, 4
	push	eax
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70357
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70359
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 114		; 00000072H
	jmp	$eva_err$70283
$L70357:

; 116  : 	else if(pv->exportparams ||

	jmp	$L70368
$L70354:

; 117  : 			(pv->data && !strcmp(dyntab_val(&pv->data->percent, 0, 0), "_EVA_SINGLE")))

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94136], 0
	jne	SHORT $L70362
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+208], 0
	je	$L70361
	push	OFFSET FLAT:$SG70363
	push	0
	push	0
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+208]
	add	edx, 164				; 000000a4H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70361
$L70362:

; 119  : 		DYNBUF_ADD_CELL(html, pv->res, i, j, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+212]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70364
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70366
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 119		; 00000077H
	jmp	$eva_err$70283
$L70364:

; 121  : 	else

	jmp	$L70368
$L70361:

; 122  : 		DYNBUF_ADD(html, number_space_thousands(dyntab_val(pv->res, i, j), pv->data ? pv->data->decimals : 0), 0, TO_HTML);

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+208], 0
	je	SHORT $L73083
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	mov	edx, DWORD PTR [ecx+364]
	mov	DWORD PTR -144+[ebp], edx
	jmp	SHORT $L73084
$L73083:
	mov	DWORD PTR -144+[ebp], 0
$L73084:
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR -144+[ebp]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_number_space_thousands
	add	esp, 8
	push	eax
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70368
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70370
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 122		; 0000007aH
	jmp	$eva_err$70283
$L70368:

; 123  : 	if(b_vallinks) DYNBUF_ADD_STR(html, "</a>");

	cmp	DWORD PTR _b_vallinks$[ebp], 0
	je	SHORT $L70373
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70374
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70373
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70376
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 123		; 0000007bH
	jmp	SHORT $eva_err$70283
$L70373:

; 124  : 	DYNBUF_ADD_STR(html, "&nbsp;");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70379
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70378
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70381
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 124		; 0000007cH
	jmp	SHORT $eva_err$70283
$L70378:
$eva_noerr$70382:

; 125  : 
; 126  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70383
	push	OFFSET FLAT:$SG70384
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70283:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70385
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70386
	push	OFFSET FLAT:$SG70387
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70385:
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 127  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_calc_output_pvt_val ENDP
_TEXT	ENDS
PUBLIC	_ctrl_calc_output_title
EXTRN	_put_html_button_sz:NEAR
EXTRN	_strlen:NEAR
EXTRN	_ctrl_add_symbol_btn:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70406 DB	'EXPORTPVT=%lu', 00H
	ORG $+2
$SG70412 DB	'<table width=100%><tr><td class=NoBorder>', 00H
	ORG $+2
$SG70414 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70418 DB	'LABEL+OBJNOTES', 00H
	ORG $+1
$SG70421 DB	'</td><td align=right class=NoBorder>', 00H
	ORG $+3
$SG70423 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70426 DB	'Cliquez pour obtenir le tableau de statistiques au forma'
	DB	't Excel', 00H
$SG70427 DB	'_eva_excel_icon_small_s.gif', 00H
$SG70428 DB	'_eva_excel_icon_small.gif', 00H
	ORG $+2
$SG70429 DB	'Exporter', 00H
	ORG $+3
$SG70432 DB	'</td></tr></table>', 00H
	ORG $+1
$SG70434 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70438 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70440 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG70441 DB	'ctrl_calc_output_title', 00H
	ORG $+1
$SG70443 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG70444 DB	'ctrl_calc_output_title', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_pv$ = 16
_form$ = -4
_ctrl$ = -16
_html$ = -8
_name$ = -12
_tmp$70405 = -48
_ctrl_calc_output_title PROC NEAR

; 141  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H

; 142  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 143  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 144  : 	DynBuffer **html = form->html;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _html$[ebp], eax

; 145  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 146  : 	if(pv->srcdata->nbrows && !pv->exportparams)

	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	cmp	DWORD PTR [edx], 0
	je	$L70404
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+94136], 0
	jne	$L70404

; 148  : 		char tmp[32];
; 149  : 		sprintf(tmp, "EXPORTPVT=%lu", pv->srcdata->cell->IdObj);

	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	push	OFFSET FLAT:$SG70406
	lea	edx, DWORD PTR _tmp$70405[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 150  : 		if(ctrl_cgi_name(cntxt, ctrl, NULL, 1, &name, 'B', tmp, strlen(tmp))) STACK_ERROR;

	lea	eax, DWORD PTR _tmp$70405[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	lea	ecx, DWORD PTR _tmp$70405[ebp]
	push	ecx
	push	66					; 00000042H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70408
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 150		; 00000096H
	jmp	$eva_err$70409
$L70408:

; 151  : 		DYNBUF_ADD_STR(html, "<table width=100%><tr><td class=NoBorder>");

	push	0
	push	0
	push	41					; 00000029H
	push	OFFSET FLAT:$SG70412
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70411
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70414
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 151		; 00000097H
	jmp	$eva_err$70409
$L70411:

; 152  : 		if(ctrl_add_symbol_btn(cntxt, ctrl, NULL, pv->srcdata, 0, NULL, "LABEL+OBJNOTES"))

	push	OFFSET FLAT:$SG70418
	push	0
	push	0
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	push	ecx
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_symbol_btn
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70417

; 153  : 			STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 153		; 00000099H
	jmp	$eva_err$70409
$L70417:

; 154  : 		DYNBUF_ADD_STR(html, "</td><td align=right class=NoBorder>");

	push	0
	push	0
	push	36					; 00000024H
	push	OFFSET FLAT:$SG70421
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70420
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70423
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 154		; 0000009aH
	jmp	$eva_err$70409
$L70420:

; 155  : 		if(!pv->rowcolclic && put_html_button(cntxt, name->data, "Exporter", "_eva_excel_icon_small.gif", "_eva_excel_icon_small_s.gif",
; 156  : 			"Cliquez pour obtenir le tableau de statistiques au format Excel", 0, 0)) STACK_ERROR;

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94220], 0
	jne	SHORT $L70425
	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70426
	push	OFFSET FLAT:$SG70427
	push	OFFSET FLAT:$SG70428
	push	OFFSET FLAT:$SG70429
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70425
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 156		; 0000009cH
	jmp	$eva_err$70409
$L70425:

; 157  : 		DYNBUF_ADD_STR(html, "</td></tr></table>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70432
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70431
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70434
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 157		; 0000009dH
	jmp	SHORT $eva_err$70409
$L70431:

; 159  : 	else

	jmp	SHORT $L70436
$L70404:

; 160  : 		DYNBUF_ADD(html, pv->label, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70436
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70438
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 160		; 000000a0H
	jmp	SHORT $eva_err$70409
$L70436:
$eva_noerr$70439:

; 161  : 
; 162  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70440
	push	OFFSET FLAT:$SG70441
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70409:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70442
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70443
	push	OFFSET FLAT:$SG70444
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70442:
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 163  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_calc_output_title ENDP
_TEXT	ENDS
PUBLIC	_ctrl_calc_output_fieldval_objlist
_DATA	SEGMENT
	ORG $+1
$SG70461 DB	'<u>', 00H
$SG70463 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70467 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70470 DB	'=<b>', 00H
	ORG $+3
$SG70472 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70477 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70481 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70484 DB	'</b></u>', 00H
	ORG $+3
$SG70486 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70488 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG70489 DB	'ctrl_calc_output_fieldval_objlist', 00H
	ORG $+2
$SG70491 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG70492 DB	'ctrl_calc_output_fieldval_objlist', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pvf$ = 12
_i$ = 16
_tmp$ = -8
_html$ = -4
_ctrl_calc_output_fieldval_objlist PROC NEAR

; 177  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 178  : 	DynBuffer *tmp = NULL;

	mov	DWORD PTR _tmp$[ebp], 0

; 179  : 	DynBuffer **html = cntxt->form->html;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR _html$[ebp], edx

; 180  : 
; 181  : 	DYNBUF_ADD_STR(html, "<u>");

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70461
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70460
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70463
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 181		; 000000b5H
	jmp	$eva_err$70464
$L70460:

; 182  : 	DYNBUF_ADD(html, pvf->label, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70465
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70467
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 182		; 000000b6H
	jmp	$eva_err$70464
$L70465:

; 183  : 	DYNBUF_ADD_STR(html, "=<b>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70470
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70469
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70472
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 183		; 000000b7H
	jmp	$eva_err$70464
$L70469:

; 184  : 	if(dyntab_sz(&pvf->labels, i, 0))

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70473

; 186  : 		if(put_value_fmt(cntxt, &tmp, DYNTAB_VAL_SZ(&pvf->labels, i, 0), pvf->dispfmt)) STACK_ERROR;

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+304]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _tmp$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_value_fmt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70474
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 186		; 000000baH
	jmp	$eva_err$70464
$L70474:

; 187  : 		DYNBUF_ADD_BUF(html, tmp, TO_HTML);

	cmp	DWORD PTR _tmp$[ebp], 0
	je	SHORT $L70475
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR _tmp$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _tmp$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70475
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70477
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 187		; 000000bbH
	jmp	$eva_err$70464
$L70475:

; 189  : 	else

	jmp	SHORT $L70479
$L70473:

; 190  : 		DYNBUF_ADD_CELL(html, &pvf->emptyval, 0, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 492				; 000001ecH
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 492				; 000001ecH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70479
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70481
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 190		; 000000beH
	jmp	SHORT $eva_err$70464
$L70479:

; 191  : 	DYNBUF_ADD_STR(html, "</b></u>");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70484
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70483
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70486
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 191		; 000000bfH
	jmp	SHORT $eva_err$70464
$L70483:
$eva_noerr$70487:

; 192  : 
; 193  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70488
	push	OFFSET FLAT:$SG70489
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70464:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70490
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70491
	push	OFFSET FLAT:$SG70492
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70490:
	mov	edx, DWORD PTR _tmp$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _tmp$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 194  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_calc_output_fieldval_objlist ENDP
_TEXT	ENDS
PUBLIC	_ctrl_calc_prepare_objlist
EXTRN	_dyntab_add:NEAR
EXTRN	_qry_eval_sqlexpr_var:NEAR
EXTRN	_strchr:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70518 DB	'<-', 00H
	ORG $+1
$SG70520 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70526 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70529 DB	'->', 00H
	ORG $+1
$SG70531 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70535 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG70536 DB	'ctrl_calc_prepare_objlist', 00H
	ORG $+2
$SG70543 DB	'***', 00H
$SG70545 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70546 DB	'_EVA_DISPLAYFIELDS', 00H
	ORG $+1
$SG70554 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70555 DB	'_EVA_DISPLAYLABELS', 00H
	ORG $+1
$SG70564 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70565 DB	'_EVA_DISPLAYFORMAT', 00H
	ORG $+1
$SG70566 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG70567 DB	'ctrl_calc_prepare_objlist', 00H
	ORG $+2
$SG70569 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG70570 DB	'ctrl_calc_prepare_objlist', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_disptbldata$ = 12
_col$ = 16
_pvf$ = 20
_expr$ = -4
___tab$70537 = -20
___row$70538 = -16
___col$70539 = -12
__c$70540 = -8
___tab$70547 = -36
___row$70548 = -32
___col$70549 = -28
__c$70550 = -24
___tab$70557 = -52
___row$70558 = -48
___col$70559 = -44
__c$70560 = -40
_ctrl_calc_prepare_objlist PROC NEAR

; 209  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH

; 210  : 	DynBuffer *expr = NULL;

	mov	DWORD PTR _expr$[ebp], 0

; 211  : 	if(!pvf || !dyntab_sz(&pvf->expr, 0, 0)) RETURN_OK;

	cmp	DWORD PTR _pvf$[ebp], 0
	je	SHORT $L70509
	push	0
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 4
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70508
$L70509:
	jmp	$eva_noerr$70510
$L70508:

; 212  : 
; 213  : 	/* Handle relation to base table */
; 214  : 	/* TODO use FROM clause if relation to SQL expression */
; 215  : 	switch(pvf->relmode) {

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+536]
	mov	DWORD PTR -56+[ebp], edx
	cmp	DWORD PTR -56+[ebp], 1
	je	SHORT $L70517
	cmp	DWORD PTR -56+[ebp], 2
	je	SHORT $L70515
	jmp	$L70528
$L70515:

; 216  : 	case RelReverse:
; 217  : 		DYNBUF_ADD_STR(&expr, "<-");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70518
	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70517
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70520
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 217		; 000000d9H
	jmp	$eva_err$70521
$L70517:

; 218  : 	case RelDirect:
; 219  : 		DYNBUF_ADD_CELL(&expr, pvf->relfields, 0, 0, NO_CONV);

	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+540]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+540]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70524
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70526
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 219		; 000000dbH
	jmp	$eva_err$70521
$L70524:

; 220  : 		DYNBUF_ADD_STR(&expr, "->");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70529
	lea	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70528
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70531
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 220		; 000000dcH
	jmp	$eva_err$70521
$L70528:

; 224  : 
; 225  : 	/* Add column for field in display table definition - TODO use FROM clause if relation to SQL expression */
; 226  : 	if(qry_eval_sqlexpr_var(cntxt, &expr, dyntab_val(&pvf->expr, 0, 0), &pvf->srcdata, NULL)) CLEAR_ERROR;

	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 188				; 000000bcH
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 4
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70534
	push	226					; 000000e2H
	push	OFFSET FLAT:$SG70535
	push	OFFSET FLAT:$SG70536
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70534:

; 228  : 		(pvf->relmode && strchr(dyntab_val(&pvf->expr, 0, 0), '[')) ?
; 229  : 			"***" : expr->data, 0, "_EVA_DISPLAYFIELDS", 0, 1, 1, *col);

	mov	eax, DWORD PTR _disptbldata$[ebp]
	mov	DWORD PTR ___tab$70537[ebp], eax
	mov	ecx, DWORD PTR _disptbldata$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR ___row$70538[ebp], edx
	mov	DWORD PTR ___col$70539[ebp], 0
	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+536], 0
	je	SHORT $L73088
	push	91					; 0000005bH
	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 4
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L73088
	mov	DWORD PTR -60+[ebp], OFFSET FLAT:$SG70543
	jmp	SHORT $L73089
$L73088:
	mov	edx, DWORD PTR _expr$[ebp]
	add	edx, 8
	mov	DWORD PTR -60+[ebp], edx
$L73089:
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR -60+[ebp]
	push	eax
	mov	ecx, DWORD PTR ___col$70539[ebp]
	push	ecx
	mov	edx, DWORD PTR ___row$70538[ebp]
	push	edx
	mov	eax, DWORD PTR ___tab$70537[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70542
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70545
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 229		; 000000e5H
	jmp	$eva_err$70521
$L70542:
	mov	eax, DWORD PTR ___col$70539[ebp]
	push	eax
	mov	ecx, DWORD PTR ___row$70538[ebp]
	push	ecx
	mov	edx, DWORD PTR ___tab$70537[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$70540[ebp], eax
	mov	eax, DWORD PTR __c$70540[ebp]
	mov	DWORD PTR [eax+20], 1
	mov	ecx, DWORD PTR __c$70540[ebp]
	mov	DWORD PTR [ecx+8], OFFSET FLAT:$SG70546
	mov	edx, DWORD PTR __c$70540[ebp]
	mov	DWORD PTR [edx+28], 0
	mov	eax, DWORD PTR __c$70540[ebp]
	mov	DWORD PTR [eax+36], 1
	mov	ecx, DWORD PTR __c$70540[ebp]
	mov	edx, DWORD PTR _col$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [ecx+40], eax
	mov	ecx, DWORD PTR __c$70540[ebp]
	mov	BYTE PTR [ecx+15], 1

; 230  : 	DYNTAB_ADD_FIELD_NL(disptbldata, disptbldata->nbrows, 0, pvf->label, 0, "_EVA_DISPLAYLABELS", 0, 1, 1, *col);

	mov	edx, DWORD PTR _disptbldata$[ebp]
	mov	DWORD PTR ___tab$70547[ebp], edx
	mov	eax, DWORD PTR _disptbldata$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR ___row$70548[ebp], ecx
	mov	DWORD PTR ___col$70549[ebp], 0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR ___col$70549[ebp]
	push	ecx
	mov	edx, DWORD PTR ___row$70548[ebp]
	push	edx
	mov	eax, DWORD PTR ___tab$70547[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70552
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70554
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 230		; 000000e6H
	jmp	$eva_err$70521
$L70552:
	mov	eax, DWORD PTR ___col$70549[ebp]
	push	eax
	mov	ecx, DWORD PTR ___row$70548[ebp]
	push	ecx
	mov	edx, DWORD PTR ___tab$70547[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$70550[ebp], eax
	mov	eax, DWORD PTR __c$70550[ebp]
	mov	DWORD PTR [eax+20], 1
	mov	ecx, DWORD PTR __c$70550[ebp]
	mov	DWORD PTR [ecx+8], OFFSET FLAT:$SG70555
	mov	edx, DWORD PTR __c$70550[ebp]
	mov	DWORD PTR [edx+28], 0
	mov	eax, DWORD PTR __c$70550[ebp]
	mov	DWORD PTR [eax+36], 1
	mov	ecx, DWORD PTR __c$70550[ebp]
	mov	edx, DWORD PTR _col$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [ecx+40], eax
	mov	ecx, DWORD PTR __c$70550[ebp]
	mov	BYTE PTR [ecx+15], 1

; 231  : 	if(pvf->dispfmt && pvf->dispfmt[0])

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+304], 0
	je	$L70556
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+304]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L70556

; 232  : 		DYNTAB_ADD_FIELD_NL(disptbldata, disptbldata->nbrows, 0, pvf->dispfmt, 0, "_EVA_DISPLAYFORMAT", 0, 1, 1, *col);

	mov	eax, DWORD PTR _disptbldata$[ebp]
	mov	DWORD PTR ___tab$70557[ebp], eax
	mov	ecx, DWORD PTR _disptbldata$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR ___row$70558[ebp], edx
	mov	DWORD PTR ___col$70559[ebp], 0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+304]
	push	ecx
	mov	edx, DWORD PTR ___col$70559[ebp]
	push	edx
	mov	eax, DWORD PTR ___row$70558[ebp]
	push	eax
	mov	ecx, DWORD PTR ___tab$70557[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70562
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70564
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 232		; 000000e8H
	jmp	SHORT $eva_err$70521
$L70562:
	mov	ecx, DWORD PTR ___col$70559[ebp]
	push	ecx
	mov	edx, DWORD PTR ___row$70558[ebp]
	push	edx
	mov	eax, DWORD PTR ___tab$70557[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$70560[ebp], eax
	mov	ecx, DWORD PTR __c$70560[ebp]
	mov	DWORD PTR [ecx+20], 1
	mov	edx, DWORD PTR __c$70560[ebp]
	mov	DWORD PTR [edx+8], OFFSET FLAT:$SG70565
	mov	eax, DWORD PTR __c$70560[ebp]
	mov	DWORD PTR [eax+28], 0
	mov	ecx, DWORD PTR __c$70560[ebp]
	mov	DWORD PTR [ecx+36], 1
	mov	edx, DWORD PTR __c$70560[ebp]
	mov	eax, DWORD PTR _col$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR [edx+40], ecx
	mov	edx, DWORD PTR __c$70560[ebp]
	mov	BYTE PTR [edx+15], 1
$L70556:

; 233  : 
; 234  : 	(*col)++;

	mov	eax, DWORD PTR _col$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 1
	mov	edx, DWORD PTR _col$[ebp]
	mov	DWORD PTR [edx], ecx
$eva_noerr$70510:

; 235  : 
; 236  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70566
	push	OFFSET FLAT:$SG70567
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70521:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70568
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70569
	push	OFFSET FLAT:$SG70570
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70568:
	mov	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 237  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_calc_prepare_objlist ENDP
_TEXT	ENDS
PUBLIC	_ctrl_calc_output_pvtcell_objlist
EXTRN	_table_read_controls:NEAR
EXTRN	_table_process_controls:NEAR
EXTRN	_sscanf:NEAR
EXTRN	_table_put_html_obj_list:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_pivottable_select:NEAR
EXTRN	_pivottable_calc_single:NEAR
EXTRN	_sql_no_quote:BYTE
EXTRN	_qry_obj_field:NEAR
EXTRN	_dynbuf_add_int:NEAR
EXTRN	_ctrl_read_baseobj:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_sql_drop_table:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70659 DB	01H DUP (?)
	ALIGN	4

$SG70677 DB	01H DUP (?)
	ALIGN	4

$SG70635 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70596 DB	'%lu,%lu,%lu,%lu,%lu,%lu', 00H
$SG70605 DB	'-- ctrl_calc_stats - Build clicked value objects list', 0aH
	DB	'CREATE TEMPORARY TABLE IdList TYPE=HEAP', 0aH, 00H
	ORG $+1
$SG70607 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70611 DB	'.IdObj ', 00H
$SG70612 DB	'SELECT DISTINCT ', 00H
	ORG $+3
$SG70614 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70617 DB	0aH, 00H
	ORG $+2
$SG70618 DB	'FROM ', 00H
	ORG $+2
$SG70620 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70624 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70629 DB	' AND ', 00H
	ORG $+2
$SG70631 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70634 DB	'.Val=', 00H
	ORG $+2
$SG70637 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70639 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG70641 DB	'''', 00H
	ORG $+2
$SG70642 DB	'''', 00H
	ORG $+2
$SG70644 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70648 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70653 DB	' AND ', 00H
	ORG $+2
$SG70655 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70658 DB	'.Val=', 00H
	ORG $+2
$SG70661 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70663 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG70665 DB	'''', 00H
	ORG $+2
$SG70666 DB	'''', 00H
	ORG $+2
$SG70668 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70672 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70678 DB	'WHERE ', 00H
	ORG $+1
$SG70680 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70684 DB	'(IdObj INT)', 00H
$SG70686 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70690 DB	'<table border=1 rules=rows width=100% cellspacing=0 bgco'
	DB	'lor=#FFFFFF><tr><td>', 00H
	ORG $+3
$SG70692 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70696 DB	'PVTLISTOFF', 00H
	ORG $+1
$SG70699 DB	'</td><td align=right>', 00H
	ORG $+2
$SG70701 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70705 DB	'Affiche le tableau de statistiques complet', 0aH, 'Vous '
	DB	'pouvez aussi utiliser le bouton ''Page pr', 0e9H, 'c', 0e9H, 'd'
	DB	'ente'' de votre navigateur (plus rapide)', 00H
$SG70706 DB	'_eva_btn_gobacktable_fr_s.gif', 00H
	ORG $+2
$SG70707 DB	'_eva_btn_gobacktable_fr.gif', 00H
$SG70710 DB	'</td></tr><tr>', 00H
	ORG $+1
$SG70712 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70715 DB	'<td colspan=2 align=center>', 00H
$SG70717 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70722 DB	' --- ', 00H
	ORG $+2
$SG70724 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70728 DB	'</td></tr></table>', 00H
	ORG $+1
$SG70730 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70732 DB	'_EVA_AUTO_LIST', 00H
	ORG $+1
$SG70740 DB	'_EVA_SYMBOL_LABEL', 00H
	ORG $+2
$SG70742 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70743 DB	'_EVA_OPENBUTTON', 00H
$SG70750 DB	'_EVA_SEARCHONLOAD', 00H
	ORG $+2
$SG70752 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70753 DB	'_EVA_TABLESEARCH', 00H
	ORG $+3
$SG70760 DB	'1', 00H
	ORG $+2
$SG70762 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70763 DB	'_EVA_EXPORTLIST', 00H
$SG70770 DB	'1', 00H
	ORG $+2
$SG70772 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70773 DB	'_EVA_TABLE_NOTITLESHRINK', 00H
	ORG $+3
$SG70785 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG70786 DB	'ctrl_calc_output_pvtcell_objlist', 00H
	ORG $+3
$SG70788 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG70789 DB	'ctrl_calc_output_pvtcell_objlist', 00H
	ORG $+3
$SG70790 DB	'IdList', 00H
_DATA	ENDS
_TEXT	SEGMENT
_col$70733 = -68
___tab$70734 = -84
___row$70735 = -80
___col$70736 = -76
__c$70737 = -72
___tab$70744 = -100
___row$70745 = -96
___col$70746 = -92
__c$70747 = -88
___tab$70754 = -116
___row$70755 = -112
___col$70756 = -108
__c$70757 = -104
___tab$70764 = -132
___row$70765 = -128
___col$70766 = -124
__c$70767 = -120
_cntxt$ = 8
_i_ctrl$ = 12
_pv$ = 16
_form$ = -32
_ctrl$ = -64
_disptbldata$ = -24
_sql$ = -4
_name$ = -60
_html$ = -36
_i$ = -52
_irow$ = -48
_icol$ = -44
_idata$ = -56
_clrow$ = -40
_clcol$ = -28
_ctrl_calc_output_pvtcell_objlist PROC NEAR

; 254  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 176				; 000000b0H

; 255  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 256  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 257  : 	DynTable disptbldata = {0};

	mov	DWORD PTR _disptbldata$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _disptbldata$[ebp+4], edx
	mov	DWORD PTR _disptbldata$[ebp+8], edx
	mov	DWORD PTR _disptbldata$[ebp+12], edx
	mov	DWORD PTR _disptbldata$[ebp+16], edx

; 258  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 259  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 260  : 	DynBuffer **html = form->html;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR _html$[ebp], ecx

; 261  : 	unsigned long i, irow = 0, icol = 0, idata = 0, clrow = 0, clcol = 0;

	mov	DWORD PTR _irow$[ebp], 0
	mov	DWORD PTR _icol$[ebp], 0
	mov	DWORD PTR _idata$[ebp], 0
	mov	DWORD PTR _clrow$[ebp], 0
	mov	DWORD PTR _clcol$[ebp], 0

; 262  : 
; 263  : 	/* Build clicked pivot table */
; 264  : 	sscanf(pv->rowcolclic, "%lu,%lu,%lu,%lu,%lu,%lu", &i, &idata, &irow, &icol, &clrow, &clcol);

	lea	edx, DWORD PTR _clcol$[ebp]
	push	edx
	lea	eax, DWORD PTR _clrow$[ebp]
	push	eax
	lea	ecx, DWORD PTR _icol$[ebp]
	push	ecx
	lea	edx, DWORD PTR _irow$[ebp]
	push	edx
	lea	eax, DWORD PTR _idata$[ebp]
	push	eax
	lea	ecx, DWORD PTR _i$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70596
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+94220]
	push	eax
	call	_sscanf
	add	esp, 32					; 00000020H

; 265  : 	pv->row = pv->nbrow ? pv->rows + irow : NULL;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+78696], 0
	je	SHORT $L73091
	mov	edx, DWORD PTR _irow$[ebp]
	imul	edx, 616				; 00000268H
	mov	eax, DWORD PTR _pv$[ebp]
	lea	ecx, DWORD PTR [eax+edx+60216]
	mov	DWORD PTR -136+[ebp], ecx
	jmp	SHORT $L73092
$L73091:
	mov	DWORD PTR -136+[ebp], 0
$L73092:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR -136+[ebp]
	mov	DWORD PTR [edx+200], eax

; 266  : 	pv->col = pv->nbcol ? pv->cols + icol : NULL;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+81784], 0
	je	SHORT $L73093
	mov	edx, DWORD PTR _icol$[ebp]
	imul	edx, 616				; 00000268H
	mov	eax, DWORD PTR _pv$[ebp]
	lea	ecx, DWORD PTR [eax+edx+78704]
	mov	DWORD PTR -140+[ebp], ecx
	jmp	SHORT $L73094
$L73093:
	mov	DWORD PTR -140+[ebp], 0
$L73094:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR -140+[ebp]
	mov	DWORD PTR [edx+204], eax

; 267  : 	pv->data = pv->nbdata ? pv->datas + idata : NULL;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+94112], 0
	je	SHORT $L73095
	mov	edx, DWORD PTR _idata$[ebp]
	imul	edx, 616				; 00000268H
	mov	eax, DWORD PTR _pv$[ebp]
	lea	ecx, DWORD PTR [eax+edx+81792]
	mov	DWORD PTR -144+[ebp], ecx
	jmp	SHORT $L73096
$L73095:
	mov	DWORD PTR -144+[ebp], 0
$L73096:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR -144+[ebp]
	mov	DWORD PTR [edx+208], eax

; 268  : 	pv->res = &pv->restbl[idata][irow][icol];

	mov	ecx, DWORD PTR _idata$[ebp]
	imul	ecx, 3000				; 00000bb8H
	mov	edx, DWORD PTR _pv$[ebp]
	lea	eax, DWORD PTR [edx+ecx+216]
	mov	ecx, DWORD PTR _irow$[ebp]
	imul	ecx, 100				; 00000064H
	add	eax, ecx
	mov	edx, DWORD PTR _icol$[ebp]
	imul	edx, 20					; 00000014H
	add	eax, edx
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+212], eax

; 269  : 	if(pivottable_select(cntxt, pv)) STACK_ERROR;

	mov	edx, DWORD PTR _pv$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_pivottable_select
	add	esp, 8
	test	eax, eax
	je	SHORT $L70600
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 269		; 0000010dH
	jmp	$eva_err$70601
$L70600:

; 270  : 	if(pivottable_calc_single(cntxt, pv)) STACK_ERROR;

	mov	edx, DWORD PTR _pv$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_pivottable_calc_single
	add	esp, 8
	test	eax, eax
	je	SHORT $L70602
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 270		; 0000010eH
	jmp	$eva_err$70601
$L70602:

; 274  : 		"-- ctrl_calc_stats - Build clicked value objects list\n"
; 275  : 		"CREATE TEMPORARY TABLE IdList TYPE=HEAP\n");

	push	0
	push	0
	push	94					; 0000005eH
	push	OFFSET FLAT:$SG70605
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70604
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70607
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 275		; 00000113H
	jmp	$eva_err$70601
$L70604:

; 276  : 	if(pv->basetable)

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+192], 0
	je	$L70608

; 279  : 			"SELECT DISTINCT ", pv->basetable, 0, NO_CONV, ".IdObj ");

	push	7
	push	OFFSET FLAT:$SG70611
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	push	ecx
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70612
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70610
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70614
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 279		; 00000117H
	jmp	$eva_err$70601
$L70610:

; 280  : 		DYNBUF_ADD3(&sql, "FROM ", pv->basetable, 0, NO_CONV, "\n");

	push	1
	push	OFFSET FLAT:$SG70617
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+192]
	push	eax
	push	5
	push	OFFSET FLAT:$SG70618
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70616
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70620
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 280		; 00000118H
	jmp	$eva_err$70601
$L70616:

; 281  : 		DYNBUF_ADD_BUF(&sql, pv->join, NO_CONV);

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+94208], 0
	je	SHORT $L70622
	push	0
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+94208]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+94208]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70622
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70624
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 281		; 00000119H
	jmp	$eva_err$70601
$L70622:

; 282  : 		if(pv->row && clrow < ROWCNT)

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	je	$L70646
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L73097
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -148+[ebp], edx
	jmp	SHORT $L73098
$L73097:
	mov	DWORD PTR -148+[ebp], 0
$L73098:
	mov	eax, DWORD PTR _clrow$[ebp]
	cmp	eax, DWORD PTR -148+[ebp]
	jae	$L70646

; 284  : 			if(pv->where) DYNBUF_ADD_STR(&pv->where, " AND ");

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+94212], 0
	je	SHORT $L70628
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70629
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 94212				; 00017004H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70628
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70631
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 284		; 0000011cH
	jmp	$eva_err$70601
$L70628:

; 285  : 			DYNBUF_ADD3(&pv->where, "", pv->row->datatable, 0, NO_CONV, ".Val=");

	push	5
	push	OFFSET FLAT:$SG70634
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	add	eax, 208				; 000000d0H
	push	eax
	push	0
	push	OFFSET FLAT:$SG70635
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 94212				; 00017004H
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70633
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70637
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 285		; 0000011dH
	jmp	$eva_err$70601
$L70633:

; 286  : 			if(strcmp(pv->row->dispfmt, "_EVA_RELATION"))

	push	OFFSET FLAT:$SG70639
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	mov	eax, DWORD PTR [edx+304]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70638

; 287  : 				DYNBUF_ADD3_CELL(&pv->where, "'", &pv->row->labels, clrow, 0, SQL_NO_QUOTE, "'")

	push	1
	push	OFFSET FLAT:$SG70641
	push	1
	push	OFFSET FLAT:_sql_no_quote
	push	0
	mov	ecx, DWORD PTR _clrow$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _clrow$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG70642
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 94212				; 00017004H
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70640
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70644
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 287		; 0000011fH
	jmp	$eva_err$70601
$L70640:

; 288  : 			else

	jmp	SHORT $L70646
$L70638:

; 289  : 				DYNBUF_ADD_INT(&pv->where, dyntab_cell(&pv->row->labels, clrow, 0)->IdObj);

	push	0
	mov	ecx, DWORD PTR _clrow$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 94212				; 00017004H
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70646
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70648
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 289		; 00000121H
	jmp	$eva_err$70601
$L70646:

; 291  : 		if(pv->col && clcol < COLCNT)

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+204], 0
	je	$L70670
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+204], 0
	je	SHORT $L73099
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -152+[ebp], eax
	jmp	SHORT $L73100
$L73099:
	mov	DWORD PTR -152+[ebp], 0
$L73100:
	mov	ecx, DWORD PTR _clcol$[ebp]
	cmp	ecx, DWORD PTR -152+[ebp]
	jae	$L70670

; 293  : 			if(pv->where) DYNBUF_ADD_STR(&pv->where, " AND ");

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94212], 0
	je	SHORT $L70652
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70653
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 94212				; 00017004H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70652
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70655
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 293		; 00000125H
	jmp	$eva_err$70601
$L70652:

; 294  : 			DYNBUF_ADD3(&pv->where, "", pv->col->datatable, 0, NO_CONV, ".Val=");

	push	5
	push	OFFSET FLAT:$SG70658
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	add	ecx, 208				; 000000d0H
	push	ecx
	push	0
	push	OFFSET FLAT:$SG70659
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 94212				; 00017004H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70657
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70661
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 294		; 00000126H
	jmp	$eva_err$70601
$L70657:

; 295  : 			if(strcmp(pv->col->dispfmt, "_EVA_RELATION"))

	push	OFFSET FLAT:$SG70663
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR [eax+304]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70662

; 296  : 				DYNBUF_ADD3_CELL(&pv->where, "'", &pv->col->labels, clcol, 0, SQL_NO_QUOTE, "'")

	push	1
	push	OFFSET FLAT:$SG70665
	push	1
	push	OFFSET FLAT:_sql_no_quote
	push	0
	mov	edx, DWORD PTR _clcol$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _clcol$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG70666
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 94212				; 00017004H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70664
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70668
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 296		; 00000128H
	jmp	$eva_err$70601
$L70664:

; 297  : 			else

	jmp	SHORT $L70670
$L70662:

; 298  : 				DYNBUF_ADD_INT(&pv->where, dyntab_cell(&pv->col->labels, clcol, 0)->IdObj);

	push	0
	mov	edx, DWORD PTR _clcol$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR [eax+20]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 94212				; 00017004H
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70670
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70672
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 298		; 0000012aH
	jmp	$eva_err$70601
$L70670:

; 300  : 		if(pv->where) DYNBUF_ADD3_BUF(&sql, "WHERE ", pv->where, NO_CONV, "");

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+94212], 0
	je	$L70676
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+94212], 0
	je	SHORT $L73101
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+94212]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -156+[ebp], ecx
	jmp	SHORT $L73102
$L73101:
	mov	DWORD PTR -156+[ebp], 0
$L73102:
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94212], 0
	je	SHORT $L73103
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+94212]
	add	ecx, 8
	mov	DWORD PTR -160+[ebp], ecx
	jmp	SHORT $L73104
$L73103:
	mov	DWORD PTR -160+[ebp], 0
$L73104:
	push	0
	push	OFFSET FLAT:$SG70677
	push	0
	push	0
	mov	edx, DWORD PTR -156+[ebp]
	push	edx
	mov	eax, DWORD PTR -160+[ebp]
	push	eax
	push	6
	push	OFFSET FLAT:$SG70678
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70676
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70680
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 300		; 0000012cH
	jmp	$eva_err$70601
$L70676:

; 302  : 	else

	jmp	SHORT $L70683
$L70608:

; 303  : 		DYNBUF_ADD_STR(&sql, "(IdObj INT)");

	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70684
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70683
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70686
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 303		; 0000012fH
	jmp	$eva_err$70601
$L70683:

; 304  : 	if(sql_exec_query(cntxt, sql->data)) STACK_ERROR;

	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	SHORT $L70687
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 304		; 00000130H
	jmp	$eva_err$70601
$L70687:

; 305  : 
; 306  : 	/* Output title & 'Back to table' button */
; 307  : 	DYNBUF_ADD_STR(html, "<table border=1 rules=rows width=100% cellspacing=0 bgcolor=#FFFFFF><tr><td>");

	push	0
	push	0
	push	76					; 0000004cH
	push	OFFSET FLAT:$SG70690
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70689
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70692
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 307		; 00000133H
	jmp	$eva_err$70601
$L70689:

; 308  : 	if(ctrl_calc_output_title(cntxt, i_ctrl, pv)) STACK_ERROR;

	mov	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_calc_output_title
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70693
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 308		; 00000134H
	jmp	$eva_err$70601
$L70693:

; 309  : 	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("PVTLISTOFF"));

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70696
	push	66					; 00000042H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70695
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 309		; 00000135H
	jmp	$eva_err$70601
$L70695:

; 310  : 	DYNBUF_ADD_STR(html, "</td><td align=right>");

	push	0
	push	0
	push	21					; 00000015H
	push	OFFSET FLAT:$SG70699
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70698
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70701
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 310		; 00000136H
	jmp	$eva_err$70601
$L70698:

; 311  : 	if(put_html_button(cntxt, name->data, NULL, "_eva_btn_gobacktable_fr.gif", "_eva_btn_gobacktable_fr_s.gif",
; 312  : 		"Affiche le tableau de statistiques complet\n"
; 313  : 		"Vous pouvez aussi utiliser le bouton 'Page précédente' de votre navigateur (plus rapide)" , 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70705
	push	OFFSET FLAT:$SG70706
	push	OFFSET FLAT:$SG70707
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70704
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 313		; 00000139H
	jmp	$eva_err$70601
$L70704:

; 314  : 	DYNBUF_ADD_STR(html, "</td></tr><tr>");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70710
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70709
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70712
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 314		; 0000013aH
	jmp	$eva_err$70601
$L70709:

; 315  : 
; 316  : 	/* Output row / column values */
; 317  : 	DYNBUF_ADD_STR(html, "<td colspan=2 align=center>");

	push	0
	push	0
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG70715
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70714
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70717
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 317		; 0000013dH
	jmp	$eva_err$70601
$L70714:

; 318  : 	if(pv->row && clrow < ROWCNT && ctrl_calc_output_fieldval_objlist(cntxt, pv->row, clrow)) STACK_ERROR;

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	SHORT $L70718
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	je	SHORT $L73105
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -164+[ebp], ecx
	jmp	SHORT $L73106
$L73105:
	mov	DWORD PTR -164+[ebp], 0
$L73106:
	mov	edx, DWORD PTR _clrow$[ebp]
	cmp	edx, DWORD PTR -164+[ebp]
	jae	SHORT $L70718
	mov	eax, DWORD PTR _clrow$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_calc_output_fieldval_objlist
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70718
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 318		; 0000013eH
	jmp	$eva_err$70601
$L70718:

; 319  : 	if(pv->row && clrow < ROWCNT && pv->col && clcol < COLCNT) DYNBUF_ADD_STR(html, " --- ");

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	$L70721
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	SHORT $L73107
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -168+[ebp], eax
	jmp	SHORT $L73108
$L73107:
	mov	DWORD PTR -168+[ebp], 0
$L73108:
	mov	ecx, DWORD PTR _clrow$[ebp]
	cmp	ecx, DWORD PTR -168+[ebp]
	jae	SHORT $L70721
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+204], 0
	je	SHORT $L70721
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+204], 0
	je	SHORT $L73109
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -172+[ebp], eax
	jmp	SHORT $L73110
$L73109:
	mov	DWORD PTR -172+[ebp], 0
$L73110:
	mov	ecx, DWORD PTR _clcol$[ebp]
	cmp	ecx, DWORD PTR -172+[ebp]
	jae	SHORT $L70721
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70722
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70721
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70724
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 319		; 0000013fH
	jmp	$eva_err$70601
$L70721:

; 320  : 	if(pv->col && clcol < COLCNT && ctrl_calc_output_fieldval_objlist(cntxt, pv->col, clcol)) STACK_ERROR;

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+204], 0
	je	SHORT $L70725
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+204], 0
	je	SHORT $L73111
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -176+[ebp], eax
	jmp	SHORT $L73112
$L73111:
	mov	DWORD PTR -176+[ebp], 0
$L73112:
	mov	ecx, DWORD PTR _clcol$[ebp]
	cmp	ecx, DWORD PTR -176+[ebp]
	jae	SHORT $L70725
	mov	edx, DWORD PTR _clcol$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_calc_output_fieldval_objlist
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70725
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 320		; 00000140H
	jmp	$eva_err$70601
$L70725:

; 321  : 	DYNBUF_ADD_STR(html, "</td></tr></table>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70728
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70727
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70730
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 321		; 00000141H
	jmp	$eva_err$70601
$L70727:

; 322  : 
; 323  : 	/* Display list of matched objects */
; 324  : 	if(!strcmp(pv->clicmode, "_EVA_AUTO_LIST"))

	push	OFFSET FLAT:$SG70732
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70731

; 326  : 		unsigned long col = 1;

	mov	DWORD PTR _col$70733[ebp], 1

; 327  : 		DYNTAB_ADD_FIELD_NL(&disptbldata, disptbldata.nbrows, 0, "_EVA_SYMBOL_LABEL", 0, "_EVA_OPENBUTTON", 0, 1, 1, 0);

	lea	eax, DWORD PTR _disptbldata$[ebp]
	mov	DWORD PTR ___tab$70734[ebp], eax
	mov	ecx, DWORD PTR _disptbldata$[ebp]
	mov	DWORD PTR ___row$70735[ebp], ecx
	mov	DWORD PTR ___col$70736[ebp], 0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70740
	mov	edx, DWORD PTR ___col$70736[ebp]
	push	edx
	mov	eax, DWORD PTR ___row$70735[ebp]
	push	eax
	mov	ecx, DWORD PTR ___tab$70734[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70739
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70742
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 327		; 00000147H
	jmp	$eva_err$70601
$L70739:
	mov	ecx, DWORD PTR ___col$70736[ebp]
	push	ecx
	mov	edx, DWORD PTR ___row$70735[ebp]
	push	edx
	mov	eax, DWORD PTR ___tab$70734[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$70737[ebp], eax
	mov	ecx, DWORD PTR __c$70737[ebp]
	mov	DWORD PTR [ecx+20], 1
	mov	edx, DWORD PTR __c$70737[ebp]
	mov	DWORD PTR [edx+8], OFFSET FLAT:$SG70743
	mov	eax, DWORD PTR __c$70737[ebp]
	mov	DWORD PTR [eax+28], 0
	mov	ecx, DWORD PTR __c$70737[ebp]
	mov	DWORD PTR [ecx+36], 1
	mov	edx, DWORD PTR __c$70737[ebp]
	mov	DWORD PTR [edx+40], 0
	mov	eax, DWORD PTR __c$70737[ebp]
	mov	BYTE PTR [eax+15], 1

; 328  : 		DYNTAB_ADD_FIELD_NL(&disptbldata, disptbldata.nbrows, 0, "_EVA_SEARCHONLOAD", 0, "_EVA_TABLESEARCH", 0, 1, 1, 0);

	lea	ecx, DWORD PTR _disptbldata$[ebp]
	mov	DWORD PTR ___tab$70744[ebp], ecx
	mov	edx, DWORD PTR _disptbldata$[ebp]
	mov	DWORD PTR ___row$70745[ebp], edx
	mov	DWORD PTR ___col$70746[ebp], 0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70750
	mov	eax, DWORD PTR ___col$70746[ebp]
	push	eax
	mov	ecx, DWORD PTR ___row$70745[ebp]
	push	ecx
	mov	edx, DWORD PTR ___tab$70744[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70749
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70752
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 328		; 00000148H
	jmp	$eva_err$70601
$L70749:
	mov	edx, DWORD PTR ___col$70746[ebp]
	push	edx
	mov	eax, DWORD PTR ___row$70745[ebp]
	push	eax
	mov	ecx, DWORD PTR ___tab$70744[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$70747[ebp], eax
	mov	edx, DWORD PTR __c$70747[ebp]
	mov	DWORD PTR [edx+20], 1
	mov	eax, DWORD PTR __c$70747[ebp]
	mov	DWORD PTR [eax+8], OFFSET FLAT:$SG70753
	mov	ecx, DWORD PTR __c$70747[ebp]
	mov	DWORD PTR [ecx+28], 0
	mov	edx, DWORD PTR __c$70747[ebp]
	mov	DWORD PTR [edx+36], 1
	mov	eax, DWORD PTR __c$70747[ebp]
	mov	DWORD PTR [eax+40], 0
	mov	ecx, DWORD PTR __c$70747[ebp]
	mov	BYTE PTR [ecx+15], 1

; 329  : 		DYNTAB_ADD_FIELD_NL(&disptbldata, disptbldata.nbrows, 0, "1", 0, "_EVA_EXPORTLIST", 0, 1, 1, 0);

	lea	edx, DWORD PTR _disptbldata$[ebp]
	mov	DWORD PTR ___tab$70754[ebp], edx
	mov	eax, DWORD PTR _disptbldata$[ebp]
	mov	DWORD PTR ___row$70755[ebp], eax
	mov	DWORD PTR ___col$70756[ebp], 0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70760
	mov	ecx, DWORD PTR ___col$70756[ebp]
	push	ecx
	mov	edx, DWORD PTR ___row$70755[ebp]
	push	edx
	mov	eax, DWORD PTR ___tab$70754[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70759
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70762
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 329		; 00000149H
	jmp	$eva_err$70601
$L70759:
	mov	eax, DWORD PTR ___col$70756[ebp]
	push	eax
	mov	ecx, DWORD PTR ___row$70755[ebp]
	push	ecx
	mov	edx, DWORD PTR ___tab$70754[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$70757[ebp], eax
	mov	eax, DWORD PTR __c$70757[ebp]
	mov	DWORD PTR [eax+20], 1
	mov	ecx, DWORD PTR __c$70757[ebp]
	mov	DWORD PTR [ecx+8], OFFSET FLAT:$SG70763
	mov	edx, DWORD PTR __c$70757[ebp]
	mov	DWORD PTR [edx+28], 0
	mov	eax, DWORD PTR __c$70757[ebp]
	mov	DWORD PTR [eax+36], 1
	mov	ecx, DWORD PTR __c$70757[ebp]
	mov	DWORD PTR [ecx+40], 0
	mov	edx, DWORD PTR __c$70757[ebp]
	mov	BYTE PTR [edx+15], 1

; 330  : 		DYNTAB_ADD_FIELD_NL(&disptbldata, disptbldata.nbrows, 0, "1", 0, "_EVA_TABLE_NOTITLESHRINK", 0, 1, 1, 0);

	lea	eax, DWORD PTR _disptbldata$[ebp]
	mov	DWORD PTR ___tab$70764[ebp], eax
	mov	ecx, DWORD PTR _disptbldata$[ebp]
	mov	DWORD PTR ___row$70765[ebp], ecx
	mov	DWORD PTR ___col$70766[ebp], 0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70770
	mov	edx, DWORD PTR ___col$70766[ebp]
	push	edx
	mov	eax, DWORD PTR ___row$70765[ebp]
	push	eax
	mov	ecx, DWORD PTR ___tab$70764[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70769
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70772
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 330		; 0000014aH
	jmp	$eva_err$70601
$L70769:
	mov	ecx, DWORD PTR ___col$70766[ebp]
	push	ecx
	mov	edx, DWORD PTR ___row$70765[ebp]
	push	edx
	mov	eax, DWORD PTR ___tab$70764[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$70767[ebp], eax
	mov	ecx, DWORD PTR __c$70767[ebp]
	mov	DWORD PTR [ecx+20], 1
	mov	edx, DWORD PTR __c$70767[ebp]
	mov	DWORD PTR [edx+8], OFFSET FLAT:$SG70773
	mov	eax, DWORD PTR __c$70767[ebp]
	mov	DWORD PTR [eax+28], 0
	mov	ecx, DWORD PTR __c$70767[ebp]
	mov	DWORD PTR [ecx+36], 1
	mov	edx, DWORD PTR __c$70767[ebp]
	mov	DWORD PTR [edx+40], 0
	mov	eax, DWORD PTR __c$70767[ebp]
	mov	BYTE PTR [eax+15], 1

; 331  : 		if(ctrl_calc_prepare_objlist(cntxt, &disptbldata, &col, pv->row) ||
; 332  : 			ctrl_calc_prepare_objlist(cntxt, &disptbldata, &col, pv->col) ||
; 333  : 			ctrl_calc_prepare_objlist(cntxt, &disptbldata, &col, pv->data)) STACK_ERROR;

	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	push	edx
	lea	eax, DWORD PTR _col$70733[ebp]
	push	eax
	lea	ecx, DWORD PTR _disptbldata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_calc_prepare_objlist
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70775
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	push	ecx
	lea	edx, DWORD PTR _col$70733[ebp]
	push	edx
	lea	eax, DWORD PTR _disptbldata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_calc_prepare_objlist
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70775
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+208]
	push	eax
	lea	ecx, DWORD PTR _col$70733[ebp]
	push	ecx
	lea	edx, DWORD PTR _disptbldata$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_calc_prepare_objlist
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70774
$L70775:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 333		; 0000014dH
	jmp	$eva_err$70601
$L70774:

; 335  : 	else

	jmp	SHORT $L70778
$L70731:

; 336  : 		if(qry_obj_field(cntxt, &disptbldata, pv->objlist, NULL) || ctrl_read_baseobj(cntxt, &disptbldata)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+132]
	push	eax
	lea	ecx, DWORD PTR _disptbldata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70779
	lea	eax, DWORD PTR _disptbldata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	je	SHORT $L70778
$L70779:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 336		; 00000150H
	jmp	$eva_err$70601
$L70778:

; 337  : 	if(table_read_controls(cntxt, i_ctrl, disptbldata.nbrows ? &disptbldata : NULL) ) STACK_ERROR;

	mov	eax, DWORD PTR _disptbldata$[ebp]
	neg	eax
	sbb	eax, eax
	lea	ecx, DWORD PTR _disptbldata$[ebp]
	and	eax, ecx
	push	eax
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_read_controls
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70781
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 337		; 00000151H
	jmp	$eva_err$70601
$L70781:

; 338  : 	ctrl->objtbl->from_idlist = 1;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR [eax+28], 1

; 339  : 	ctrl->objtbl->lines = 40;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR [edx+44], 40			; 00000028H

; 340  : 	ctrl->LABEL = pv->label;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [eax+284], edx

; 341  : 	if(table_process_controls(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_process_controls
	add	esp, 8
	test	eax, eax
	je	SHORT $L70782
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 341		; 00000155H
	jmp	SHORT $eva_err$70601
$L70782:

; 342  : 	if(!cntxt->b_terminate && table_put_html_obj_list(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29776], 0
	jne	SHORT $eva_noerr$70784
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_put_html_obj_list
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$70784
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 342		; 00000156H
	jmp	SHORT $eva_err$70601
$eva_noerr$70784:

; 343  : 
; 344  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70785
	push	OFFSET FLAT:$SG70786
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70601:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70787
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70788
	push	OFFSET FLAT:$SG70789
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70787:
	lea	eax, DWORD PTR _disptbldata$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	push	OFFSET FLAT:$SG70790
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_drop_table
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 345  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_calc_output_pvtcell_objlist ENDP
_TEXT	ENDS
PUBLIC	_ctrl_calc_output_field_label
EXTRN	_qry_obj_label:NEAR
EXTRN	_datetxt_to_format:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_strncmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70856 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70815 DB	'<font size=-1>', 00H
	ORG $+1
$SG70817 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70820 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG70832 DB	'<a href=''javascript:ol(%lu,0,%lu,%lu);''', 00H
$SG70835 DB	'''', 00H
	ORG $+2
$SG70836 DB	' title=''', 00H
	ORG $+3
$SG70838 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70841 DB	'</a>', 00H
	ORG $+3
$SG70842 DB	'>', 00H
	ORG $+2
$SG70844 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70850 DB	'<b>', 00H
$SG70852 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70854 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70858 DB	'_EVA_DAY', 00H
	ORG $+3
$SG70859 DB	'_EVA_DayLong', 00H
	ORG $+3
$SG70860 DB	'_EVA_LongDay', 00H
	ORG $+3
$SG70863 DB	'_EVA_HOUR', 00H
	ORG $+2
$SG70864 DB	'_EVA_Time', 00H
	ORG $+2
$SG70865 DB	'_EVA_LongTime', 00H
	ORG $+2
$SG70868 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70873 DB	'</b>', 00H
	ORG $+3
$SG70875 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70878 DB	'</font></td>', 00H
	ORG $+3
$SG70880 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70882 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG70883 DB	'ctrl_calc_output_field_label', 00H
	ORG $+3
$SG70885 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG70886 DB	'ctrl_calc_output_field_label', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pv$ = 12
_pvf$ = 16
_i$ = 20
_objnotes$ = -1060
_html$ = -1032
_objdata$ = -1056
_printbuf$ = -1024
_c$ = -1028
_id_obj$ = -1036
_fmt$70847 = -1064
_unit$70855 = -1068
_ctrl_calc_output_field_label PROC NEAR

; 361  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1092				; 00000444H

; 362  : 	DynBuffer *objnotes = NULL;

	mov	DWORD PTR _objnotes$[ebp], 0

; 363  : 	DynBuffer **html = cntxt->form->html;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR _html$[ebp], edx

; 364  : 	DynTable objdata = {0};

	mov	DWORD PTR _objdata$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _objdata$[ebp+4], eax
	mov	DWORD PTR _objdata$[ebp+8], eax
	mov	DWORD PTR _objdata$[ebp+12], eax
	mov	DWORD PTR _objdata$[ebp+16], eax

; 365  : 	char printbuf[1024];
; 366  : 	DynTableCell *c = dyntab_cell(&pvf->labels, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$[ebp], eax

; 367  : 	unsigned long id_obj = c ? c->IdObj : 0;

	cmp	DWORD PTR _c$[ebp], 0
	je	SHORT $L73114
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	mov	DWORD PTR -1072+[ebp], ecx
	jmp	SHORT $L73115
$L73114:
	mov	DWORD PTR -1072+[ebp], 0
$L73115:
	mov	edx, DWORD PTR -1072+[ebp]
	mov	DWORD PTR _id_obj$[ebp], edx

; 368  : 	if(!c || !c->len) c = dyntab_cell(&pvf->emptyval, 0, 0);

	cmp	DWORD PTR _c$[ebp], 0
	je	SHORT $L70812
	mov	eax, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L70811
$L70812:
	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 492				; 000001ecH
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$[ebp], eax
$L70811:

; 369  : 	DYNBUF_ADD_STR(html, "<font size=-1>");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70815
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70814
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70817
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 369		; 00000171H
	jmp	$eva_err$70818
$L70814:

; 370  : 	if(pvf->dispfmt && !strcmp(pvf->dispfmt, "_EVA_RELATION") && id_obj && !pv->exportparams)

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+304], 0
	je	$L70819
	push	OFFSET FLAT:$SG70820
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+304]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70819
	cmp	DWORD PTR _id_obj$[ebp], 0
	je	$L70819
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94136], 0
	jne	$L70819

; 372  : 		if(qry_obj_field(cntxt, &objdata, id_obj, NULL)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70822
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 372		; 00000174H
	jmp	$eva_err$70818
$L70822:

; 373  : 		/* TODO - use code from ctrl_add_symbol_btn to handle multiple formstamps */
; 374  : 		if(qry_obj_label(cntxt, &objnotes, NULL, &objnotes, NULL, &objnotes, NULL, NULL, NULL, 0, &objdata, 0)) STACK_ERROR;

	push	0
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	push	0
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _objnotes$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _objnotes$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _objnotes$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L70828
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 374		; 00000176H
	jmp	$eva_err$70818
$L70828:

; 375  : 		dynbuf_print3(html, "<a href='javascript:ol(%lu,0,%lu,%lu);'",
; 376  : 						dyntab_cell(&pvf->labels, i, 0)->IdObj,
; 377  : 						DYNTAB_TOUL(&cntxt->form->id_form),
; 378  : 						DYNTAB_TOUL(&cntxt->form->id_obj));

	push	0
	push	0
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
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	push	OFFSET FLAT:$SG70832
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 24					; 00000018H
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 379  : 		DYNBUF_ADD3_BUF(html, " title='", objnotes, HTML_TOOLTIP, "'");

	cmp	DWORD PTR _objnotes$[ebp], 0
	je	SHORT $L73116
	mov	edx, DWORD PTR _objnotes$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -1076+[ebp], eax
	jmp	SHORT $L73117
$L73116:
	mov	DWORD PTR -1076+[ebp], 0
$L73117:
	cmp	DWORD PTR _objnotes$[ebp], 0
	je	SHORT $L73118
	mov	ecx, DWORD PTR _objnotes$[ebp]
	add	ecx, 8
	mov	DWORD PTR -1080+[ebp], ecx
	jmp	SHORT $L73119
$L73118:
	mov	DWORD PTR -1080+[ebp], 0
$L73119:
	push	1
	push	OFFSET FLAT:$SG70835
	push	1
	push	OFFSET FLAT:_html_tooltip
	mov	edx, DWORD PTR -1076+[ebp]
	push	edx
	mov	eax, DWORD PTR -1080+[ebp]
	push	eax
	push	8
	push	OFFSET FLAT:$SG70836
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70834
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70838
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 379		; 0000017bH
	jmp	$eva_err$70818
$L70834:

; 380  : 		if(put_showhelp(cntxt, html)) STACK_ERROR;

	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_showhelp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70839
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 380		; 0000017cH
	jmp	$eva_err$70818
$L70839:

; 381  : 		DYNBUF_ADD3_CELL(html, ">", &pvf->labels, i, 0, TO_HTML, "</a>");

	push	4
	push	OFFSET FLAT:$SG70841
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG70842
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70840
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70844
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 381		; 0000017dH
	jmp	$eva_err$70818
$L70840:

; 383  : 	else if(c && c->txt)

	jmp	$L70872
$L70819:
	cmp	DWORD PTR _c$[ebp], 0
	je	$L70872
	mov	edx, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [edx], 0
	je	$L70872

; 385  : 		char *fmt = pvf->dispfmt;

	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+304]
	mov	DWORD PTR _fmt$70847[ebp], ecx

; 386  : 		DYNBUF_ADD_STR(html, "<b>");

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70850
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70849
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70852
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 386		; 00000182H
	jmp	$eva_err$70818
$L70849:

; 387  : 		if(fmt && !strcmp(fmt, "_EVA_DATE"))

	cmp	DWORD PTR _fmt$70847[ebp], 0
	je	$L70853
	push	OFFSET FLAT:$SG70854
	mov	edx, DWORD PTR _fmt$70847[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70853

; 389  : 			char *unit = pvf->dispunit ? pvf->dispunit : "";

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+332], 0
	je	SHORT $L73120
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+332]
	mov	DWORD PTR -1084+[ebp], edx
	jmp	SHORT $L73121
$L73120:
	mov	DWORD PTR -1084+[ebp], OFFSET FLAT:$SG70856
$L73121:
	mov	eax, DWORD PTR -1084+[ebp]
	mov	DWORD PTR _unit$70855[ebp], eax

; 390  : 			if(!strcmp(unit, "_EVA_DAY"))

	push	OFFSET FLAT:$SG70858
	mov	ecx, DWORD PTR _unit$70855[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70857

; 391  : 				fmt = (i && !strncmp(c->txt, dyntab_val(&pvf->labels, i - 1, 0), 6)) ? "_EVA_DayLong" : "_EVA_LongDay";

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73122
	push	6
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _c$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L73122
	mov	DWORD PTR -1088+[ebp], OFFSET FLAT:$SG70859
	jmp	SHORT $L73123
$L73122:
	mov	DWORD PTR -1088+[ebp], OFFSET FLAT:$SG70860
$L73123:
	mov	eax, DWORD PTR -1088+[ebp]
	mov	DWORD PTR _fmt$70847[ebp], eax

; 392  : 			else if(!strcmp(unit, "_EVA_HOUR"))

	jmp	SHORT $L70862
$L70857:
	push	OFFSET FLAT:$SG70863
	mov	ecx, DWORD PTR _unit$70855[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70862

; 393  : 				fmt = (i && !strncmp(c->txt, dyntab_val(&pvf->labels, i - 1, 0), 8)) ? "_EVA_Time" : "_EVA_LongTime";

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73124
	push	8
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _c$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L73124
	mov	DWORD PTR -1092+[ebp], OFFSET FLAT:$SG70864
	jmp	SHORT $L73125
$L73124:
	mov	DWORD PTR -1092+[ebp], OFFSET FLAT:$SG70865
$L73125:
	mov	eax, DWORD PTR -1092+[ebp]
	mov	DWORD PTR _fmt$70847[ebp], eax
$L70862:

; 394  : 			datetxt_to_format(cntxt, printbuf, c->txt, fmt);

	mov	ecx, DWORD PTR _fmt$70847[ebp]
	push	ecx
	mov	edx, DWORD PTR _c$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 395  : 			DYNBUF_ADD(html, printbuf, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70866
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70868
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 395		; 0000018bH
	jmp	$eva_err$70818
$L70866:

; 397  : 		else if(put_value_fmt(cntxt, html, c->txt, c->len, fmt)) STACK_ERROR;

	jmp	SHORT $L70870
$L70853:
	mov	ecx, DWORD PTR _fmt$70847[ebp]
	push	ecx
	mov	edx, DWORD PTR _c$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _c$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_value_fmt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70870
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 397		; 0000018dH
	jmp	$eva_err$70818
$L70870:

; 398  : 		DYNBUF_ADD_STR(html, "</b>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70873
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70872
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70875
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 398		; 0000018eH
	jmp	SHORT $eva_err$70818
$L70872:

; 400  : 	DYNBUF_ADD_STR(html, "</font></td>");

	push	0
	push	0
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70878
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70877
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70880
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 400		; 00000190H
	jmp	SHORT $eva_err$70818
$L70877:
$eva_noerr$70881:

; 401  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70882
	push	OFFSET FLAT:$SG70883
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70818:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70884
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70885
	push	OFFSET FLAT:$SG70886
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70884:
	mov	edx, DWORD PTR _objnotes$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _objnotes$[ebp], 0
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 402  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_calc_output_field_label ENDP
_TEXT	ENDS
PUBLIC	_ctrl_calc_output_field_title
EXTRN	_ctrl_add_calendar_input:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70943 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70911 DB	'&nbsp;', 00H
	ORG $+1
$SG70913 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70917 DB	'_EVA_MASK_ITEM', 00H
	ORG $+1
$SG70922 DB	'LABEL+OBJNOTES', 00H
	ORG $+1
$SG70926 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70931 DB	'%lu', 00H
$SG70936 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70939 DB	' <font size=-1>sur <nobr>', 00H
	ORG $+2
$SG70941 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70946 DB	'</nobr></font>', 00H
	ORG $+1
$SG70948 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70949 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG70950 DB	'ctrl_calc_output_field_title', 00H
	ORG $+3
$SG70952 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG70953 DB	'ctrl_calc_output_field_title', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_pv$ = 16
_pvf$ = 20
_form$ = -24
_ctrl$ = -56
_html$ = -28
_name$ = -52
_options$ = -20
_values$ = -48
_idindic$70928 = -72
_cnt$70929 = -76
_ctrl_calc_output_field_title PROC NEAR

; 419  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H

; 420  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 421  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 422  : 	DynBuffer **html = form->html;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _html$[ebp], eax

; 423  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 424  : 	DynTable options = {0};

	mov	DWORD PTR _options$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _options$[ebp+4], ecx
	mov	DWORD PTR _options$[ebp+8], ecx
	mov	DWORD PTR _options$[ebp+12], ecx
	mov	DWORD PTR _options$[ebp+16], ecx

; 425  : 	DynTable values = {0};

	mov	DWORD PTR _values$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _values$[ebp+4], edx
	mov	DWORD PTR _values$[ebp+8], edx
	mov	DWORD PTR _values$[ebp+12], edx
	mov	DWORD PTR _values$[ebp+16], edx

; 426  : 
; 427  : 
; 428  : 	/* Output field label */
; 429  : 	if(!pvf || (pvf == pv->data && (!pv->row && pv->nbdata > 1)) )

	cmp	DWORD PTR _pvf$[ebp], 0
	je	SHORT $L70908
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	ecx, DWORD PTR [eax+208]
	jne	SHORT $L70907
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	jne	SHORT $L70907
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+94112], 1
	jbe	SHORT $L70907
$L70908:

; 431  : 		/* No field : empty label */
; 432  : 		DYNBUF_ADD_STR(html, "&nbsp;");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70911
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70910
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70913
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 432		; 000001b0H
	jmp	$eva_err$70914
$L70910:

; 433  : 		RETURN_OK;

	jmp	$eva_noerr$70915
$L70907:

; 435  : 	if(!DYNTAB_FIELD_CELL(&pvf->srcdata, MASK_ITEM))

	push	0
	push	-1
	push	OFFSET FLAT:$SG70917
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 188				; 000000bcH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	$L70924

; 437  : 		if(pvf->srcdata.nbrows && !pv->exportparams)

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+188], 0
	je	SHORT $L70918
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+94136], 0
	jne	SHORT $L70918

; 439  : 			/* Indicator / control : output label as open object link if not masked */
; 440  : 			if(ctrl_add_symbol_btn(cntxt, ctrl, NULL, &pvf->srcdata, 0, NULL, "LABEL+OBJNOTES"))

	push	OFFSET FLAT:$SG70922
	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 188				; 000000bcH
	push	ecx
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_symbol_btn
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70921

; 441  : 				STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 441		; 000001b9H
	jmp	$eva_err$70914
$L70921:

; 443  : 		else

	jmp	SHORT $L70924
$L70918:

; 444  : 			/* No description data for indicator : output label */
; 445  : 			DYNBUF_ADD(html, pvf->label, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70924
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70926
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 445		; 000001bdH
	jmp	$eva_err$70914
$L70924:

; 447  : 
; 448  : 	/* Output calendar control if applicable */
; 449  : 	if(pvf->b_calendar == 2 && !pv->exportparams)

	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+356], 2
	jne	$L70945
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94136], 0
	jne	$L70945

; 451  : 		char idindic[16] = {0};

	mov	BYTE PTR _idindic$70928[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _idindic$70928[ebp+1], eax
	mov	DWORD PTR _idindic$70928[ebp+5], eax
	mov	DWORD PTR _idindic$70928[ebp+9], eax
	mov	WORD PTR _idindic$70928[ebp+13], ax
	mov	BYTE PTR _idindic$70928[ebp+15], al

; 452  : 		size_t cnt = ctrl->cginame->cnt;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _cnt$70929[ebp], eax

; 453  : 		if(pvf && pvf->srcdata.cell) snprintf(add_sz_str(idindic), "%lu", pvf->srcdata.cell->IdObj);

	cmp	DWORD PTR _pvf$[ebp], 0
	je	SHORT $L70930
	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L70930
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	push	OFFSET FLAT:$SG70931
	push	15					; 0000000fH
	lea	edx, DWORD PTR _idindic$70928[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
$L70930:

; 454  : 		if(*idindic) DYNBUF_ADD(&ctrl->cginame, idindic, 0, NO_CONV);

	movsx	eax, BYTE PTR _idindic$70928[ebp]
	test	eax, eax
	je	SHORT $L70934
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _idindic$70928[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70934
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70936
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 454		; 000001c6H
	jmp	$eva_err$70914
$L70934:

; 455  : 		DYNBUF_ADD_STR(html, " <font size=-1>sur <nobr>");

	push	0
	push	0
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70939
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70938
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70941
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 455		; 000001c7H
	jmp	$eva_err$70914
$L70938:

; 456  : 		ctrl->FIELD = idindic;

	mov	edx, DWORD PTR _ctrl$[ebp]
	lea	eax, DWORD PTR _idindic$70928[ebp]
	mov	DWORD PTR [edx+280], eax

; 457  : 		if(ctrl_add_calendar_input(cntxt, i_ctrl,
; 458  : 			pvf->startdate[0] ? pvf->startdate : dyntab_val(&pvf->labels, 0, 0),
; 459  : 			pvf->dispunit, pvf->maxlabels)) STACK_ERROR;

	mov	ecx, DWORD PTR _pvf$[ebp]
	movsx	edx, BYTE PTR [ecx+544]
	test	edx, edx
	je	SHORT $L73127
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 544				; 00000220H
	mov	DWORD PTR -80+[ebp], eax
	jmp	SHORT $L73128
$L73127:
	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -80+[ebp], eax
$L73128:
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+296]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+332]
	push	edx
	mov	eax, DWORD PTR -80+[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_calendar_input
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70942
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 459		; 000001cbH
	jmp	SHORT $eva_err$70914
$L70942:

; 460  : 		ctrl->FIELD = "";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+280], OFFSET FLAT:$SG70943

; 461  : 		ctrl->cginame->cnt = cnt;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	mov	ecx, DWORD PTR _cnt$70929[ebp]
	mov	DWORD PTR [eax+4], ecx

; 462  : 		ctrl->cginame->data[cnt] = 0;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	mov	ecx, DWORD PTR _cnt$70929[ebp]
	mov	BYTE PTR [eax+ecx+8], 0

; 463  : 		DYNBUF_ADD_STR(html, "</nobr></font>");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70946
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70945
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70948
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 463		; 000001cfH
	jmp	SHORT $eva_err$70914
$L70945:
$eva_noerr$70915:

; 465  : 
; 466  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70949
	push	OFFSET FLAT:$SG70950
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70914:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70951
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70952
	push	OFFSET FLAT:$SG70953
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70951:
	lea	ecx, DWORD PTR _options$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 467  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_calc_output_field_title ENDP
_TEXT	ENDS
PUBLIC	_ctrl_calc_output_pvtcell
_DATA	SEGMENT
	ORG $+3
$SG70975 DB	'<td', 00H
$SG70977 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70981 DB	' align=right', 00H
	ORG $+3
$SG70982 DB	' align=center', 00H
	ORG $+2
$SG70984 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70988 DB	'><nobr><font size=-1>', 00H
	ORG $+2
$SG70990 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70996 DB	'&nbsp;', 00H
	ORG $+1
$SG70998 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71001 DB	'</font>', 00H
$SG71003 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71008 DB	' bgcolor=#EEEEEE', 00H
	ORG $+3
$SG71010 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71013 DB	'><nobr><b>', 00H
	ORG $+1
$SG71015 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71020 DB	'<font size=-1>', 00H
	ORG $+1
$SG71022 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71029 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71034 DB	'</font>', 00H
$SG71036 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71039 DB	'</b>', 00H
	ORG $+3
$SG71041 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71044 DB	'</td>', 00H
	ORG $+2
$SG71046 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71048 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71049 DB	'ctrl_calc_output_pvtcell', 00H
	ORG $+3
$SG71051 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71052 DB	'ctrl_calc_output_pvtcell', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_pv$ = 16
_i$ = 20
_j$ = 24
_form$ = -4
_html$ = -8
_b_multi_data$ = -16
_b_last_data$ = -12
_ctrl_calc_output_pvtcell PROC NEAR

; 483  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 72					; 00000048H

; 484  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 485  : 	DynBuffer **html = form->html;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _html$[ebp], eax

; 486  : 	int b_multi_data = pv->nbdata > 1 && !pv->row;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+94112], 1
	jbe	SHORT $L73130
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	jne	SHORT $L73130
	mov	DWORD PTR -20+[ebp], 1
	jmp	SHORT $L73131
$L73130:
	mov	DWORD PTR -20+[ebp], 0
$L73131:
	mov	eax, DWORD PTR -20+[ebp]
	mov	DWORD PTR _b_multi_data$[ebp], eax

; 487  : 	int b_last_data = pv->data == &pv->datas[pv->nbdata - 1];

	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+94112]
	sub	edx, 1
	imul	edx, 616				; 00000268H
	mov	eax, DWORD PTR _pv$[ebp]
	lea	ecx, DWORD PTR [eax+edx+81792]
	mov	edx, DWORD PTR _pv$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+208], ecx
	sete	al
	mov	DWORD PTR _b_last_data$[ebp], eax

; 488  : 
; 489  : 	/* Output cell header */
; 490  : 	DYNBUF_ADD_STR(html, "<td");

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70975
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70974
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70977
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 490		; 000001eaH
	jmp	$eva_err$70978
$L70974:

; 491  : 	DYNBUF_ADD(html, (pv->data && pv->data->decimals > 0) ? " align=right" : " align=center", 0, NO_CONV);

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+208], 0
	je	SHORT $L73132
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+208]
	cmp	DWORD PTR [eax+364], 0
	jle	SHORT $L73132
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG70981
	jmp	SHORT $L73133
$L73132:
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG70982
$L73133:
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR -24+[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70980
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70984
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 491		; 000001ebH
	jmp	$eva_err$70978
$L70980:

; 492  : 	if((b_multi_data ? !b_last_data : i < ROWCNT) && j < COLCNT)

	cmp	DWORD PTR _b_multi_data$[ebp], 0
	je	SHORT $L73136
	xor	edx, edx
	cmp	DWORD PTR _b_last_data$[ebp], 0
	sete	dl
	mov	DWORD PTR -28+[ebp], edx
	jmp	SHORT $L73137
$L73136:
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	SHORT $L73134
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -32+[ebp], eax
	jmp	SHORT $L73135
$L73134:
	mov	DWORD PTR -32+[ebp], 0
$L73135:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR -32+[ebp]
	sbb	edx, edx
	neg	edx
	mov	DWORD PTR -28+[ebp], edx
$L73137:
	cmp	DWORD PTR -28+[ebp], 0
	je	$L70985
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+204], 0
	je	SHORT $L73138
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -36+[ebp], eax
	jmp	SHORT $L73139
$L73138:
	mov	DWORD PTR -36+[ebp], 0
$L73139:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR -36+[ebp]
	jae	$L70985

; 494  : 		/* Output values */
; 495  : 		DYNBUF_ADD_STR(html, "><nobr><font size=-1>");

	push	0
	push	0
	push	21					; 00000015H
	push	OFFSET FLAT:$SG70988
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70987
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70990
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 495		; 000001efH
	jmp	$eva_err$70978
$L70987:

; 496  : 		if(dyntab_sz(pv->res, i, j))

	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70991

; 498  : 			if(ctrl_calc_output_pvt_val(cntxt, i_ctrl, pv, i, j)) STACK_ERROR;

	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_calc_output_pvt_val
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70992
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 498		; 000001f2H
	jmp	$eva_err$70978
$L70992:

; 500  : 		else

	jmp	SHORT $L70995
$L70991:

; 501  : 			DYNBUF_ADD_STR(html, "&nbsp;");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70996
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70995
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70998
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 501		; 000001f5H
	jmp	$eva_err$70978
$L70995:

; 502  : 		DYNBUF_ADD_STR(html, "</font>");

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG71001
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71000
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71003
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 502		; 000001f6H
	jmp	$eva_err$70978
$L71000:

; 504  : 	else

	jmp	$L71038
$L70985:

; 506  : 		/* Output totals */
; 507  : 		if(b_multi_data ? b_last_data : i >= ROWCNT) DYNBUF_ADD_STR(html, " bgcolor=#EEEEEE");

	cmp	DWORD PTR _b_multi_data$[ebp], 0
	je	SHORT $L73142
	mov	eax, DWORD PTR _b_last_data$[ebp]
	mov	DWORD PTR -40+[ebp], eax
	jmp	SHORT $L73143
$L73142:
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	je	SHORT $L73140
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -44+[ebp], ecx
	jmp	SHORT $L73141
$L73140:
	mov	DWORD PTR -44+[ebp], 0
$L73141:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR -44+[ebp]
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR -40+[ebp], eax
$L73143:
	cmp	DWORD PTR -40+[ebp], 0
	je	SHORT $L71007
	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG71008
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71007
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71010
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 507		; 000001fbH
	jmp	$eva_err$70978
$L71007:

; 508  : 		DYNBUF_ADD_STR(html, "><nobr><b>");

	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71013
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71012
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71015
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 508		; 000001fcH
	jmp	$eva_err$70978
$L71012:

; 509  : 		if((b_multi_data ? !b_last_data : i != ROWCNT) || j != COLCNT) DYNBUF_ADD_STR(html, "<font size=-1>");

	cmp	DWORD PTR _b_multi_data$[ebp], 0
	je	SHORT $L73146
	xor	ecx, ecx
	cmp	DWORD PTR _b_last_data$[ebp], 0
	sete	cl
	mov	DWORD PTR -48+[ebp], ecx
	jmp	SHORT $L73147
$L73146:
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L73144
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -52+[ebp], edx
	jmp	SHORT $L73145
$L73144:
	mov	DWORD PTR -52+[ebp], 0
$L73145:
	mov	eax, DWORD PTR _i$[ebp]
	xor	ecx, ecx
	cmp	eax, DWORD PTR -52+[ebp]
	setne	cl
	mov	DWORD PTR -48+[ebp], ecx
$L73147:
	cmp	DWORD PTR -48+[ebp], 0
	jne	SHORT $L71017
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+204], 0
	je	SHORT $L73148
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -56+[ebp], edx
	jmp	SHORT $L73149
$L73148:
	mov	DWORD PTR -56+[ebp], 0
$L73149:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR -56+[ebp]
	je	SHORT $L71019
$L71017:
	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG71020
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71019
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71022
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 509		; 000001fdH
	jmp	$eva_err$70978
$L71019:

; 510  : 		if(i <= ROWCNT && j <= COLCNT)

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	je	SHORT $L73150
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -60+[ebp], ecx
	jmp	SHORT $L73151
$L73150:
	mov	DWORD PTR -60+[ebp], 0
$L73151:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR -60+[ebp]
	ja	SHORT $L71023
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+204], 0
	je	SHORT $L73152
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L73153
$L73152:
	mov	DWORD PTR -64+[ebp], 0
$L73153:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR -64+[ebp]
	ja	SHORT $L71023

; 512  : 			if(ctrl_calc_output_pvt_val(cntxt, i_ctrl, pv, i, j)) STACK_ERROR;

	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_calc_output_pvt_val
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71024
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 512		; 00000200H
	jmp	$eva_err$70978
$L71024:

; 514  : 		else

	jmp	SHORT $L71027
$L71023:

; 515  : 			DYNBUF_ADD_CELL(html, pv->res, i, j, NO_CONV);

	push	0
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+212]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71027
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71029
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 515		; 00000203H
	jmp	$eva_err$70978
$L71027:

; 516  : 		if(i != ROWCNT || j != COLCNT) DYNBUF_ADD_STR(html, "</font>");

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	je	SHORT $L73154
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -68+[ebp], ecx
	jmp	SHORT $L73155
$L73154:
	mov	DWORD PTR -68+[ebp], 0
$L73155:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR -68+[ebp]
	jne	SHORT $L71031
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+204], 0
	je	SHORT $L73156
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L73157
$L73156:
	mov	DWORD PTR -72+[ebp], 0
$L73157:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR -72+[ebp]
	je	SHORT $L71033
$L71031:
	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG71034
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71033
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71036
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 516		; 00000204H
	jmp	$eva_err$70978
$L71033:

; 517  : 		DYNBUF_ADD_STR(html, "</b>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG71039
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71038
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71041
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 517		; 00000205H
	jmp	SHORT $eva_err$70978
$L71038:

; 519  : 	DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71044
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71043
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71046
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 519		; 00000207H
	jmp	SHORT $eva_err$70978
$L71043:
$eva_noerr$71047:

; 520  : 
; 521  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71048
	push	OFFSET FLAT:$SG71049
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70978:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71050
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71051
	push	OFFSET FLAT:$SG71052
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71050:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 522  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_calc_output_pvtcell ENDP
_TEXT	ENDS
PUBLIC	_ctrl_calc_output_coltitle
_BSS	SEGMENT
	ALIGN	4

$SG71126 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG71069 DB	'DDDDDD', 00H
	ORG $+1
$SG71074 DB	'<tr><td valign=bottom rowspan=%lu><b>', 00H
	ORG $+2
$SG71079 DB	'</b></td>', 00H
	ORG $+2
$SG71081 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71088 DB	'<td>&nbsp;</td>', 00H
$SG71090 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71093 DB	'</tr>', 00H
	ORG $+2
$SG71095 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71111 DB	'>', 00H
	ORG $+2
$SG71112 DB	'<td align=center bgcolor=#', 00H
	ORG $+1
$SG71114 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71120 DB	'>&nbsp;</td>', 00H
	ORG $+3
$SG71121 DB	'<td width=30 bgcolor=#EEEEEE rowspan=', 00H
	ORG $+2
$SG71123 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71127 DB	'<td bgcolor=#', 00H
	ORG $+2
$SG71129 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71131 DB	'>', 00H
	ORG $+2
$SG71132 DB	' colspan=', 00H
	ORG $+2
$SG71134 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71141 DB	'<td>&nbsp;</td>', 00H
$SG71143 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71150 DB	'>', 00H
	ORG $+2
$SG71151 DB	'EEEEEE', 00H
	ORG $+1
$SG71152 DB	'<td align=center bgcolor=#', 00H
	ORG $+1
$SG71154 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71156 DB	'</b></font></td>', 00H
	ORG $+3
$SG71157 DB	'Total', 00H
	ORG $+2
$SG71158 DB	'<font size=-1><b>', 00H
	ORG $+2
$SG71160 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71163 DB	'</tr>', 00H
	ORG $+2
$SG71165 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71169 DB	'<tr bgcolor=#EEEEEE>', 00H
	ORG $+3
$SG71171 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71184 DB	'>', 00H
	ORG $+2
$SG71185 DB	'<td align=center bgcolor=#', 00H
	ORG $+1
$SG71187 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71195 DB	'>', 00H
	ORG $+2
$SG71196 DB	'EEEEEE', 00H
	ORG $+1
$SG71197 DB	'<td align=center bgcolor=#', 00H
	ORG $+1
$SG71199 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71201 DB	'</b></font></td>', 00H
	ORG $+3
$SG71202 DB	'Total', 00H
	ORG $+2
$SG71203 DB	'<font size=-1><b>', 00H
	ORG $+2
$SG71205 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71208 DB	'</tr>', 00H
	ORG $+2
$SG71210 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71211 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71212 DB	'ctrl_calc_output_coltitle', 00H
	ORG $+2
$SG71214 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71215 DB	'ctrl_calc_output_coltitle', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_pv$ = 16
_form$ = -4
_i$ = -1044
_j$ = -1048
_icol$ = -1036
_bgcolor$ = -1040
_html$ = -1032
_b_coltitle$ = -1052
_printbuf$ = -1028
_j$71105 = -1056
_j$71117 = -1060
_ctrl_calc_output_coltitle PROC NEAR

; 536  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1092				; 00000444H

; 537  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 538  : 	unsigned long i, j, icol;
; 539  : 	char *bgcolor = "DDDDDD";

	mov	DWORD PTR _bgcolor$[ebp], OFFSET FLAT:$SG71069

; 540  : 	DynBuffer **html = form->html;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _html$[ebp], eax

; 541  : 	int b_coltitle = pv->row == pv->rows || !pv->b_stackcols;

	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 60216				; 0000eb38H
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], ecx
	je	SHORT $L73159
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+94128], 0
	je	SHORT $L73159
	mov	DWORD PTR -1064+[ebp], 0
	jmp	SHORT $L73160
$L73159:
	mov	DWORD PTR -1064+[ebp], 1
$L73160:
	mov	ecx, DWORD PTR -1064+[ebp]
	mov	DWORD PTR _b_coltitle$[ebp], ecx

; 542  : 	char printbuf[1024];
; 543  : 
; 544  : 	/* Output row header */
; 545  : 	dynbuf_print(html, "<tr><td valign=bottom rowspan=%lu><b>", b_coltitle ? pv->maxcols + 1 : 1);

	cmp	DWORD PTR _b_coltitle$[ebp], 0
	je	SHORT $L73161
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+94120]
	add	eax, 1
	mov	DWORD PTR -1068+[ebp], eax
	jmp	SHORT $L73162
$L73161:
	mov	DWORD PTR -1068+[ebp], 1
$L73162:
	push	0
	push	0
	mov	ecx, DWORD PTR -1068+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71074
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 546  : 	if(ctrl_calc_output_field_title(cntxt, i_ctrl, pv, pv->row)) STACK_ERROR;

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_calc_output_field_title
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71075
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 546		; 00000222H
	jmp	$eva_err$71076
$L71075:

; 547  : 	DYNBUF_ADD_STR(html, "</b></td>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG71079
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71078
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71081
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 547		; 00000223H
	jmp	$eva_err$71076
$L71078:

; 548  : 
; 549  : 	/* Output empty line & return if no column titles (multiple lines with stacked columns) */
; 550  : 	if(!b_coltitle)

	cmp	DWORD PTR _b_coltitle$[ebp], 0
	jne	$L71082

; 552  : 		for(i = 0; i < pv->totcols - 1; i++) DYNBUF_ADD_STR(html, "<td>&nbsp;</td>");

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71083
$L71084:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71083:
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+94116]
	sub	ecx, 1
	cmp	DWORD PTR _i$[ebp], ecx
	jae	SHORT $L71085
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG71088
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71087
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71090
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 552		; 00000228H
	jmp	$eva_err$71076
$L71087:
	jmp	SHORT $L71084
$L71085:

; 553  : 		DYNBUF_ADD_STR(html, "</tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71093
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71092
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71095
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 553		; 00000229H
	jmp	$eva_err$71076
$L71092:

; 554  : 		RETURN_OK;

	jmp	$eva_noerr$71096
$L71082:

; 556  : 
; 557  : 	/* Handle stacked labels : output one column label per row */
; 558  : 	if(pv->b_stackcols)

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94128], 0
	je	$L71097

; 560  : 		for(i = 0; i <= pv->maxcols; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71098
$L71099:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71098:
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+94120]
	ja	$L71100

; 562  : 			/* Output title row for each column field */
; 563  : 			for(icol = 0; icol < pv->nbcol; icol++)

	mov	DWORD PTR _icol$[ebp], 0
	jmp	SHORT $L71101
$L71102:
	mov	eax, DWORD PTR _icol$[ebp]
	add	eax, 1
	mov	DWORD PTR _icol$[ebp], eax
$L71101:
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR _icol$[ebp]
	cmp	edx, DWORD PTR [ecx+81784]
	jae	$L71103

; 565  : 				pv->col = pv->cols + icol;

	mov	eax, DWORD PTR _icol$[ebp]
	imul	eax, 616				; 00000268H
	mov	ecx, DWORD PTR _pv$[ebp]
	lea	edx, DWORD PTR [ecx+eax+78704]
	mov	eax, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [eax+204], edx

; 566  : 				pv->res = &pv->restbl[0][0][icol];

	mov	ecx, DWORD PTR _icol$[ebp]
	imul	ecx, 20					; 00000014H
	mov	edx, DWORD PTR _pv$[ebp]
	lea	eax, DWORD PTR [edx+ecx+216]
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+212], eax

; 567  : 
; 568  : 				/* Output unstacked label on last row only */
; 569  : 				if(!pv->col->b_stackcols && i == pv->maxcols)

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	cmp	DWORD PTR [eax+524], 0
	jne	$L71108
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+94120]
	jne	$L71108

; 571  : 					unsigned long j;
; 572  : 					for(j = 0; j < COLCNT; j++)

	mov	DWORD PTR _j$71105[ebp], 0
	jmp	SHORT $L71106
$L71107:
	mov	eax, DWORD PTR _j$71105[ebp]
	add	eax, 1
	mov	DWORD PTR _j$71105[ebp], eax
$L71106:
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L73163
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -1072+[ebp], ecx
	jmp	SHORT $L73164
$L73163:
	mov	DWORD PTR -1072+[ebp], 0
$L73164:
	mov	edx, DWORD PTR _j$71105[ebp]
	cmp	edx, DWORD PTR -1072+[ebp]
	jae	$L71108

; 574  : 						DYNBUF_ADD3(html, "<td align=center bgcolor=#", bgcolor, 0, NO_CONV, ">");

	push	1
	push	OFFSET FLAT:$SG71111
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _bgcolor$[ebp]
	push	eax
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG71112
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71110
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71114
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 574		; 0000023eH
	jmp	$eva_err$71076
$L71110:

; 575  : 						if(ctrl_calc_output_field_label(cntxt, pv, pv->col, j)) STACK_ERROR;

	mov	ecx, DWORD PTR _j$71105[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_calc_output_field_label
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71115
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 575		; 0000023fH
	jmp	$eva_err$71076
$L71115:

; 576  : 					}

	jmp	$L71107
$L71108:

; 578  : 
; 579  : 				/* Output stacked labels or totals */
; 580  : 				if(pv->col->b_stackcols && i >= pv->maxcols - COLCNT && i < pv->maxcols)

	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	cmp	DWORD PTR [edx+524], 0
	je	$L71116
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+204], 0
	je	SHORT $L73165
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -1076+[ebp], eax
	jmp	SHORT $L73166
$L73165:
	mov	DWORD PTR -1076+[ebp], 0
$L73166:
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+94120]
	sub	edx, DWORD PTR -1076+[ebp]
	cmp	DWORD PTR _i$[ebp], edx
	jb	$L71116
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+94120]
	jae	$L71116

; 582  : 					/* Output stacked label for this title row */
; 583  : 					unsigned long j = i + COLCNT - pv->maxcols;

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+204], 0
	je	SHORT $L73167
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -1080+[ebp], edx
	jmp	SHORT $L73168
$L73167:
	mov	DWORD PTR -1080+[ebp], 0
$L73168:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, DWORD PTR -1080+[ebp]
	mov	ecx, DWORD PTR _pv$[ebp]
	sub	eax, DWORD PTR [ecx+94120]
	mov	DWORD PTR _j$71117[ebp], eax

; 584  : 					if(j) DYNBUF_ADD3_INT(html, "<td width=30 bgcolor=#EEEEEE rowspan=", pv->maxcols - i + 1, ">&nbsp;</td>");

	cmp	DWORD PTR _j$71117[ebp], 0
	je	SHORT $L71119
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG71120
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+94120]
	sub	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	push	37					; 00000025H
	push	OFFSET FLAT:$SG71121
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71119
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71123
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 584		; 00000248H
	jmp	$eva_err$71076
$L71119:

; 585  : 					DYNBUF_ADD3(html, "<td bgcolor=#", bgcolor, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG71126
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _bgcolor$[ebp]
	push	ecx
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG71127
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71125
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71129
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 585		; 00000249H
	jmp	$eva_err$71076
$L71125:

; 586  : 					DYNBUF_ADD3_INT(html, " colspan=", pv->res->nbcols - j, ">");

	push	1
	push	OFFSET FLAT:$SG71131
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+212]
	mov	ecx, DWORD PTR [eax+8]
	sub	ecx, DWORD PTR _j$71117[ebp]
	push	ecx
	push	9
	push	OFFSET FLAT:$SG71132
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71130
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71134
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 586		; 0000024aH
	jmp	$eva_err$71076
$L71130:

; 587  : 					if(ctrl_calc_output_field_label(cntxt, pv, pv->col, j)) STACK_ERROR;

	mov	edx, DWORD PTR _j$71117[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_calc_output_field_label
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71135
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 587		; 0000024bH
	jmp	$eva_err$71076
$L71135:

; 589  : 				else if(i >= pv->maxcols)

	jmp	$L71146
$L71116:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+94120]
	jb	$L71146

; 591  : 					/* Output field total labels */
; 592  : 					if(pv->col->b_stackcols) DYNBUF_ADD_STR(html, "<td>&nbsp;</td>");

	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	cmp	DWORD PTR [edx+524], 0
	je	SHORT $L71140
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG71141
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71140
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71143
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 592		; 00000250H
	jmp	$eva_err$71076
$L71140:

; 593  : 					for(j = 0; !j || (pv->row && j < pv->row->totals.nbrows); j++ )

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71144
$L71145:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L71144:
	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L71147
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	je	$L71146
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+44]
	jae	$L71146
$L71147:

; 595  : 						DYNBUF_ADD3(html, "<td align=center bgcolor=#", "EEEEEE", 0, NO_CONV, ">");

	push	1
	push	OFFSET FLAT:$SG71150
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71151
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG71152
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71149
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71154
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 595		; 00000253H
	jmp	$eva_err$71076
$L71149:

; 597  : 								(pv->row && dyntab_sz(&pv->row->totals, j, 0 )) ?
; 598  : 									dyntab_val(&pv->row->totals, j, 0 ) : "Total", 0,
; 599  : 								TO_HTML, "</b></font></td>");

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L73169
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73169
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -1084+[ebp], eax
	jmp	SHORT $L73170
$L73169:
	mov	DWORD PTR -1084+[ebp], OFFSET FLAT:$SG71157
$L73170:
	push	16					; 00000010H
	push	OFFSET FLAT:$SG71156
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR -1084+[ebp]
	push	eax
	push	17					; 00000011H
	push	OFFSET FLAT:$SG71158
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71155
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71160
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 599		; 00000257H
	jmp	$eva_err$71076
$L71155:

; 600  : 					}

	jmp	$L71145
$L71146:

; 602  : 			}

	jmp	$L71102
$L71103:

; 603  : 			DYNBUF_ADD_STR(html, "</tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71163
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71162
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71165
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 603		; 0000025bH
	jmp	$eva_err$71076
$L71162:

; 604  : 
; 605  : 			/* Prepare next row if applicable */
; 606  : 			if(i < pv->maxcols)

	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+94120]
	jae	SHORT $L71168

; 607  : 				DYNBUF_ADD_STR(html, "<tr bgcolor=#EEEEEE>");

	push	0
	push	0
	push	20					; 00000014H
	push	OFFSET FLAT:$SG71169
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71168
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71171
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 607		; 0000025fH
	jmp	$eva_err$71076
$L71168:

; 608  : 		}

	jmp	$L71099
$L71100:

; 610  : 	else

	jmp	$L71207
$L71097:

; 612  : 		/* Standard format : output column labels in one row */
; 613  : 		for(icol = 0; (!icol && pv->row) || icol < pv->nbcol; icol++)

	mov	DWORD PTR _icol$[ebp], 0
	jmp	SHORT $L71173
$L71174:
	mov	eax, DWORD PTR _icol$[ebp]
	add	eax, 1
	mov	DWORD PTR _icol$[ebp], eax
$L71173:
	cmp	DWORD PTR _icol$[ebp], 0
	jne	SHORT $L71177
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	jne	SHORT $L71176
$L71177:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _icol$[ebp]
	cmp	eax, DWORD PTR [edx+81784]
	jae	$L71175
$L71176:

; 615  : 			/* Output field labels */
; 616  : 			if(pv->nbcol)

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+81784], 0
	je	$L71181

; 618  : 				pv->col = pv->cols + icol;

	mov	edx, DWORD PTR _icol$[ebp]
	imul	edx, 616				; 00000268H
	mov	eax, DWORD PTR _pv$[ebp]
	lea	ecx, DWORD PTR [eax+edx+78704]
	mov	edx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [edx+204], ecx

; 619  : 				for(i = 0; i < COLCNT; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71179
$L71180:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71179:
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L73171
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -1088+[ebp], ecx
	jmp	SHORT $L73172
$L73171:
	mov	DWORD PTR -1088+[ebp], 0
$L73172:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR -1088+[ebp]
	jae	$L71181

; 621  : 					DYNBUF_ADD3(html, "<td align=center bgcolor=#", bgcolor, 0, NO_CONV, ">");

	push	1
	push	OFFSET FLAT:$SG71184
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _bgcolor$[ebp]
	push	eax
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG71185
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71183
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71187
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 621		; 0000026dH
	jmp	$eva_err$71076
$L71183:

; 622  : 					if(ctrl_calc_output_field_label(cntxt, pv, pv->col, i)) STACK_ERROR;

	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_calc_output_field_label
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71188
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 622		; 0000026eH
	jmp	$eva_err$71076
$L71188:

; 623  : 				}

	jmp	$L71180
$L71181:

; 625  : 
; 626  : 			/* Output field total labels */
; 627  : 			for(i = 0; !i || (pv->row && i < pv->row->totals.nbrows); i++ )

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71189
$L71190:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71189:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L71192
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	$L71191
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+44]
	jae	$L71191
$L71192:

; 629  : 				DYNBUF_ADD3(html, "<td align=center bgcolor=#", "EEEEEE", 0, NO_CONV, ">");

	push	1
	push	OFFSET FLAT:$SG71195
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71196
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG71197
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71194
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71199
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 629		; 00000275H
	jmp	$eva_err$71076
$L71194:

; 631  : 					"<font size=-1><b>",
; 632  : 						(pv->row && dyntab_sz(&pv->row->totals, i, 0 )) ?
; 633  : 							dyntab_val(&pv->row->totals, i, 0 ) : "Total", 0, TO_HTML,
; 634  : 					"</b></font></td>");

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	SHORT $L73173
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73173
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -1092+[ebp], eax
	jmp	SHORT $L73174
$L73173:
	mov	DWORD PTR -1092+[ebp], OFFSET FLAT:$SG71202
$L73174:
	push	16					; 00000010H
	push	OFFSET FLAT:$SG71201
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR -1092+[ebp]
	push	ecx
	push	17					; 00000011H
	push	OFFSET FLAT:$SG71203
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71200
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71205
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 634		; 0000027aH
	jmp	SHORT $eva_err$71076
$L71200:

; 635  : 			}

	jmp	$L71190
$L71191:

; 636  : 		}

	jmp	$L71174
$L71175:

; 637  : 		DYNBUF_ADD_STR(html, "</tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71208
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71207
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71210
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 637		; 0000027dH
	jmp	SHORT $eva_err$71076
$L71207:
$eva_noerr$71096:

; 639  : 
; 640  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71211
	push	OFFSET FLAT:$SG71212
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71076:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71213
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71214
	push	OFFSET FLAT:$SG71215
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71213:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 641  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_calc_output_coltitle ENDP
_TEXT	ENDS
PUBLIC	_ctrl_calc_output_rowfield
EXTRN	_table_row_bgcolor:NEAR
EXTRN	_atof:NEAR
EXTRN	__ftol:NEAR
EXTRN	__fltused:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71273 DB	01H DUP (?)
	ALIGN	4

$SG71304 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG71241 DB	'<tr><td>-</td><td align=center>0</td>', 00H
	ORG $+2
$SG71243 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71264 DB	'EEEEEE', 00H
	ORG $+1
$SG71267 DB	'<tr', 00H
$SG71269 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71274 DB	' bgcolor=#', 00H
	ORG $+1
$SG71276 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71279 DB	'>', 00H
	ORG $+2
$SG71281 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71291 DB	'<td align=right><font size=-1>', 00H
	ORG $+1
$SG71293 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71298 DB	'<td align=right><font size=-1>', 00H
	ORG $+1
$SG71300 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71303 DB	' lignes - ', 00H
	ORG $+1
$SG71306 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71309 DB	'</b></font></td>', 00H
	ORG $+3
$SG71310 DB	'%', 00H
	ORG $+2
$SG71311 DB	'Total', 00H
	ORG $+2
$SG71312 DB	'<b>', 00H
$SG71314 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71320 DB	'8080FF', 00H
	ORG $+1
$SG71324 DB	'_EVA_TOTAL', 00H
	ORG $+1
$SG71330 DB	'<td>', 00H
	ORG $+3
$SG71332 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71335 DB	'<table noborder height=16 cellpadding=0 cellspacing=0 bg'
	DB	'color=#%s width=%lu><tr><td><font size=-1 color=%s></font></t'
	DB	'd></tr></table>', 00H
	ORG $+3
$SG71338 DB	'</td>', 00H
	ORG $+2
$SG71340 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71343 DB	'</tr>', 00H
	ORG $+2
$SG71345 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71350 DB	'<tr><td></td>', 00H
	ORG $+2
$SG71352 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71358 DB	'8080FF', 00H
	ORG $+1
$SG71367 DB	'_EVA_TOTAL', 00H
	ORG $+1
$SG71376 DB	'<td valign=bottom>', 00H
	ORG $+1
$SG71378 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71381 DB	'<table noborder cellpadding=0 cellspacing=0 width=100%%>'
	DB	'<tr><td height=%lu bgcolor=#%s></td></tr></table>', 00H
	ORG $+2
$SG71384 DB	'</td>', 00H
	ORG $+2
$SG71386 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71387 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71388 DB	'ctrl_calc_output_rowfield', 00H
	ORG $+2
$SG71390 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71391 DB	'ctrl_calc_output_rowfield', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_pv$ = 16
_form$ = -4
_ctrl$ = -1064
_irow$ = -1040
_idata$ = -1052
_i$ = -1044
_j$ = -1048
_icol$ = -1036
_html$ = -1032
_printbuf$ = -1028
_pvf$ = -1056
_pvg$ = -1060
_val$71255 = -1072
_bgcolor$71262 = -1076
_val$71325 = -1084
_w$71326 = -1088
_b_graph$71356 = -1092
_val$71363 = -1100
_val$71371 = -1108
_h$71372 = -1112
_ctrl_calc_output_rowfield PROC NEAR

; 655  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1236				; 000004d4H

; 656  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 657  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 658  : 	unsigned long irow = pv->row ? pv->row - pv->rows : 0;

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L73176
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 60216				; 0000eb38H
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	sub	edx, eax
	mov	eax, edx
	cdq
	mov	ecx, 616				; 00000268H
	idiv	ecx
	mov	DWORD PTR -1116+[ebp], eax
	jmp	SHORT $L73177
$L73176:
	mov	DWORD PTR -1116+[ebp], 0
$L73177:
	mov	edx, DWORD PTR -1116+[ebp]
	mov	DWORD PTR _irow$[ebp], edx

; 659  : 	unsigned long idata = pv->data ? pv->data - pv->datas : 0;

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+208], 0
	je	SHORT $L73178
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 81792				; 00013f80H
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+208]
	sub	eax, ecx
	cdq
	mov	ecx, 616				; 00000268H
	idiv	ecx
	mov	DWORD PTR -1120+[ebp], eax
	jmp	SHORT $L73179
$L73178:
	mov	DWORD PTR -1120+[ebp], 0
$L73179:
	mov	edx, DWORD PTR -1120+[ebp]
	mov	DWORD PTR _idata$[ebp], edx

; 660  : 	unsigned long i, j, icol;
; 661  : 	DynBuffer **html = form->html;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR _html$[ebp], ecx

; 662  : 	char printbuf[1024];
; 663  : 	PivotTableField *pvf, *pvg;
; 664  : 
; 665  : 	/* Return if no object selected */
; 666  : 	if(pv->b_empty)

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94224], 0
	je	SHORT $L71238

; 668  : 		DYNBUF_ADD_STR(html, "<tr><td>-</td><td align=center>0</td>");

	push	0
	push	0
	push	37					; 00000025H
	push	OFFSET FLAT:$SG71241
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71240
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71243
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 668		; 0000029cH
	jmp	$eva_err$71244
$L71240:

; 669  : 		RETURN_OK;

	jmp	$eva_noerr$71245
$L71238:

; 671  : 
; 672  : 	/* Get min / max values for each column field */
; 673  : 	if(pv->row) for(icol = 0; !icol || icol < pv->nbcol; icol++)

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	$L71249
	mov	DWORD PTR _icol$[ebp], 0
	jmp	SHORT $L71247
$L71248:
	mov	ecx, DWORD PTR _icol$[ebp]
	add	ecx, 1
	mov	DWORD PTR _icol$[ebp], ecx
$L71247:
	cmp	DWORD PTR _icol$[ebp], 0
	je	SHORT $L71250
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _icol$[ebp]
	cmp	eax, DWORD PTR [edx+81784]
	jae	$L71249
$L71250:

; 675  : 		pv->col = pv->nbcol ? pv->cols + icol : NULL;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+81784], 0
	je	SHORT $L73180
	mov	edx, DWORD PTR _icol$[ebp]
	imul	edx, 616				; 00000268H
	mov	eax, DWORD PTR _pv$[ebp]
	lea	ecx, DWORD PTR [eax+edx+78704]
	mov	DWORD PTR -1124+[ebp], ecx
	jmp	SHORT $L73181
$L73180:
	mov	DWORD PTR -1124+[ebp], 0
$L73181:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR -1124+[ebp]
	mov	DWORD PTR [edx+204], eax

; 676  : 		pvf = pv->col ? pv->col : pv->row;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L73182
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	DWORD PTR -1128+[ebp], eax
	jmp	SHORT $L73183
$L73182:
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	mov	DWORD PTR -1128+[ebp], edx
$L73183:
	mov	eax, DWORD PTR -1128+[ebp]
	mov	DWORD PTR _pvf$[ebp], eax

; 677  : 		pvf->resmin = 0; pvf->resmax = 0;

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+584], 0
	mov	DWORD PTR [ecx+588], 0
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [edx+592], 0
	mov	DWORD PTR [edx+596], 0

; 678  : 		for(j = 0; j < ROWCNT; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71252
$L71253:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L71252:
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	je	SHORT $L73184
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -1132+[ebp], ecx
	jmp	SHORT $L73185
$L73184:
	mov	DWORD PTR -1132+[ebp], 0
$L73185:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR -1132+[ebp]
	jae	$L71254

; 680  : 			double val = atof(dyntab_val(&pv->restbl[idata][irow][icol], j, COLCNT));

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+204], 0
	je	SHORT $L73186
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -1136+[ebp], eax
	jmp	SHORT $L73187
$L73186:
	mov	DWORD PTR -1136+[ebp], 0
$L73187:
	mov	ecx, DWORD PTR -1136+[ebp]
	push	ecx
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _idata$[ebp]
	imul	eax, 3000				; 00000bb8H
	mov	ecx, DWORD PTR _pv$[ebp]
	lea	edx, DWORD PTR [ecx+eax+216]
	mov	eax, DWORD PTR _irow$[ebp]
	imul	eax, 100				; 00000064H
	add	edx, eax
	mov	ecx, DWORD PTR _icol$[ebp]
	imul	ecx, 20					; 00000014H
	add	edx, ecx
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atof
	add	esp, 4
	fstp	QWORD PTR _val$71255[ebp]

; 681  : 			if(val > pvf->resmax) pvf->resmax = val;

	mov	edx, DWORD PTR _pvf$[ebp]
	fld	QWORD PTR _val$71255[ebp]
	fcomp	QWORD PTR [edx+592]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L71256
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR _val$71255[ebp]
	mov	DWORD PTR [eax+592], ecx
	mov	edx, DWORD PTR _val$71255[ebp+4]
	mov	DWORD PTR [eax+596], edx

; 682  : 			else if(val < pvf->resmin) pvf->resmin = val;

	jmp	SHORT $L71258
$L71256:
	mov	eax, DWORD PTR _pvf$[ebp]
	fld	QWORD PTR _val$71255[ebp]
	fcomp	QWORD PTR [eax+584]
	fnstsw	ax
	test	ah, 1
	je	SHORT $L71258
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR _val$71255[ebp]
	mov	DWORD PTR [ecx+584], edx
	mov	eax, DWORD PTR _val$71255[ebp+4]
	mov	DWORD PTR [ecx+588], eax
$L71258:

; 683  : 		}

	jmp	$L71253
$L71254:

; 684  : 	}

	jmp	$L71248
$L71249:

; 685  : 
; 686  : 	/* Output rows */
; 687  : 	for(i = 0; i < pv->maxrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71259
$L71260:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71259:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+94124]
	jae	$L71261

; 689  : 		char *bgcolor = i < ROWCNT ? table_row_bgcolor(cntxt, ctrl->objtbl, i, NULL) : "EEEEEE";

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	je	SHORT $L73188
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -1140+[ebp], ecx
	jmp	SHORT $L73189
$L73188:
	mov	DWORD PTR -1140+[ebp], 0
$L73189:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR -1140+[ebp]
	jae	SHORT $L73190
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_row_bgcolor
	add	esp, 16					; 00000010H
	mov	DWORD PTR -1144+[ebp], eax
	jmp	SHORT $L73191
$L73190:
	mov	DWORD PTR -1144+[ebp], OFFSET FLAT:$SG71264
$L73191:
	mov	ecx, DWORD PTR -1144+[ebp]
	mov	DWORD PTR _bgcolor$71262[ebp], ecx

; 690  : 		DYNBUF_ADD_STR(html, "<tr");

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG71267
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71266
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71269
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 690		; 000002b2H
	jmp	$eva_err$71244
$L71266:

; 691  : 		if(*bgcolor) DYNBUF_ADD3(html, " bgcolor=#", bgcolor, 0, NO_CONV, "");

	mov	edx, DWORD PTR _bgcolor$71262[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L71272
	push	0
	push	OFFSET FLAT:$SG71273
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _bgcolor$71262[ebp]
	push	ecx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71274
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71272
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71276
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 691		; 000002b3H
	jmp	$eva_err$71244
$L71272:

; 692  : 		DYNBUF_ADD_STR(html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71279
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71278
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71281
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 692		; 000002b4H
	jmp	$eva_err$71244
$L71278:

; 693  : 
; 694  : 		/* Output columns for each field */
; 695  : 		for(icol = 0; !icol || icol < pv->nbcol; icol++)

	mov	DWORD PTR _icol$[ebp], 0
	jmp	SHORT $L71282
$L71283:
	mov	edx, DWORD PTR _icol$[ebp]
	add	edx, 1
	mov	DWORD PTR _icol$[ebp], edx
$L71282:
	cmp	DWORD PTR _icol$[ebp], 0
	je	SHORT $L71285
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR _icol$[ebp]
	cmp	ecx, DWORD PTR [eax+81784]
	jae	$L71284
$L71285:

; 697  : 			pv->col = pv->nbcol ? pv->cols + icol : NULL;

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+81784], 0
	je	SHORT $L73192
	mov	eax, DWORD PTR _icol$[ebp]
	imul	eax, 616				; 00000268H
	mov	ecx, DWORD PTR _pv$[ebp]
	lea	edx, DWORD PTR [ecx+eax+78704]
	mov	DWORD PTR -1148+[ebp], edx
	jmp	SHORT $L73193
$L73192:
	mov	DWORD PTR -1148+[ebp], 0
$L73193:
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR -1148+[ebp]
	mov	DWORD PTR [eax+204], ecx

; 698  : 			pv->res = &pv->restbl[idata][irow][icol];

	mov	edx, DWORD PTR _idata$[ebp]
	imul	edx, 3000				; 00000bb8H
	mov	eax, DWORD PTR _pv$[ebp]
	lea	ecx, DWORD PTR [eax+edx+216]
	mov	edx, DWORD PTR _irow$[ebp]
	imul	edx, 100				; 00000064H
	add	ecx, edx
	mov	eax, DWORD PTR _icol$[ebp]
	imul	eax, 20					; 00000014H
	add	ecx, eax
	mov	edx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [edx+212], ecx

; 699  : 
; 700  : 			/* Output row label if first column field */
; 701  : 			if(!icol)

	cmp	DWORD PTR _icol$[ebp], 0
	jne	$L71308

; 703  : 				if(i < ROWCNT)

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	SHORT $L73194
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -1152+[ebp], eax
	jmp	SHORT $L73195
$L73194:
	mov	DWORD PTR -1152+[ebp], 0
$L73195:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR -1152+[ebp]
	jae	SHORT $L71288

; 705  : 					DYNBUF_ADD_STR(html, "<td align=right><font size=-1>");

	push	0
	push	0
	push	30					; 0000001eH
	push	OFFSET FLAT:$SG71291
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71290
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71293
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 705		; 000002c1H
	jmp	$eva_err$71244
$L71290:

; 706  : 					if(ctrl_calc_output_field_label(cntxt, pv, pv->row, i)) STACK_ERROR;

	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_calc_output_field_label
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71294
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 706		; 000002c2H
	jmp	$eva_err$71244
$L71294:

; 708  : 				else

	jmp	$L71308
$L71288:

; 710  : 					DYNBUF_ADD_STR(html, "<td align=right><font size=-1>");

	push	0
	push	0
	push	30					; 0000001eH
	push	OFFSET FLAT:$SG71298
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71297
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71300
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 710		; 000002c6H
	jmp	$eva_err$71244
$L71297:

; 711  : 					if(i == ROWCNT && pv->row && pv->row->labels.nbrows > 2 && pv->tblnotes != TblNote_minimal)

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L73196
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -1156+[ebp], edx
	jmp	SHORT $L73197
$L73196:
	mov	DWORD PTR -1156+[ebp], 0
$L73197:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR -1156+[ebp]
	jne	SHORT $L71302
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	je	SHORT $L71302
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	cmp	DWORD PTR [eax+24], 2
	jbe	SHORT $L71302
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+156], 61440		; 0000f000H
	je	SHORT $L71302

; 712  : 						DYNBUF_ADD3_INT(html, "", pv->row->labels.nbrows, " lignes - ");

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71303
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	push	0
	push	OFFSET FLAT:$SG71304
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71302
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71306
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 712		; 000002c8H
	jmp	$eva_err$71244
$L71302:

; 714  : 								(pv->col && dyntab_sz(&pv->col->totals, i - ROWCNT, 0 )) ?
; 715  : 								dyntab_val(&pv->col->totals, i - ROWCNT, 0 ) : (i - ROWCNT) ? "%" : "Total", 0, NO_CONV,
; 716  : 							"</b></font></td>");

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+204], 0
	je	$L73200
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	SHORT $L73198
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -1160+[ebp], eax
	jmp	SHORT $L73199
$L73198:
	mov	DWORD PTR -1160+[ebp], 0
$L73199:
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	sub	ecx, DWORD PTR -1160+[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73200
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	je	SHORT $L73201
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -1164+[ebp], ecx
	jmp	SHORT $L73202
$L73201:
	mov	DWORD PTR -1164+[ebp], 0
$L73202:
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, DWORD PTR -1164+[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -1168+[ebp], eax
	jmp	SHORT $L73207
$L73200:
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L73203
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -1172+[ebp], edx
	jmp	SHORT $L73204
$L73203:
	mov	DWORD PTR -1172+[ebp], 0
$L73204:
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, DWORD PTR -1172+[ebp]
	test	eax, eax
	je	SHORT $L73205
	mov	DWORD PTR -1176+[ebp], OFFSET FLAT:$SG71310
	jmp	SHORT $L73206
$L73205:
	mov	DWORD PTR -1176+[ebp], OFFSET FLAT:$SG71311
$L73206:
	mov	ecx, DWORD PTR -1176+[ebp]
	mov	DWORD PTR -1168+[ebp], ecx
$L73207:
	push	16					; 00000010H
	push	OFFSET FLAT:$SG71309
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR -1168+[ebp]
	push	edx
	push	3
	push	OFFSET FLAT:$SG71312
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71308
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71314
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 716		; 000002ccH
	jmp	$eva_err$71244
$L71308:

; 719  : 
; 720  : 			/* Output cells */
; 721  : 			for(j = 0; j < pv->res->nbcols; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71315
$L71316:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L71315:
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+8]
	jae	SHORT $L71317

; 722  : 				if(ctrl_calc_output_pvtcell(cntxt, i_ctrl, pv, i, j)) STACK_ERROR;

	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_calc_output_pvtcell
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71318
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 722		; 000002d2H
	jmp	$eva_err$71244
$L71318:
	jmp	SHORT $L71316
$L71317:

; 723  : 
; 724  : 			/* Set params for in-table graph */
; 725  : 			pvf = pv->col ? pv->col : pv->row;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L73208
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	DWORD PTR -1180+[ebp], eax
	jmp	SHORT $L73209
$L73208:
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	mov	DWORD PTR -1180+[ebp], edx
$L73209:
	mov	eax, DWORD PTR -1180+[ebp]
	mov	DWORD PTR _pvf$[ebp], eax

; 726  : 			pvg = (pv->row && pv->row->graph_pos) ? pv->row : pv->data;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	je	SHORT $L73210
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	cmp	DWORD PTR [eax+600], 0
	je	SHORT $L73210
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	mov	DWORD PTR -1184+[ebp], edx
	jmp	SHORT $L73211
$L73210:
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	mov	DWORD PTR -1184+[ebp], ecx
$L73211:
	mov	edx, DWORD PTR -1184+[ebp]
	mov	DWORD PTR _pvg$[ebp], edx

; 727  : 			if(pvg && !pvg->graph_color) pvg->graph_color = "8080FF";

	cmp	DWORD PTR _pvg$[ebp], 0
	je	SHORT $L71319
	mov	eax, DWORD PTR _pvg$[ebp]
	cmp	DWORD PTR [eax+604], 0
	jne	SHORT $L71319
	mov	ecx, DWORD PTR _pvg$[ebp]
	mov	DWORD PTR [ecx+604], OFFSET FLAT:$SG71320
$L71319:

; 728  : 			if(pvg && pvg->graph_size < 10) pvg->graph_size = 40;

	cmp	DWORD PTR _pvg$[ebp], 0
	je	SHORT $L71321
	mov	edx, DWORD PTR _pvg$[ebp]
	cmp	DWORD PTR [edx+608], 10			; 0000000aH
	jae	SHORT $L71321
	mov	eax, DWORD PTR _pvg$[ebp]
	mov	DWORD PTR [eax+608], 40			; 00000028H
$L71321:

; 729  : 
; 730  : 			/* Output in-table graph for row values */
; 731  : 			if((icol + 1 == pv->nbcol || !pv->nbcol) && !pv->exportparams && pvg && pvg->graph_pos &&
; 732  : 				!strcmp(pvg->graph_pos, "_EVA_TOTAL") && pvf && pvf->resmax > pvf->resmin)

	mov	ecx, DWORD PTR _icol$[ebp]
	add	ecx, 1
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	ecx, DWORD PTR [edx+81784]
	je	SHORT $L71323
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+81784], 0
	jne	$L71337
$L71323:
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+94136], 0
	jne	$L71337
	cmp	DWORD PTR _pvg$[ebp], 0
	je	$L71337
	mov	edx, DWORD PTR _pvg$[ebp]
	cmp	DWORD PTR [edx+600], 0
	je	$L71337
	push	OFFSET FLAT:$SG71324
	mov	eax, DWORD PTR _pvg$[ebp]
	mov	ecx, DWORD PTR [eax+600]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L71337
	cmp	DWORD PTR _pvf$[ebp], 0
	je	$L71337
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR _pvf$[ebp]
	fld	QWORD PTR [edx+592]
	fcomp	QWORD PTR [eax+584]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	$L71337

; 734  : 				double val = atof(dyntab_val(pv->res, i, COLCNT));

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L73212
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -1188+[ebp], ecx
	jmp	SHORT $L73213
$L73212:
	mov	DWORD PTR -1188+[ebp], 0
$L73213:
	mov	edx, DWORD PTR -1188+[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atof
	add	esp, 4
	fstp	QWORD PTR _val$71325[ebp]

; 735  : 				unsigned long w = (unsigned long)(pvg->graph_size * (val - pvf->resmin) / (pvf->resmax - pvf->resmin));

	mov	eax, DWORD PTR _pvg$[ebp]
	mov	ecx, DWORD PTR [eax+608]
	mov	DWORD PTR -1196+[ebp], ecx
	mov	DWORD PTR -1196+[ebp+4], 0
	fild	QWORD PTR -1196+[ebp]
	mov	edx, DWORD PTR _pvf$[ebp]
	fld	QWORD PTR _val$71325[ebp]
	fsub	QWORD PTR [edx+584]
	fmulp	ST(1), ST(0)
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR _pvf$[ebp]
	fld	QWORD PTR [eax+592]
	fsub	QWORD PTR [ecx+584]
	fdivp	ST(1), ST(0)
	call	__ftol
	mov	DWORD PTR _w$71326[ebp], eax

; 736  : 				DYNBUF_ADD_STR(html, "<td>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG71330
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71329
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71332
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 736		; 000002e0H
	jmp	$eva_err$71244
$L71329:

; 737  : 				if( i < ROWCNT && w)

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L73214
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -1200+[ebp], edx
	jmp	SHORT $L73215
$L73214:
	mov	DWORD PTR -1200+[ebp], 0
$L73215:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR -1200+[ebp]
	jae	SHORT $L71333
	cmp	DWORD PTR _w$71326[ebp], 0
	je	SHORT $L71333

; 739  : 					dynbuf_print3(html,
; 740  : 						"<table noborder height=16 cellpadding=0 cellspacing=0 bgcolor=#%s width=%lu><tr>"
; 741  : 						"<td><font size=-1 color=%s></font></td></tr></table>", pvg->graph_color, w, pvg->graph_color);

	push	0
	push	0
	mov	ecx, DWORD PTR _pvg$[ebp]
	mov	edx, DWORD PTR [ecx+604]
	push	edx
	mov	eax, DWORD PTR _w$71326[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvg$[ebp]
	mov	edx, DWORD PTR [ecx+604]
	push	edx
	push	OFFSET FLAT:$SG71335
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 24					; 00000018H
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L71333:

; 743  : 				DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71338
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71337
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71340
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 743		; 000002e7H
	jmp	$eva_err$71244
$L71337:

; 745  : 
; 746  : 		}

	jmp	$L71283
$L71284:

; 747  : 		DYNBUF_ADD_STR(html, "</tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71343
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71342
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71345
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 747		; 000002ebH
	jmp	$eva_err$71244
$L71342:

; 748  : 	}

	jmp	$L71260
$L71261:

; 749  : 
; 750  : 	/* Output in-table graph for each column field */
; 751  : 	if(!pv->exportparams && pv->nbcol && (!pv->nbrow || irow + 1 == pv->nbrow))

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+94136], 0
	jne	$L71355
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+81784], 0
	je	$L71355
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+78696], 0
	je	SHORT $L71347
	mov	eax, DWORD PTR _irow$[ebp]
	add	eax, 1
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	eax, DWORD PTR [ecx+78696]
	jne	$L71355
$L71347:

; 753  : 		DYNBUF_ADD_STR(html, "<tr><td></td>");

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG71350
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71349
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71352
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 753		; 000002f1H
	jmp	$eva_err$71244
$L71349:

; 754  : 		for(icol = 0; icol < pv->nbcol; icol++)

	mov	DWORD PTR _icol$[ebp], 0
	jmp	SHORT $L71353
$L71354:
	mov	edx, DWORD PTR _icol$[ebp]
	add	edx, 1
	mov	DWORD PTR _icol$[ebp], edx
$L71353:
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR _icol$[ebp]
	cmp	ecx, DWORD PTR [eax+81784]
	jae	$L71355

; 756  : 			int b_graph = 0;

	mov	DWORD PTR _b_graph$71356[ebp], 0

; 757  : 			pv->col = pv->cols + icol;

	mov	edx, DWORD PTR _icol$[ebp]
	imul	edx, 616				; 00000268H
	mov	eax, DWORD PTR _pv$[ebp]
	lea	ecx, DWORD PTR [eax+edx+78704]
	mov	edx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [edx+204], ecx

; 758  : 			pv->col->resmin = 0; pv->col->resmax = 0;

	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	DWORD PTR [ecx+584], 0
	mov	DWORD PTR [ecx+588], 0
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	DWORD PTR [eax+592], 0
	mov	DWORD PTR [eax+596], 0

; 759  : 			pvg = (pv->col->graph_pos) ? pv->col : pv->data;

	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	cmp	DWORD PTR [edx+600], 0
	je	SHORT $L73216
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	DWORD PTR -1204+[ebp], ecx
	jmp	SHORT $L73217
$L73216:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+208]
	mov	DWORD PTR -1204+[ebp], eax
$L73217:
	mov	ecx, DWORD PTR -1204+[ebp]
	mov	DWORD PTR _pvg$[ebp], ecx

; 760  : 			if(pvg && !pvg->graph_color) pvg->graph_color = "8080FF";

	cmp	DWORD PTR _pvg$[ebp], 0
	je	SHORT $L71357
	mov	edx, DWORD PTR _pvg$[ebp]
	cmp	DWORD PTR [edx+604], 0
	jne	SHORT $L71357
	mov	eax, DWORD PTR _pvg$[ebp]
	mov	DWORD PTR [eax+604], OFFSET FLAT:$SG71358
$L71357:

; 761  : 			if(pvg && pvg->graph_size < 10) pvg->graph_size = 40;

	cmp	DWORD PTR _pvg$[ebp], 0
	je	SHORT $L71359
	mov	ecx, DWORD PTR _pvg$[ebp]
	cmp	DWORD PTR [ecx+608], 10			; 0000000aH
	jae	SHORT $L71359
	mov	edx, DWORD PTR _pvg$[ebp]
	mov	DWORD PTR [edx+608], 40			; 00000028H
$L71359:

; 762  : 
; 763  : 			/* Get maximum value for column field totals */
; 764  : 			pv->res = &pv->restbl[idata][irow][icol];

	mov	eax, DWORD PTR _idata$[ebp]
	imul	eax, 3000				; 00000bb8H
	mov	ecx, DWORD PTR _pv$[ebp]
	lea	edx, DWORD PTR [ecx+eax+216]
	mov	eax, DWORD PTR _irow$[ebp]
	imul	eax, 100				; 00000064H
	add	edx, eax
	mov	ecx, DWORD PTR _icol$[ebp]
	imul	ecx, 20					; 00000014H
	add	edx, ecx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [eax+212], edx

; 765  : 			for(j = 0; j < COLCNT; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71360
$L71361:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L71360:
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+204], 0
	je	SHORT $L73218
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -1208+[ebp], edx
	jmp	SHORT $L73219
$L73218:
	mov	DWORD PTR -1208+[ebp], 0
$L73219:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR -1208+[ebp]
	jae	$L71362

; 767  : 				double val = atof(dyntab_val(pv->res, ROWCNT, j));

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	je	SHORT $L73220
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR -1212+[ebp], ecx
	jmp	SHORT $L73221
$L73220:
	mov	DWORD PTR -1212+[ebp], 0
$L73221:
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR -1212+[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atof
	add	esp, 4
	fstp	QWORD PTR _val$71363[ebp]

; 768  : 				if(val > pv->col->resmax) pv->col->resmax = val;

	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	fld	QWORD PTR _val$71363[ebp]
	fcomp	QWORD PTR [ecx+592]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L71364
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR _val$71363[ebp]
	mov	DWORD PTR [eax+592], ecx
	mov	edx, DWORD PTR _val$71363[ebp+4]
	mov	DWORD PTR [eax+596], edx

; 769  : 				else if(val < pv->col->resmin) pv->col->resmin = val;

	jmp	SHORT $L71366
$L71364:
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	fld	QWORD PTR _val$71363[ebp]
	fcomp	QWORD PTR [ecx+584]
	fnstsw	ax
	test	ah, 1
	je	SHORT $L71366
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR _val$71363[ebp]
	mov	DWORD PTR [eax+584], ecx
	mov	edx, DWORD PTR _val$71363[ebp+4]
	mov	DWORD PTR [eax+588], edx
$L71366:

; 770  : 			}

	jmp	$L71361
$L71362:

; 771  : 			b_graph = pvg && pvg->graph_pos && !strcmp(pvg->graph_pos, "_EVA_TOTAL") && pv->col->resmax > pv->col->resmin;

	cmp	DWORD PTR _pvg$[ebp], 0
	je	SHORT $L73222
	mov	eax, DWORD PTR _pvg$[ebp]
	cmp	DWORD PTR [eax+600], 0
	je	SHORT $L73222
	push	OFFSET FLAT:$SG71367
	mov	ecx, DWORD PTR _pvg$[ebp]
	mov	edx, DWORD PTR [ecx+600]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73222
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	fld	QWORD PTR [ecx+592]
	fcomp	QWORD PTR [eax+584]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L73222
	mov	DWORD PTR -1216+[ebp], 1
	jmp	SHORT $L73223
$L73222:
	mov	DWORD PTR -1216+[ebp], 0
$L73223:
	mov	ecx, DWORD PTR -1216+[ebp]
	mov	DWORD PTR _b_graph$71356[ebp], ecx

; 772  : 
; 773  : 			/* Output graph for column field */
; 774  : 			for(j = 0; j < pv->res->nbcols; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71368
$L71369:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L71368:
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+8]
	jae	$L71370

; 776  : 				double val = atof(dyntab_val(pv->res, ROWCNT, j));

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	SHORT $L73224
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -1220+[ebp], eax
	jmp	SHORT $L73225
$L73224:
	mov	DWORD PTR -1220+[ebp], 0
$L73225:
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR -1220+[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atof
	add	esp, 4
	fstp	QWORD PTR _val$71371[ebp]

; 777  : 				unsigned long h = b_graph ? (unsigned long)(pvg->graph_size * (val - pv->col->resmin) / (pv->col->resmax - pv->col->resmin)) : 0;

	cmp	DWORD PTR _b_graph$71356[ebp], 0
	je	SHORT $L73226
	mov	edx, DWORD PTR _pvg$[ebp]
	mov	eax, DWORD PTR [edx+608]
	mov	DWORD PTR -1228+[ebp], eax
	mov	DWORD PTR -1228+[ebp+4], 0
	fild	QWORD PTR -1228+[ebp]
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	fld	QWORD PTR _val$71371[ebp]
	fsub	QWORD PTR [edx+584]
	fmulp	ST(1), ST(0)
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	fld	QWORD PTR [ecx+592]
	fsub	QWORD PTR [eax+584]
	fdivp	ST(1), ST(0)
	call	__ftol
	mov	DWORD PTR -1232+[ebp], eax
	jmp	SHORT $L73227
$L73226:
	mov	DWORD PTR -1232+[ebp], 0
$L73227:
	mov	ecx, DWORD PTR -1232+[ebp]
	mov	DWORD PTR _h$71372[ebp], ecx

; 778  : 				DYNBUF_ADD_STR(html, "<td valign=bottom>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG71376
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71375
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71378
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 778		; 0000030aH
	jmp	$eva_err$71244
$L71375:

; 779  : 				if(h && j < COLCNT)

	cmp	DWORD PTR _h$71372[ebp], 0
	je	$L71379
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+204], 0
	je	SHORT $L73228
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -1236+[ebp], edx
	jmp	SHORT $L73229
$L73228:
	mov	DWORD PTR -1236+[ebp], 0
$L73229:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR -1236+[ebp]
	jae	SHORT $L71379

; 781  : 					dynbuf_print2(html,
; 782  : 						"<table noborder cellpadding=0 cellspacing=0 width=100%%><tr>"
; 783  : 						"<td height=%lu bgcolor=#%s></td></tr></table>", h, pvg->graph_color);

	push	0
	push	0
	mov	ecx, DWORD PTR _pvg$[ebp]
	mov	edx, DWORD PTR [ecx+604]
	push	edx
	mov	eax, DWORD PTR _h$71372[ebp]
	push	eax
	push	OFFSET FLAT:$SG71381
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L71379:

; 785  : 				DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71384
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71383
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71386
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 785		; 00000311H
	jmp	SHORT $eva_err$71244
$L71383:

; 786  : 			}

	jmp	$L71369
$L71370:

; 787  : 
; 788  : 		}

	jmp	$L71354
$L71355:
$eva_noerr$71245:

; 790  : 
; 791  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71387
	push	OFFSET FLAT:$SG71388
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71244:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71389
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71390
	push	OFFSET FLAT:$SG71391
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71389:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 792  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_calc_output_rowfield ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_pvt_lblnote
_BSS	SEGMENT
	ALIGN	4

$SG71442 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG71407 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG71410 DB	'</b> ', 00H
	ORG $+2
$SG71411 DB	'<b>', 00H
$SG71413 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71418 DB	'<br>', 00H
	ORG $+3
$SG71420 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71423 DB	'_EVA_NOTES', 00H
	ORG $+1
$SG71428 DB	'<u>Notes</u> : ', 00H
$SG71430 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71435 DB	' : ', 00H
$SG71437 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71441 DB	'<br>', 00H
	ORG $+3
$SG71444 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71446 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71447 DB	'ctrl_output_pvt_lblnote', 00H
$SG71449 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71450 DB	'ctrl_output_pvt_lblnote', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_options$ = 12
_data$ = 16
_html$ = -4
__c$71406 = -8
_c$71422 = -12
__c$71438 = -16
_ctrl_output_pvt_lblnote PROC NEAR

; 809  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

; 810  : 	DynBuffer **html = cntxt->form->html;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR _html$[ebp], edx

; 811  : 	if(!html) return 0;

	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L71404
	xor	eax, eax
	jmp	$L71402
$L71404:

; 812  : 
; 813  : 	if(options & 2)

	mov	eax, DWORD PTR _options$[ebp]
	and	eax, 2
	test	eax, eax
	je	$L71417

; 815  : 		DYNBUF_ADD3_CELLP(html, "<b>", DYNTAB_FIELD_CELL(data, LABEL), TO_HTML, "</b> ");

	push	0
	push	-1
	push	OFFSET FLAT:$SG71407
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR __c$71406[ebp], eax
	cmp	DWORD PTR __c$71406[ebp], 0
	je	SHORT $L73233
	mov	edx, DWORD PTR __c$71406[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -20+[ebp], eax
	jmp	SHORT $L73234
$L73233:
	mov	DWORD PTR -20+[ebp], 0
$L73234:
	cmp	DWORD PTR __c$71406[ebp], 0
	je	SHORT $L73235
	mov	ecx, DWORD PTR __c$71406[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -24+[ebp], edx
	jmp	SHORT $L73236
$L73235:
	mov	DWORD PTR -24+[ebp], 0
$L73236:
	push	5
	push	OFFSET FLAT:$SG71410
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	eax, DWORD PTR -20+[ebp]
	push	eax
	mov	ecx, DWORD PTR -24+[ebp]
	push	ecx
	push	3
	push	OFFSET FLAT:$SG71411
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71409
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71413
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 815		; 0000032fH
	jmp	$eva_err$71414
$L71409:

; 816  : 		if(options & 1) DYNBUF_ADD_STR(html, "<br>")

	mov	edx, DWORD PTR _options$[ebp]
	and	edx, 1
	test	edx, edx
	je	SHORT $L71417
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG71418
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71417
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71420
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 816		; 00000330H
	jmp	$eva_err$71414
$L71417:

; 818  : 
; 819  : 	if(options & 4)

	mov	eax, DWORD PTR _options$[ebp]
	and	eax, 4
	test	eax, eax
	je	$L71440

; 821  : 		DynTableCell *c = DYNTAB_FIELD_CELL(data, NOTES);

	push	0
	push	-1
	push	OFFSET FLAT:$SG71423
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _c$71422[ebp], eax

; 822  : 		if(c)

	cmp	DWORD PTR _c$71422[ebp], 0
	je	$L71440

; 824  : 			if(options & 1) DYNBUF_ADD_STR(html, "<u>Notes</u> : ")

	mov	edx, DWORD PTR _options$[ebp]
	and	edx, 1
	test	edx, edx
	je	SHORT $L71425
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG71428
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71427
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71430
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 824		; 00000338H
	jmp	$eva_err$71414
$L71427:

; 825  : 			else if(options & 2) DYNBUF_ADD_STR(html, " : ");

	jmp	SHORT $L71434
$L71425:
	mov	eax, DWORD PTR _options$[ebp]
	and	eax, 2
	test	eax, eax
	je	SHORT $L71434
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG71435
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71434
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71437
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 825		; 00000339H
	jmp	$eva_err$71414
$L71434:

; 826  : 			DYNBUF_ADD3_CELLP(html, "", c, TO_HTML, "<br>");

	mov	ecx, DWORD PTR _c$71422[ebp]
	mov	DWORD PTR __c$71438[ebp], ecx
	cmp	DWORD PTR __c$71438[ebp], 0
	je	SHORT $L73237
	mov	edx, DWORD PTR __c$71438[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L73238
$L73237:
	mov	DWORD PTR -28+[ebp], 0
$L73238:
	cmp	DWORD PTR __c$71438[ebp], 0
	je	SHORT $L73239
	mov	ecx, DWORD PTR __c$71438[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -32+[ebp], edx
	jmp	SHORT $L73240
$L73239:
	mov	DWORD PTR -32+[ebp], 0
$L73240:
	push	4
	push	OFFSET FLAT:$SG71441
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	eax, DWORD PTR -28+[ebp]
	push	eax
	mov	ecx, DWORD PTR -32+[ebp]
	push	ecx
	push	0
	push	OFFSET FLAT:$SG71442
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71440
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71444
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 826		; 0000033aH
	jmp	SHORT $eva_err$71414
$L71440:
$eva_noerr$71445:

; 829  : 
; 830  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71446
	push	OFFSET FLAT:$SG71447
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71414:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71448
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71449
	push	OFFSET FLAT:$SG71450
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71448:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L71402:

; 831  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_pvt_lblnote ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_listobj_lblnote
_DATA	SEGMENT
$SG71469 DB	'</u>', 00H
	ORG $+3
$SG71470 DB	'<br><u>', 00H
$SG71472 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71476 DB	'<ul>', 00H
	ORG $+3
$SG71478 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71484 DB	'<li>', 00H
	ORG $+3
$SG71486 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71490 DB	'_EVA_LABEL,_EVA_NOTES', 00H
	ORG $+2
$SG71493 DB	'</li>', 00H
	ORG $+2
$SG71495 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71498 DB	'</ul>', 00H
	ORG $+2
$SG71500 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71502 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71503 DB	'ctrl_output_listobj_lblnote', 00H
$SG71505 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71506 DB	'ctrl_output_listobj_lblnote', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_title$ = 12
_val$ = 16
_html$ = -24
_valdata$ = -20
_i$ = -28
_ctrl_output_listobj_lblnote PROC NEAR

; 845  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 846  : 	DynBuffer **html = cntxt->form->html;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR _html$[ebp], edx

; 847  : 	DynTable valdata = {0};

	mov	DWORD PTR _valdata$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _valdata$[ebp+4], eax
	mov	DWORD PTR _valdata$[ebp+8], eax
	mov	DWORD PTR _valdata$[ebp+12], eax
	mov	DWORD PTR _valdata$[ebp+16], eax

; 848  : 	unsigned long i;
; 849  : 	if(!html || !val || !val->nbrows || !val->cell || !val->cell->txt) return 0;

	cmp	DWORD PTR _html$[ebp], 0
	je	SHORT $L71466
	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L71466
	mov	ecx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71466
	mov	edx, DWORD PTR _val$[ebp]
	cmp	DWORD PTR [edx+16], 0
	je	SHORT $L71466
	mov	eax, DWORD PTR _val$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	cmp	DWORD PTR [ecx], 0
	jne	SHORT $L71465
$L71466:
	xor	eax, eax
	jmp	$L71461
$L71465:

; 850  : 
; 851  : 	if(title) DYNBUF_ADD3(html, "<br><u>", title, 0, TO_HTML, "</u>");

	cmp	DWORD PTR _title$[ebp], 0
	je	SHORT $L71468
	push	4
	push	OFFSET FLAT:$SG71469
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _title$[ebp]
	push	edx
	push	7
	push	OFFSET FLAT:$SG71470
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71468
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71472
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 851		; 00000353H
	jmp	$eva_err$71473
$L71468:

; 852  : 	DYNBUF_ADD_STR(html, "<ul>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG71476
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71475
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71478
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 852		; 00000354H
	jmp	$eva_err$71473
$L71475:

; 853  : 	for(i = 0; i < val->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71479
$L71480:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71479:
	mov	ecx, DWORD PTR _val$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L71481

; 855  : 		DYNBUF_ADD_STR(html, "<li>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG71484
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71483
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71486
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 855		; 00000357H
	jmp	$eva_err$71473
$L71483:

; 856  : 		if(qry_obj_field(cntxt, &valdata, DYNTAB_TOULRC(val, i, 0), "_EVA_LABEL,_EVA_NOTES") ||
; 857  : 			ctrl_output_pvt_lblnote(cntxt, 6, &valdata)) STACK_ERROR;

	push	OFFSET FLAT:$SG71490
	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _valdata$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L71489
	lea	ecx, DWORD PTR _valdata$[ebp]
	push	ecx
	push	6
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_output_pvt_lblnote
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71488
$L71489:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 857		; 00000359H
	jmp	$eva_err$71473
$L71488:

; 858  : 		DYNBUF_ADD_STR(html, "</li>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71493
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71492
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71495
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 858		; 0000035aH
	jmp	SHORT $eva_err$71473
$L71492:

; 859  : 	}

	jmp	$L71480
$L71481:

; 860  : 	DYNBUF_ADD_STR(html, "</ul>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71498
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71497
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71500
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 860		; 0000035cH
	jmp	SHORT $eva_err$71473
$L71497:
$eva_noerr$71501:

; 861  : 
; 862  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71502
	push	OFFSET FLAT:$SG71503
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71473:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71504
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71505
	push	OFFSET FLAT:$SG71506
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71504:
	lea	eax, DWORD PTR _valdata$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al
$L71461:

; 863  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_listobj_lblnote ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_pvt_notes
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
_DATA	SEGMENT
$SG71525 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG71528 DB	'<br><u><b>', 00H
	ORG $+1
$SG71530 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71535 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71537 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG71540 DB	']</b></u>', 00H
	ORG $+2
$SG71541 DB	' [', 00H
	ORG $+1
$SG71543 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71547 DB	'_EVA_SELCTRL', 00H
	ORG $+3
$SG71549 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71552 DB	'Champ de saisie', 00H
$SG71556 DB	'</font>', 00H
$SG71557 DB	'<br><u>Valeur calculee</u> : <font face=''Courier new''>'
	DB	00H
	ORG $+1
$SG71559 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71562 DB	'_EVA_FORMS', 00H
	ORG $+1
$SG71564 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71566 DB	'Fiches s', 0e9H, 'lectionn', 0e9H, 'es', 00H
	ORG $+3
$SG71569 DB	'_EVA_FILTERS', 00H
	ORG $+3
$SG71571 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71573 DB	'Condition de s', 0e9H, 'lection', 00H
	ORG $+1
$SG71576 DB	'_EVA_NOTES', 00H
	ORG $+1
$SG71581 DB	'<br>', 00H
	ORG $+3
$SG71583 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71585 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71586 DB	'ctrl_output_pvt_notes', 00H
	ORG $+2
$SG71588 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71589 DB	'ctrl_output_pvt_notes', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_title$ = 12
_options$ = 16
_data$ = 20
_html$ = -24
_val$ = -20
_expr$71524 = -28
__c$71536 = -32
_ctrl_output_pvt_notes PROC NEAR

; 880  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H

; 881  : 	DynBuffer **html = cntxt->form->html;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR _html$[ebp], edx

; 882  : 	DynTable val = {0};

	mov	DWORD PTR _val$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _val$[ebp+4], eax
	mov	DWORD PTR _val$[ebp+8], eax
	mov	DWORD PTR _val$[ebp+12], eax
	mov	DWORD PTR _val$[ebp+16], eax

; 883  : 	if(!html) return 0;

	cmp	DWORD PTR _html$[ebp], 0
	jne	SHORT $L71522
	xor	eax, eax
	jmp	$L71519
$L71522:

; 884  : 
; 885  : 	/* Output detail if applicable */
; 886  : 	if(options & 1)

	mov	ecx, DWORD PTR _options$[ebp]
	and	ecx, 1
	test	ecx, ecx
	je	$L71523

; 888  : 		char *expr = DYNTAB_FIELD_VAL(data, FIELD);

	push	0
	push	-1
	push	OFFSET FLAT:$SG71525
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _expr$71524[ebp], eax

; 889  : 
; 890  : 		/* Output label & notes */
; 891  : 		DYNBUF_ADD_STR(html, "<br><u><b>");

	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71528
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71527
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71530
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 891		; 0000037bH
	jmp	$eva_err$71531
$L71527:

; 892  : 		if(title) DYNBUF_ADD(html, title, 0, TO_HTML);

	cmp	DWORD PTR _title$[ebp], 0
	je	SHORT $L71533
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _title$[ebp]
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71533
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71535
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 892		; 0000037cH
	jmp	$eva_err$71531
$L71533:

; 893  : 		DYNBUF_ADD3_CELLP(html, " [", DYNTAB_FIELD_CELL(data, LABEL), TO_HTML, "]</b></u>");

	push	0
	push	-1
	push	OFFSET FLAT:$SG71537
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR __c$71536[ebp], eax
	cmp	DWORD PTR __c$71536[ebp], 0
	je	SHORT $L73243
	mov	edx, DWORD PTR __c$71536[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -36+[ebp], eax
	jmp	SHORT $L73244
$L73243:
	mov	DWORD PTR -36+[ebp], 0
$L73244:
	cmp	DWORD PTR __c$71536[ebp], 0
	je	SHORT $L73245
	mov	ecx, DWORD PTR __c$71536[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -40+[ebp], edx
	jmp	SHORT $L73246
$L73245:
	mov	DWORD PTR -40+[ebp], 0
$L73246:
	push	9
	push	OFFSET FLAT:$SG71540
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	eax, DWORD PTR -36+[ebp]
	push	eax
	mov	ecx, DWORD PTR -40+[ebp]
	push	ecx
	push	2
	push	OFFSET FLAT:$SG71541
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71539
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71543
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 893		; 0000037dH
	jmp	$eva_err$71531
$L71539:

; 894  : 		if(ctrl_output_pvt_lblnote(cntxt, 4, data)) STACK_ERROR;

	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	push	4
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_output_pvt_lblnote
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71544
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 894		; 0000037eH
	jmp	$eva_err$71531
$L71544:

; 895  : 
; 896  : 		/* Output fields label or formula */
; 897  : 		DYNTAB_FIELD(&val, data, SELCTRL);

	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71547
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71546
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71549
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 897		; 00000381H
	jmp	$eva_err$71531
$L71546:

; 898  : 		if(val.nbrows && val.cell->txt)

	cmp	DWORD PTR _val$[ebp], 0
	je	SHORT $L71550
	mov	ecx, DWORD PTR _val$[ebp+16]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71550

; 900  : 			if(ctrl_output_listobj_lblnote(cntxt, "Champ de saisie", &val)) STACK_ERROR;

	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	push	OFFSET FLAT:$SG71552
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_output_listobj_lblnote
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71551
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 900		; 00000384H
	jmp	$eva_err$71531
$L71551:

; 902  : 		else if(*expr)

	jmp	SHORT $L71555
$L71550:
	mov	edx, DWORD PTR _expr$71524[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L71555

; 903  : 			DYNBUF_ADD3(html, "<br><u>Valeur calculee</u> : <font face='Courier new'>", expr, 0, TO_HTML, "</font>");

	push	7
	push	OFFSET FLAT:$SG71556
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _expr$71524[ebp]
	push	ecx
	push	54					; 00000036H
	push	OFFSET FLAT:$SG71557
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71555
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71559
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 903		; 00000387H
	jmp	$eva_err$71531
$L71555:

; 904  : 
; 905  : 		/* Output forms label */
; 906  : 		DYNTAB_FIELD(&val, data, FORMS);

	lea	edx, DWORD PTR _val$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71562
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71561
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71564
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 906		; 0000038aH
	jmp	$eva_err$71531
$L71561:

; 907  : 		if(ctrl_output_listobj_lblnote(cntxt, "Fiches sélectionnées", &val)) STACK_ERROR;

	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71566
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_output_listobj_lblnote
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71565
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 907		; 0000038bH
	jmp	$eva_err$71531
$L71565:

; 908  : 
; 909  : 		/* Output filters label */
; 910  : 		DYNTAB_FIELD(&val, data, FILTERS);

	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71569
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71568
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71571
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 910		; 0000038eH
	jmp	$eva_err$71531
$L71568:

; 911  : 		if(ctrl_output_listobj_lblnote(cntxt, "Condition de sélection", &val)) STACK_ERROR;

	lea	eax, DWORD PTR _val$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71573
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_output_listobj_lblnote
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71572
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 911		; 0000038fH
	jmp	$eva_err$71531
$L71572:

; 913  : 	else if(DYNTAB_FIELD_CELL(data, NOTES))

	jmp	SHORT $L71577
$L71523:
	push	0
	push	-1
	push	OFFSET FLAT:$SG71576
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71577

; 915  : 		/* Output notes */
; 916  : 		if(ctrl_output_pvt_lblnote(cntxt, 6, data)) STACK_ERROR;

	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	6
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_output_pvt_lblnote
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71577
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 916		; 00000394H
	jmp	SHORT $eva_err$71531
$L71577:

; 918  : 
; 919  : 	if(options & 2) DYNBUF_ADD_STR(html, "<br>");

	mov	ecx, DWORD PTR _options$[ebp]
	and	ecx, 2
	test	ecx, ecx
	je	SHORT $L71580
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG71581
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71580
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71583
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 919		; 00000397H
	jmp	SHORT $eva_err$71531
$L71580:
$eva_noerr$71584:

; 920  : 
; 921  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71585
	push	OFFSET FLAT:$SG71586
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71531:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71587
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71588
	push	OFFSET FLAT:$SG71589
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71587:
	lea	ecx, DWORD PTR _val$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al
$L71519:

; 922  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_pvt_notes ENDP
_TEXT	ENDS
PUBLIC	_ctrl_calc_output_pvtres
EXTRN	_ctrl_output_exprval:NEAR
EXTRN	_ctrl_set_format_attr:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_ctrl_put_table_header:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71745 DB	01H DUP (?)
	ALIGN	4

$SG71746 DB	01H DUP (?)
	ALIGN	4

$SG71747 DB	01H DUP (?)
	ALIGN	4

$SG71750 DB	01H DUP (?)
	ALIGN	4

$SG71751 DB	01H DUP (?)
	ALIGN	4

$SG71752 DB	01H DUP (?)
	ALIGN	4

$SG71755 DB	01H DUP (?)
	ALIGN	4

$SG71765 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG71630 DB	'>', 00H
	ORG $+2
$SG71631 DB	'</tr><tr bgcolor=#FFFFFF><td colspan=', 00H
	ORG $+2
$SG71633 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71637 DB	'</td></tr>', 00H
	ORG $+1
$SG71639 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71654 DB	'>&nbsp;</tr>', 00H
	ORG $+3
$SG71655 DB	'<tr><td colspan=', 00H
	ORG $+3
$SG71657 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71660 DB	'<tr bgcolor=#EEEEEE><td align=center valign=middle><font'
	DB	' size=-1>', 00H
	ORG $+2
$SG71662 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71667 DB	'&nbsp;</font></td>', 00H
	ORG $+1
$SG71669 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71674 DB	'<td align=center valign=bottom rowspan=%lu colspan=%lu><'
	DB	'b>', 00H
	ORG $+1
$SG71678 DB	'</b></td>', 00H
	ORG $+2
$SG71680 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71683 DB	'</tr>', 00H
	ORG $+2
$SG71685 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71698 DB	'><td align=right><font size=-1>', 00H
$SG71699 DB	'<tr bgcolor=#', 00H
	ORG $+2
$SG71701 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71705 DB	'<b>', 00H
$SG71707 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71712 DB	'LABEL+OBJNOTES', 00H
	ORG $+1
$SG71716 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71720 DB	'</b>', 00H
	ORG $+3
$SG71722 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71725 DB	'</td>', 00H
	ORG $+2
$SG71727 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71748 DB	'Table', 09H, '%lu', 09H, '%s', 09H, '%s', 09H, '%s', 09H
	DB	'%lu', 09H, '%lu', 00H
	ORG $+1
$SG71753 DB	09H, '%lu', 09H, '%s', 09H, '%s', 09H, '%s', 09H, '%lu', 09H
	DB	'%lu', 00H
	ORG $+2
$SG71756 DB	09H, '%lu', 09H, '%s', 09H, '%u', 0aH, 00H
$SG71759 DB	'</table>', 00H
	ORG $+3
$SG71761 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71767 DB	'>', 00H
	ORG $+2
$SG71768 DB	'<table><tr><td bgcolor=#FFFFFF colspan=', 00H
$SG71770 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71780 DB	'_EVA_NONE', 00H
	ORG $+2
$SG71781 DB	'_EVA_SameCell', 00H
	ORG $+2
$SG71786 DB	'<br>', 00H
	ORG $+3
$SG71788 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71791 DB	'<font size=-1>', 00H
	ORG $+1
$SG71793 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71795 DB	'D', 0e9H, 'tail du tableau', 00H
	ORG $+2
$SG71798 DB	'tout', 00H
	ORG $+3
$SG71799 DB	'VALCOUNT', 00H
	ORG $+3
$SG71800 DB	'Nombre de valeurs', 00H
	ORG $+2
$SG71801 DB	'VALCOUNT1', 00H
	ORG $+2
$SG71802 DB	'Nombre de valeurs distinctes', 00H
	ORG $+3
$SG71803 DB	'SUM', 00H
$SG71804 DB	'Somme des valeurs', 00H
	ORG $+2
$SG71805 DB	'AVG', 00H
$SG71806 DB	'Moyenne des valeurs', 00H
$SG71807 DB	'MIN', 00H
$SG71808 DB	'Plus petite valeur', 00H
	ORG $+1
$SG71809 DB	'MAX', 00H
$SG71810 DB	'Plus grande valeur', 00H
	ORG $+1
$SG71811 DB	'Nombre de fiches', 00H
	ORG $+3
$SG71812 DB	'<br><u>Valeurs affich', 0e9H, 'es</u> : <b>%s de [%s]</b'
	DB	'><br>', 00H
	ORG $+3
$SG71814 DB	'Lignes', 00H
	ORG $+1
$SG71816 DB	'Colonnes', 00H
	ORG $+3
$SG71818 DB	'Donn', 0e9H, 'es', 00H
$SG71821 DB	'</font></td></tr></table>', 00H
	ORG $+2
$SG71823 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71825 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71826 DB	'ctrl_calc_output_pvtres', 00H
$SG71828 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71829 DB	'ctrl_calc_output_pvtres', 00H
_DATA	ENDS
_TEXT	SEGMENT
_function$71763 = -1056
_ct$71772 = -1536
_cntxt$ = 8
_i_ctrl$ = 12
_pv$ = 16
_form$ = -4
_ctrl$ = -1052
_i$ = -1044
_irow$ = -1040
_icol$ = -1036
_idata$ = -1048
_html$ = -1032
_printbuf$ = -1028
_ctrl_calc_output_pvtres PROC NEAR

; 936  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1668				; 00000684H
	push	edi

; 937  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 938  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 939  : 	unsigned long i;
; 940  : 	unsigned long irow = 0, icol, idata = 0;

	mov	DWORD PTR _irow$[ebp], 0
	mov	DWORD PTR _idata$[ebp], 0

; 941  : 	DynBuffer **html = form->html;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _html$[ebp], eax

; 942  : 	char printbuf[1024];
; 943  : 
; 944  : 	/* Scan column labels for each column field to determine stacking mode */
; 945  : 	pv->totcols = (pv->nbrow ? 1 : 0);

	mov	ecx, DWORD PTR _pv$[ebp]
	xor	edx, edx
	cmp	DWORD PTR [ecx+78696], 0
	setne	dl
	mov	eax, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [eax+94116], edx

; 946  : 	for(icol = 0; !icol || icol < pv->nbcol; icol++)

	mov	DWORD PTR _icol$[ebp], 0
	jmp	SHORT $L71609
$L71610:
	mov	ecx, DWORD PTR _icol$[ebp]
	add	ecx, 1
	mov	DWORD PTR _icol$[ebp], ecx
$L71609:
	cmp	DWORD PTR _icol$[ebp], 0
	je	SHORT $L71612
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _icol$[ebp]
	cmp	eax, DWORD PTR [edx+81784]
	jae	$L71611
$L71612:

; 948  : 		pv->col = pv->nbcol ? pv->cols + icol : NULL;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+81784], 0
	je	SHORT $L73248
	mov	edx, DWORD PTR _icol$[ebp]
	imul	edx, 616				; 00000268H
	mov	eax, DWORD PTR _pv$[ebp]
	lea	ecx, DWORD PTR [eax+edx+78704]
	mov	DWORD PTR -1540+[ebp], ecx
	jmp	SHORT $L73249
$L73248:
	mov	DWORD PTR -1540+[ebp], 0
$L73249:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR -1540+[ebp]
	mov	DWORD PTR [edx+204], eax

; 949  : 		pv->res = &pv->restbl[idata][irow][icol];

	mov	ecx, DWORD PTR _idata$[ebp]
	imul	ecx, 3000				; 00000bb8H
	mov	edx, DWORD PTR _pv$[ebp]
	lea	eax, DWORD PTR [edx+ecx+216]
	mov	ecx, DWORD PTR _irow$[ebp]
	imul	ecx, 100				; 00000064H
	add	eax, ecx
	mov	edx, DWORD PTR _icol$[ebp]
	imul	edx, 20					; 00000014H
	add	eax, edx
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+212], eax

; 950  : 
; 951  : 		/* Compute total # of columns for the field */
; 952  : 		pv->totcols += pv->res->nbcols;

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+212]
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+94116]
	add	edx, DWORD PTR [eax+8]
	mov	eax, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [eax+94116], edx

; 953  : 		if(!pv->col || pv->exportparams) continue;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L71615
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94136], 0
	je	SHORT $L71614
$L71615:
	jmp	$L71610
$L71614:

; 954  : 
; 955  : 		/* Check column labels size & set columns stack mode */
; 956  : 		if(!pv->col->b_stackcols && pv->col->stackcols_limit)

	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	cmp	DWORD PTR [ecx+524], 0
	jne	$L71619
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	cmp	DWORD PTR [eax+520], 0
	je	SHORT $L71619

; 957  : 			for(i = 0; i < pv->col->labels.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71617
$L71618:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71617:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+24]
	jae	SHORT $L71619

; 958  : 				if(dyntab_sz(&pv->col->labels, i, 0) > pv->col->stackcols_limit)

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [edx+204]
	cmp	eax, DWORD PTR [ecx+520]
	jbe	SHORT $L71620

; 959  : 					pv->col->b_stackcols = 1;

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	DWORD PTR [eax+524], 1
$L71620:

; 960  : 		if(pv->col->b_stackcols && pv->col->labels.nbrows > pv->maxcols) pv->maxcols = pv->col->labels.nbrows;

	jmp	SHORT $L71618
$L71619:
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	cmp	DWORD PTR [edx+524], 0
	je	SHORT $L71621
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [ecx+24]
	cmp	eax, DWORD PTR [edx+94120]
	jbe	SHORT $L71621
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [edx+24]
	mov	DWORD PTR [eax+94120], ecx
$L71621:

; 961  : 		pv->b_stackcols |= pv->col->b_stackcols;

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+94128]
	or	edx, DWORD PTR [eax+524]
	mov	eax, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [eax+94128], edx

; 962  : 	}

	jmp	$L71610
$L71611:

; 963  : 	if(pv->exportparams) pv->b_stackcols = 0;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+94136], 0
	je	SHORT $L71622
	mov	edx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [edx+94128], 0
$L71622:

; 964  : 
; 965  : 	/* Output table header */
; 966  : 	if(!(ctrl->TABLE_STYLE && *ctrl->TABLE_STYLE)) ctrl->BORDER = 1;

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+476], 0
	je	SHORT $L71624
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+476]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L71623
$L71624:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+460], 1
$L71623:

; 967  : 	if(table_read_controls(cntxt, i_ctrl, NULL) ||
; 968  : 		ctrl_put_table_header(cntxt, ctrl)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_read_controls
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71627
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_table_header
	add	esp, 8
	test	eax, eax
	je	SHORT $L71626
$L71627:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 968		; 000003c8H
	jmp	$eva_err$71628
$L71626:

; 969  : 
; 970  : 	/* Output title */
; 971  : 	DYNBUF_ADD3_INT(html, "</tr><tr bgcolor=#FFFFFF><td colspan=", pv->totcols + 2, ">");

	push	1
	push	OFFSET FLAT:$SG71630
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+94116]
	add	edx, 2
	push	edx
	push	37					; 00000025H
	push	OFFSET FLAT:$SG71631
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71629
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71633
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 971		; 000003cbH
	jmp	$eva_err$71628
$L71629:

; 972  : 	if(pv->tblnotes != TblNote_minimal && ctrl_calc_output_title(cntxt, i_ctrl, pv)) STACK_ERROR;

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+156], 61440		; 0000f000H
	je	SHORT $L71634
	mov	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_calc_output_title
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71634
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 972		; 000003ccH
	jmp	$eva_err$71628
$L71634:

; 973  : 	DYNBUF_ADD_STR(html, "</td></tr>");

	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71637
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71636
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71639
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 973		; 000003cdH
	jmp	$eva_err$71628
$L71636:

; 974  : 
; 975  : 	/* Loop on data fields */
; 976  : 	for(idata = 0; !idata || idata < pv->nbdata; idata++)

	mov	DWORD PTR _idata$[ebp], 0
	jmp	SHORT $L71640
$L71641:
	mov	edx, DWORD PTR _idata$[ebp]
	add	edx, 1
	mov	DWORD PTR _idata$[ebp], edx
$L71640:
	cmp	DWORD PTR _idata$[ebp], 0
	je	SHORT $L71643
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR _idata$[ebp]
	cmp	ecx, DWORD PTR [eax+94112]
	jae	$L71642
$L71643:

; 978  : 		/* Loop on row fields */
; 979  : 		pv->data = pv->nbdata ? pv->datas + idata : NULL;

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94112], 0
	je	SHORT $L73250
	mov	eax, DWORD PTR _idata$[ebp]
	imul	eax, 616				; 00000268H
	mov	ecx, DWORD PTR _pv$[ebp]
	lea	edx, DWORD PTR [ecx+eax+81792]
	mov	DWORD PTR -1544+[ebp], edx
	jmp	SHORT $L73251
$L73250:
	mov	DWORD PTR -1544+[ebp], 0
$L73251:
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR -1544+[ebp]
	mov	DWORD PTR [eax+208], ecx

; 980  : 		for(irow = 0; !irow || irow < pv->nbrow; irow++)

	mov	DWORD PTR _irow$[ebp], 0
	jmp	SHORT $L71645
$L71646:
	mov	edx, DWORD PTR _irow$[ebp]
	add	edx, 1
	mov	DWORD PTR _irow$[ebp], edx
$L71645:
	cmp	DWORD PTR _irow$[ebp], 0
	je	SHORT $L71648
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR _irow$[ebp]
	cmp	ecx, DWORD PTR [eax+78696]
	jae	$L71647
$L71648:

; 982  : 			/* Output data & column headers if applicable */
; 983  : 			pv->row = pv->nbrow ? pv->rows + irow : NULL;

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+78696], 0
	je	SHORT $L73252
	mov	eax, DWORD PTR _irow$[ebp]
	imul	eax, 616				; 00000268H
	mov	ecx, DWORD PTR _pv$[ebp]
	lea	edx, DWORD PTR [ecx+eax+60216]
	mov	DWORD PTR -1548+[ebp], edx
	jmp	SHORT $L73253
$L73252:
	mov	DWORD PTR -1548+[ebp], 0
$L73253:
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR -1548+[ebp]
	mov	DWORD PTR [eax+200], ecx

; 984  : 			if((pv->data ? !idata : (pv->exportparams || !irow)) && (pv->nbdata || pv->nbcol))

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+208], 0
	je	SHORT $L73256
	xor	eax, eax
	cmp	DWORD PTR _idata$[ebp], 0
	sete	al
	mov	DWORD PTR -1552+[ebp], eax
	jmp	SHORT $L73257
$L73256:
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+94136], 0
	jne	SHORT $L73254
	cmp	DWORD PTR _irow$[ebp], 0
	je	SHORT $L73254
	mov	DWORD PTR -1556+[ebp], 0
	jmp	SHORT $L73255
$L73254:
	mov	DWORD PTR -1556+[ebp], 1
$L73255:
	mov	edx, DWORD PTR -1556+[ebp]
	mov	DWORD PTR -1552+[ebp], edx
$L73257:
	cmp	DWORD PTR -1552+[ebp], 0
	je	$L71682
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+94112], 0
	jne	SHORT $L71651
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+81784], 0
	je	$L71682
$L71651:

; 986  : 				if(pv->exportparams && irow) DYNBUF_ADD3_INT(html, "<tr><td colspan=", pv->maxcols, ">&nbsp;</tr>");

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94136], 0
	je	SHORT $L71653
	cmp	DWORD PTR _irow$[ebp], 0
	je	SHORT $L71653
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG71654
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+94120]
	push	ecx
	push	16					; 00000010H
	push	OFFSET FLAT:$SG71655
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71653
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71657
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 986		; 000003daH
	jmp	$eva_err$71628
$L71653:

; 987  : 				DYNBUF_ADD_STR(html, "<tr bgcolor=#EEEEEE><td align=center valign=middle><font size=-1>");

	push	0
	push	0
	push	65					; 00000041H
	push	OFFSET FLAT:$SG71660
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71659
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71662
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 987		; 000003dbH
	jmp	$eva_err$71628
$L71659:

; 988  : 				if(pv->tblnotes != TblNote_minimal)

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+156], 61440		; 0000f000H
	je	SHORT $L71666

; 990  : 					if(ctrl_calc_output_field_title(cntxt, i_ctrl, pv, pv->data)) STACK_ERROR;

	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_calc_output_field_title
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71664
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 990		; 000003deH
	jmp	$eva_err$71628
$L71664:

; 991  : 					DYNBUF_ADD_STR(html, "&nbsp;</font></td>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG71667
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71666
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71669
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 991		; 000003dfH
	jmp	$eva_err$71628
$L71666:

; 993  : 				for(icol = 0; icol < pv->nbcol; icol++)

	mov	DWORD PTR _icol$[ebp], 0
	jmp	SHORT $L71670
$L71671:
	mov	eax, DWORD PTR _icol$[ebp]
	add	eax, 1
	mov	DWORD PTR _icol$[ebp], eax
$L71670:
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR _icol$[ebp]
	cmp	edx, DWORD PTR [ecx+81784]
	jae	$L71672

; 995  : 					pv->col = pv->cols + icol;

	mov	eax, DWORD PTR _icol$[ebp]
	imul	eax, 616				; 00000268H
	mov	ecx, DWORD PTR _pv$[ebp]
	lea	edx, DWORD PTR [ecx+eax+78704]
	mov	eax, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [eax+204], edx

; 996  : 					pv->res = &pv->restbl[idata][irow][icol];

	mov	ecx, DWORD PTR _idata$[ebp]
	imul	ecx, 3000				; 00000bb8H
	mov	edx, DWORD PTR _pv$[ebp]
	lea	eax, DWORD PTR [edx+ecx+216]
	mov	ecx, DWORD PTR _irow$[ebp]
	imul	ecx, 100				; 00000064H
	add	eax, ecx
	mov	edx, DWORD PTR _icol$[ebp]
	imul	edx, 20					; 00000014H
	add	eax, edx
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+212], eax

; 997  : 					dynbuf_print2(html, "<td align=center valign=bottom rowspan=%lu colspan=%lu><b>",
; 998  : 						(!pv->b_stackcols || irow) ? 1 :
; 999  : 						pv->col->b_stackcols ? pv->maxcols - COLCNT + 1 : pv->b_stackcols ? pv->maxcols + 1 : 1,
; 1000 : 						pv->res->nbcols);

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94128], 0
	je	$L73258
	cmp	DWORD PTR _irow$[ebp], 0
	jne	$L73258
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	cmp	DWORD PTR [ecx+524], 0
	je	SHORT $L73263
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+204], 0
	je	SHORT $L73259
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -1560+[ebp], edx
	jmp	SHORT $L73260
$L73259:
	mov	DWORD PTR -1560+[ebp], 0
$L73260:
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+94120]
	sub	ecx, DWORD PTR -1560+[ebp]
	add	ecx, 1
	mov	DWORD PTR -1564+[ebp], ecx
	jmp	SHORT $L73264
$L73263:
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94128], 0
	je	SHORT $L73261
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+94120]
	add	ecx, 1
	mov	DWORD PTR -1568+[ebp], ecx
	jmp	SHORT $L73262
$L73261:
	mov	DWORD PTR -1568+[ebp], 1
$L73262:
	mov	edx, DWORD PTR -1568+[ebp]
	mov	DWORD PTR -1564+[ebp], edx
$L73264:
	mov	eax, DWORD PTR -1564+[ebp]
	mov	DWORD PTR -1572+[ebp], eax
	jmp	SHORT $L73265
$L73258:
	mov	DWORD PTR -1572+[ebp], 1
$L73265:
	push	0
	push	0
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	mov	ecx, DWORD PTR -1572+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71674
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 1001 : 					if(ctrl_calc_output_field_title(cntxt, i_ctrl, pv, pv->col)) STACK_ERROR;

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_calc_output_field_title
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71675
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1001		; 000003e9H
	jmp	$eva_err$71628
$L71675:

; 1002 : 					DYNBUF_ADD_STR(html, "</b></td>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG71678
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71677
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71680
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1002		; 000003eaH
	jmp	$eva_err$71628
$L71677:

; 1003 : 				}

	jmp	$L71671
$L71672:

; 1004 : 				DYNBUF_ADD_STR(html, "</tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71683
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71682
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71685
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1004		; 000003ecH
	jmp	$eva_err$71628
$L71682:

; 1006 : 
; 1007 : 			/* Output columns titles if rows present */
; 1008 : 			if(!idata || pv->row)

	cmp	DWORD PTR _idata$[ebp], 0
	je	SHORT $L71687
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	$L71692
$L71687:

; 1010 : 				/* Output columns labels */
; 1011 : 				pv->row = pv->nbrow ? pv->rows + irow : NULL;

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+78696], 0
	je	SHORT $L73266
	mov	ecx, DWORD PTR _irow$[ebp]
	imul	ecx, 616				; 00000268H
	mov	edx, DWORD PTR _pv$[ebp]
	lea	eax, DWORD PTR [edx+ecx+60216]
	mov	DWORD PTR -1576+[ebp], eax
	jmp	SHORT $L73267
$L73266:
	mov	DWORD PTR -1576+[ebp], 0
$L73267:
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR -1576+[ebp]
	mov	DWORD PTR [ecx+200], edx

; 1012 : 				if(ctrl_calc_output_coltitle(cntxt, i_ctrl, pv)) STACK_ERROR;

	mov	eax, DWORD PTR _pv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_calc_output_coltitle
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71689
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1012		; 000003f4H
	jmp	$eva_err$71628
$L71689:

; 1013 : 
; 1014 : 				/* Output columns fields for the row field */
; 1015 : 				pv->maxrows = pv->restbl[idata][irow][0].nbrows;

	mov	ecx, DWORD PTR _idata$[ebp]
	imul	ecx, 3000				; 00000bb8H
	mov	edx, DWORD PTR _pv$[ebp]
	lea	eax, DWORD PTR [edx+ecx+216]
	mov	ecx, DWORD PTR _irow$[ebp]
	imul	ecx, 100				; 00000064H
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [eax+ecx]
	mov	DWORD PTR [edx+94124], eax

; 1016 : 				for(icol = 1; icol < pv->nbcol; icol++)

	mov	DWORD PTR _icol$[ebp], 1
	jmp	SHORT $L71690
$L71691:
	mov	ecx, DWORD PTR _icol$[ebp]
	add	ecx, 1
	mov	DWORD PTR _icol$[ebp], ecx
$L71690:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _icol$[ebp]
	cmp	eax, DWORD PTR [edx+81784]
	jae	SHORT $L71692

; 1018 : 					pv->res = &pv->restbl[idata][irow][icol];

	mov	ecx, DWORD PTR _idata$[ebp]
	imul	ecx, 3000				; 00000bb8H
	mov	edx, DWORD PTR _pv$[ebp]
	lea	eax, DWORD PTR [edx+ecx+216]
	mov	ecx, DWORD PTR _irow$[ebp]
	imul	ecx, 100				; 00000064H
	add	eax, ecx
	mov	edx, DWORD PTR _icol$[ebp]
	imul	edx, 20					; 00000014H
	add	eax, edx
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+212], eax

; 1019 : 					if(pv->res->nbrows > pv->maxrows) pv->maxrows = pv->res->nbrows;

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+212]
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [eax]
	cmp	edx, DWORD PTR [ecx+94124]
	jbe	SHORT $L71693
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [edx+94124], eax
$L71693:

; 1020 : 				}

	jmp	$L71691
$L71692:

; 1022 : 
; 1023 : 			/* If no rows : output data totals for each column field */
; 1024 : 			if(!pv->row && pv->nbdata > 1)

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	jne	$L71694
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94112], 1
	jbe	$L71694

; 1026 : 				/* Output line header & data label */
; 1027 : 				DYNBUF_ADD3(html, "<tr bgcolor=#", table_row_bgcolor(cntxt, ctrl->objtbl, idata, NULL), 0, NO_CONV, "><td align=right><font size=-1>");

	push	31					; 0000001fH
	push	OFFSET FLAT:$SG71698
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _idata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_row_bgcolor
	add	esp, 16					; 00000010H
	push	eax
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG71699
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71697
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71701
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1027		; 00000403H
	jmp	$eva_err$71628
$L71697:

; 1028 : 				if(idata == pv->nbdata - 1)	DYNBUF_ADD_STR(html, "<b>");

	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+94112]
	sub	edx, 1
	cmp	DWORD PTR _idata$[ebp], edx
	jne	SHORT $L71704
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG71705
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71704
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71707
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1028		; 00000404H
	jmp	$eva_err$71628
$L71704:

; 1029 : 				if(pv->data->srcdata.nbrows && !pv->exportparams)

	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	cmp	DWORD PTR [ecx+188], 0
	je	SHORT $L71708
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94136], 0
	jne	SHORT $L71708

; 1031 : 					if(ctrl_add_symbol_btn(cntxt, ctrl, NULL, &pv->data->srcdata, 0, NULL, "LABEL+OBJNOTES")) STACK_ERROR;

	push	OFFSET FLAT:$SG71712
	push	0
	push	0
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	add	ecx, 188				; 000000bcH
	push	ecx
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_symbol_btn
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71711
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1031		; 00000407H
	jmp	$eva_err$71628
$L71711:

; 1033 : 				else

	jmp	SHORT $L71714
$L71708:

; 1034 : 					DYNBUF_ADD(html, pv->data->label, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+208]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71714
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71716
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1034		; 0000040aH
	jmp	$eva_err$71628
$L71714:

; 1035 : 				if(idata == pv->nbdata - 1)	DYNBUF_ADD_STR(html, "</b>");

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+94112]
	sub	eax, 1
	cmp	DWORD PTR _idata$[ebp], eax
	jne	SHORT $L71719
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG71720
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71719
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71722
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1035		; 0000040bH
	jmp	$eva_err$71628
$L71719:

; 1036 : 				DYNBUF_ADD_STR(html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71725
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71724
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71727
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1036		; 0000040cH
	jmp	$eva_err$71628
$L71724:

; 1037 : 
; 1038 : 				/* Output cells */
; 1039 : 				for(icol = 0; !icol || icol < pv->nbcol; icol++)

	mov	DWORD PTR _icol$[ebp], 0
	jmp	SHORT $L71728
$L71729:
	mov	ecx, DWORD PTR _icol$[ebp]
	add	ecx, 1
	mov	DWORD PTR _icol$[ebp], ecx
$L71728:
	cmp	DWORD PTR _icol$[ebp], 0
	je	SHORT $L71731
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _icol$[ebp]
	cmp	eax, DWORD PTR [edx+81784]
	jae	$L71730
$L71731:

; 1041 : 					pv->res = &pv->restbl[idata][irow][icol];

	mov	ecx, DWORD PTR _idata$[ebp]
	imul	ecx, 3000				; 00000bb8H
	mov	edx, DWORD PTR _pv$[ebp]
	lea	eax, DWORD PTR [edx+ecx+216]
	mov	ecx, DWORD PTR _irow$[ebp]
	imul	ecx, 100				; 00000064H
	add	eax, ecx
	mov	edx, DWORD PTR _icol$[ebp]
	imul	edx, 20					; 00000014H
	add	eax, edx
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+212], eax

; 1042 : 					for(i = 0; i < pv->res->nbcols; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71732
$L71733:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71732:
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+8]
	jae	SHORT $L71734

; 1043 : 						if(ctrl_calc_output_pvtcell(cntxt, i_ctrl, pv, 0, i)) STACK_ERROR;

	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_calc_output_pvtcell
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71735
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1043		; 00000413H
	jmp	$eva_err$71628
$L71735:
	jmp	SHORT $L71733
$L71734:

; 1044 : 				}

	jmp	$L71729
$L71730:

; 1046 : 			else

	jmp	SHORT $L71737
$L71694:

; 1047 : 				/* Output rows fields for the data field */
; 1048 : 				if(ctrl_calc_output_rowfield(cntxt, i_ctrl, pv)) STACK_ERROR;

	mov	edx, DWORD PTR _pv$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_calc_output_rowfield
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71737
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1048		; 00000418H
	jmp	$eva_err$71628
$L71737:

; 1049 : 
; 1050 : 			/* Output export params if applicable */
; 1051 : 			if(pv->exportparams) for(icol = 0; !icol || icol < pv->nbcol; icol++)

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+94136], 0
	je	$L71741
	mov	DWORD PTR _icol$[ebp], 0
	jmp	SHORT $L71739
$L71740:
	mov	ecx, DWORD PTR _icol$[ebp]
	add	ecx, 1
	mov	DWORD PTR _icol$[ebp], ecx
$L71739:
	cmp	DWORD PTR _icol$[ebp], 0
	je	SHORT $L71742
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _icol$[ebp]
	cmp	eax, DWORD PTR [edx+81784]
	jae	$L71741
$L71742:

; 1053 : 				pv->col = pv->nbcol ? pv->cols + icol : NULL;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+81784], 0
	je	SHORT $L73268
	mov	edx, DWORD PTR _icol$[ebp]
	imul	edx, 616				; 00000268H
	mov	eax, DWORD PTR _pv$[ebp]
	lea	ecx, DWORD PTR [eax+edx+78704]
	mov	DWORD PTR -1580+[ebp], ecx
	jmp	SHORT $L73269
$L73268:
	mov	DWORD PTR -1580+[ebp], 0
$L73269:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR -1580+[ebp]
	mov	DWORD PTR [edx+204], eax

; 1054 : 				pv->res = &pv->restbl[idata][irow][icol];

	mov	ecx, DWORD PTR _idata$[ebp]
	imul	ecx, 3000				; 00000bb8H
	mov	edx, DWORD PTR _pv$[ebp]
	lea	eax, DWORD PTR [edx+ecx+216]
	mov	ecx, DWORD PTR _irow$[ebp]
	imul	ecx, 100				; 00000064H
	add	eax, ecx
	mov	edx, DWORD PTR _icol$[ebp]
	imul	edx, 20					; 00000014H
	add	eax, edx
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+212], eax

; 1055 : 				dynbuf_print6(&pv->exportparams, "Table\t%lu\t%s\t%s\t%s\t%lu\t%lu",	irow,
; 1056 : 					pv->row ? pv->row->label : "",
; 1057 : 					pv->row ? (pv->row->basefmt && *pv->row->basefmt) ? pv->row->basefmt : pv->row->dispfmt : "",
; 1058 : 					pv->row ? pv->row->graphtyp : "", pv->row ? pv->row->labels.nbrows : 0, pv->res->nbrows);

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L73270
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -1584+[ebp], edx
	jmp	SHORT $L73271
$L73270:
	mov	DWORD PTR -1584+[ebp], 0
$L73271:
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	SHORT $L73272
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	mov	eax, DWORD PTR [edx+308]
	mov	DWORD PTR -1588+[ebp], eax
	jmp	SHORT $L73273
$L73272:
	mov	DWORD PTR -1588+[ebp], OFFSET FLAT:$SG71745
$L73273:
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	je	SHORT $L73276
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	cmp	DWORD PTR [eax+300], 0
	je	SHORT $L73274
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	mov	eax, DWORD PTR [edx+300]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L73274
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	mov	ecx, DWORD PTR [eax+300]
	mov	DWORD PTR -1592+[ebp], ecx
	jmp	SHORT $L73275
$L73274:
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	mov	ecx, DWORD PTR [eax+304]
	mov	DWORD PTR -1592+[ebp], ecx
$L73275:
	mov	edx, DWORD PTR -1592+[ebp]
	mov	DWORD PTR -1596+[ebp], edx
	jmp	SHORT $L73277
$L73276:
	mov	DWORD PTR -1596+[ebp], OFFSET FLAT:$SG71746
$L73277:
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+200], 0
	je	SHORT $L73278
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -1600+[ebp], eax
	jmp	SHORT $L73279
$L73278:
	mov	DWORD PTR -1600+[ebp], OFFSET FLAT:$SG71747
$L73279:
	push	0
	push	0
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR -1584+[ebp]
	push	ecx
	mov	edx, DWORD PTR -1588+[ebp]
	push	edx
	mov	eax, DWORD PTR -1596+[ebp]
	push	eax
	mov	ecx, DWORD PTR -1600+[ebp]
	push	ecx
	mov	edx, DWORD PTR _irow$[ebp]
	push	edx
	push	OFFSET FLAT:$SG71748
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 36					; 00000024H
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 94136				; 00016fb8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 1059 : 				dynbuf_print6(&pv->exportparams, "\t%lu\t%s\t%s\t%s\t%lu\t%lu",	icol,
; 1060 : 					pv->col ? pv->col->label : "",
; 1061 : 					pv->col ? (pv->col->basefmt && *pv->col->basefmt) ? pv->col->basefmt : pv->col->dispfmt : "",
; 1062 : 					pv->col ? pv->col->graphtyp : "", pv->col ? pv->col->labels.nbrows : 0, pv->res->nbcols);

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+204], 0
	je	SHORT $L73280
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR -1604+[ebp], eax
	jmp	SHORT $L73281
$L73280:
	mov	DWORD PTR -1604+[ebp], 0
$L73281:
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L73282
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR [eax+308]
	mov	DWORD PTR -1608+[ebp], ecx
	jmp	SHORT $L73283
$L73282:
	mov	DWORD PTR -1608+[ebp], OFFSET FLAT:$SG71750
$L73283:
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+204], 0
	je	SHORT $L73286
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	cmp	DWORD PTR [ecx+300], 0
	je	SHORT $L73284
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR [eax+300]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L73284
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	edx, DWORD PTR [ecx+300]
	mov	DWORD PTR -1612+[ebp], edx
	jmp	SHORT $L73285
$L73284:
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	edx, DWORD PTR [ecx+304]
	mov	DWORD PTR -1612+[ebp], edx
$L73285:
	mov	eax, DWORD PTR -1612+[ebp]
	mov	DWORD PTR -1616+[ebp], eax
	jmp	SHORT $L73287
$L73286:
	mov	DWORD PTR -1616+[ebp], OFFSET FLAT:$SG71751
$L73287:
	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L73288
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -1620+[ebp], ecx
	jmp	SHORT $L73289
$L73288:
	mov	DWORD PTR -1620+[ebp], OFFSET FLAT:$SG71752
$L73289:
	push	0
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+212]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR -1604+[ebp]
	push	edx
	mov	eax, DWORD PTR -1608+[ebp]
	push	eax
	mov	ecx, DWORD PTR -1616+[ebp]
	push	ecx
	mov	edx, DWORD PTR -1620+[ebp]
	push	edx
	mov	eax, DWORD PTR _icol$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71753
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 36					; 00000024H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 94136				; 00016fb8H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 1063 : 				dynbuf_print3(&pv->exportparams, "\t%lu\t%s\t%u\n",
; 1064 : 					idata, pv->data ? pv->data->label : "", pv->data ? pv->data->decimals : 0);

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+208], 0
	je	SHORT $L73290
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+208]
	mov	ecx, DWORD PTR [eax+364]
	mov	DWORD PTR -1624+[ebp], ecx
	jmp	SHORT $L73291
$L73290:
	mov	DWORD PTR -1624+[ebp], 0
$L73291:
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+208], 0
	je	SHORT $L73292
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -1628+[ebp], edx
	jmp	SHORT $L73293
$L73292:
	mov	DWORD PTR -1628+[ebp], OFFSET FLAT:$SG71755
$L73293:
	push	0
	push	0
	mov	eax, DWORD PTR -1624+[ebp]
	push	eax
	mov	ecx, DWORD PTR -1628+[ebp]
	push	ecx
	mov	edx, DWORD PTR _idata$[ebp]
	push	edx
	push	OFFSET FLAT:$SG71756
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 24					; 00000018H
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 94136				; 00016fb8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 1065 : 			}

	jmp	$L71740
$L71741:

; 1066 : 		}

	jmp	$L71646
$L71647:

; 1067 : 	}

	jmp	$L71641
$L71642:

; 1068 : 	DYNBUF_ADD_STR(html, "</table>");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG71759
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71758
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71761
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1068		; 0000042cH
	jmp	$eva_err$71628
$L71758:

; 1069 : 
; 1070 : 	/* Output table comments */
; 1071 : 	if(pv->tblnotes)

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+156], 0
	je	$L71820

; 1073 : 		char *function = (pv->data && pv->data->function.cell && pv->data->function.cell->txt && pv->data->function.cell->txt[0]) ?
; 1074 : 							pv->data->function.cell->txt : pv->function;

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+208], 0
	je	SHORT $L73294
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+208]
	cmp	DWORD PTR [eax+140], 0
	je	SHORT $L73294
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+208]
	mov	eax, DWORD PTR [edx+140]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L73294
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+208]
	mov	eax, DWORD PTR [edx+140]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L73294
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	mov	edx, DWORD PTR [ecx+140]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -1632+[ebp], eax
	jmp	SHORT $L73295
$L73294:
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+52]
	mov	DWORD PTR -1632+[ebp], edx
$L73295:
	mov	eax, DWORD PTR -1632+[ebp]
	mov	DWORD PTR _function$71763[ebp], eax

; 1075 : 		if(!function) function = "";

	cmp	DWORD PTR _function$71763[ebp], 0
	jne	SHORT $L71764
	mov	DWORD PTR _function$71763[ebp], OFFSET FLAT:$SG71765
$L71764:

; 1076 : 		DYNBUF_ADD3_INT(html, "<table><tr><td bgcolor=#FFFFFF colspan=", pv->totcols, ">");

	push	1
	push	OFFSET FLAT:$SG71767
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+94116]
	push	edx
	push	39					; 00000027H
	push	OFFSET FLAT:$SG71768
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71766
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71770
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1076		; 00000434H
	jmp	$eva_err$71628
$L71766:

; 1077 : 
; 1078 : 		/* Output dynamic label */
; 1079 : 		if(pv->tblnotes & TblNote_dynamic)

	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+156]
	and	ecx, 256				; 00000100H
	test	ecx, ecx
	je	$L71785

; 1081 : 			EVA_ctrl ct = {{0}};

	mov	DWORD PTR _ct$71772[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _ct$71772[ebp+4], edx
	mov	DWORD PTR _ct$71772[ebp+8], edx
	mov	DWORD PTR _ct$71772[ebp+12], edx
	mov	DWORD PTR _ct$71772[ebp+16], edx
	mov	ecx, 115				; 00000073H
	xor	eax, eax
	lea	edi, DWORD PTR _ct$71772[ebp+20]
	rep stosd

; 1082 : 			for(i = 0; i < pv->dynnotes.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71773
$L71774:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71773:
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+136]
	jae	$L71775

; 1084 : 				if(qry_obj_field(cntxt, &ct.attr, DYNTAB_TOULRC(&pv->dynnotes, i, 0), NULL) ||
; 1085 : 					ctrl_read_baseobj(cntxt, &ct.attr) ||
; 1086 : 					ctrl_set_format_attr(cntxt, &ct)) STACK_ERROR;

	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 136				; 00000088H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _ct$71772[ebp+44]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L71779
	lea	ecx, DWORD PTR _ct$71772[ebp+44]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71779
	lea	eax, DWORD PTR _ct$71772[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_set_format_attr
	add	esp, 8
	test	eax, eax
	je	SHORT $L71778
$L71779:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1086		; 0000043eH
	jmp	$eva_err$71628
$L71778:

; 1087 : 				ct.LABELPOS = "_EVA_NONE";

	mov	DWORD PTR _ct$71772[ebp+292], OFFSET FLAT:$SG71780

; 1088 : 				ct.POSITION = "_EVA_SameCell";

	mov	DWORD PTR _ct$71772[ebp+296], OFFSET FLAT:$SG71781

; 1089 : 				if(ctrl_format_pos(cntxt, &ct, 1) ||
; 1090 : 					ctrl_output_exprval(cntxt, &ct, 1) ||
; 1091 : 					ctrl_format_pos(cntxt, &ct, 0)) STACK_ERROR;

	push	1
	lea	eax, DWORD PTR _ct$71772[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71783
	push	1
	lea	edx, DWORD PTR _ct$71772[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_output_exprval
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71783
	push	0
	lea	ecx, DWORD PTR _ct$71772[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71782
$L71783:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1091		; 00000443H
	jmp	$eva_err$71628
$L71782:

; 1092 : 				DYNTAB_FREE(ct.attr);

	lea	ecx, DWORD PTR _ct$71772[ebp+44]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 1093 : 				DYNTAB_FREE(ct.val);

	lea	edx, DWORD PTR _ct$71772[ebp+64]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 1094 : 				DYNTAB_FREE(ct.allval);

	lea	eax, DWORD PTR _ct$71772[ebp+124]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 1095 : 			}

	jmp	$L71774
$L71775:

; 1096 : 			DYNBUF_ADD_STR(html, "<br>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG71786
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71785
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71788
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1096		; 00000448H
	jmp	$eva_err$71628
$L71785:

; 1098 : 
; 1099 : 		/* Output table contents */
; 1100 : 		DYNBUF_ADD_STR(html, "<font size=-1>");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG71791
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71790
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71793
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1100		; 0000044cH
	jmp	$eva_err$71628
$L71790:

; 1101 : 		if(pv->tblnotes & (TblNote_note | TblNote_detail))

	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+156]
	and	edx, 17					; 00000011H
	test	edx, edx
	je	$L71796

; 1103 : 			ctrl_output_pvt_notes(cntxt, "Détail du tableau", pv->tblnotes & TblNote_detail ? 1 : 0,pv->srcdata);

	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+156]
	and	eax, 16					; 00000010H
	neg	eax
	sbb	eax, eax
	neg	eax
	push	eax
	push	OFFSET FLAT:$SG71795
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_output_pvt_notes
	add	esp, 16					; 00000010H

; 1104 : 			if(pv->tblnotes & TblNote_detail)

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+156]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	$L71796

; 1105 : 				dynbuf_print2(html, "<br><u>Valeurs affichées</u> : <b>%s de [%s]</b><br>",
; 1106 : 									!strcmp("VALCOUNT", function) ? "Nombre de valeurs" :
; 1107 : 									!strcmp("VALCOUNT1", function) ? "Nombre de valeurs distinctes" :
; 1108 : 									!strcmp("SUM", function) ? "Somme des valeurs" :
; 1109 : 									!strcmp("AVG", function) ? "Moyenne des valeurs" :
; 1110 : 									!strcmp("MIN", function) ? "Plus petite valeur" :
; 1111 : 									!strcmp("MAX", function) ? "Plus grande valeur" :
; 1112 : 																	"Nombre de fiches",
; 1113 : 									pv->data ? pv->data->label : pv->row ? pv->row->label : pv->col ? pv->col->label : "tout");

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+208], 0
	je	SHORT $L73300
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+208]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -1636+[ebp], ecx
	jmp	SHORT $L73301
$L73300:
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L73298
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -1640+[ebp], edx
	jmp	SHORT $L73299
$L73298:
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+204], 0
	je	SHORT $L73296
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -1644+[ebp], eax
	jmp	SHORT $L73297
$L73296:
	mov	DWORD PTR -1644+[ebp], OFFSET FLAT:$SG71798
$L73297:
	mov	ecx, DWORD PTR -1644+[ebp]
	mov	DWORD PTR -1640+[ebp], ecx
$L73299:
	mov	edx, DWORD PTR -1640+[ebp]
	mov	DWORD PTR -1636+[ebp], edx
$L73301:
	mov	eax, DWORD PTR _function$71763[ebp]
	push	eax
	push	OFFSET FLAT:$SG71799
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73312
	mov	DWORD PTR -1648+[ebp], OFFSET FLAT:$SG71800
	jmp	$L73313
$L73312:
	mov	ecx, DWORD PTR _function$71763[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71801
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73310
	mov	DWORD PTR -1652+[ebp], OFFSET FLAT:$SG71802
	jmp	$L73311
$L73310:
	mov	edx, DWORD PTR _function$71763[ebp]
	push	edx
	push	OFFSET FLAT:$SG71803
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73308
	mov	DWORD PTR -1656+[ebp], OFFSET FLAT:$SG71804
	jmp	$L73309
$L73308:
	mov	eax, DWORD PTR _function$71763[ebp]
	push	eax
	push	OFFSET FLAT:$SG71805
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73306
	mov	DWORD PTR -1660+[ebp], OFFSET FLAT:$SG71806
	jmp	SHORT $L73307
$L73306:
	mov	ecx, DWORD PTR _function$71763[ebp]
	push	ecx
	push	OFFSET FLAT:$SG71807
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73304
	mov	DWORD PTR -1664+[ebp], OFFSET FLAT:$SG71808
	jmp	SHORT $L73305
$L73304:
	mov	edx, DWORD PTR _function$71763[ebp]
	push	edx
	push	OFFSET FLAT:$SG71809
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73302
	mov	DWORD PTR -1668+[ebp], OFFSET FLAT:$SG71810
	jmp	SHORT $L73303
$L73302:
	mov	DWORD PTR -1668+[ebp], OFFSET FLAT:$SG71811
$L73303:
	mov	eax, DWORD PTR -1668+[ebp]
	mov	DWORD PTR -1664+[ebp], eax
$L73305:
	mov	ecx, DWORD PTR -1664+[ebp]
	mov	DWORD PTR -1660+[ebp], ecx
$L73307:
	mov	edx, DWORD PTR -1660+[ebp]
	mov	DWORD PTR -1656+[ebp], edx
$L73309:
	mov	eax, DWORD PTR -1656+[ebp]
	mov	DWORD PTR -1652+[ebp], eax
$L73311:
	mov	ecx, DWORD PTR -1652+[ebp]
	mov	DWORD PTR -1648+[ebp], ecx
$L73313:
	push	0
	push	0
	mov	edx, DWORD PTR -1636+[ebp]
	push	edx
	mov	eax, DWORD PTR -1648+[ebp]
	push	eax
	push	OFFSET FLAT:$SG71812
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L71796:

; 1115 : 		if(pv->row && pv->tblnotes & (TblNote_rownote | TblNote_rowdetail))

	mov	ecx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [ecx+200], 0
	je	SHORT $L71813
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+156]
	and	eax, 34					; 00000022H
	test	eax, eax
	je	SHORT $L71813

; 1116 : 			ctrl_output_pvt_notes(cntxt, "Lignes", pv->tblnotes & TblNote_rowdetail ? 3 : 0,&pv->row->srcdata);

	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+200]
	add	edx, 188				; 000000bcH
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+156]
	and	ecx, 32					; 00000020H
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 3
	push	ecx
	push	OFFSET FLAT:$SG71814
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_output_pvt_notes
	add	esp, 16					; 00000010H
$L71813:

; 1117 : 		if(pv->col && pv->tblnotes & (TblNote_colnote | TblNote_coldetail))

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+204], 0
	je	SHORT $L71815
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+156]
	and	edx, 68					; 00000044H
	test	edx, edx
	je	SHORT $L71815

; 1118 : 			ctrl_output_pvt_notes(cntxt, "Colonnes", pv->tblnotes & TblNote_coldetail ? 3 : 0,&pv->col->srcdata);

	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	add	ecx, 188				; 000000bcH
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+156]
	and	eax, 64					; 00000040H
	neg	eax
	sbb	eax, eax
	and	eax, 3
	push	eax
	push	OFFSET FLAT:$SG71816
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_output_pvt_notes
	add	esp, 16					; 00000010H
$L71815:

; 1119 : 		if(pv->data && pv->tblnotes & (TblNote_datanote | TblNote_datadetail))

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+208], 0
	je	SHORT $L71817
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+156]
	and	ecx, 136				; 00000088H
	test	ecx, ecx
	je	SHORT $L71817

; 1120 : 			ctrl_output_pvt_notes(cntxt, "Données", pv->tblnotes & TblNote_datadetail ? 3 : 0,&pv->data->srcdata);

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+208]
	add	eax, 188				; 000000bcH
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+156]
	and	edx, 128				; 00000080H
	neg	edx
	sbb	edx, edx
	and	edx, 3
	push	edx
	push	OFFSET FLAT:$SG71818
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_output_pvt_notes
	add	esp, 16					; 00000010H
$L71817:

; 1121 : 		DYNBUF_ADD_STR(html, "</font></td></tr></table>");

	push	0
	push	0
	push	25					; 00000019H
	push	OFFSET FLAT:$SG71821
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71820
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71823
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1121		; 00000461H
	jmp	SHORT $eva_err$71628
$L71820:
$eva_noerr$71824:

; 1123 : 
; 1124 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71825
	push	OFFSET FLAT:$SG71826
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71628:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71827
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71828
	push	OFFSET FLAT:$SG71829
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71827:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1125 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_calc_output_pvtres ENDP
_TEXT	ENDS
PUBLIC	_get_cgi_obj_data
EXTRN	_cgi_filter_values:NEAR
EXTRN	_qry_complete_data:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71847 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG71851 DB	'%lu', 00H
$SG71859 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71860 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG71868 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71869 DB	'get_cgi_obj_data', 00H
	ORG $+3
$SG71871 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71872 DB	'get_cgi_obj_data', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_objdata$ = 12
_idobj$ = 16
_idform$ = 20
_dbdata$ = 24
_tmp$71850 = -32
___tab$71852 = -48
___row$71853 = -44
___col$71854 = -40
__c$71855 = -36
_get_cgi_obj_data PROC NEAR

; 1141 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H

; 1142 : 	/* Read cgi data for object / form */
; 1143 : 	dyntab_free(objdata);

	mov	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 1144 : 	if(cgi_filter_values(cntxt, objdata, 'D', ~0UL, idform, idobj, NULL, "", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	OFFSET FLAT:$SG71847
	push	0
	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _idform$[ebp]
	push	edx
	push	-1
	push	68					; 00000044H
	mov	eax, DWORD PTR _objdata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L71846
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1144		; 00000478H
	jmp	$eva_err$71848
$L71846:

; 1145 : 
; 1146 : 	/* Check for new object */
; 1147 : 	if(!idobj)

	cmp	DWORD PTR _idobj$[ebp], 0
	jne	$L71849

; 1149 : 		/* New object : add formstamp for correct title display */
; 1150 : 		char tmp[32];
; 1151 : 		sprintf(tmp, "%lu", idform);

	mov	eax, DWORD PTR _idform$[ebp]
	push	eax
	push	OFFSET FLAT:$SG71851
	lea	ecx, DWORD PTR _tmp$71850[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 1153 : 						"_EVA_FORMSTAMP", cntxt->val_FORMSTAMP, idobj);

	mov	edx, DWORD PTR _objdata$[ebp]
	mov	DWORD PTR ___tab$71852[ebp], edx
	mov	eax, DWORD PTR _objdata$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR ___row$71853[ebp], ecx
	mov	DWORD PTR ___col$71854[ebp], 0
	push	0
	push	0
	lea	edx, DWORD PTR _tmp$71850[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	push	eax
	lea	eax, DWORD PTR _tmp$71850[ebp]
	push	eax
	mov	ecx, DWORD PTR ___col$71854[ebp]
	push	ecx
	mov	edx, DWORD PTR ___row$71853[ebp]
	push	edx
	mov	eax, DWORD PTR ___tab$71852[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71857
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71859
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1153		; 00000481H
	jmp	$eva_err$71848
$L71857:
	mov	eax, DWORD PTR ___col$71854[ebp]
	push	eax
	mov	ecx, DWORD PTR ___row$71853[ebp]
	push	ecx
	mov	edx, DWORD PTR ___tab$71852[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$71855[ebp], eax
	mov	eax, DWORD PTR __c$71855[ebp]
	mov	ecx, DWORD PTR _idobj$[ebp]
	mov	DWORD PTR [eax+20], ecx
	mov	edx, DWORD PTR __c$71855[ebp]
	mov	DWORD PTR [edx+8], OFFSET FLAT:$SG71860
	mov	eax, DWORD PTR __c$71855[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+269636]
	mov	DWORD PTR [eax+28], edx
	mov	eax, DWORD PTR __c$71855[ebp]
	mov	DWORD PTR [eax+36], 1
	mov	ecx, DWORD PTR __c$71855[ebp]
	mov	DWORD PTR [ecx+40], 0
	mov	edx, DWORD PTR __c$71855[ebp]
	mov	BYTE PTR [edx+15], 1

; 1155 : 	else

	jmp	SHORT $L71866
$L71849:

; 1157 : 		/* Existing object : complete with DB data for unchanged fields */
; 1158 : 		if(!dbdata->nbrows && qry_obj_field(cntxt, dbdata, idobj, NULL)) STACK_ERROR;

	mov	eax, DWORD PTR _dbdata$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L71863
	push	0
	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _dbdata$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71863
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1158		; 00000486H
	jmp	SHORT $eva_err$71848
$L71863:

; 1159 : 		if(qry_complete_data(cntxt, objdata, dbdata, NULL, NULL)) STACK_ERROR;

	push	0
	push	0
	mov	edx, DWORD PTR _dbdata$[ebp]
	push	edx
	mov	eax, DWORD PTR _objdata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_complete_data
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71866
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1159		; 00000487H
	jmp	SHORT $eva_err$71848
$L71866:
$eva_noerr$71867:

; 1161 : 
; 1162 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71868
	push	OFFSET FLAT:$SG71869
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71848:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71870
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71871
	push	OFFSET FLAT:$SG71872
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71870:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1163 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_get_cgi_obj_data ENDP
_TEXT	ENDS
PUBLIC	_get_current_obj_field_data
EXTRN	_qry_obj_data:NEAR
EXTRN	_dyntab_del_rows:NEAR
EXTRN	_form_get_field_values:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71900 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG71914 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71916 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG71922 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71923 DB	'get_current_obj_field_data', 00H
	ORG $+1
$SG71925 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71926 DB	'get_current_obj_field_data', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_field$ = 12
_objdata$ = 16
_idlist$ = 20
_form$ = -4
_i$71895 = -8
_c$71906 = -12
___tab$71907 = -28
___row$71908 = -24
___col$71909 = -20
__c$71910 = -16
_get_current_obj_field_data PROC NEAR

; 1178 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 1179 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1180 : 
; 1181 : 	dyntab_free(objdata);

	mov	edx, DWORD PTR _objdata$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 1182 : 	if(field && *field)

	cmp	DWORD PTR _field$[ebp], 0
	je	$L71887
	mov	eax, DWORD PTR _field$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L71887

; 1184 : 		/* Field is given : read field value from CGI / DB data (multiple IdObj) */
; 1185 : 		if(form_get_field_values(cntxt, idlist, field, DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj)))

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 32					; 00000020H
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
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _field$[ebp]
	push	ecx
	mov	edx, DWORD PTR _idlist$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_get_field_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71890

; 1186 : 			STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1186		; 000004a2H
	jmp	$eva_err$71891
$L71890:

; 1187 : 
; 1188 : 		/* Read object data if unique object */
; 1189 : 		if(idlist->nbrows == 1 && qry_obj_data(cntxt, objdata, idlist, NULL)) STACK_ERROR;

	mov	edx, DWORD PTR _idlist$[ebp]
	cmp	DWORD PTR [edx], 1
	jne	SHORT $L71893
	push	0
	mov	eax, DWORD PTR _idlist$[ebp]
	push	eax
	mov	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71893
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1189		; 000004a5H
	jmp	$eva_err$71891
$L71893:

; 1191 : 	else

	jmp	$L71920
$L71887:

; 1193 : 		/* Field is not given : use CGI data of current object */
; 1194 : 		unsigned long i;
; 1195 : 		if(cgi_filter_values(cntxt, objdata, 'D', ~0UL,
; 1196 : 				DYNTAB_TOUL(&form->id_form), DYNTAB_TOUL(&form->id_obj), NULL, "", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	OFFSET FLAT:$SG71900
	push	0
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
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
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	push	-1
	push	68					; 00000044H
	mov	eax, DWORD PTR _objdata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L71899
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1196		; 000004acH
	jmp	$eva_err$71891
$L71899:

; 1197 : 		for(i = objdata->nbrows; i > 0; i--)

	mov	eax, DWORD PTR _objdata$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _i$71895[ebp], ecx
	jmp	SHORT $L71901
$L71902:
	mov	edx, DWORD PTR _i$71895[ebp]
	sub	edx, 1
	mov	DWORD PTR _i$71895[ebp], edx
$L71901:
	cmp	DWORD PTR _i$71895[ebp], 0
	jbe	SHORT $L71903

; 1198 : 			if(!dyntab_sz(objdata, i - 1, 0))

	push	0
	mov	eax, DWORD PTR _i$71895[ebp]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71904

; 1199 : 				dyntab_del_rows(objdata, i - 1, 1);

	push	1
	mov	edx, DWORD PTR _i$71895[ebp]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_del_rows
	add	esp, 12					; 0000000cH
$L71904:

; 1200 : 
; 1201 : 		/* Check for new object */
; 1202 : 		if(!form->objdata.nbrows)

	jmp	SHORT $L71902
$L71903:
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+52], 0
	jne	$L71905

; 1204 : 			/* New object : add formstamp for correct title display */
; 1205 : 			DynTableCell *c = dyntab_cell(&form->id_form, 0, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$71906[ebp], eax

; 1207 : 							"_EVA_FORMSTAMP", cntxt->val_FORMSTAMP, DYNTAB_TOUL(&form->id_obj));

	mov	eax, DWORD PTR _objdata$[ebp]
	mov	DWORD PTR ___tab$71907[ebp], eax
	mov	ecx, DWORD PTR _objdata$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR ___row$71908[ebp], edx
	mov	DWORD PTR ___col$71909[ebp], 0
	push	0
	push	0
	mov	eax, DWORD PTR _c$71906[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _c$71906[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR ___col$71909[ebp]
	push	ecx
	mov	edx, DWORD PTR ___row$71908[ebp]
	push	edx
	mov	eax, DWORD PTR ___tab$71907[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71912
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71914
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1207		; 000004b7H
	jmp	$eva_err$71891
$L71912:
	mov	eax, DWORD PTR ___col$71909[ebp]
	push	eax
	mov	ecx, DWORD PTR ___row$71908[ebp]
	push	ecx
	mov	edx, DWORD PTR ___tab$71907[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$71910[ebp], eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR __c$71910[ebp]
	mov	DWORD PTR [ecx+20], eax
	mov	edx, DWORD PTR __c$71910[ebp]
	mov	DWORD PTR [edx+8], OFFSET FLAT:$SG71916
	mov	eax, DWORD PTR __c$71910[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+269636]
	mov	DWORD PTR [eax+28], edx
	mov	eax, DWORD PTR __c$71910[ebp]
	mov	DWORD PTR [eax+36], 1
	mov	ecx, DWORD PTR __c$71910[ebp]
	mov	DWORD PTR [ecx+40], 0
	mov	edx, DWORD PTR __c$71910[ebp]
	mov	BYTE PTR [edx+15], 1

; 1209 : 		else

	jmp	SHORT $L71920
$L71905:

; 1210 : 			/* Existing object : complete with DB data for unchanged fields */
; 1211 : 			if(qry_complete_data(cntxt, objdata, &form->objdata, NULL, NULL)) STACK_ERROR;

	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 52					; 00000034H
	push	eax
	mov	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_complete_data
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71920
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1211		; 000004bbH
	jmp	SHORT $eva_err$71891
$L71920:
$eva_noerr$71921:

; 1213 : 
; 1214 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71922
	push	OFFSET FLAT:$SG71923
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71891:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71924
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71925
	push	OFFSET FLAT:$SG71926
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71924:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1215 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_get_current_obj_field_data ENDP
_TEXT	ENDS
PUBLIC	_pivottable_add_sr_options
EXTRN	_qry_listobj_field:NEAR
EXTRN	_dyntab_copy:NEAR
_DATA	SEGMENT
	ORG $+1
$SG71945 DB	'_EVA_LABEL,_EVA_VALUE', 00H
	ORG $+2
$SG71960 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71963 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71971 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71973 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71974 DB	'pivottable_add_sr_options', 00H
	ORG $+2
$SG71976 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG71977 DB	'pivottable_add_sr_options', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pvf$ = 12
_options$ = 16
_values$ = -32
_i$ = -8
_j$ = -12
_cnt$ = -4
_empty$ = -36
_c$71950 = -44
_cprev$71951 = -40
_cnext$71953 = -48
_l$71956 = -56
_v$71957 = -52
_pivottable_add_sr_options PROC NEAR

; 1229 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H

; 1230 : 	DynTable values = {0};

	mov	DWORD PTR _values$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _values$[ebp+4], eax
	mov	DWORD PTR _values$[ebp+8], eax
	mov	DWORD PTR _values$[ebp+12], eax
	mov	DWORD PTR _values$[ebp+16], eax

; 1231 : 	unsigned long i, j, cnt = 0;

	mov	DWORD PTR _cnt$[ebp], 0

; 1232 : 	DynTableCell *empty = NULL;

	mov	DWORD PTR _empty$[ebp], 0

; 1233 : 
; 1234 : 	/* Read options labels & values in a single table (default order is used : label & value for each option) */
; 1235 : 	if(qry_listobj_field(cntxt, &values, options, "_EVA_LABEL,_EVA_VALUE")) STACK_ERROR;

	push	OFFSET FLAT:$SG71945
	mov	ecx, DWORD PTR _options$[ebp]
	push	ecx
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_listobj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71944
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1235		; 000004d3H
	jmp	$eva_err$71946
$L71944:

; 1236 : 
; 1237 : 	for(i = 0; i < values.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71947
$L71948:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71947:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _values$[ebp]
	jae	$L71949

; 1239 : 		DynTableCell *c = dyntab_cell(&values, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$71950[ebp], eax

; 1240 : 		DynTableCell *cprev = i ? c - 1 : NULL;

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L73317
	mov	eax, DWORD PTR _c$71950[ebp]
	sub	eax, 64					; 00000040H
	mov	DWORD PTR -60+[ebp], eax
	jmp	SHORT $L73318
$L73317:
	mov	DWORD PTR -60+[ebp], 0
$L73318:
	mov	ecx, DWORD PTR -60+[ebp]
	mov	DWORD PTR _cprev$71951[ebp], ecx

; 1241 : 		DynTableCell *cnext = (i + 1 < values.nbrows) ? c + 1 : NULL;

	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	cmp	edx, DWORD PTR _values$[ebp]
	jae	SHORT $L73319
	mov	eax, DWORD PTR _c$71950[ebp]
	add	eax, 64					; 00000040H
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L73320
$L73319:
	mov	DWORD PTR -64+[ebp], 0
$L73320:
	mov	ecx, DWORD PTR -64+[ebp]
	mov	DWORD PTR _cnext$71953[ebp], ecx

; 1242 : 
; 1243 : 		/* If label / value pair found */
; 1244 : 		if(cnext && c->IdObj == cnext->IdObj)

	cmp	DWORD PTR _cnext$71953[ebp], 0
	je	$L71955
	mov	edx, DWORD PTR _c$71950[ebp]
	mov	eax, DWORD PTR _cnext$71953[ebp]
	mov	ecx, DWORD PTR [edx+20]
	cmp	ecx, DWORD PTR [eax+20]
	jne	$L71955

; 1246 : 			/* Add to search & replace table */
; 1247 : 			DynTableCell *l = c, *v = cnext;

	mov	edx, DWORD PTR _c$71950[ebp]
	mov	DWORD PTR _l$71956[ebp], edx
	mov	eax, DWORD PTR _cnext$71953[ebp]
	mov	DWORD PTR _v$71957[ebp], eax

; 1248 : 			j = pvf->sr_src.nbrows > pvf->sr_dest.nbrows ? pvf->sr_src.nbrows : pvf->sr_dest.nbrows;

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [ecx+388]
	cmp	eax, DWORD PTR [edx+408]
	jbe	SHORT $L73321
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+388]
	mov	DWORD PTR -68+[ebp], edx
	jmp	SHORT $L73322
$L73321:
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+408]
	mov	DWORD PTR -68+[ebp], ecx
$L73322:
	mov	edx, DWORD PTR -68+[ebp]
	mov	DWORD PTR _j$[ebp], edx

; 1249 : 			DYNTAB_ADD_CELLP(&pvf->sr_src, j, 0, v);

	push	1
	mov	eax, DWORD PTR _v$71957[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 388				; 00000184H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71958
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71960
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1249		; 000004e1H
	jmp	$eva_err$71946
$L71958:

; 1250 : 			DYNTAB_ADD_CELLP(&pvf->sr_dest, j, 0, l);

	push	1
	mov	edx, DWORD PTR _l$71956[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 408				; 00000198H
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71961
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71963
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1250		; 000004e2H
	jmp	$eva_err$71946
$L71961:

; 1252 : 		/* Count options without value */
; 1253 : 		else if((!cprev || c->IdObj != cprev->IdObj) && (!cnext || c->IdObj != cnext->IdObj))

	jmp	SHORT $L71965
$L71955:
	cmp	DWORD PTR _cprev$71951[ebp], 0
	je	SHORT $L71966
	mov	ecx, DWORD PTR _c$71950[ebp]
	mov	edx, DWORD PTR _cprev$71951[ebp]
	mov	eax, DWORD PTR [ecx+20]
	cmp	eax, DWORD PTR [edx+20]
	je	SHORT $L71965
$L71966:
	cmp	DWORD PTR _cnext$71953[ebp], 0
	je	SHORT $L71967
	mov	ecx, DWORD PTR _c$71950[ebp]
	mov	edx, DWORD PTR _cnext$71953[ebp]
	mov	eax, DWORD PTR [ecx+20]
	cmp	eax, DWORD PTR [edx+20]
	je	SHORT $L71965
$L71967:

; 1255 : 			cnt ++;

	mov	ecx, DWORD PTR _cnt$[ebp]
	add	ecx, 1
	mov	DWORD PTR _cnt$[ebp], ecx

; 1256 : 			empty = c;

	mov	edx, DWORD PTR _c$71950[ebp]
	mov	DWORD PTR _empty$[ebp], edx
$L71965:

; 1258 : 	}

	jmp	$L71948
$L71949:

; 1259 : 
; 1260 : 	/* Use option with empty value if applicable */
; 1261 : 	if(!pvf->emptyval.nbrows && pvf->sr_src.nbrows > 1 && empty && cnt == 1)

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+492], 0
	jne	SHORT $L71969
	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+388], 1
	jbe	SHORT $L71969
	cmp	DWORD PTR _empty$[ebp], 0
	je	SHORT $L71969
	cmp	DWORD PTR _cnt$[ebp], 1
	jne	SHORT $L71969

; 1262 : 		DYNTAB_ADD_CELLP(&pvf->emptyval, 0, 0, empty);

	push	1
	mov	edx, DWORD PTR _empty$[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 492				; 000001ecH
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71969
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71971
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1262		; 000004eeH
	jmp	SHORT $eva_err$71946
$L71969:
$eva_noerr$71972:

; 1263 : 
; 1264 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71973
	push	OFFSET FLAT:$SG71974
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71946:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71975
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71976
	push	OFFSET FLAT:$SG71977
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71975:
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1265 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_pivottable_add_sr_options ENDP
_TEXT	ENDS
PUBLIC	_pivottable_set_indic_fmt_from_ctrl
EXTRN	_form_eval_fieldexpr:NEAR
EXTRN	_stricmp:NEAR
_DATA	SEGMENT
	ORG $+2
$SG71991 DB	'_EVA_TYPE', 00H
	ORG $+2
$SG71993 DB	'_EVA_FORMAT', 00H
$SG71997 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG71998 DB	'_EVA_FILEUPLOAD', 00H
$SG71999 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG72003 DB	'_EVA_NUMBER', 00H
$SG72004 DB	'_EVA_NUMBER', 00H
$SG72006 DB	'_EVA_MONEY', 00H
	ORG $+1
$SG72009 DB	'_EVA_NUMBER', 00H
$SG72013 DB	'_EVA_DATE', 00H
	ORG $+2
$SG72014 DB	'_EVA_DATE', 00H
	ORG $+2
$SG72017 DB	'_EVA_LIST', 00H
	ORG $+2
$SG72020 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG72022 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72027 DB	'_EVA_CTRLTREE->_EVA_LABEL', 00H
	ORG $+2
$SG72029 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72030 DB	'pivottable_set_indic_fmt_from_ctrl', 00H
	ORG $+1
$SG72032 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72033 DB	'pivottable_set_indic_fmt_from_ctrl', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pvf$ = 12
_attr$ = 16
_options$ = -24
_ctrltyp$ = -28
_ctrlfmt$ = -4
_pivottable_set_indic_fmt_from_ctrl PROC NEAR

; 1279 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 1280 : 	DynTable options = {0};

	mov	DWORD PTR _options$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _options$[ebp+4], eax
	mov	DWORD PTR _options$[ebp+8], eax
	mov	DWORD PTR _options$[ebp+12], eax
	mov	DWORD PTR _options$[ebp+16], eax

; 1281 : 	char *ctrltyp = DYNTAB_FIELD_VAL(attr, TYPE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG71991
	mov	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _ctrltyp$[ebp], eax

; 1282 : 	char *ctrlfmt = DYNTAB_FIELD_VAL(attr, FORMAT);

	push	0
	push	-1
	push	OFFSET FLAT:$SG71993
	mov	edx, DWORD PTR _attr$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _ctrlfmt$[ebp], eax

; 1283 : 
; 1284 : 	if((!pvf->dispfmt || !pvf->dispfmt[0]) && (
; 1285 : 		!strcmp(ctrltyp, "_EVA_RELATION") ||
; 1286 : 		!strcmp(ctrltyp, "_EVA_FILEUPLOAD")))

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+304], 0
	je	SHORT $L71995
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+304]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L71994
$L71995:
	push	OFFSET FLAT:$SG71997
	mov	ecx, DWORD PTR _ctrltyp$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71996
	push	OFFSET FLAT:$SG71998
	mov	edx, DWORD PTR _ctrltyp$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71994
$L71996:

; 1288 : 		pvf->dispfmt = "_EVA_RELATION";

	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+304], OFFSET FLAT:$SG71999

; 1290 : 	else if((!pvf->dispfmt || !pvf->dispfmt[0]) && !strcmp(ctrltyp, "_EVA_NUMBER"))

	jmp	$L72026
$L71994:
	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+304], 0
	je	SHORT $L72002
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+304]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L72001
$L72002:
	push	OFFSET FLAT:$SG72003
	mov	edx, DWORD PTR _ctrltyp$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72001

; 1292 : 		pvf->dispfmt = "_EVA_NUMBER";

	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+304], OFFSET FLAT:$SG72004

; 1293 : 		if(!STRCMPCASE(ctrlfmt, "_EVA_MONEY")) pvf->decimals = 2;

	push	OFFSET FLAT:$SG72006
	mov	ecx, DWORD PTR _ctrlfmt$[ebp]
	push	ecx
	call	_stricmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72005
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [edx+364], 2
$L72005:

; 1294 : 		if(!pvf->sortmode || !pvf->sortmode[0]) pvf->sortmode = "_EVA_NUMBER";

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+484], 0
	je	SHORT $L72008
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR [ecx+484]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L72007
$L72008:
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+484], OFFSET FLAT:$SG72009
$L72007:

; 1296 : 	else if((!pvf->dispfmt || !pvf->dispfmt[0]) && !strcmp(ctrltyp, "_EVA_DATE"))

	jmp	$L72026
$L72001:
	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+304], 0
	je	SHORT $L72012
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+304]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L72011
$L72012:
	push	OFFSET FLAT:$SG72013
	mov	eax, DWORD PTR _ctrltyp$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72011

; 1298 : 		pvf->dispfmt = "_EVA_DATE";

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+304], OFFSET FLAT:$SG72014

; 1299 : 		pvf->b_calendar = 2;

	mov	edx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [edx+356], 2

; 1300 : 		pvf->maxlabels = 12;

	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+296], 12			; 0000000cH

; 1302 : 	else if(!strcmp(ctrltyp, "_EVA_LIST") && !pvf->optsrc.nbrows && pvf->datatable[0] != 'D')

	jmp	$L72026
$L72011:
	push	OFFSET FLAT:$SG72017
	mov	ecx, DWORD PTR _ctrltyp$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72026
	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+448], 0
	jne	$L72026
	mov	eax, DWORD PTR _pvf$[ebp]
	movsx	ecx, BYTE PTR [eax+208]
	cmp	ecx, 68					; 00000044H
	je	$L72026

; 1304 : 		/* List : use options label/value as transform table */
; 1305 : 		DYNTAB_FIELD(&options, attr, CTRLTREE);

	lea	edx, DWORD PTR _options$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72020
	mov	eax, DWORD PTR _attr$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _options$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72019
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72022
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1305		; 00000519H
	jmp	$eva_err$72023
$L72019:

; 1306 : 		if((!pvf->dispfmt || !pvf->dispfmt[0]) && pivottable_add_sr_options(cntxt, pvf, &options)) STACK_ERROR;

	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+304], 0
	je	SHORT $L72025
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+304]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L72024
$L72025:
	lea	edx, DWORD PTR _options$[ebp]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_pivottable_add_sr_options
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72024
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1306		; 0000051aH
	jmp	SHORT $eva_err$72023
$L72024:

; 1307 : 
; 1308 : 		/* Add list options to labels if show no match */
; 1309 : 		if(pvf->b_shownomatch && form_eval_fieldexpr(cntxt, &pvf->labels, 0, attr->cell->IdObj, add_sz_str("_EVA_CTRLTREE->_EVA_LABEL"), attr, 0)) STACK_ERROR;

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+516], 0
	je	SHORT $L72026
	push	0
	mov	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	push	25					; 00000019H
	push	OFFSET FLAT:$SG72027
	mov	edx, DWORD PTR _attr$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	push	0
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L72026
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1309		; 0000051dH
	jmp	SHORT $eva_err$72023
$L72026:
$eva_noerr$72028:

; 1311 : 
; 1312 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72029
	push	OFFSET FLAT:$SG72030
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72023:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L72031
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG72032
	push	OFFSET FLAT:$SG72033
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72031:
	lea	ecx, DWORD PTR _options$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1313 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_pivottable_set_indic_fmt_from_ctrl ENDP
_TEXT	ENDS
PUBLIC	_pivottable_get_indic_definition
EXTRN	_ctrl_eval_fieldexpr:NEAR
EXTRN	_form_eval_valtype:NEAR
EXTRN	_ctrl_get_calendar_input:NEAR
EXTRN	_atoi:NEAR
EXTRN	_dyntab_from_list:NEAR
EXTRN	_dyntab_set_txt:NEAR
EXTRN	_dyntab_txt_cmp:NEAR
EXTRN	_dyntab_order_lines:NEAR
EXTRN	_dyntab_group:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG72109 DB	01H DUP (?)
	ALIGN	4

$SG72219 DB	01H DUP (?)
	ALIGN	4

$SG72234 DB	01H DUP (?)
	ALIGN	4

$SG72243 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG72056 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG72058 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72061 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG72065 DB	'_EVA_TOTAL', 00H
	ORG $+1
$SG72067 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72068 DB	'_EVA_TOTAL', 00H
	ORG $+1
$SG72072 DB	'_EVA_FORMS', 00H
	ORG $+1
$SG72074 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72077 DB	'_EVA_FILTERS', 00H
	ORG $+3
$SG72079 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72082 DB	'_EVA_SELCTRL', 00H
	ORG $+3
$SG72084 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72091 DB	'_EVA_TOT_LABEL', 00H
	ORG $+1
$SG72093 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72097 DB	'_EVA_FUNCTION', 00H
	ORG $+2
$SG72099 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72103 DB	'_EVA_PERCENT', 00H
	ORG $+3
$SG72105 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72106 DB	'_EVA_CLICMODE', 00H
	ORG $+2
$SG72108 DB	'_EVA_NONE', 00H
	ORG $+2
$SG72111 DB	'_EVA_PVTLIST_CTRL', 00H
	ORG $+2
$SG72112 DB	'_EVA_FORMAT', 00H
$SG72113 DB	'_EVA_DATEUNIT', 00H
	ORG $+2
$SG72114 DB	'_EVA_OVERRUN', 00H
	ORG $+3
$SG72115 DB	'_EVA_DATEREF', 00H
	ORG $+3
$SG72118 DB	'%s', 00H
	ORG $+1
$SG72120 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72121 DB	'pivottable_get_indic_definition', 00H
$SG72123 DB	'%s', 00H
	ORG $+1
$SG72124 DB	'_EVA_TRUNC', 00H
	ORG $+1
$SG72125 DB	'_EVA_SORTMODE', 00H
	ORG $+2
$SG72126 DB	'_EVA_SORTDESC', 00H
	ORG $+2
$SG72129 DB	'_EVA_EMPTYLABEL', 00H
$SG72131 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72132 DB	'_EVA_NOEMPTYVAL', 00H
$SG72133 DB	'_EVA_SHOWNOMATCH', 00H
	ORG $+3
$SG72134 DB	'_EVA_DECIMALS', 00H
	ORG $+2
$SG72135 DB	'_EVA_SLICES', 00H
$SG72137 DB	'/', 00H
	ORG $+2
$SG72139 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72143 DB	'_EVA_SUBST_SRC', 00H
	ORG $+1
$SG72145 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72149 DB	'_EVA_SUBST_DEST', 00H
$SG72151 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72155 DB	'_EVA_SUBST_POS', 00H
	ORG $+1
$SG72157 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72158 DB	'_EVA_GRAPH_TYPE', 00H
$SG72160 DB	'_EVA_GRAPH_PERSO', 00H
	ORG $+3
$SG72162 DB	'_EVA_GRAPH_PERSO->_EVA_FILE_SERVER_NAME', 00H
$SG72163 DB	'_EVA_PERIODS', 00H
	ORG $+3
$SG72164 DB	'_EVA_TIMEWAY', 00H
	ORG $+3
$SG72165 DB	'_EVA_DATE', 00H
	ORG $+2
$SG72166 DB	'_EVA_CALENDAR', 00H
	ORG $+2
$SG72169 DB	'_EVA_OPTIONS_LIST', 00H
	ORG $+2
$SG72171 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72174 DB	'_EVA_CONTROL', 00H
	ORG $+3
$SG72176 DB	'_EVA_CALC', 00H
	ORG $+2
$SG72179 DB	'_EVA_EXPRVAL', 00H
	ORG $+3
$SG72180 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72181 DB	'pivottable_get_indic_definition', 00H
$SG72184 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG72186 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG72188 DB	'DISTINCT', 00H
	ORG $+3
$SG72189 DB	'_EVA_STACKLABELS', 00H
	ORG $+3
$SG72192 DB	'_EVA_SINGLE', 00H
$SG72195 DB	'_EVA_STACK', 00H
	ORG $+1
$SG72198 DB	'_EVA_STACK_THRESHOLD', 00H
	ORG $+3
$SG72200 DB	'_EVA_HTML_GRAPH_POS', 00H
$SG72203 DB	'_EVA_GRAPH_COLOR', 00H
	ORG $+3
$SG72207 DB	'_EVA_GRAPH_MAX_SIZE', 00H
$SG72212 DB	'%lu', 00H
$SG72217 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72222 DB	'_EVA_FIELD,_EVA_SRCFIELD', 00H
	ORG $+3
$SG72229 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG72231 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72236 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72239 DB	'(non renseign', 0e9H, ')', 00H
$SG72241 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72245 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72246 DB	'pivottable_get_indic_definition', 00H
$SG72248 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72249 DB	'pivottable_get_indic_definition', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_pv$ = 16
_pvf$ = 20
_form$ = -4
_ctrl$ = -60
_cgival$ = -52
_data$ = -28
_c$ = -8
_txt$ = -32
_b_ctrl$ = -56
_idindic$72209 = -76
_cnt$72210 = -80
_pivottable_get_indic_definition PROC NEAR

; 1329 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 88					; 00000058H

; 1330 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1331 : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 1332 : 	DynTable cgival = {0};

	mov	DWORD PTR _cgival$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cgival$[ebp+4], edx
	mov	DWORD PTR _cgival$[ebp+8], edx
	mov	DWORD PTR _cgival$[ebp+12], edx
	mov	DWORD PTR _cgival$[ebp+16], edx

; 1333 : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 1334 : 	DynTableCell *c;
; 1335 : 	char *txt;
; 1336 : 	int b_ctrl;
; 1337 : 
; 1338 : 	/* Check if field is a control */
; 1339 : 	DYNTAB_FIELD(&data, &pvf->srcdata, FORMSTAMP);

	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72056
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72055
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72058
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1339		; 0000053bH
	jmp	$eva_err$72059
$L72055:

; 1340 : 	b_ctrl = data.nbrows == 1 && DYNTAB_TOUL(&data) == OBJ_FORM_CONTROL;

	cmp	DWORD PTR _data$[ebp], 1
	jne	SHORT $L73325
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	cmp	eax, 10					; 0000000aH
	jne	SHORT $L73325
	mov	DWORD PTR -84+[ebp], 1
	jmp	SHORT $L73326
$L73325:
	mov	DWORD PTR -84+[ebp], 0
$L73326:
	mov	ecx, DWORD PTR -84+[ebp]
	mov	DWORD PTR _b_ctrl$[ebp], ecx

; 1341 : 
; 1342 : 	/* Read indicator label */
; 1343 : 	pvf->label = DYNTAB_FIELD_VAL(&pvf->srcdata, LABEL);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72061
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx], eax

; 1344 : 
; 1345 : 	/* Read control / indicator data */
; 1346 : 	if(b_ctrl)

	cmp	DWORD PTR _b_ctrl$[ebp], 0
	je	$L72062

; 1348 : 		/* Set display format depending on control type */
; 1349 : 		if(pivottable_set_indic_fmt_from_ctrl(cntxt, pvf, &pvf->srcdata)) STACK_ERROR;

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_pivottable_set_indic_fmt_from_ctrl
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72063
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1349		; 00000545H
	jmp	$eva_err$72059
$L72063:

; 1350 : 		pvf->b_showemptyval = 1;

	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+512], 1

; 1351 : 
; 1352 : 		/* Read displayed data contents & totals */
; 1353 : 		DYNTAB_ADD_STR(&pvf->percent, 0, 0, "_EVA_TOTAL");

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG72065
	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 164				; 000000a4H
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72064
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72067
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1353		; 00000549H
	jmp	$eva_err$72059
$L72064:

; 1354 : 		pvf->graph_pos = "_EVA_TOTAL";

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+600], OFFSET FLAT:$SG72068

; 1356 : 	else

	jmp	$L72069
$L72062:

; 1358 : 		/* Read filter & field control */
; 1359 : 		DYNTAB_FIELD(&pvf->forms, &pvf->srcdata, FORMS);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72072
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72071
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72074
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1359		; 0000054fH
	jmp	$eva_err$72059
$L72071:

; 1360 : 		DYNTAB_FIELD(&pvf->filters, &pvf->srcdata, FILTERS);

	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 84					; 00000054H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72077
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 84					; 00000054H
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72076
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72079
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1360		; 00000550H
	jmp	$eva_err$72059
$L72076:

; 1361 : 		DYNTAB_FIELD(&pvf->selctrl, &pvf->srcdata, SELCTRL);

	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72082
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 188				; 000000bcH
	push	ecx
	push	0
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 104				; 00000068H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72081
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72084
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1361		; 00000551H
	jmp	$eva_err$72059
$L72081:

; 1362 : 		if(!dyntab_sz(&pvf->forms, 0, 0)) dyntab_free(&pvf->forms);

	push	0
	push	0
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72085
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_free
	add	esp, 4
$L72085:

; 1363 : 		if(!dyntab_sz(&pvf->filters, 0, 0)) dyntab_free(&pvf->filters);

	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 84					; 00000054H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72086
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 84					; 00000054H
	push	edx
	call	_dyntab_free
	add	esp, 4
$L72086:

; 1364 : 		if(!dyntab_sz(&pvf->selctrl, 0, 0)) dyntab_free(&pvf->selctrl);

	push	0
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72087
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	_dyntab_free
	add	esp, 4
$L72087:

; 1365 : 
; 1366 : 		/* Read displayed data contents & totals */
; 1367 : 		DYNTAB_FIELD_TAB(&pvf->totlabel, &pvf->srcdata, TOT_LABEL);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 144				; 00000090H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72091
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 144				; 00000090H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72090
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 144				; 00000090H
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L72089
$L72090:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72093
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1367		; 00000557H
	jmp	$eva_err$72059
$L72089:

; 1368 : 		DYNTAB_FIELD_TAB(&pvf->function, &pvf->srcdata, FUNCTION);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 124				; 0000007cH
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72097
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 124				; 0000007cH
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72096
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 124				; 0000007cH
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L72095
$L72096:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72099
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1368		; 00000558H
	jmp	$eva_err$72059
$L72095:

; 1369 : 		DYNTAB_FIELD_TAB(&pvf->percent, &pvf->srcdata, PERCENT);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 164				; 000000a4H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72103
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 164				; 000000a4H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72102
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 164				; 000000a4H
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L72101
$L72102:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72105
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1369		; 00000559H
	jmp	$eva_err$72059
$L72101:

; 1370 : 
; 1371 : 		/* Read display options */
; 1372 : 		pvf->clicmode = DYNTAB_FIELD_VAL(&pvf->srcdata, CLICMODE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72106
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+528], eax

; 1373 : 		if(!strcmp(pvf->clicmode, "_EVA_NONE")) pvf->clicmode = "";

	push	OFFSET FLAT:$SG72108
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+528]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72107
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+528], OFFSET FLAT:$SG72109
$L72107:

; 1374 : 		pvf->objlist = strtoul(DYNTAB_FIELD_VAL(&pvf->srcdata, PVTLIST_CTRL), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG72111
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+532], eax

; 1375 : 		pvf->dispfmt = DYNTAB_FIELD_VAL(&pvf->srcdata, FORMAT);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72112
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+304], eax

; 1376 : 		pvf->dispunit = DYNTAB_FIELD_VAL(&pvf->srcdata, DATEUNIT);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72113
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+332], eax

; 1377 : 		pvf->b_overrun = DYNTAB_FIELD_VAL(&pvf->srcdata, OVERRUN)[0] != 0;

	push	0
	push	-1
	push	OFFSET FLAT:$SG72114
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	movsx	eax, BYTE PTR [eax]
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+480], eax

; 1378 : 		c = DYNTAB_FIELD_CELL(&pvf->srcdata, DATEREF);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72115
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _c$[ebp], eax

; 1379 : 		if(c)

	cmp	DWORD PTR _c$[ebp], 0
	je	SHORT $L72119

; 1381 : 			if(!ctrl_eval_fieldexpr(cntxt, ctrl, &data, c->txt))

	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_eval_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L72117

; 1382 : 				snprintf(add_sz_str(pvf->dateref), "%s", dyntab_val(&data, 0, 0));

	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG72118
	push	15					; 0000000fH
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 340				; 00000154H
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 1383 : 			else

	jmp	SHORT $L72119
$L72117:

; 1384 : 				CLEAR_ERROR;

	push	1384					; 00000568H
	push	OFFSET FLAT:$SG72120
	push	OFFSET FLAT:$SG72121
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L72119:

; 1386 : 		if(!*pvf->dateref) snprintf(add_sz_str(pvf->dateref), "%s", cntxt->timestamp);

	mov	edx, DWORD PTR _pvf$[ebp]
	movsx	eax, BYTE PTR [edx+340]
	test	eax, eax
	jne	SHORT $L72122
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29704				; 00007408H
	push	ecx
	push	OFFSET FLAT:$SG72123
	push	15					; 0000000fH
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 340				; 00000154H
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
$L72122:

; 1387 : 		pvf->trunc = DYNTAB_FIELD_VAL(&pvf->srcdata, TRUNC);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72124
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+360], eax

; 1388 : 		pvf->sortmode = DYNTAB_FIELD_VAL(&pvf->srcdata, SORTMODE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72125
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+484], eax

; 1389 : 		pvf->b_sortdesc = atoi(DYNTAB_FIELD_VAL(&pvf->srcdata, SORTDESC)) != 0;

	push	0
	push	-1
	push	OFFSET FLAT:$SG72126
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atoi
	add	esp, 4
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+488], eax

; 1390 : 		DYNTAB_FIELD(&pvf->emptyval, &pvf->srcdata, EMPTYLABEL);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 492				; 000001ecH
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72129
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 492				; 000001ecH
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72128
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72131
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1390		; 0000056eH
	jmp	$eva_err$72059
$L72128:

; 1391 : 		pvf->b_showemptyval = DYNTAB_FIELD_VAL(&pvf->srcdata, NOEMPTYVAL)[0] == 0;

	push	0
	push	-1
	push	OFFSET FLAT:$SG72132
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 188				; 000000bcH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	movsx	edx, BYTE PTR [eax]
	neg	edx
	sbb	edx, edx
	inc	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+512], edx

; 1392 : 		pvf->b_shownomatch = DYNTAB_FIELD_VAL(&pvf->srcdata, SHOWNOMATCH)[0] != 0;

	push	0
	push	-1
	push	OFFSET FLAT:$SG72133
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 188				; 000000bcH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	movsx	edx, BYTE PTR [eax]
	neg	edx
	sbb	edx, edx
	neg	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+516], edx

; 1393 : 		pvf->decimals = atoi(DYNTAB_FIELD_VAL(&pvf->srcdata, DECIMALS));

	push	0
	push	-1
	push	OFFSET FLAT:$SG72134
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 188				; 000000bcH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atoi
	add	esp, 4
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [edx+364], eax

; 1394 : 		c = DYNTAB_FIELD_CELL(&pvf->srcdata, SLICES);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72135
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _c$[ebp], eax

; 1395 : 		if(c && dyntab_from_list(&pvf->slices, c->txt, c->len, "/", 0, 2)) RETURN_ERR_MEMORY;

	cmp	DWORD PTR _c$[ebp], 0
	je	SHORT $L72136
	push	2
	push	0
	push	OFFSET FLAT:$SG72137
	mov	ecx, DWORD PTR _c$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 368				; 00000170H
	push	edx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72136
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72139
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1395		; 00000573H
	jmp	$eva_err$72059
$L72136:

; 1396 : 		DYNTAB_FIELD_TAB(&pvf->sr_src, &pvf->srcdata, SUBST_SRC);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 388				; 00000184H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72143
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 388				; 00000184H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72142
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 388				; 00000184H
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L72141
$L72142:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72145
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1396		; 00000574H
	jmp	$eva_err$72059
$L72141:

; 1397 : 		DYNTAB_FIELD_TAB(&pvf->sr_dest, &pvf->srcdata, SUBST_DEST);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 408				; 00000198H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72149
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 408				; 00000198H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72148
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 408				; 00000198H
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L72147
$L72148:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72151
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1397		; 00000575H
	jmp	$eva_err$72059
$L72147:

; 1398 : 		DYNTAB_FIELD_TAB(&pvf->sr_pos, &pvf->srcdata, SUBST_POS);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 428				; 000001acH
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72155
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 428				; 000001acH
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L72154
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 428				; 000001acH
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L72153
$L72154:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72157
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1398		; 00000576H
	jmp	$eva_err$72059
$L72153:

; 1399 : 		pvf->graphtyp = DYNTAB_FIELD_VAL(&pvf->srcdata, GRAPH_TYPE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72158
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+308], eax

; 1400 : 		if(!strcmp(pvf->graphtyp, "_EVA_GRAPH_PERSO"))

	push	OFFSET FLAT:$SG72160
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+308]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72159

; 1402 : 			if(form_eval_fieldexpr(cntxt, &pvf->graphfile, 0, pvf->srcdata.cell->IdObj, add_sz_str("_EVA_GRAPH_PERSO->_EVA_FILE_SERVER_NAME"), &pvf->srcdata, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 188				; 000000bcH
	push	ecx
	push	39					; 00000027H
	push	OFFSET FLAT:$SG72162
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	push	0
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 312				; 00000138H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L72161
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1402		; 0000057aH
	jmp	$eva_err$72059
$L72161:

; 1403 : 			pvf->graphtyp = dyntab_val(&pvf->graphfile, 0, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 312				; 00000138H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+308], eax
$L72159:

; 1405 : 		pvf->maxlabels = atoi(DYNTAB_FIELD_VAL(&pvf->srcdata, PERIODS));

	push	0
	push	-1
	push	OFFSET FLAT:$SG72163
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atoi
	add	esp, 4
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+296], eax

; 1406 : 		pvf->timeway = DYNTAB_FIELD_VAL(&pvf->srcdata, TIMEWAY);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72164
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+336], eax

; 1407 : 		pvf->b_calendar = (pvf->maxlabels && !strcmp(pvf->dispfmt, "_EVA_DATE")) ?
; 1408 : 									DYNTAB_FIELD_CELL(&pvf->srcdata, CALENDAR) ? 2 : 1 : 0;

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+296], 0
	je	SHORT $L73327
	push	OFFSET FLAT:$SG72165
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR [eax+304]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73327
	push	0
	push	-1
	push	OFFSET FLAT:$SG72166
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	neg	eax
	sbb	eax, eax
	neg	eax
	add	eax, 1
	mov	DWORD PTR -88+[ebp], eax
	jmp	SHORT $L73328
$L73327:
	mov	DWORD PTR -88+[ebp], 0
$L73328:
	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR -88+[ebp]
	mov	DWORD PTR [eax+356], ecx

; 1409 : 
; 1410 : 		/* Handle list options */
; 1411 : 		DYNTAB_FIELD(&pvf->optsrc, &pvf->srcdata, OPTIONS_LIST);

	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 448				; 000001c0H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72169
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 448				; 000001c0H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72168
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72171
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1411		; 00000583H
	jmp	$eva_err$72059
$L72168:

; 1412 : 		if(pvf->optsrc.nbrows)

	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+448], 0
	je	$L72172

; 1414 : 			/* If list options present - check control type */
; 1415 : 			if(qry_listobj_field(cntxt, &data, &pvf->optsrc, "_EVA_CONTROL")) STACK_ERROR;

	push	OFFSET FLAT:$SG72174
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 448				; 000001c0H
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_listobj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72173
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1415		; 00000587H
	jmp	$eva_err$72059
$L72173:

; 1416 : 			if(!dyntab_txt_cmp(add_sz_str("_EVA_CALC"), &data, 0, 0))

	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	9
	push	OFFSET FLAT:$SG72176
	call	_dyntab_txt_cmp
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L72175

; 1418 : 				/* Calc-ed value : add result to labels */
; 1419 : 				if(form_eval_valtype(cntxt, &pvf->labels, "_EVA_EXPRVAL", &pvf->optsrc, NULL)) CLEAR_ERROR;

	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 448				; 000001c0H
	push	ecx
	push	OFFSET FLAT:$SG72179
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72178
	push	1419					; 0000058bH
	push	OFFSET FLAT:$SG72180
	push	OFFSET FLAT:$SG72181
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L72178:

; 1421 : 			else

	jmp	$L72187
$L72175:

; 1423 : 				/* Other : get control tree */
; 1424 : 				if(qry_listobj_field(cntxt, &data, &pvf->optsrc, "_EVA_CTRLTREE")) STACK_ERROR;

	push	OFFSET FLAT:$SG72184
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 448				; 000001c0H
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_listobj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72183
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1424		; 00000590H
	jmp	$eva_err$72059
$L72183:

; 1425 : 
; 1426 : 				/* Add list options to labels if show no match */
; 1427 : 				if(pvf->b_shownomatch && qry_listobj_field(cntxt, &pvf->labels, &data, "_EVA_LABEL")) STACK_ERROR;

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+516], 0
	je	SHORT $L72185
	push	OFFSET FLAT:$SG72186
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_listobj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72185
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1427		; 00000593H
	jmp	$eva_err$72059
$L72185:

; 1428 : 
; 1429 : 				/* Add list options to search & replace table */
; 1430 : 				if(pivottable_add_sr_options(cntxt, pvf, &data)) STACK_ERROR;

	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_pivottable_add_sr_options
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72187
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1430		; 00000596H
	jmp	$eva_err$72059
$L72187:

; 1432 : 			dyntab_group(&pvf->labels, "DISTINCT");

	push	OFFSET FLAT:$SG72188
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_group
	add	esp, 8
$L72172:

; 1434 : 
; 1435 : 		/* Read labels stacking option for columns */
; 1436 : 		txt = DYNTAB_FIELD_VAL(&pvf->srcdata, STACKLABELS);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72189
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 188				; 000000bcH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _txt$[ebp], eax

; 1437 : 		if(!strcmp(txt, "_EVA_SINGLE") || pv->exportparams)

	push	OFFSET FLAT:$SG72192
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L72191
	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax+94136], 0
	je	SHORT $L72190
$L72191:

; 1438 : 			pvf->b_stackcols = 0;

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+524], 0

; 1439 : 		else if(!strcmp(txt, "_EVA_STACK"))

	jmp	SHORT $L72199
$L72190:
	push	OFFSET FLAT:$SG72195
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72194

; 1440 : 			pvf->b_stackcols = 1;

	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+524], 1

; 1441 : 		else

	jmp	SHORT $L72199
$L72194:

; 1443 : 			pvf->stackcols_limit = strtoul(DYNTAB_FIELD_VAL(&pvf->srcdata, STACK_THRESHOLD), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG72198
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 188				; 000000bcH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [edx+520], eax

; 1444 : 			if(!pvf->stackcols_limit) pvf->stackcols_limit = 10;

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+520], 0
	jne	SHORT $L72199
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+520], 10			; 0000000aH
$L72199:

; 1446 : 
; 1447 : 		/* Read graph options */
; 1448 : 		pvf->graph_pos = DYNTAB_FIELD_VAL(&pvf->srcdata, HTML_GRAPH_POS);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72200
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 188				; 000000bcH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+600], eax

; 1449 : 		if(!*pvf->graph_pos) pvf->graph_pos = NULL;

	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+600]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L72201
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [edx+600], 0
$L72201:

; 1450 : 		pvf->graph_color = DYNTAB_FIELD_VAL(&pvf->srcdata, GRAPH_COLOR);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72203
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+604], eax

; 1451 : 		if(!*pvf->graph_color) pvf->graph_color = NULL;

	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+604]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L72204
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [edx+604], 0
$L72204:

; 1452 : 		pvf->graph_size = strtoul(DYNTAB_FIELD_VAL(&pvf->srcdata, GRAPH_MAX_SIZE), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG72207
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx+608], eax
$L72069:

; 1454 : 	/* Read calendar inputs if applicable */
; 1455 : 	if(pvf->b_calendar == 2)

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+356], 2
	jne	$L72208

; 1457 : 		char idindic[16] = {0};

	mov	BYTE PTR _idindic$72209[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _idindic$72209[ebp+1], eax
	mov	DWORD PTR _idindic$72209[ebp+5], eax
	mov	DWORD PTR _idindic$72209[ebp+9], eax
	mov	WORD PTR _idindic$72209[ebp+13], ax
	mov	BYTE PTR _idindic$72209[ebp+15], al

; 1458 : 		size_t cnt = ctrl->cginame->cnt;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _cnt$72210[ebp], eax

; 1459 : 		if(pvf && pvf->srcdata.cell) snprintf(add_sz_str(idindic), "%lu", pvf->srcdata.cell->IdObj);

	cmp	DWORD PTR _pvf$[ebp], 0
	je	SHORT $L72211
	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+204], 0
	je	SHORT $L72211
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	push	OFFSET FLAT:$SG72212
	push	15					; 0000000fH
	lea	edx, DWORD PTR _idindic$72209[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
$L72211:

; 1460 : 		if(*idindic) DYNBUF_ADD(&ctrl->cginame, idindic, 0, NO_CONV);

	movsx	eax, BYTE PTR _idindic$72209[ebp]
	test	eax, eax
	je	SHORT $L72215
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _idindic$72209[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72215
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72217
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1460		; 000005b4H
	jmp	$eva_err$72059
$L72215:

; 1461 : 		ctrl->FIELD = idindic;

	mov	edx, DWORD PTR _ctrl$[ebp]
	lea	eax, DWORD PTR _idindic$72209[ebp]
	mov	DWORD PTR [edx+280], eax

; 1462 : 		if(ctrl_get_calendar_input(cntxt, i_ctrl, CtlDateAll, pvf->startdate, &pvf->dispunit, &pvf->maxlabels))

	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 296				; 00000128H
	push	ecx
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 332				; 0000014cH
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 544				; 00000220H
	push	eax
	push	255					; 000000ffH
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_get_calendar_input
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72218

; 1463 : 			STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1463		; 000005b7H
	jmp	$eva_err$72059
$L72218:

; 1464 : 		ctrl->FIELD = "";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+280], OFFSET FLAT:$SG72219

; 1465 : 		ctrl->cginame->cnt = cnt;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	mov	ecx, DWORD PTR _cnt$72210[ebp]
	mov	DWORD PTR [eax+4], ecx

; 1466 : 		ctrl->cginame->data[cnt] = 0;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	mov	ecx, DWORD PTR _cnt$72210[ebp]
	mov	BYTE PTR [eax+ecx+8], 0
$L72208:

; 1468 : 
; 1469 : 	/* Read indicator value expression */
; 1470 : 	if(pvf->selctrl.nbrows)

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+104], 0
	je	$L72220

; 1472 : 		if(qry_listobj_field(cntxt, &pvf->expr, &pvf->selctrl, "_EVA_FIELD,_EVA_SRCFIELD")) STACK_ERROR;

	push	OFFSET FLAT:$SG72222
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 4
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_listobj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72221
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1472		; 000005c0H
	jmp	$eva_err$72059
$L72221:

; 1473 : 		if(qry_listobj_field(cntxt, &data, &pvf->selctrl, NULL)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_listobj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72224
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1473		; 000005c1H
	jmp	$eva_err$72059
$L72224:

; 1474 : 
; 1475 : 		/* Set default format from control */
; 1476 : 		if(pivottable_set_indic_fmt_from_ctrl(cntxt, pvf, &data)) STACK_ERROR;

	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_pivottable_set_indic_fmt_from_ctrl
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72225
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1476		; 000005c4H
	jmp	$eva_err$72059
$L72225:

; 1478 : 	else

	jmp	SHORT $L72228
$L72220:

; 1479 : 		DYNTAB_FIELD(&pvf->expr, &pvf->srcdata, FIELD);

	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 4
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72229
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 188				; 000000bcH
	push	ecx
	push	0
	mov	edx, DWORD PTR _pvf$[ebp]
	add	edx, 4
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72228
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72231
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1479		; 000005c7H
	jmp	$eva_err$72059
$L72228:

; 1480 : 	if(!pvf->expr.nbrows) DYNTAB_ADD_STR(&pvf->expr, 0, 0, "");

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L72233
	push	0
	push	OFFSET FLAT:$SG72234
	push	0
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 4
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72233
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72236
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1480		; 000005c8H
	jmp	$eva_err$72059
$L72233:

; 1481 : 	if(!pvf->emptyval.nbrows) DYNTAB_ADD_STR(&pvf->emptyval, 0, 0, "(non renseigné)");

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+492], 0
	jne	SHORT $L72238
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG72239
	push	0
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 492				; 000001ecH
	push	ecx
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72238
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72241
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1481		; 000005c9H
	jmp	SHORT $eva_err$72059
$L72238:

; 1482 : 
; 1483 : 	/* Store base format */
; 1484 : 	pvf->basefmt = pvf->dispfmt;

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	eax, DWORD PTR [edx+304]
	mov	DWORD PTR [ecx+300], eax

; 1485 : 	if(!pvf->basefmt) pvf->basefmt = "";

	mov	ecx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [ecx+300], 0
	jne	SHORT $eva_noerr$72244
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [edx+300], OFFSET FLAT:$SG72243
$eva_noerr$72244:

; 1486 : 
; 1487 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72245
	push	OFFSET FLAT:$SG72246
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72059:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L72247
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG72248
	push	OFFSET FLAT:$SG72249
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72247:
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 1488 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_pivottable_get_indic_definition ENDP
_TEXT	ENDS
PUBLIC	_pivottable_get_field_definition
_DATA	SEGMENT
$SG72271 DB	'_EVA_SEL%s', 00H
	ORG $+1
$SG72273 DB	'_EVA_SIMPLE', 00H
$SG72274 DB	'_EVA_%sEXPR', 00H
$SG72278 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72280 DB	'_EVA_%sLABEL', 00H
	ORG $+3
$SG72282 DB	'DATA', 00H
	ORG $+3
$SG72283 DB	'_EVA_DECIMALS', 00H
	ORG $+2
$SG72285 DB	'_EVA_%sTRUNC', 00H
	ORG $+3
$SG72289 DB	'_EVA_FUNCTION', 00H
	ORG $+2
$SG72291 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72292 DB	'%s0', 00H
$SG72295 DB	'_EVA_CURRENTOBJ', 00H
$SG72296 DB	'_EVA_SEL%s_FIELD', 00H
	ORG $+3
$SG72300 DB	'%s0', 00H
$SG72304 DB	'_EVA_SEL%s_OBJ', 00H
	ORG $+1
$SG72308 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72315 DB	'%s%lu', 00H
	ORG $+2
$SG72321 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72322 DB	'pivottable_get_field_definition', 00H
$SG72324 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72325 DB	'pivottable_get_field_definition', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_pv$ = 16
_pos$ = 20
_field$ = -68
_srctype$ = -108
_idlist$ = -104
_pvftbl$ = -84
_pvfnb$ = -72
_dest$ = -4
_pvf$ = -80
_maxnb$ = -76
_i$72303 = -112
_pvf1$72314 = -116
_pivottable_get_field_definition PROC NEAR

; 1504 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 144				; 00000090H

; 1505 : 	char field[64];
; 1506 : 	char *srctype;
; 1507 : 	DynTable idlist = {0};

	mov	DWORD PTR _idlist$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _idlist$[ebp+4], eax
	mov	DWORD PTR _idlist$[ebp+8], eax
	mov	DWORD PTR _idlist$[ebp+12], eax
	mov	DWORD PTR _idlist$[ebp+16], eax

; 1508 : 	PivotTableField *pvftbl = *pos == 'R' ? pv->rows : *pos == 'C' ? pv->cols : pv->datas;

	mov	ecx, DWORD PTR _pos$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 82					; 00000052H
	jne	SHORT $L73332
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 60216				; 0000eb38H
	mov	DWORD PTR -120+[ebp], eax
	jmp	SHORT $L73333
$L73332:
	mov	ecx, DWORD PTR _pos$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 67					; 00000043H
	jne	SHORT $L73330
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 78704				; 00013370H
	mov	DWORD PTR -124+[ebp], eax
	jmp	SHORT $L73331
$L73330:
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 81792				; 00013f80H
	mov	DWORD PTR -124+[ebp], ecx
$L73331:
	mov	edx, DWORD PTR -124+[ebp]
	mov	DWORD PTR -120+[ebp], edx
$L73333:
	mov	eax, DWORD PTR -120+[ebp]
	mov	DWORD PTR _pvftbl$[ebp], eax

; 1509 : 	unsigned long *pvfnb = *pos == 'R' ? &pv->nbrow : *pos == 'C' ? &pv->nbcol : &pv->nbdata;

	mov	ecx, DWORD PTR _pos$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 82					; 00000052H
	jne	SHORT $L73336
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 78696				; 00013368H
	mov	DWORD PTR -128+[ebp], eax
	jmp	SHORT $L73337
$L73336:
	mov	ecx, DWORD PTR _pos$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 67					; 00000043H
	jne	SHORT $L73334
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 81784				; 00013f78H
	mov	DWORD PTR -132+[ebp], eax
	jmp	SHORT $L73335
$L73334:
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 94112				; 00016fa0H
	mov	DWORD PTR -132+[ebp], ecx
$L73335:
	mov	edx, DWORD PTR -132+[ebp]
	mov	DWORD PTR -128+[ebp], edx
$L73337:
	mov	eax, DWORD PTR -128+[ebp]
	mov	DWORD PTR _pvfnb$[ebp], eax

; 1510 : 	PivotTableField **dest = *pos == 'R' ? &pv->row : *pos == 'C' ? &pv->col : &pv->data;

	mov	ecx, DWORD PTR _pos$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 82					; 00000052H
	jne	SHORT $L73340
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 200				; 000000c8H
	mov	DWORD PTR -136+[ebp], eax
	jmp	SHORT $L73341
$L73340:
	mov	ecx, DWORD PTR _pos$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 67					; 00000043H
	jne	SHORT $L73338
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 204				; 000000ccH
	mov	DWORD PTR -140+[ebp], eax
	jmp	SHORT $L73339
$L73338:
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 208				; 000000d0H
	mov	DWORD PTR -140+[ebp], ecx
$L73339:
	mov	edx, DWORD PTR -140+[ebp]
	mov	DWORD PTR -136+[ebp], edx
$L73341:
	mov	eax, DWORD PTR -136+[ebp]
	mov	DWORD PTR _dest$[ebp], eax

; 1511 : 	PivotTableField *pvf = pvftbl + *pvfnb;

	mov	ecx, DWORD PTR _pvfnb$[ebp]
	mov	edx, DWORD PTR [ecx]
	imul	edx, 616				; 00000268H
	mov	eax, DWORD PTR _pvftbl$[ebp]
	add	eax, edx
	mov	DWORD PTR _pvf$[ebp], eax

; 1512 : 	unsigned long maxnb =  *pos == 'R' ? MAX_PVT_ROWFIELDS : *pos == 'C' ? MAX_PVT_COLFIELDS : MAX_PVT_DATAFIELDS;

	mov	ecx, DWORD PTR _pos$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 82					; 00000052H
	jne	SHORT $L73342
	mov	DWORD PTR -144+[ebp], 30		; 0000001eH
	jmp	SHORT $L73343
$L73342:
	mov	eax, DWORD PTR _pos$[ebp]
	movsx	ecx, BYTE PTR [eax]
	sub	ecx, 67					; 00000043H
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 15					; 0000000fH
	add	ecx, 5
	mov	DWORD PTR -144+[ebp], ecx
$L73343:
	mov	edx, DWORD PTR -144+[ebp]
	mov	DWORD PTR _maxnb$[ebp], edx

; 1513 : 
; 1514 : 	/* Read source type & basic field expression*/
; 1515 : 	sprintf(field, "_EVA_SEL%s", pos);

	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	push	OFFSET FLAT:$SG72271
	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 1516 : 	srctype = dyntab_field_val(pv->srcdata, field, ~0UL, 0);

	push	0
	push	-1
	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _srctype$[ebp], eax

; 1517 : 	if(!strcmp(srctype, "_EVA_SIMPLE"))

	push	OFFSET FLAT:$SG72273
	mov	edx, DWORD PTR _srctype$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72272

; 1519 : 		/* Simple source type : read prefixed label & expression */
; 1520 : 		pvf->pos = pos;

	mov	eax, DWORD PTR _pvf$[ebp]
	mov	ecx, DWORD PTR _pos$[ebp]
	mov	DWORD PTR [eax+184], ecx

; 1521 : 		sprintf(field, "_EVA_%sEXPR", pos);

	mov	edx, DWORD PTR _pos$[ebp]
	push	edx
	push	OFFSET FLAT:$SG72274
	lea	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH

; 1522 : 		if(dyntab_filter_field(&pvf->expr, 0, pv->srcdata, field, ~0UL, NULL)) RETURN_ERR_MEMORY;

	push	0
	push	-1
	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+44]
	push	eax
	push	0
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 4
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72276
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72278
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1522		; 000005f2H
	jmp	$eva_err$72279
$L72276:

; 1523 : 		sprintf(field, "_EVA_%sLABEL", pos);

	mov	ecx, DWORD PTR _pos$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG72280
	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 1524 : 		pvf->label = dyntab_field_val(pv->srcdata, field, ~0UL, 0);

	push	0
	push	-1
	lea	eax, DWORD PTR _field$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [ecx], eax

; 1525 : 		if(!strcmp(pos, "DATA"))

	push	OFFSET FLAT:$SG72282
	mov	edx, DWORD PTR _pos$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72281

; 1526 : 			pvf->decimals = atoi(DYNTAB_FIELD_VAL(pv->srcdata, DECIMALS));

	push	0
	push	-1
	push	OFFSET FLAT:$SG72283
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atoi
	add	esp, 4
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [edx+364], eax

; 1527 : 		else

	jmp	SHORT $L72284
$L72281:

; 1529 : 			sprintf(field, "_EVA_%sTRUNC", pos);

	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	push	OFFSET FLAT:$SG72285
	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 1530 : 			pvf->trunc = dyntab_field_val(pv->srcdata, field, ~0UL, 0);

	push	0
	push	-1
	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	edx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [edx+360], eax
$L72284:

; 1532 : 		pvf->stackcols_limit = 10;

	mov	eax, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax+520], 10			; 0000000aH

; 1533 : 		if(*pos == 'D') DYNTAB_FIELD(&pvf->function, pv->srcdata, FUNCTION);

	mov	ecx, DWORD PTR _pos$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 68					; 00000044H
	jne	SHORT $L72288
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 124				; 0000007cH
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72289
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	push	edx
	push	0
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 124				; 0000007cH
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72288
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72291
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1533		; 000005fdH
	jmp	$eva_err$72279
$L72288:

; 1534 : 		snprintf(add_sz_str(pvf->datatable), "%s0", pos);

	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	push	OFFSET FLAT:$SG72292
	push	31					; 0000001fH
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 208				; 000000d0H
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 1536 : 	else if(!strcmp(srctype, "_EVA_CURRENTOBJ"))

	jmp	$L72302
$L72272:
	push	OFFSET FLAT:$SG72295
	mov	edx, DWORD PTR _srctype$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72294

; 1538 : 		/* Current object : read corresponding object data - return if empty */
; 1539 : 		sprintf(field, "_EVA_SEL%s_FIELD", pos);

	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	push	OFFSET FLAT:$SG72296
	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 1540 : 		if(get_current_obj_field_data(cntxt, dyntab_field_val(pv->srcdata, field, ~0UL, 0),
; 1541 : 											&pvf->srcdata, &idlist)) STACK_ERROR;

	lea	edx, DWORD PTR _idlist$[ebp]
	push	edx
	mov	eax, DWORD PTR _pvf$[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	push	0
	push	-1
	lea	ecx, DWORD PTR _field$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+44]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_get_current_obj_field_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72297
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1541		; 00000605H
	jmp	$eva_err$72279
$L72297:

; 1542 : 		if(!pvf->srcdata.nbrows) RETURN_OK;

	mov	eax, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [eax+188], 0
	jne	SHORT $L72298
	jmp	$eva_noerr$72299
$L72298:

; 1543 : 		pvf->pos = pos;

	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	edx, DWORD PTR _pos$[ebp]
	mov	DWORD PTR [ecx+184], edx

; 1544 : 		snprintf(add_sz_str(pvf->datatable), "%s0", pos);

	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	push	OFFSET FLAT:$SG72300
	push	31					; 0000001fH
	mov	ecx, DWORD PTR _pvf$[ebp]
	add	ecx, 208				; 000000d0H
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 1545 : 		if(pivottable_get_indic_definition(cntxt, i_ctrl, pv, pvf)) STACK_ERROR;

	mov	edx, DWORD PTR _pvf$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pivottable_get_indic_definition
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72301
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1545		; 00000609H
	jmp	$eva_err$72279
$L72301:

; 1547 : 	else

	jmp	$L72302
$L72294:

; 1549 : 		/* Existing indicator : read corresponding object data - return if empty */
; 1550 : 		unsigned long i;
; 1551 : 		sprintf(field, "_EVA_SEL%s_OBJ", pos);

	mov	ecx, DWORD PTR _pos$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG72304
	lea	edx, DWORD PTR _field$[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 1552 : 		if(dyntab_filter_field(&idlist, 0, pv->srcdata, field, ~0UL, NULL)) RETURN_ERR_MEMORY;

	push	0
	push	-1
	lea	eax, DWORD PTR _field$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	push	edx
	push	0
	lea	eax, DWORD PTR _idlist$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72306
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72308
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1552		; 00000610H
	jmp	$eva_err$72279
$L72306:

; 1553 : 		if(!dyntab_sz(&idlist, 0, 0)) dyntab_free(&idlist);

	push	0
	push	0
	lea	eax, DWORD PTR _idlist$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72309
	lea	ecx, DWORD PTR _idlist$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
$L72309:

; 1554 : 		if(!pvf->srcdata.nbrows && !idlist.nbrows) RETURN_OK;

	mov	edx, DWORD PTR _pvf$[ebp]
	cmp	DWORD PTR [edx+188], 0
	jne	SHORT $L72310
	cmp	DWORD PTR _idlist$[ebp], 0
	jne	SHORT $L72310
	jmp	$eva_noerr$72299
$L72310:

; 1555 : 
; 1556 : 		/* Read field data for indicators */
; 1557 : 		for(i = 0; i < idlist.nbrows && i < maxnb; i++)

	mov	DWORD PTR _i$72303[ebp], 0
	jmp	SHORT $L72311
$L72312:
	mov	eax, DWORD PTR _i$72303[ebp]
	add	eax, 1
	mov	DWORD PTR _i$72303[ebp], eax
$L72311:
	mov	ecx, DWORD PTR _i$72303[ebp]
	cmp	ecx, DWORD PTR _idlist$[ebp]
	jae	$L72313
	mov	edx, DWORD PTR _i$72303[ebp]
	cmp	edx, DWORD PTR _maxnb$[ebp]
	jae	$L72313

; 1559 : 			/* Initialize pivot field data */
; 1560 : 			PivotTableField *pvf1 = pvftbl + *pvfnb + i;

	mov	eax, DWORD PTR _pvfnb$[ebp]
	mov	ecx, DWORD PTR [eax]
	imul	ecx, 616				; 00000268H
	mov	edx, DWORD PTR _pvftbl$[ebp]
	add	edx, ecx
	mov	eax, DWORD PTR _i$72303[ebp]
	imul	eax, 616				; 00000268H
	add	edx, eax
	mov	DWORD PTR _pvf1$72314[ebp], edx

; 1561 : 			pvf1->pos = pos;

	mov	ecx, DWORD PTR _pvf1$72314[ebp]
	mov	edx, DWORD PTR _pos$[ebp]
	mov	DWORD PTR [ecx+184], edx

; 1562 : 			snprintf(add_sz_str(pvf1->datatable), "%s%lu", pos, i);

	mov	eax, DWORD PTR _i$72303[ebp]
	push	eax
	mov	ecx, DWORD PTR _pos$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG72315
	push	31					; 0000001fH
	mov	edx, DWORD PTR _pvf1$72314[ebp]
	add	edx, 208				; 000000d0H
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H

; 1563 : 			if(( !pvf1->srcdata.nbrows &&
; 1564 : 				qry_obj_field(cntxt, &pvf1->srcdata, DYNTAB_TOULRC(&idlist, i, 0), NULL) ) ||
; 1565 : 				pivottable_get_indic_definition(cntxt, i_ctrl, pv, pvf1)) STACK_ERROR;

	mov	eax, DWORD PTR _pvf1$72314[ebp]
	cmp	DWORD PTR [eax+188], 0
	jne	SHORT $L72320
	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$72303[ebp]
	push	ecx
	lea	edx, DWORD PTR _idlist$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _pvf1$72314[ebp]
	add	eax, 188				; 000000bcH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L72319
$L72320:
	mov	edx, DWORD PTR _pvf1$72314[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pivottable_get_indic_definition
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72318
$L72319:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1565		; 0000061dH
	jmp	SHORT $eva_err$72279
$L72318:

; 1566 : 		}

	jmp	$L72312
$L72313:

; 1567 : 		*pvfnb += i - 1;

	mov	ecx, DWORD PTR _pvfnb$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _i$72303[ebp]
	lea	ecx, DWORD PTR [edx+eax-1]
	mov	edx, DWORD PTR _pvfnb$[ebp]
	mov	DWORD PTR [edx], ecx
$L72302:

; 1569 : 
; 1570 : 	/* Set initial field for computation */
; 1571 : 	*dest = pvf;

	mov	eax, DWORD PTR _dest$[ebp]
	mov	ecx, DWORD PTR _pvf$[ebp]
	mov	DWORD PTR [eax], ecx

; 1572 : 	(*pvfnb)++;

	mov	edx, DWORD PTR _pvfnb$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, 1
	mov	ecx, DWORD PTR _pvfnb$[ebp]
	mov	DWORD PTR [ecx], eax
$eva_noerr$72299:

; 1573 : 
; 1574 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72321
	push	OFFSET FLAT:$SG72322
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72279:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L72323
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG72324
	push	OFFSET FLAT:$SG72325
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72323:
	lea	ecx, DWORD PTR _idlist$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1575 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_pivottable_get_field_definition ENDP
_TEXT	ENDS
PUBLIC	_pvt_eval_relfield
_DATA	SEGMENT
$SG72345 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72348 DB	',', 00H
	ORG $+2
$SG72349 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72350 DB	'pvt_eval_relfield', 00H
	ORG $+2
$SG72352 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72353 DB	'pvt_eval_relfield', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_tab$ = 12
_expr$ = -8
_c$ = -4
__c$72341 = -12
_pvt_eval_relfield PROC NEAR

; 1588 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 1589 : 	DynBuffer *expr = NULL;

	mov	DWORD PTR _expr$[ebp], 0

; 1590 : 	DynTableCell *c = dyntab_cell(tab, 0, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$[ebp], eax

; 1591 : 	if(!c || !c->txt || !c->len) RETURN_OK;

	cmp	DWORD PTR _c$[ebp], 0
	je	SHORT $L72339
	mov	ecx, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L72339
	mov	edx, DWORD PTR _c$[ebp]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L72338
$L72339:
	jmp	SHORT $eva_noerr$72340
$L72338:

; 1592 : 	DYNBUF_ADD_CELLP(&expr, c, NO_CONV);

	mov	eax, DWORD PTR _c$[ebp]
	mov	DWORD PTR __c$72341[ebp], eax
	cmp	DWORD PTR __c$72341[ebp], 0
	je	SHORT $L72343
	push	0
	push	0
	mov	ecx, DWORD PTR __c$72341[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR __c$72341[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72343
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72345
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1592		; 00000638H
	jmp	SHORT $eva_err$72346
$L72343:

; 1593 : 	if(dyntab_from_list(tab, expr->data, expr->cnt, ",", 0, 2)) STACK_ERROR;

	push	2
	push	0
	push	OFFSET FLAT:$SG72348
	mov	edx, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _expr$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $eva_noerr$72340
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1593		; 00000639H
	jmp	SHORT $eva_err$72346
$eva_noerr$72340:

; 1594 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72349
	push	OFFSET FLAT:$SG72350
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72346:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L72351
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG72352
	push	OFFSET FLAT:$SG72353
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72351:
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 1595 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_pvt_eval_relfield ENDP
_TEXT	ENDS
PUBLIC	_pvt_load_definition
EXTRN	_qry_cache_idobj_field:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG72473 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG72369 DB	'_EVA_SELFILTER', 00H
	ORG $+1
$SG72372 DB	'_EVA_BASE_OBJ', 00H
	ORG $+2
$SG72380 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG72383 DB	'_EVA_LABEL_CALC', 00H
$SG72385 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72389 DB	'_EVA_LABEL_CALC', 00H
$SG72391 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72393 DB	'_EVA_EXTRA_NOTES', 00H
	ORG $+3
$SG72394 DB	'_EVA_NOTES', 00H
	ORG $+1
$SG72395 DB	'_EVA_DETAIL', 00H
$SG72396 DB	'_EVA_MINIMAL', 00H
	ORG $+3
$SG72397 DB	'_EVA_NONE', 00H
	ORG $+2
$SG72399 DB	'_EVA_SELFILTER_OBJ', 00H
	ORG $+1
$SG72402 DB	'_EVA_FILTERS', 00H
	ORG $+3
$SG72404 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72407 DB	'_EVA_CURRENTOBJ', 00H
$SG72410 DB	'_EVA_SELFILTER_FIELD', 00H
	ORG $+3
$SG72412 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72415 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72416 DB	'pvt_load_definition', 00H
$SG72419 DB	'%lu', 00H
$SG72423 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72427 DB	'_EVA_FORMS', 00H
	ORG $+1
$SG72429 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72432 DB	'_EVA_FILTERS', 00H
	ORG $+3
$SG72434 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72435 DB	'_EVA_CONDEXPR', 00H
	ORG $+2
$SG72440 DB	'DATA', 00H
	ORG $+3
$SG72441 DB	'ROW', 00H
$SG72442 DB	'COL', 00H
$SG72443 DB	'_EVA_ROWDATA_RELMODE', 00H
	ORG $+3
$SG72446 DB	'_EVA_ROWDATA_RELFIELD', 00H
	ORG $+2
$SG72448 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72450 DB	'_EVA_COLDATA_RELMODE', 00H
	ORG $+3
$SG72453 DB	'_EVA_COLDATA_RELFIELD', 00H
	ORG $+2
$SG72455 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72457 DB	'_EVA_ROWCOL_RELMODE', 00H
$SG72460 DB	'_EVA_ROWCOL_RELFIELD', 00H
	ORG $+3
$SG72462 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72464 DB	'_EVA_CLICMODE', 00H
	ORG $+2
$SG72466 DB	'_EVA_PVTLIST_CTRL', 00H
	ORG $+2
$SG72472 DB	'_EVA_NONE', 00H
	ORG $+2
$SG72475 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72476 DB	'pvt_load_definition', 00H
$SG72478 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72479 DB	'pvt_load_definition', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_pv$ = 16
_pvtdata$ = 20
_data$ = -20
_srctype$ = -28
_srcobj$ = -24
_notes$72392 = -32
__tmp$72417 = -64
_pvf$72468 = -68
_pvt_load_definition PROC NEAR

; 1610 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 92					; 0000005cH
	push	edi

; 1611 : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 1612 : 	char *srctype = DYNTAB_FIELD_VAL(pvtdata, SELFILTER);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72369
	mov	ecx, DWORD PTR _pvtdata$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _srctype$[ebp], eax

; 1613 : 	unsigned long srcobj = strtoul(DYNTAB_FIELD_VAL(pvtdata, BASE_OBJ), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG72372
	mov	edx, DWORD PTR _pvtdata$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _srcobj$[ebp], eax

; 1614 : 
; 1615 : 	/* Use template object data if applicable */
; 1616 : 	if(srcobj)

	cmp	DWORD PTR _srcobj$[ebp], 0
	je	SHORT $L72379

; 1618 : 		if(qry_cache_idobj(&data, srcobj)) STACK_ERROR;

	push	3
	push	0
	mov	eax, DWORD PTR _srcobj$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72375
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1618		; 00000652H
	jmp	$eva_err$72376
$L72375:

; 1619 : 		if(qry_complete_data(cntxt, pvtdata, &data, NULL, NULL)) STACK_ERROR;

	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pvtdata$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_complete_data
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72379
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1619		; 00000653H
	jmp	$eva_err$72376
$L72379:

; 1621 : 
; 1622 : 	/* Initialize pivot table structure */
; 1623 : 	pv->srcdata = pvtdata;

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _pvtdata$[ebp]
	mov	DWORD PTR [edx+44], eax

; 1624 : 	pv->label = DYNTAB_FIELD_VAL(pvtdata, LABEL);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72380
	mov	ecx, DWORD PTR _pvtdata$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	edx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [edx], eax

; 1625 : 
; 1626 : 	/* Read notes contents */
; 1627 : 	DYNTAB_FIELD(&pv->dynnotes, pvtdata, LABEL_CALC);

	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 136				; 00000088H
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72383
	mov	ecx, DWORD PTR _pvtdata$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 136				; 00000088H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72382
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72385
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1627		; 0000065bH
	jmp	$eva_err$72376
$L72382:

; 1628 : 	if(!pv->dynnotes.nbrows) DYNTAB_FIELD(&pv->dynnotes, &cntxt->form->objdata, LABEL_CALC);

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+136], 0
	jne	SHORT $L72388
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 136				; 00000088H
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72389
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	add	edx, 52					; 00000034H
	push	edx
	push	0
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 136				; 00000088H
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72388
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72391
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1628		; 0000065cH
	jmp	$eva_err$72376
$L72388:

; 1630 : 		char *notes = DYNTAB_FIELD_VAL(pvtdata, EXTRA_NOTES);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72393
	mov	eax, DWORD PTR _pvtdata$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _notes$72392[ebp], eax

; 1631 : 		pv->tblnotes = (pv->dynnotes.nbrows ? TblNote_dynamic : 0) |
; 1632 : 					   (!strcmp(notes, "_EVA_NOTES") ? TblNote_allnote :
; 1633 : 						!strcmp(notes, "_EVA_DETAIL") ? TblNote_alldetail :
; 1634 : 						!strcmp(notes, "_EVA_MINIMAL") ? TblNote_minimal :
; 1635 : 						!strcmp(notes, "_EVA_NONE") ? 0 : TblNote_note);

	push	OFFSET FLAT:$SG72394
	mov	ecx, DWORD PTR _notes$72392[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73350
	mov	DWORD PTR -72+[ebp], 15			; 0000000fH
	jmp	SHORT $L73351
$L73350:
	push	OFFSET FLAT:$SG72395
	mov	edx, DWORD PTR _notes$72392[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73348
	mov	DWORD PTR -76+[ebp], 240		; 000000f0H
	jmp	SHORT $L73349
$L73348:
	push	OFFSET FLAT:$SG72396
	mov	eax, DWORD PTR _notes$72392[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73346
	mov	DWORD PTR -80+[ebp], 61440		; 0000f000H
	jmp	SHORT $L73347
$L73346:
	push	OFFSET FLAT:$SG72397
	mov	ecx, DWORD PTR _notes$72392[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR -80+[ebp], eax
$L73347:
	mov	edx, DWORD PTR -80+[ebp]
	mov	DWORD PTR -76+[ebp], edx
$L73349:
	mov	eax, DWORD PTR -76+[ebp]
	mov	DWORD PTR -72+[ebp], eax
$L73351:
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+136]
	neg	edx
	sbb	edx, edx
	and	edx, 256				; 00000100H
	or	edx, DWORD PTR -72+[ebp]
	mov	eax, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [eax+156], edx

; 1637 : 
; 1638 : 	/* Read initial filter definition */
; 1639 : 	if(!strcmp(srctype, "_EVA_SELFILTER_OBJ"))

	push	OFFSET FLAT:$SG72399
	mov	ecx, DWORD PTR _srctype$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72398

; 1641 : 		/* Existing conditional expression */
; 1642 : 		DYNTAB_FIELD(&pv->filters, pvtdata, FILTERS);

	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72402
	mov	eax, DWORD PTR _pvtdata$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72401
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72404
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1642		; 0000066aH
	jmp	$eva_err$72376
$L72401:

; 1644 : 	else if(!strcmp(srctype, "_EVA_CURRENTOBJ"))

	jmp	$L72424
$L72398:
	push	OFFSET FLAT:$SG72407
	mov	ecx, DWORD PTR _srctype$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72406

; 1646 : 		/* Current object : get data from given field */
; 1647 : 		DYNTAB_FIELD(&data, pvtdata, SELFILTER_FIELD);

	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72410
	mov	eax, DWORD PTR _pvtdata$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72409
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72412
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1647		; 0000066fH
	jmp	$eva_err$72376
$L72409:

; 1648 : 		if(form_eval_valtype(cntxt, &pv->filters, srctype, NULL, &data))

	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _srctype$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_eval_valtype
	add	esp, 20					; 00000014H
	test	eax, eax
	je	$L72421

; 1650 : 			CLEAR_ERROR;

	push	1650					; 00000672H
	push	OFFSET FLAT:$SG72415
	push	OFFSET FLAT:$SG72416
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H

; 1651 : 			DYNTAB_ADD_INT(&pv->filters, 0, 0, (unsigned long int)0);

	mov	BYTE PTR __tmp$72417[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$72417[ebp+1]
	rep stosd
	stosw
	stosb
	push	0
	push	OFFSET FLAT:$SG72419
	lea	eax, DWORD PTR __tmp$72417[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$72417[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72421
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72423
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1651		; 00000673H
	jmp	$eva_err$72376
$L72421:

; 1654 : 	else

	jmp	$L72424
$L72406:

; 1656 : 		/* Simple : read filter params from pvtdata */
; 1657 : 		DYNTAB_FIELD(&pv->forms, pvtdata, FORMS);

	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 4
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72427
	mov	eax, DWORD PTR _pvtdata$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 4
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72426
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72429
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1657		; 00000679H
	jmp	$eva_err$72376
$L72426:

; 1658 : 		DYNTAB_FIELD(&pv->filters, pvtdata, FILTERS);

	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72432
	mov	edx, DWORD PTR _pvtdata$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72431
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72434
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1658		; 0000067aH
	jmp	$eva_err$72376
$L72431:

; 1659 : 		pv->condexpr = DYNTAB_FIELD_VAL(pvtdata, CONDEXPR);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72435
	mov	eax, DWORD PTR _pvtdata$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+48], eax
$L72424:

; 1661 : 	if(!dyntab_sz(&pv->forms, 0, 0)) dyntab_free(&pv->forms);

	push	0
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 4
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72436
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 4
	push	eax
	call	_dyntab_free
	add	esp, 4
$L72436:

; 1662 : 	if(!dyntab_sz(&pv->filters, 0, 0)) dyntab_free(&pv->filters);

	push	0
	push	0
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72437
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_free
	add	esp, 4
$L72437:

; 1663 : 
; 1664 : 	/* Read fields definition & relations */
; 1665 : 	if(pivottable_get_field_definition(cntxt, i_ctrl, pv, "DATA") ||
; 1666 : 		pivottable_get_field_definition(cntxt, i_ctrl, pv, "ROW") ||
; 1667 : 		pivottable_get_field_definition(cntxt, i_ctrl, pv, "COL")) STACK_ERROR;

	push	OFFSET FLAT:$SG72440
	mov	eax, DWORD PTR _pv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pivottable_get_field_definition
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L72439
	push	OFFSET FLAT:$SG72441
	mov	eax, DWORD PTR _pv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pivottable_get_field_definition
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L72439
	push	OFFSET FLAT:$SG72442
	mov	eax, DWORD PTR _pv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pivottable_get_field_definition
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72438
$L72439:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1667		; 00000683H
	jmp	$eva_err$72376
$L72438:

; 1668 : 
; 1669 : 	/* Read relations definition */
; 1670 : 	pv->rowdata_relmode = DYNTAB_FIELD_VAL(pvtdata, ROWDATA_RELMODE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72443
	mov	ecx, DWORD PTR _pvtdata$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	edx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [edx+56], eax

; 1671 : 	DYNTAB_FIELD(&pv->rowdata_relfield, pvtdata, ROWDATA_RELFIELD);

	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 60					; 0000003cH
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72446
	mov	ecx, DWORD PTR _pvtdata$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 60					; 0000003cH
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72445
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72448
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1671		; 00000687H
	jmp	$eva_err$72376
$L72445:

; 1672 : 	if(pvt_eval_relfield(cntxt, &pv->rowdata_relfield)) STACK_ERROR;

	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 60					; 0000003cH
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_pvt_eval_relfield
	add	esp, 8
	test	eax, eax
	je	SHORT $L72449
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1672		; 00000688H
	jmp	$eva_err$72376
$L72449:

; 1673 : 	pv->coldata_relmode = DYNTAB_FIELD_VAL(pvtdata, COLDATA_RELMODE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72450
	mov	edx, DWORD PTR _pvtdata$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+80], eax

; 1674 : 	DYNTAB_FIELD(&pv->coldata_relfield, pvtdata, COLDATA_RELFIELD);

	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 84					; 00000054H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72453
	mov	eax, DWORD PTR _pvtdata$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 84					; 00000054H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72452
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72455
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1674		; 0000068aH
	jmp	$eva_err$72376
$L72452:

; 1675 : 	if(pvt_eval_relfield(cntxt, &pv->coldata_relfield)) STACK_ERROR;

	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 84					; 00000054H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pvt_eval_relfield
	add	esp, 8
	test	eax, eax
	je	SHORT $L72456
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1675		; 0000068bH
	jmp	$eva_err$72376
$L72456:

; 1676 : 	pv->rowcol_relmode = DYNTAB_FIELD_VAL(pvtdata, ROWCOL_RELMODE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72457
	mov	ecx, DWORD PTR _pvtdata$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	edx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [edx+104], eax

; 1677 : 	DYNTAB_FIELD(&pv->rowcol_relfield, pvtdata, ROWCOL_RELFIELD);

	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 108				; 0000006cH
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG72460
	mov	ecx, DWORD PTR _pvtdata$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 108				; 0000006cH
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72459
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72462
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1677		; 0000068dH
	jmp	$eva_err$72376
$L72459:

; 1678 : 	if(pvt_eval_relfield(cntxt, &pv->rowcol_relfield)) STACK_ERROR;

	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 108				; 0000006cH
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_pvt_eval_relfield
	add	esp, 8
	test	eax, eax
	je	SHORT $L72463
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1678		; 0000068eH
	jmp	$eva_err$72376
$L72463:

; 1679 : 
; 1680 : 	/* Set list to use for values clic */
; 1681 : 	pv->clicmode = DYNTAB_FIELD_VAL(pvtdata, CLICMODE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72464
	mov	edx, DWORD PTR _pvtdata$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+128], eax

; 1682 : 	pv->objlist =strtoul(DYNTAB_FIELD_VAL(pvtdata, PVTLIST_CTRL), NULL, 10);

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG72466
	mov	edx, DWORD PTR _pvtdata$[ebp]
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+132], eax

; 1683 : 	if(!pv->clicmode[0])

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+128]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	$L72470

; 1685 : 		PivotTableField *pvf = (pv->data && pv->data->clicmode && pv->data->clicmode[0]) ? pv->data :
; 1686 : 								(pv->row && pv->row->clicmode && pv->row->clicmode[0]) ? pv->row :
; 1687 : 								(pv->col && pv->col->clicmode && pv->col->clicmode[0]) ? pv->col : NULL;

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+208], 0
	je	SHORT $L73352
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	cmp	DWORD PTR [ecx+528], 0
	je	SHORT $L73352
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+208]
	mov	ecx, DWORD PTR [eax+528]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L73352
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	mov	DWORD PTR -84+[ebp], ecx
	jmp	$L73357
$L73352:
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+200], 0
	je	SHORT $L73353
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	cmp	DWORD PTR [ecx+528], 0
	je	SHORT $L73353
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+200]
	mov	ecx, DWORD PTR [eax+528]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L73353
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	DWORD PTR -88+[ebp], ecx
	jmp	SHORT $L73356
$L73353:
	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+204], 0
	je	SHORT $L73354
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	cmp	DWORD PTR [ecx+528], 0
	je	SHORT $L73354
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	ecx, DWORD PTR [eax+528]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L73354
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	DWORD PTR -92+[ebp], ecx
	jmp	SHORT $L73355
$L73354:
	mov	DWORD PTR -92+[ebp], 0
$L73355:
	mov	edx, DWORD PTR -92+[ebp]
	mov	DWORD PTR -88+[ebp], edx
$L73356:
	mov	eax, DWORD PTR -88+[ebp]
	mov	DWORD PTR -84+[ebp], eax
$L73357:
	mov	ecx, DWORD PTR -84+[ebp]
	mov	DWORD PTR _pvf$72468[ebp], ecx

; 1688 : 		if(pvf)

	cmp	DWORD PTR _pvf$72468[ebp], 0
	je	SHORT $L72470

; 1690 : 			pv->clicmode = pvf->clicmode;

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _pvf$72468[ebp]
	mov	ecx, DWORD PTR [eax+528]
	mov	DWORD PTR [edx+128], ecx

; 1691 : 			pv->objlist = pvf->objlist;

	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR _pvf$72468[ebp]
	mov	ecx, DWORD PTR [eax+532]
	mov	DWORD PTR [edx+132], ecx
$L72470:

; 1694 : 	if(!strcmp(pv->clicmode, "_EVA_NONE")) pv->clicmode = "";

	push	OFFSET FLAT:$SG72472
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+128]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $eva_noerr$72474
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+128], OFFSET FLAT:$SG72473
$eva_noerr$72474:

; 1695 : 
; 1696 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72475
	push	OFFSET FLAT:$SG72476
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72376:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L72477
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG72478
	push	OFFSET FLAT:$SG72479
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72477:
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1697 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_pvt_load_definition ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_pivottable
EXTRN	_pivottable_free:NEAR
EXTRN	_pivottable_calc:NEAR
EXTRN	_cgi_get_subfield:NEAR
EXTRN	_cgi_put_subfield:NEAR
EXTRN	__chkstk:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG72498 DB	01H DUP (?)
	ALIGN	4

$SG72499 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG72507 DB	'No data', 00H
$SG72509 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72514 DB	'_EVA_DEBUG_SQL', 00H
	ORG $+1
$SG72517 DB	'_EVA_DEBUG_SQL', 00H
	ORG $+1
$SG72519 DB	'PVTLIST=', 00H
	ORG $+3
$SG72521 DB	'PVTLIST', 00H
$SG72524 DB	'PVTLISTOFF', 00H
	ORG $+1
$SG72526 DB	'PVTLIST', 00H
$SG72528 DB	'STATUS', 00H
	ORG $+1
$SG72531 DB	'PVTLIST', 00H
$SG72538 DB	'PVTLIST', 00H
$SG72542 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72543 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72544 DB	'ctrl_output_pivottable', 00H
	ORG $+1
$SG72546 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72547 DB	'ctrl_output_pivottable', 00H
	ORG $+1
$SG72549 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72550 DB	'ctrl_output_pivottable', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_pvtdata$ = 16
_form$ = -4
_ctrl$ = -94280
_html$ = -12
_cgival$ = -94268
_name$ = -94276
_btn$ = -16
_sql_trace$ = -8
__pv$ = -94248
_pv$ = -94272
_ctrl_output_pivottable PROC NEAR

; 1714 : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 94288				; 00017050H
	call	__chkstk
	push	edi

; 1715 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1716 : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 1717 : 	DynBuffer **html = form->html;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _html$[ebp], eax

; 1718 : 	DynTable cgival = { 0 };

	mov	DWORD PTR _cgival$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _cgival$[ebp+4], ecx
	mov	DWORD PTR _cgival$[ebp+8], ecx
	mov	DWORD PTR _cgival$[ebp+12], ecx
	mov	DWORD PTR _cgival$[ebp+16], ecx

; 1719 : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 1720 : 	char *btn = i_ctrl == form->i_ctrl_clic ? CGI_CLICK_BTN_SUBFIELD : "";

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	cmp	eax, DWORD PTR [edx+124]
	jne	$L73361
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29648], 0
	je	SHORT $L73359
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 66					; 00000042H
	jne	SHORT $L73359
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	cmp	DWORD PTR [edx+eax+32], 0
	je	SHORT $L73359
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx+32]
	mov	DWORD PTR -94284+[ebp], ecx
	jmp	SHORT $L73360
$L73359:
	mov	DWORD PTR -94284+[ebp], OFFSET FLAT:$SG72498
$L73360:
	mov	edx, DWORD PTR -94284+[ebp]
	mov	DWORD PTR -94288+[ebp], edx
	jmp	SHORT $L73362
$L73361:
	mov	DWORD PTR -94288+[ebp], OFFSET FLAT:$SG72499
$L73362:
	mov	eax, DWORD PTR -94288+[ebp]
	mov	DWORD PTR _btn$[ebp], eax

; 1721 : 	int sql_trace = cntxt->sql_trace;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29852]
	mov	DWORD PTR _sql_trace$[ebp], edx

; 1722 : 
; 1723 : 	/* Initialize pivot table */
; 1724 : 	PivotTable _pv = {0}, *pv = &_pv;

	mov	DWORD PTR __pv$[ebp], 0
	mov	ecx, 23557				; 00005c05H
	xor	eax, eax
	lea	edi, DWORD PTR __pv$[ebp+4]
	rep stosd
	lea	eax, DWORD PTR __pv$[ebp]
	mov	DWORD PTR _pv$[ebp], eax

; 1725 : 
; 1726 : 	/* Handle empty data */
; 1727 : 	if(!pvtdata || !pvtdata->nbrows)

	cmp	DWORD PTR _pvtdata$[ebp], 0
	je	SHORT $L72504
	mov	ecx, DWORD PTR _pvtdata$[ebp]
	cmp	DWORD PTR [ecx], 0
	jne	SHORT $L72503
$L72504:

; 1729 : 		DYNBUF_ADD_STR(html, "No data");

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG72507
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72506
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72509
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1729		; 000006c1H
	jmp	$eva_err$72510
$L72506:

; 1730 : 		RETURN_OK;

	jmp	$eva_noerr$72511
$L72503:

; 1732 : 
; 1733 : 	/* Read pivot table definition */
; 1734 : 	if(pvt_load_definition(cntxt, i_ctrl, pv, pvtdata)) STACK_ERROR;

	mov	edx, DWORD PTR _pvtdata$[ebp]
	push	edx
	mov	eax, DWORD PTR _pv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pvt_load_definition
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72512
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1734		; 000006c6H
	jmp	$eva_err$72510
$L72512:

; 1735 : 
; 1736 : 	/* Handle debug */
; 1737 : 	if(form_get_field_values(cntxt, &cgival, "_EVA_DEBUG_SQL", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	OFFSET FLAT:$SG72514
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_get_field_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72513
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1737		; 000006c9H
	jmp	$eva_err$72510
$L72513:

; 1738 : 	if(*dyntab_val(&cgival, 0, 0) == '1' || *DYNTAB_FIELD_VAL(pvtdata, DEBUG_SQL) == '1')

	push	0
	push	0
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	movsx	edx, BYTE PTR [eax]
	cmp	edx, 49					; 00000031H
	je	SHORT $L72516
	push	0
	push	-1
	push	OFFSET FLAT:$SG72517
	mov	eax, DWORD PTR _pvtdata$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L72515
$L72516:

; 1739 : 		cntxt->sql_trace = DEBUG_SQL_RES;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29852], 2
$L72515:

; 1740 : 
; 1741 : 	/* Read values list status & handle values clic */
; 1742 : 	if(!strncmp(btn, add_sz_str("PVTLIST=")))

	push	8
	push	OFFSET FLAT:$SG72519
	mov	eax, DWORD PTR _btn$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72518

; 1744 : 		/* Value clic : store clic info in CGI data */
; 1745 : 		pv->rowcolclic = btn + 8;

	mov	ecx, DWORD PTR _btn$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [edx+94220], ecx

; 1746 : 		CTRL_PUT_CGI_SUBFIELD_VAL("PVTLIST", pv->rowcolclic, 0);

	push	0
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+94220]
	push	ecx
	push	OFFSET FLAT:$SG72521
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_put_subfield
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72520
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1746		; 000006d2H
	jmp	$eva_err$72510
$L72520:

; 1748 : 	else if(!strcmp(btn, "PVTLISTOFF"))

	jmp	$L72533
$L72518:
	push	OFFSET FLAT:$SG72524
	mov	edx, DWORD PTR _btn$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72523

; 1750 : 		/* Click on 'Return to table' button - clear values list CGI data */
; 1751 : 		CTRL_GET_CGI_SUBFIELD("PVTLIST");

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG72526
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72525
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1751		; 000006d7H
	jmp	$eva_err$72510
$L72525:

; 1752 : 		CTRL_GET_CGI_SUBFIELD("STATUS");

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG72528
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72527
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1752		; 000006d8H
	jmp	$eva_err$72510
$L72527:

; 1754 : 	else

	jmp	$L72533
$L72523:

; 1756 : 		/* Other cases : check for values list status */
; 1757 : 		CTRL_GET_CGI_SUBFIELD1("PVTLIST");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG72531
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72530
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1757		; 000006ddH
	jmp	$eva_err$72510
$L72530:

; 1758 : 		if(cgival.nbrows && DYNTAB_TOUL(&cgival) == pvtdata->cell->IdObj)

	cmp	DWORD PTR _cgival$[ebp], 0
	je	SHORT $L72533
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _pvtdata$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	cmp	eax, DWORD PTR [edx+20]
	jne	SHORT $L72533

; 1759 : 			pv->rowcolclic = dyntab_val(&cgival, 0, 0);

	push	0
	push	0
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR [ecx+94220], eax
$L72533:

; 1761 : 
; 1762 : 	/* Values list is displayed : output list if pivot table is the one clicked */
; 1763 : 	if(pv->rowcolclic)

	mov	edx, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [edx+94220], 0
	je	SHORT $L72534

; 1765 : 		if(strtoul(pv->rowcolclic, NULL, 10) == pvtdata->cell->IdObj &&
; 1766 : 			ctrl_calc_output_pvtcell_objlist(cntxt, i_ctrl, pv)) STACK_ERROR;

	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+94220]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _pvtdata$[ebp]
	mov	ecx, DWORD PTR [edx+16]
	cmp	eax, DWORD PTR [ecx+20]
	jne	SHORT $L72536
	mov	edx, DWORD PTR _pv$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_calc_output_pvtcell_objlist
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72536
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1766		; 000006e6H
	jmp	$eva_err$72510
$L72536:

; 1767 : 		RETURN_OK;

	jmp	$eva_noerr$72511
$L72534:

; 1769 : 
; 1770 : 	/* Calc pivot table - return on error */
; 1771 : 	CTRL_GET_CGI_SUBFIELD("PVTLIST");

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG72538
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72537
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1771		; 000006ebH
	jmp	$eva_err$72510
$L72537:

; 1772 : 	if(pivottable_calc(cntxt, pv))

	mov	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pivottable_calc
	add	esp, 8
	test	eax, eax
	je	SHORT $L72539

; 1774 : 		DYNBUF_ADD(html, cntxt->err.text, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29872]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72540
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72542
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1774		; 000006eeH
	jmp	SHORT $eva_err$72510
$L72540:

; 1775 : 		CLEAR_ERROR;

	push	1775					; 000006efH
	push	OFFSET FLAT:$SG72543
	push	OFFSET FLAT:$SG72544
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H

; 1776 : 		RETURN_OK;

	jmp	SHORT $eva_noerr$72511
$L72539:

; 1778 : 
; 1779 : 	/* Output pivot table */
; 1780 : 	if(ctrl_calc_output_pvtres(cntxt, i_ctrl, pv)) STACK_ERROR;

	mov	eax, DWORD PTR _pv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_calc_output_pvtres
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$72511
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1780		; 000006f4H
	jmp	SHORT $eva_err$72510
$eva_noerr$72511:

; 1781 : 
; 1782 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72546
	push	OFFSET FLAT:$SG72547
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72510:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L72548
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG72549
	push	OFFSET FLAT:$SG72550
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72548:
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _pv$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_pivottable_free
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [ecx+29852], edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 1783 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_pivottable ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_stats_fields
_DATA	SEGMENT
	ORG $+1
$SG72561 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72562 DB	'ctrl_output_stats_fields', 00H
	ORG $+3
$SG72565 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72566 DB	'ctrl_output_stats_fields', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_ctrl_output_stats_fields PROC NEAR

; 1796 : ){

	push	ebp
	mov	ebp, esp
$eva_noerr$72560:

; 1797 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72561
	push	OFFSET FLAT:$SG72562
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72563:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L72564
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG72565
	push	OFFSET FLAT:$SG72566
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72564:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1798 : }

	pop	ebp
	ret	0
_ctrl_output_stats_fields ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_pivottable_selector
EXTRN	_put_html_list:NEAR
EXTRN	_get_id_value:NEAR
EXTRN	_qry_obj_idfield:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_dyntab_to_dynbuf:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG72610 DB	01H DUP (?)
	ALIGN	4

$SG72627 DB	01H DUP (?)
	ALIGN	4

$SG72628 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG72590 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG72593 DB	'PVTSELECT', 00H
	ORG $+2
$SG72604 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72607 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72611 DB	' - ', 00H
$SG72613 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72618 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72624 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72630 DB	'PVTNEXT', 00H
$SG72633 DB	'PVTPREV', 00H
$SG72637 DB	'<table><tr><td>', 00H
$SG72639 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72642 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72645 DB	'PVTSELECT', 00H
	ORG $+2
$SG72653 DB	'</td><td>', 00H
	ORG $+2
$SG72655 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72658 DB	'PVTPREV', 00H
$SG72661 DB	'Passe au tableau pr', 0e9H, 'c', 0e9H, 'dent', 00H
	ORG $+1
$SG72662 DB	'arrow_left_yellow_s.gif', 00H
$SG72663 DB	'arrow_left_yellow.gif', 00H
	ORG $+2
$SG72664 DB	'Page pr', 0e9H, 'c', 0e9H, 'dente', 00H
$SG72667 DB	' ', 00H
	ORG $+2
$SG72669 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72672 DB	'PVTNEXT', 00H
$SG72675 DB	'Passe au tableau suivant', 00H
	ORG $+3
$SG72676 DB	'arrow_right_yellow_s.gif', 00H
	ORG $+3
$SG72677 DB	'arrow_right_yellow.gif', 00H
	ORG $+1
$SG72678 DB	'Page suivante', 00H
	ORG $+2
$SG72681 DB	'</td><td>', 00H
	ORG $+2
$SG72683 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72686 DB	'EXPORTPVT=', 00H
	ORG $+1
$SG72688 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72690 DB	',', 00H
	ORG $+2
$SG72696 DB	'Produit l''ensemble des tableaux dans un document Excel '
	DB	'et Word', 00H
	ORG $+1
$SG72697 DB	'btn_book_s.gif', 00H
	ORG $+1
$SG72698 DB	'btn_book.gif', 00H
	ORG $+3
$SG72699 DB	'Rapport', 00H
$SG72702 DB	'</td></tr></table>', 00H
	ORG $+1
$SG72704 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72708 DB	'_EVA_LIST_SIMPLE', 00H
	ORG $+3
$SG72709 DB	'_EVA_TYPE', 00H
	ORG $+2
$SG72715 DB	'LABEL+SYMBOL+OBJNOTES', 00H
	ORG $+2
$SG72716 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72717 DB	'ctrl_add_pivottable_selector', 00H
	ORG $+3
$SG72721 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72722 DB	'ctrl_add_pivottable_selector', 00H
	ORG $+3
$SG72724 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72725 DB	'ctrl_add_pivottable_selector', 00H
_DATA	ENDS
_TEXT	SEGMENT
_tmp$72710 = -104
_cntxt$ = 8
_i_ctrl$ = 12
_idlist$ = 16
_form$ = -4
_ctrl$ = -76
_cgival$ = -48
_optlist$ = -72
_name$ = -52
_buf$ = -8
_i$ = -28
_i_sel$ = -24
_objsel$ = -20
_idlbl$ = -16
_html$ = -12
_idobj$72599 = -80
_btn$72626 = -84
_ctrl_add_pivottable_selector PROC NEAR

; 1815 : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 124				; 0000007cH

; 1816 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1817 : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 1818 : 	DynTable cgival = {0};

	mov	DWORD PTR _cgival$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cgival$[ebp+4], edx
	mov	DWORD PTR _cgival$[ebp+8], edx
	mov	DWORD PTR _cgival$[ebp+12], edx
	mov	DWORD PTR _cgival$[ebp+16], edx

; 1819 : 	DynTable optlist = {0};

	mov	DWORD PTR _optlist$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _optlist$[ebp+4], eax
	mov	DWORD PTR _optlist$[ebp+8], eax
	mov	DWORD PTR _optlist$[ebp+12], eax
	mov	DWORD PTR _optlist$[ebp+16], eax

; 1820 : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 1821 : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 1822 : 	unsigned long i, i_sel = 0, objsel;

	mov	DWORD PTR _i_sel$[ebp], 0

; 1823 : 	unsigned long idlbl = get_id_value(cntxt, add_sz_str("_EVA_LABEL"));

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG72590
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_get_id_value
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idlbl$[ebp], eax

; 1824 : 	DynBuffer **html = form->html;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _html$[ebp], eax

; 1825 : 
; 1826 : 	/* Get current selection */
; 1827 : 	CTRL_GET_CGI_SUBFIELD("PVTSELECT");

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG72593
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72592
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1827		; 00000723H
	jmp	$eva_err$72594
$L72592:

; 1828 : 	objsel = DYNTAB_TOUL(&cgival);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _objsel$[ebp], eax

; 1829 : 
; 1830 : 	/* For each pivot table */
; 1831 : 	for(i = 0; i < idlist->nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L72596
$L72597:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L72596:
	mov	ecx, DWORD PTR _idlist$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	$L72598

; 1833 : 		/* Read pivot table label & build selector list options */
; 1834 : 		unsigned long idobj = DYNTAB_TOULRC(idlist, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _idlist$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$72599[ebp], eax

; 1835 : 		if(qry_obj_idfield(cntxt, &cgival, idobj, idlbl)) STACK_ERROR;

	mov	edx, DWORD PTR _idlbl$[ebp]
	push	edx
	mov	eax, DWORD PTR _idobj$72599[ebp]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72601
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1835		; 0000072bH
	jmp	$eva_err$72594
$L72601:

; 1836 : 		DYNTAB_ADD_CELL(&optlist, i, 0, idlist, i, 0);

	push	1
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _idlist$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72602
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72604
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1836		; 0000072cH
	jmp	$eva_err$72594
$L72602:

; 1837 : 		DYNBUF_ADD_INT(&name, i + 1);

	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L72605
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72607
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1837		; 0000072dH
	jmp	$eva_err$72594
$L72605:

; 1838 : 		DYNBUF_ADD3_CELL(&name, " - ", &cgival, 0, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG72610
	push	0
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	3
	push	OFFSET FLAT:$SG72611
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72609
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72613
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1838		; 0000072eH
	jmp	$eva_err$72594
$L72609:

; 1839 : 		DYNTAB_ADD_BUF(&optlist, i, 1, name);

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L72614
	mov	ecx, DWORD PTR _name$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L72614
	push	0
	push	0
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _optlist$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72616
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72618
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1839		; 0000072fH
	jmp	$eva_err$72594
$L72616:
	jmp	SHORT $L72622
$L72614:
	push	0
	push	0
	push	0
	push	0
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _optlist$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L72622
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72624
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1839		; 0000072fH
	jmp	$eva_err$72594
$L72622:

; 1840 : 		M_FREE(name);

	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0

; 1841 : 		if(objsel == idobj) i_sel = i;

	mov	edx, DWORD PTR _objsel$[ebp]
	cmp	edx, DWORD PTR _idobj$72599[ebp]
	jne	SHORT $L72625
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _i_sel$[ebp], eax
$L72625:

; 1842 : 	}

	jmp	$L72597
$L72598:

; 1846 : 		char *btn = i_ctrl == form->i_ctrl_clic ? CGI_CLICK_BTN_SUBFIELD : "";

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	cmp	edx, DWORD PTR [ecx+124]
	jne	SHORT $L73368
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29648], 0
	je	SHORT $L73366
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 66					; 00000042H
	jne	SHORT $L73366
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	cmp	DWORD PTR [ecx+edx+32], 0
	je	SHORT $L73366
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+32]
	mov	DWORD PTR -108+[ebp], eax
	jmp	SHORT $L73367
$L73366:
	mov	DWORD PTR -108+[ebp], OFFSET FLAT:$SG72627
$L73367:
	mov	ecx, DWORD PTR -108+[ebp]
	mov	DWORD PTR -112+[ebp], ecx
	jmp	SHORT $L73369
$L73368:
	mov	DWORD PTR -112+[ebp], OFFSET FLAT:$SG72628
$L73369:
	mov	edx, DWORD PTR -112+[ebp]
	mov	DWORD PTR _btn$72626[ebp], edx

; 1847 : 		if(!strcmp(btn, "PVTNEXT")) i_sel++;

	push	OFFSET FLAT:$SG72630
	mov	eax, DWORD PTR _btn$72626[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72629
	mov	ecx, DWORD PTR _i_sel$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i_sel$[ebp], ecx

; 1848 : 		else if(!strcmp(btn, "PVTPREV")) i_sel--;

	jmp	SHORT $L72632
$L72629:
	push	OFFSET FLAT:$SG72633
	mov	edx, DWORD PTR _btn$72626[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72632
	mov	eax, DWORD PTR _i_sel$[ebp]
	sub	eax, 1
	mov	DWORD PTR _i_sel$[ebp], eax
$L72632:

; 1850 : 	if(i_sel >= optlist.nbrows) i_sel = 0;

	mov	ecx, DWORD PTR _i_sel$[ebp]
	cmp	ecx, DWORD PTR _optlist$[ebp]
	jb	SHORT $L72634
	mov	DWORD PTR _i_sel$[ebp], 0
$L72634:

; 1851 : 
; 1852 : 	/* Output enclosing table header */
; 1853 : 	DYNBUF_ADD_STR(form->html, "<table><tr><td>");

	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG72637
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72636
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72639
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1853		; 0000073dH
	jmp	$eva_err$72594
$L72636:

; 1854 : 
; 1855 : 	/* Output selector list */
; 1856 : 	DYNTAB_FREE(cgival);

	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 1857 : 	DYNTAB_ADD_CELL(&cgival, 0, 0, &optlist, i_sel, 0);

	push	1
	push	0
	mov	ecx, DWORD PTR _i_sel$[ebp]
	push	ecx
	lea	edx, DWORD PTR _optlist$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72640
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72642
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1857		; 00000741H
	jmp	$eva_err$72594
$L72640:

; 1858 : 	CTRL_CGINAMESUBFIELD(&name, NULL, "PVTSELECT");

	push	9
	push	OFFSET FLAT:$SG72645
	push	68					; 00000044H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L72644
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1858		; 00000742H
	jmp	$eva_err$72594
$L72644:

; 1859 : 	if(ctrl->LINES > optlist.nbrows) ctrl->LINES = optlist.nbrows;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+376]
	cmp	edx, DWORD PTR _optlist$[ebp]
	jbe	SHORT $L72646
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _optlist$[ebp]
	mov	DWORD PTR [eax+376], ecx

; 1860 : 	else if(!ctrl->LINES) ctrl->LINES = optlist.nbrows < 5 ? optlist.nbrows : 5;

	jmp	SHORT $L72648
$L72646:
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+376], 0
	jne	SHORT $L72648
	cmp	DWORD PTR _optlist$[ebp], 5
	jae	SHORT $L73370
	mov	eax, DWORD PTR _optlist$[ebp]
	mov	DWORD PTR -116+[ebp], eax
	jmp	SHORT $L73371
$L73370:
	mov	DWORD PTR -116+[ebp], 5
$L73371:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -116+[ebp]
	mov	DWORD PTR [ecx+376], edx
$L72648:

; 1861 : 	if(put_html_list(cntxt, name, &optlist, &cgival, ctrl->LINES, 0, 0, 1, 1, NULL)) STACK_ERROR;

	push	0
	push	1
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+376]
	push	ecx
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	lea	eax, DWORD PTR _optlist$[ebp]
	push	eax
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_list
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L72650
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1861		; 00000745H
	jmp	$eva_err$72594
$L72650:

; 1862 : 
; 1863 : 	/* Output page buttons */
; 1864 : 	DYNBUF_ADD_STR(html, "</td><td>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG72653
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72652
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72655
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1864		; 00000748H
	jmp	$eva_err$72594
$L72652:

; 1865 : 	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("PVTPREV"));

	push	7
	push	OFFSET FLAT:$SG72658
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L72657
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1865		; 00000749H
	jmp	$eva_err$72594
$L72657:

; 1866 : 	if(put_html_button(cntxt, name->data, "Page précédente", "arrow_left_yellow.gif", "arrow_left_yellow_s.gif",
; 1867 : 										"Passe au tableau précédent", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG72661
	push	OFFSET FLAT:$SG72662
	push	OFFSET FLAT:$SG72663
	push	OFFSET FLAT:$SG72664
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L72660
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1867		; 0000074bH
	jmp	$eva_err$72594
$L72660:

; 1868 : 	DYNBUF_ADD_STR(html, " ");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG72667
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72666
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72669
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1868		; 0000074cH
	jmp	$eva_err$72594
$L72666:

; 1869 : 	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("PVTNEXT"));

	push	7
	push	OFFSET FLAT:$SG72672
	push	66					; 00000042H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L72671
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1869		; 0000074dH
	jmp	$eva_err$72594
$L72671:

; 1870 : 	if(put_html_button(cntxt, name->data, "Page suivante", "arrow_right_yellow.gif", "arrow_right_yellow_s.gif",
; 1871 : 										"Passe au tableau suivant", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG72675
	push	OFFSET FLAT:$SG72676
	push	OFFSET FLAT:$SG72677
	push	OFFSET FLAT:$SG72678
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L72674
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1871		; 0000074fH
	jmp	$eva_err$72594
$L72674:

; 1872 : 
; 1873 : 	/* Output export button */
; 1874 : 	DYNBUF_ADD_STR(form->html, "</td><td>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG72681
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72680
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72683
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1874		; 00000752H
	jmp	$eva_err$72594
$L72680:

; 1875 : 	DYNBUF_ADD_STR(&buf, "EXPORTPVT=");

	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG72686
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72685
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72688
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1875		; 00000753H
	jmp	$eva_err$72594
$L72685:

; 1876 : 	dyntab_to_dynbuf(idlist, &buf, 0, 0, ",", 1, NO_CONV);

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG72690
	push	0
	push	0
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _idlist$[ebp]
	push	edx
	call	_dyntab_to_dynbuf
	add	esp, 32					; 00000020H

; 1877 : 	CTRL_CGINAMEBTN(&name, NULL, DYNBUF_VAL_SZ(buf));

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L73372
	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -120+[ebp], ecx
	jmp	SHORT $L73373
$L73372:
	mov	DWORD PTR -120+[ebp], 0
$L73373:
	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L73374
	mov	edx, DWORD PTR _buf$[ebp]
	add	edx, 8
	mov	DWORD PTR -124+[ebp], edx
	jmp	SHORT $L73375
$L73374:
	mov	DWORD PTR -124+[ebp], 0
$L73375:
	mov	eax, DWORD PTR -120+[ebp]
	push	eax
	mov	ecx, DWORD PTR -124+[ebp]
	push	ecx
	push	66					; 00000042H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L72693
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1877		; 00000755H
	jmp	$eva_err$72594
$L72693:

; 1878 : 	if(put_html_button(cntxt, name->data, "Rapport", "btn_book.gif", "btn_book_s.gif",
; 1879 : 						"Produit l'ensemble des tableaux dans un document Excel et Word", 0, 12)) STACK_ERROR;

	push	12					; 0000000cH
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG72696
	push	OFFSET FLAT:$SG72697
	push	OFFSET FLAT:$SG72698
	push	OFFSET FLAT:$SG72699
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L72695
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1879		; 00000757H
	jmp	$eva_err$72594
$L72695:

; 1880 : 	DYNBUF_ADD_STR(form->html, "</td></tr></table>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG72702
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72701
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72704
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1880		; 00000758H
	jmp	$eva_err$72594
$L72701:

; 1881 : 
; 1882 : 	/* Read table definition data */
; 1883 : 	if(qry_obj_idfield(cntxt, &cgival, DYNTAB_TOULRC(&optlist, i_sel, 0), 0)) STACK_ERROR;

	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i_sel$[ebp]
	push	ecx
	lea	edx, DWORD PTR _optlist$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72706
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1883		; 0000075bH
	jmp	$eva_err$72594
$L72706:

; 1884 : 
; 1885 : 	/* Handle table type */
; 1886 : 	if(!strcmp(DYNTAB_FIELD_VAL(&cgival, TYPE), "_EVA_LIST_SIMPLE"))

	push	OFFSET FLAT:$SG72708
	push	0
	push	-1
	push	OFFSET FLAT:$SG72709
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72707

; 1888 : 		/* Output list table */
; 1889 : 		DynTable tmp = {0};

	mov	DWORD PTR _tmp$72710[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _tmp$72710[ebp+4], ecx
	mov	DWORD PTR _tmp$72710[ebp+8], ecx
	mov	DWORD PTR _tmp$72710[ebp+12], ecx
	mov	DWORD PTR _tmp$72710[ebp+16], ecx

; 1890 : 		memcpy(&tmp, &ctrl->attr, sizeof(tmp));

	push	20					; 00000014H
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	lea	eax, DWORD PTR _tmp$72710[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH

; 1891 : 		memcpy(&ctrl->attr, &cgival, sizeof(tmp));

	push	20					; 00000014H
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH

; 1892 : 		if(ctrl_add_symbol_btn(cntxt, ctrl, NULL, &cgival, 0, NULL, "LABEL+SYMBOL+OBJNOTES") ||
; 1893 : 			table_read_controls(cntxt, i_ctrl, &cgival) ||
; 1894 : 			table_process_controls(cntxt, i_ctrl) ||
; 1895 : 			table_put_html_obj_list(cntxt, i_ctrl)) CLEAR_ERROR;

	push	OFFSET FLAT:$SG72715
	push	0
	push	0
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_symbol_btn
	add	esp, 28					; 0000001cH
	test	eax, eax
	jne	SHORT $L72714
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_table_read_controls
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L72714
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_process_controls
	add	esp, 8
	test	eax, eax
	jne	SHORT $L72714
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_put_html_obj_list
	add	esp, 8
	test	eax, eax
	je	SHORT $L72713
$L72714:
	push	1895					; 00000767H
	push	OFFSET FLAT:$SG72716
	push	OFFSET FLAT:$SG72717
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L72713:

; 1896 : 		memcpy(&ctrl->attr, &tmp, sizeof(tmp));

	push	20					; 00000014H
	lea	edx, DWORD PTR _tmp$72710[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH

; 1898 : 	else

	jmp	SHORT $eva_noerr$72720
$L72707:

; 1899 : 		/* Call pivot table display function */
; 1900 : 		if(ctrl_output_pivottable(cntxt, i_ctrl, &cgival)) STACK_ERROR;

	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_output_pivottable
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $eva_noerr$72720
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1900		; 0000076cH
	jmp	SHORT $eva_err$72594
$eva_noerr$72720:

; 1901 : 
; 1902 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72721
	push	OFFSET FLAT:$SG72722
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72594:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L72723
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG72724
	push	OFFSET FLAT:$SG72725
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72723:
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _optlist$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1903 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_pivottable_selector ENDP
_TEXT	ENDS
PUBLIC	_ctrl_export_pivottable
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fprintf:NEAR
EXTRN	_fputs:NEAR
EXTRN	_file_compatible_name:NEAR
EXTRN	_strcpy:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG72815 DB	01H DUP (?)
	ALIGN	4

$SG72824 DB	01H DUP (?)
	ALIGN	4

$SG72833 DB	01H DUP (?)
	ALIGN	4

$SG72842 DB	01H DUP (?)
	ALIGN	4

$SG72850 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG72749 DB	'Statistiques', 00H
	ORG $+3
$SG72750 DB	'%s.htm', 00H
	ORG $+1
$SG72753 DB	09H, 00H
	ORG $+2
$SG72754 DB	'DataFile', 09H, 00H
	ORG $+2
$SG72756 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72760 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72762 DB	'_EVA_GRAPH_SEL', 00H
	ORG $+1
$SG72766 DB	09H, 00H
	ORG $+2
$SG72767 DB	09H, 00H
	ORG $+2
$SG72769 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72770 DB	'_EVA_2DGRAPH_TYPE', 00H
	ORG $+2
$SG72772 DB	'_EVA_GRAPH_PERSO', 00H
	ORG $+3
$SG72774 DB	'_EVA_GRAPH_PERSO->_EVA_FILE_SERVER_NAME', 00H
$SG72778 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72784 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72786 DB	'_EVA_GRAPH_WORD_FMT', 00H
$SG72790 DB	0aH, 00H
	ORG $+2
$SG72791 DB	09H, 00H
	ORG $+2
$SG72793 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72795 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72796 DB	'ctrl_export_pivottable', 00H
	ORG $+1
$SG72801 DB	'_EVA_XL_LBL_WIDTH', 00H
	ORG $+2
$SG72805 DB	09H, 00H
	ORG $+2
$SG72806 DB	'DisplayParams', 09H, 00H
	ORG $+1
$SG72808 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72810 DB	'_EVA_XL_COL_WIDTH', 00H
	ORG $+2
$SG72814 DB	09H, 00H
	ORG $+2
$SG72817 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72819 DB	'_EVA_XL_COL_ORIENT', 00H
	ORG $+1
$SG72823 DB	09H, 00H
	ORG $+2
$SG72826 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72828 DB	'_EVA_XL_COL_HEIGHT', 00H
	ORG $+1
$SG72832 DB	0aH, 00H
	ORG $+2
$SG72835 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72836 DB	'w', 00H
	ORG $+2
$SG72839 DB	'Export stats : ', 00H
$SG72841 DB	'Droits d''acc', 0e8H, 's incorrects sur un dossier', 00H
	ORG $+3
$SG72843 DB	'<html><body><font face=%s>%s</font></body></html>', 00H
	ORG $+2
$SG72844 DB	'a', 00H
	ORG $+2
$SG72845 DB	'dumpfmt.txt', 00H
$SG72848 DB	'Export stats : dumpfmt.txt', 00H
	ORG $+1
$SG72851 DB	'Droits d''acc', 0e8H, 's incorrects sur un dossier', 00H
	ORG $+3
$SG72852 DB	0aH, 00H
	ORG $+2
$SG72854 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72855 DB	'ctrl_export_pivottable', 00H
	ORG $+1
$SG72857 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72858 DB	'ctrl_export_pivottable', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_outfile$ = 16
_pv$ = 20
_pvtdata$ = 24
_form$ = -4
_ctrl$ = -4136
_export$ = -4128
_f$ = -4132
_filename$ = -4124
_data$ = -28
_c$ = -8
__c$72761 = -4140
__c$72780 = -4144
__c$72785 = -4148
__c$72800 = -4152
__c$72809 = -4156
__c$72818 = -4160
__c$72827 = -4164
_ctrl_export_pivottable PROC NEAR

; 1920 : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4220				; 0000107cH
	call	__chkstk

; 1921 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1922 : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 1923 : 	DynBuffer *export = NULL;

	mov	DWORD PTR _export$[ebp], 0

; 1924 : 	FILE *f;
; 1925 : 	char filename[4096];
; 1926 : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 1927 : 	DynTableCell *c;
; 1928 : 
; 1929 : 	/* Build file name */
; 1930 : 	snprintf(add_sz_str(filename), "%s.htm", pv->label ? pv->label : "Statistiques");

	mov	eax, DWORD PTR _pv$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L73377
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -4168+[ebp], edx
	jmp	SHORT $L73378
$L73377:
	mov	DWORD PTR -4168+[ebp], OFFSET FLAT:$SG72749
$L73378:
	mov	eax, DWORD PTR -4168+[ebp]
	push	eax
	push	OFFSET FLAT:$SG72750
	push	4095					; 00000fffH
	lea	ecx, DWORD PTR _filename$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 1931 : 	file_compatible_name(filename);

	lea	edx, DWORD PTR _filename$[ebp]
	push	edx
	call	_file_compatible_name
	add	esp, 4

; 1932 : 
; 1933 : 	/* Output pivot table params to buffer */
; 1934 : 	DYNBUF_ADD3(&pv->exportparams, "DataFile\t", filename, 0, NO_CONV, "\t");

	push	1
	push	OFFSET FLAT:$SG72753
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _filename$[ebp]
	push	eax
	push	9
	push	OFFSET FLAT:$SG72754
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 94136				; 00016fb8H
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72752
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72756
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1934		; 0000078eH
	jmp	$eva_err$72757
$L72752:

; 1935 : 	DYNBUF_ADD_INT(&pv->exportparams, pvtdata->cell->IdObj);

	mov	ecx, DWORD PTR _pvtdata$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 94136				; 00016fb8H
	push	ecx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L72758
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72760
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1935		; 0000078fH
	jmp	$eva_err$72757
$L72758:

; 1936 : 	DYNBUF_ADD3_CELLP(&pv->exportparams, "\t", DYNTAB_FIELD_CELL(pvtdata, GRAPH_SEL), NO_CONV, "\t");

	push	0
	push	-1
	push	OFFSET FLAT:$SG72762
	mov	ecx, DWORD PTR _pvtdata$[ebp]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR __c$72761[ebp], eax
	cmp	DWORD PTR __c$72761[ebp], 0
	je	SHORT $L73379
	mov	edx, DWORD PTR __c$72761[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -4172+[ebp], eax
	jmp	SHORT $L73380
$L73379:
	mov	DWORD PTR -4172+[ebp], 0
$L73380:
	cmp	DWORD PTR __c$72761[ebp], 0
	je	SHORT $L73381
	mov	ecx, DWORD PTR __c$72761[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -4176+[ebp], edx
	jmp	SHORT $L73382
$L73381:
	mov	DWORD PTR -4176+[ebp], 0
$L73382:
	push	1
	push	OFFSET FLAT:$SG72766
	push	0
	push	0
	mov	eax, DWORD PTR -4172+[ebp]
	push	eax
	mov	ecx, DWORD PTR -4176+[ebp]
	push	ecx
	push	1
	push	OFFSET FLAT:$SG72767
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 94136				; 00016fb8H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72765
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72769
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1936		; 00000790H
	jmp	$eva_err$72757
$L72765:

; 1937 : 	c = DYNTAB_FIELD_CELL(pvtdata, 2DGRAPH_TYPE);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72770
	mov	edx, DWORD PTR _pvtdata$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _c$[ebp], eax

; 1938 : 	if(c && !strcmp(c->txt, "_EVA_GRAPH_PERSO"))

	cmp	DWORD PTR _c$[ebp], 0
	je	$L72771
	push	OFFSET FLAT:$SG72772
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72771

; 1940 : 		if(form_eval_fieldexpr(cntxt, &data, 0, pvtdata->cell->IdObj, add_sz_str("_EVA_GRAPH_PERSO->_EVA_FILE_SERVER_NAME"), pvtdata, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _pvtdata$[ebp]
	push	edx
	push	39					; 00000027H
	push	OFFSET FLAT:$SG72774
	mov	eax, DWORD PTR _pvtdata$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [ecx+20]
	push	edx
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L72773
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1940		; 00000794H
	jmp	$eva_err$72757
$L72773:

; 1941 :  		DYNBUF_ADD_CELL(&pv->exportparams, &data, 0, 0, NO_CONV);

	push	0
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 94136				; 00016fb8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72776
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72778
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1941		; 00000795H
	jmp	$eva_err$72757
$L72776:

; 1943 : 	else

	jmp	SHORT $L72782
$L72771:

; 1944 : 		DYNBUF_ADD_CELLP(&pv->exportparams, c, NO_CONV);

	mov	edx, DWORD PTR _c$[ebp]
	mov	DWORD PTR __c$72780[ebp], edx
	cmp	DWORD PTR __c$72780[ebp], 0
	je	SHORT $L72782
	push	0
	push	0
	mov	eax, DWORD PTR __c$72780[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR __c$72780[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 94136				; 00016fb8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72782
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72784
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1944		; 00000798H
	jmp	$eva_err$72757
$L72782:

; 1945 : 	DYNBUF_ADD3_CELLP(&pv->exportparams, "\t", DYNTAB_FIELD_CELL(pvtdata, GRAPH_WORD_FMT), NO_CONV, "\n");

	push	0
	push	-1
	push	OFFSET FLAT:$SG72786
	mov	ecx, DWORD PTR _pvtdata$[ebp]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR __c$72785[ebp], eax
	cmp	DWORD PTR __c$72785[ebp], 0
	je	SHORT $L73383
	mov	edx, DWORD PTR __c$72785[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -4180+[ebp], eax
	jmp	SHORT $L73384
$L73383:
	mov	DWORD PTR -4180+[ebp], 0
$L73384:
	cmp	DWORD PTR __c$72785[ebp], 0
	je	SHORT $L73385
	mov	ecx, DWORD PTR __c$72785[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -4184+[ebp], edx
	jmp	SHORT $L73386
$L73385:
	mov	DWORD PTR -4184+[ebp], 0
$L73386:
	push	1
	push	OFFSET FLAT:$SG72790
	push	0
	push	0
	mov	eax, DWORD PTR -4180+[ebp]
	push	eax
	mov	ecx, DWORD PTR -4184+[ebp]
	push	ecx
	push	1
	push	OFFSET FLAT:$SG72791
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 94136				; 00016fb8H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72789
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72793
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1945		; 00000799H
	jmp	$eva_err$72757
$L72789:

; 1946 : 
; 1947 : 	/* Output results to buffer */
; 1948 : 	form->html = &export;

	mov	edx, DWORD PTR _form$[ebp]
	lea	eax, DWORD PTR _export$[ebp]
	mov	DWORD PTR [edx+232], eax

; 1949 : 	if(pivottable_calc(cntxt, pv)) CLEAR_ERROR_RETURN;

	mov	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pivottable_calc
	add	esp, 8
	test	eax, eax
	je	SHORT $L72794
	push	1949					; 0000079dH
	push	OFFSET FLAT:$SG72795
	push	OFFSET FLAT:$SG72796
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$eva_noerr$72797
$L72794:

; 1950 : 	if(ctrl_calc_output_pvtres(cntxt, i_ctrl, pv)) STACK_ERROR;

	mov	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_calc_output_pvtres
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72798
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1950		; 0000079eH
	jmp	$eva_err$72757
$L72798:

; 1951 : 	form->html = NULL;

	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+232], 0

; 1952 : 
; 1953 : 	/* Add display parameters */
; 1954 : 	DYNBUF_ADD3_CELLP(&pv->exportparams, "DisplayParams\t", DYNTAB_FIELD_CELL(pv->srcdata, XL_LBL_WIDTH), NO_CONV, "\t");

	push	0
	push	-1
	push	OFFSET FLAT:$SG72801
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR __c$72800[ebp], eax
	cmp	DWORD PTR __c$72800[ebp], 0
	je	SHORT $L73387
	mov	edx, DWORD PTR __c$72800[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -4188+[ebp], eax
	jmp	SHORT $L73388
$L73387:
	mov	DWORD PTR -4188+[ebp], 0
$L73388:
	cmp	DWORD PTR __c$72800[ebp], 0
	je	SHORT $L73389
	mov	ecx, DWORD PTR __c$72800[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -4192+[ebp], edx
	jmp	SHORT $L73390
$L73389:
	mov	DWORD PTR -4192+[ebp], 0
$L73390:
	push	1
	push	OFFSET FLAT:$SG72805
	push	0
	push	0
	mov	eax, DWORD PTR -4188+[ebp]
	push	eax
	mov	ecx, DWORD PTR -4192+[ebp]
	push	ecx
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG72806
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 94136				; 00016fb8H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72804
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72808
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1954		; 000007a2H
	jmp	$eva_err$72757
$L72804:

; 1955 : 	DYNBUF_ADD3_CELLP(&pv->exportparams, "", DYNTAB_FIELD_CELL(pv->srcdata, XL_COL_WIDTH), NO_CONV, "\t");

	push	0
	push	-1
	push	OFFSET FLAT:$SG72810
	mov	edx, DWORD PTR _pv$[ebp]
	mov	eax, DWORD PTR [edx+44]
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR __c$72809[ebp], eax
	cmp	DWORD PTR __c$72809[ebp], 0
	je	SHORT $L73391
	mov	ecx, DWORD PTR __c$72809[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -4196+[ebp], edx
	jmp	SHORT $L73392
$L73391:
	mov	DWORD PTR -4196+[ebp], 0
$L73392:
	cmp	DWORD PTR __c$72809[ebp], 0
	je	SHORT $L73393
	mov	eax, DWORD PTR __c$72809[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -4200+[ebp], ecx
	jmp	SHORT $L73394
$L73393:
	mov	DWORD PTR -4200+[ebp], 0
$L73394:
	push	1
	push	OFFSET FLAT:$SG72814
	push	0
	push	0
	mov	edx, DWORD PTR -4196+[ebp]
	push	edx
	mov	eax, DWORD PTR -4200+[ebp]
	push	eax
	push	0
	push	OFFSET FLAT:$SG72815
	mov	ecx, DWORD PTR _pv$[ebp]
	add	ecx, 94136				; 00016fb8H
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72813
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72817
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 1955		; 000007a3H
	jmp	$eva_err$72757
$L72813:

; 1956 : 	DYNBUF_ADD3_CELLP(&pv->exportparams, "", DYNTAB_FIELD_CELL(pv->srcdata, XL_COL_ORIENT), NO_CONV, "\t");

	push	0
	push	-1
	push	OFFSET FLAT:$SG72819
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR __c$72818[ebp], eax
	cmp	DWORD PTR __c$72818[ebp], 0
	je	SHORT $L73395
	mov	eax, DWORD PTR __c$72818[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -4204+[ebp], ecx
	jmp	SHORT $L73396
$L73395:
	mov	DWORD PTR -4204+[ebp], 0
$L73396:
	cmp	DWORD PTR __c$72818[ebp], 0
	je	SHORT $L73397
	mov	edx, DWORD PTR __c$72818[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -4208+[ebp], eax
	jmp	SHORT $L73398
$L73397:
	mov	DWORD PTR -4208+[ebp], 0
$L73398:
	push	1
	push	OFFSET FLAT:$SG72823
	push	0
	push	0
	mov	ecx, DWORD PTR -4204+[ebp]
	push	ecx
	mov	edx, DWORD PTR -4208+[ebp]
	push	edx
	push	0
	push	OFFSET FLAT:$SG72824
	mov	eax, DWORD PTR _pv$[ebp]
	add	eax, 94136				; 00016fb8H
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72822
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72826
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1956		; 000007a4H
	jmp	$eva_err$72757
$L72822:

; 1957 : 	DYNBUF_ADD3_CELLP(&pv->exportparams, "", DYNTAB_FIELD_CELL(pv->srcdata, XL_COL_HEIGHT), NO_CONV, "\n");

	push	0
	push	-1
	push	OFFSET FLAT:$SG72828
	mov	eax, DWORD PTR _pv$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR __c$72827[ebp], eax
	cmp	DWORD PTR __c$72827[ebp], 0
	je	SHORT $L73399
	mov	edx, DWORD PTR __c$72827[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -4212+[ebp], eax
	jmp	SHORT $L73400
$L73399:
	mov	DWORD PTR -4212+[ebp], 0
$L73400:
	cmp	DWORD PTR __c$72827[ebp], 0
	je	SHORT $L73401
	mov	ecx, DWORD PTR __c$72827[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -4216+[ebp], edx
	jmp	SHORT $L73402
$L73401:
	mov	DWORD PTR -4216+[ebp], 0
$L73402:
	push	1
	push	OFFSET FLAT:$SG72832
	push	0
	push	0
	mov	eax, DWORD PTR -4212+[ebp]
	push	eax
	mov	ecx, DWORD PTR -4216+[ebp]
	push	ecx
	push	0
	push	OFFSET FLAT:$SG72833
	mov	edx, DWORD PTR _pv$[ebp]
	add	edx, 94136				; 00016fb8H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72831
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72835
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1957		; 000007a5H
	jmp	$eva_err$72757
$L72831:

; 1958 : 
; 1959 : 	/* Output buffer to HTML file */
; 1960 : 	f = fopen(filename, "w");

	push	OFFSET FLAT:$SG72836
	lea	edx, DWORD PTR _filename$[ebp]
	push	edx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 1961 : 	if(!f) RETURN_ERR_DIRECTORY(ERR_PUT_TXT("Export stats : ", filename, 0));

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L72837
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG72839
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29876				; 000074b4H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _filename$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG72841
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 1961		; 000007a9H
	jmp	$eva_err$72757
$L72837:

; 1962 : 	fprintf(f, "<html><body><font face=%s>%s</font></body></html>",
; 1963 : 				ctrl->FONTFACE, export ? export->data : "");

	cmp	DWORD PTR _export$[ebp], 0
	je	SHORT $L73403
	mov	edx, DWORD PTR _export$[ebp]
	add	edx, 8
	mov	DWORD PTR -4220+[ebp], edx
	jmp	SHORT $L73404
$L73403:
	mov	DWORD PTR -4220+[ebp], OFFSET FLAT:$SG72842
$L73404:
	mov	eax, DWORD PTR -4220+[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+352]
	push	edx
	push	OFFSET FLAT:$SG72843
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H

; 1964 : 	fclose(f);

	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fclose
	add	esp, 4

; 1965 : 
; 1966 : 	/* Output parameters file */
; 1967 : 	f = fopen("dumpfmt.txt", "a");

	push	OFFSET FLAT:$SG72844
	push	OFFSET FLAT:$SG72845
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 1968 : 	if(!f) RETURN_ERR_DIRECTORY(ERR_PUT_TXT("Export stats : dumpfmt.txt", "", 0));

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L72846
	push	0
	push	0
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG72848
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29876				; 000074b4H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG72850
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29876				; 000074b4H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72851
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 1968		; 000007b0H
	jmp	SHORT $eva_err$72757
$L72846:

; 1969 : 	fputs(pv->exportparams->data, f);

	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pv$[ebp]
	mov	edx, DWORD PTR [ecx+94136]
	add	edx, 8
	push	edx
	call	_fputs
	add	esp, 8

; 1970 : 	fputs("\n", f);

	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	push	OFFSET FLAT:$SG72852
	call	_fputs
	add	esp, 8

; 1971 : 	fclose(f);

	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fclose
	add	esp, 4

; 1972 : 	if(outfile) strcpy(outfile, filename);

	cmp	DWORD PTR _outfile$[ebp], 0
	je	SHORT $eva_noerr$72797
	lea	edx, DWORD PTR _filename$[ebp]
	push	edx
	mov	eax, DWORD PTR _outfile$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
$eva_noerr$72797:

; 1973 : 
; 1974 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG72854
	push	OFFSET FLAT:$SG72855
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72757:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L72856
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG72857
	push	OFFSET FLAT:$SG72858
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L72856:
	mov	eax, DWORD PTR _export$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _export$[ebp], 0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 1975 : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_export_pivottable ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_output_stats
EXTRN	_put_html_page_header:NEAR
EXTRN	__iob:BYTE
EXTRN	_fflush:NEAR
EXTRN	_table_free:NEAR
EXTRN	_table_init_obj_list:NEAR
EXTRN	_table_read_obj_list:NEAR
EXTRN	_table_prepare_rows:NEAR
EXTRN	_printf:NEAR
EXTRN	_remove:NEAR
EXTRN	_rename:NEAR
EXTRN	_cgi_build_basename:NEAR
EXTRN	_file_write_tabrc:NEAR
EXTRN	_chdir_user_doc:NEAR
EXTRN	_file_output_link:NEAR
EXTRN	_stat:NEAR
EXTRN	_strpbrk:NEAR
EXTRN	_office_launchproc:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG72874 DB	01H DUP (?)
	ALIGN	4

$SG72877 DB	01H DUP (?)
	ALIGN	4

$SG72878 DB	01H DUP (?)
	ALIGN	4

$SG72884 DB	01H DUP (?)
	ALIGN	4

$SG72936 DB	01H DUP (?)
	ALIGN	4

$SG72949 DB	01H DUP (?)
	ALIGN	4

$SG73007 DB	01H DUP (?)
	ALIGN	4

$SG73045 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG72873 DB	'_EVA_STATS_TYPE', 00H
$SG72888 DB	'EXPORTPVT=', 00H
	ORG $+1
$SG72898 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG72900 DB	'dumpfmt.txt', 00H
$SG72902 DB	',', 00H
	ORG $+2
$SG72904 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72908 DB	'<font face=Arial><hr><center><b>Export de donn', 0e9H, 'e'
	DB	's statistiques - %s</b></center><hr>', 00H
	ORG $+3
$SG72922 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG72923 DB	'<li>%lu / %lu : %s</li>', 0aH, 00H
	ORG $+3
$SG72925 DB	'_EVA_LIST_SIMPLE', 00H
	ORG $+3
$SG72926 DB	'_EVA_TYPE', 00H
	ORG $+2
$SG72929 DB	'%lu.txt', 00H
$SG72938 DB	'dump.txt', 00H
	ORG $+3
$SG72939 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72940 DB	'ctrl_add_output_stats', 00H
	ORG $+2
$SG72943 DB	09H, 00H
	ORG $+2
$SG72944 DB	'DataFile', 09H, 00H
	ORG $+2
$SG72946 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72948 DB	0aH, 00H
	ORG $+2
$SG72951 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72955 DB	'<li>Mise au format Office</li>', 0aH, 00H
$SG72957 DB	'TableStats.xls', 00H
	ORG $+1
$SG72958 DB	'_EVA_EXCEL', 00H
	ORG $+1
$SG72959 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG72960 DB	'ctrl_add_output_stats', 00H
	ORG $+2
$SG72961 DB	'TableStatsRes.xls', 00H
	ORG $+2
$SG72962 DB	'TableStats.xls', 00H
	ORG $+1
$SG72963 DB	'dumpfmt.txt', 00H
$SG72965 DB	'Rapport statistique', 00H
$SG72966 DB	'%s-%s', 00H
	ORG $+2
$SG72968 DB	'Tableau statistique', 00H
$SG72969 DB	'%s-%s', 00H
	ORG $+2
$SG72972 DB	'<hr>', 00H
	ORG $+3
$SG72974 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72978 DB	'Erreur dans Microsoft Excel - le fichier n''a pas pu ', 0eaH
	DB	'tre produit au format Office<br><br>Vous pouvez t', 0e9H, 'l', 0e9H
	DB	'charger le fichier au format HTML et l''ouvrir avec un tableu'
	DB	'r sur votre poste<br><br>', 00H
	ORG $+1
$SG72980 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG72981 DB	'TableStatsRes.xls', 00H
	ORG $+2
$SG72983 DB	'%s.doc', 00H
	ORG $+1
$SG72984 DB	'TableStatsRes.doc', 00H
	ORG $+2
$SG72988 DB	'#user', 00H
	ORG $+2
$SG72989 DB	'<b><u>Fichier document</u></b> : ', 00H
	ORG $+2
$SG72990 DB	'%s.xls', 00H
	ORG $+1
$SG72991 DB	'TableStatsRes.xls', 00H
	ORG $+2
$SG72995 DB	'#user', 00H
	ORG $+2
$SG72996 DB	'<b><u>Fichier tableur</u></b> : ', 00H
	ORG $+3
$SG72999 DB	'<br><br>', 00H
	ORG $+3
$SG73001 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73006 DB	'_EVA_0x1', 00H
	ORG $+3
$SG73009 DB	'_EVA_STATS_FORM', 00H
$SG73013 DB	'_EVA_PVT_LIST', 00H
	ORG $+2
$SG73017 DB	'_EVA_PVT_LIST', 00H
	ORG $+2
$SG73019 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG73022 DB	'_EVA_DISPMODE', 00H
	ORG $+2
$SG73033 DB	'_EVA_CURRENTOBJ', 00H
$SG73036 DB	'_EVA_SELOBJ_FIELD', 00H
	ORG $+2
$SG73039 DB	'.-([', 00H
	ORG $+3
$SG73055 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG73056 DB	'ctrl_add_output_stats', 00H
	ORG $+2
$SG73058 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_stat'
	DB	's.c', 00H
$SG73059 DB	'ctrl_add_output_stats', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -94292
_idlist$ = -94288
_objdata$ = -36
_pv$ = -94268
_stats_type$ = -12
_sql_trace$ = -8
_btn$ = -16
_fname$72889 = -98388
_sz_fname$72890 = -102540
_filename$72891 = -102524
_sz_filename$72892 = -102532
_htmname$72893 = -106636
_fs$72894 = -98424
_i$72895 = -102528
_b_err$72896 = -98428
_lbl$72897 = -102536
_idobj$72912 = -106640
_tmp$72927 = -106724
_filename$72928 = -106704
_i$73014 = -106728
_c$73034 = -106732
_ctrl_add_output_stats PROC NEAR

; 1991 : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 106776				; 0001a118H
	call	__chkstk
	push	edi

; 1992 : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 1993 : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 1994 : 	DynTable idlist = { 0 };

	mov	DWORD PTR _idlist$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _idlist$[ebp+4], edx
	mov	DWORD PTR _idlist$[ebp+8], edx
	mov	DWORD PTR _idlist$[ebp+12], edx
	mov	DWORD PTR _idlist$[ebp+16], edx

; 1995 : 	DynTable objdata = { 0 };

	mov	DWORD PTR _objdata$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _objdata$[ebp+4], eax
	mov	DWORD PTR _objdata$[ebp+8], eax
	mov	DWORD PTR _objdata$[ebp+12], eax
	mov	DWORD PTR _objdata$[ebp+16], eax

; 1996 : 	PivotTable pv = {0};

	mov	DWORD PTR _pv$[ebp], 0
	mov	ecx, 23557				; 00005c05H
	xor	eax, eax
	lea	edi, DWORD PTR _pv$[ebp+4]
	rep stosd

; 1997 : 	char *stats_type = CTRL_ATTR_VAL(STATS_TYPE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73406
	push	0
	push	-1
	push	OFFSET FLAT:$SG72873
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -106736+[ebp], eax
	jmp	SHORT $L73407
$L73406:
	mov	DWORD PTR -106736+[ebp], OFFSET FLAT:$SG72874
$L73407:
	mov	edx, DWORD PTR -106736+[ebp]
	mov	DWORD PTR _stats_type$[ebp], edx

; 1998 : 	int sql_trace = cntxt->sql_trace;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29852]
	mov	DWORD PTR _sql_trace$[ebp], ecx

; 1999 : 	char *btn = i_ctrl == form->i_ctrl_clic ? CGI_CLICK_BTN_SUBFIELD : "";

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	cmp	eax, DWORD PTR [edx+124]
	jne	$L73410
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29648], 0
	je	SHORT $L73408
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 66					; 00000042H
	jne	SHORT $L73408
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	cmp	DWORD PTR [edx+eax+32], 0
	je	SHORT $L73408
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx+32]
	mov	DWORD PTR -106740+[ebp], ecx
	jmp	SHORT $L73409
$L73408:
	mov	DWORD PTR -106740+[ebp], OFFSET FLAT:$SG72877
$L73409:
	mov	edx, DWORD PTR -106740+[ebp]
	mov	DWORD PTR -106744+[ebp], edx
	jmp	SHORT $L73411
$L73410:
	mov	DWORD PTR -106744+[ebp], OFFSET FLAT:$SG72878
$L73411:
	mov	eax, DWORD PTR -106744+[ebp]
	mov	DWORD PTR _btn$[ebp], eax

; 2000 : 
; 2001 : 	switch(form->step)
; 2002 : 	{

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+176]
	mov	DWORD PTR -106748+[ebp], edx
	cmp	DWORD PTR -106748+[ebp], 7
	ja	$L73053
	mov	eax, DWORD PTR -106748+[ebp]
	jmp	DWORD PTR $L73426[eax*4]
$L72883:

; 2003 : 	case CtrlRead:
; 2004 : 		/* Ignore field name */
; 2005 : 		ctrl->FIELD = "";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+280], OFFSET FLAT:$SG72884

; 2006 : 		if(cgi_build_basename(cntxt, &ctrl->cginame, i_ctrl, 'D')) STACK_ERROR;

	push	68					; 00000044H
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_build_basename
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72885
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2006		; 000007d6H
	jmp	$eva_err$72886
$L72885:

; 2007 : 
; 2008 : 		/* Handle click on 'Export' buttons */
; 2009 : 		if(!strncmp(btn, add_sz_str("EXPORTPVT=")))

	push	10					; 0000000aH
	push	OFFSET FLAT:$SG72888
	mov	eax, DWORD PTR _btn$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L72887

; 2011 : 			char fname[4096] = {0}; size_t sz_fname;

	mov	BYTE PTR _fname$72889[ebp], 0
	mov	ecx, 1023				; 000003ffH
	xor	eax, eax
	lea	edi, DWORD PTR _fname$72889[ebp+1]
	rep stosd
	stosw
	stosb

; 2012 : 			char filename[4096] = {0}; size_t sz_filename;

	mov	BYTE PTR _filename$72891[ebp], 0
	mov	ecx, 1023				; 000003ffH
	xor	eax, eax
	lea	edi, DWORD PTR _filename$72891[ebp+1]
	rep stosd
	stosw
	stosb

; 2013 : 			char htmname[4096] = {0};

	mov	BYTE PTR _htmname$72893[ebp], 0
	mov	ecx, 1023				; 000003ffH
	xor	eax, eax
	lea	edi, DWORD PTR _htmname$72893[ebp+1]
	rep stosd
	stosw
	stosb

; 2014 : 			struct stat fs = {0};

	mov	DWORD PTR _fs$72894[ebp], 0
	mov	ecx, 8
	xor	eax, eax
	lea	edi, DWORD PTR _fs$72894[ebp+4]
	rep stosd

; 2015 : 			unsigned long i;
; 2016 : 			int b_err;
; 2017 : 			char *lbl = DYNTAB_FIELD_VAL(&form->objdata, LABEL);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72898
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 52					; 00000034H
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _lbl$72897[ebp], eax

; 2018 : 
; 2019 : 			/* Read list of tables to output */
; 2020 : 			if(chdir_user_doc(cntxt)) STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_chdir_user_doc
	add	esp, 4
	test	eax, eax
	je	SHORT $L72899
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2020		; 000007e4H
	jmp	$eva_err$72886
$L72899:

; 2021 : 			remove("dumpfmt.txt");

	push	OFFSET FLAT:$SG72900
	call	_remove
	add	esp, 4

; 2022 : 			btn += 10;

	mov	ecx, DWORD PTR _btn$[ebp]
	add	ecx, 10					; 0000000aH
	mov	DWORD PTR _btn$[ebp], ecx

; 2023 : 			if(dyntab_from_list(&idlist, btn, strlen(btn), ",", 0, 0)) RETURN_ERR_MEMORY;

	push	0
	push	0
	push	OFFSET FLAT:$SG72902
	mov	edx, DWORD PTR _btn$[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _btn$[ebp]
	push	eax
	lea	ecx, DWORD PTR _idlist$[ebp]
	push	ecx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72901
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72904
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2023		; 000007e7H
	jmp	$eva_err$72886
$L72901:

; 2024 : 
; 2025 : 			/* Output page header */
; 2026 : 			put_html_page_header(cntxt, NULL, NULL, NULL, 3);

	push	3
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 2027 : 			printf(
; 2028 : 				"<font face=Arial><hr><center>"
; 2029 : 				"<b>Export de données statistiques - %s</b></center><hr>", lbl);

	mov	edx, DWORD PTR _lbl$72897[ebp]
	push	edx
	push	OFFSET FLAT:$SG72908
	call	_printf
	add	esp, 8

; 2030 : 
; 2031 : 			/* Loop on each table to output */
; 2032 : 			for(i = 0; i < idlist.nbrows; i++)

	mov	DWORD PTR _i$72895[ebp], 0
	jmp	SHORT $L72909
$L72910:
	mov	eax, DWORD PTR _i$72895[ebp]
	add	eax, 1
	mov	DWORD PTR _i$72895[ebp], eax
$L72909:
	mov	ecx, DWORD PTR _i$72895[ebp]
	cmp	ecx, DWORD PTR _idlist$[ebp]
	jae	$L72911

; 2034 : 				/* Read pivot table definition */
; 2035 : 				unsigned long idobj = DYNTAB_TOULRC(&idlist, i, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$72895[ebp]
	push	edx
	lea	eax, DWORD PTR _idlist$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$72912[ebp], eax

; 2036 : 				if(idobj == DYNTAB_TOUL(&form->id_obj))

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	cmp	DWORD PTR _idobj$72912[ebp], eax
	jne	SHORT $L72915

; 2038 : 					if(get_current_obj_field_data(cntxt, NULL, &objdata, NULL)) STACK_ERROR;

	push	0
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_get_current_obj_field_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72918
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2038		; 000007f6H
	jmp	$eva_err$72886
$L72918:

; 2040 : 				else

	jmp	SHORT $L72921
$L72915:

; 2042 : 					if(qry_obj_field(cntxt, &objdata, idobj, NULL)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _idobj$72912[ebp]
	push	edx
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72921
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2042		; 000007faH
	jmp	$eva_err$72886
$L72921:

; 2044 : 
; 2045 : 				/* Output status message */
; 2046 : 				printf("<li>%lu / %lu : %s</li>\n", i + 1, idlist.nbrows, DYNTAB_FIELD_VAL(&objdata, LABEL)); fflush(stdout);

	push	0
	push	-1
	push	OFFSET FLAT:$SG72922
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	mov	ecx, DWORD PTR _idlist$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$72895[ebp]
	add	edx, 1
	push	edx
	push	OFFSET FLAT:$SG72923
	call	_printf
	add	esp, 16					; 00000010H
	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 2047 : 
; 2048 : 				/* Handle table type */
; 2049 : 				if(!strcmp(DYNTAB_FIELD_VAL(&objdata, TYPE), "_EVA_LIST_SIMPLE"))

	push	OFFSET FLAT:$SG72925
	push	0
	push	-1
	push	OFFSET FLAT:$SG72926
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L72924

; 2051 : 					/* Export list contents */
; 2052 : 					DynTable tmp = {0};

	mov	DWORD PTR _tmp$72927[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _tmp$72927[ebp+4], ecx
	mov	DWORD PTR _tmp$72927[ebp+8], ecx
	mov	DWORD PTR _tmp$72927[ebp+12], ecx
	mov	DWORD PTR _tmp$72927[ebp+16], ecx

; 2053 : 					char filename[64];
; 2054 : 					snprintf(add_sz_str(filename), "%lu.txt", idobj);

	mov	edx, DWORD PTR _idobj$72912[ebp]
	push	edx
	push	OFFSET FLAT:$SG72929
	push	63					; 0000003fH
	lea	eax, DWORD PTR _filename$72928[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H

; 2055 : 					memcpy(&tmp, &ctrl->attr, sizeof(tmp));

	push	20					; 00000014H
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	lea	edx, DWORD PTR _tmp$72927[ebp]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH

; 2056 : 					memcpy(&ctrl->attr, &objdata, sizeof(tmp));

	push	20					; 00000014H
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_memcpy
	add	esp, 12					; 0000000cH

; 2057 : 					if(table_read_controls(cntxt, i_ctrl, NULL) ) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_read_controls
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72931
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2057		; 00000809H
	jmp	$eva_err$72886
$L72931:

; 2058 : 					if(table_init_obj_list(cntxt, i_ctrl, NULL)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_init_obj_list
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72933
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2058		; 0000080aH
	jmp	$eva_err$72886
$L72933:

; 2059 : 					ctrl->objtbl->line = 0;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR [eax+40], 0

; 2060 : 					ctrl->objtbl->lines = ctrl->objtbl->totlines;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	mov	edx, DWORD PTR [edx+52]
	mov	DWORD PTR [ecx+44], edx

; 2061 : 					if(table_read_obj_list(cntxt, i_ctrl, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_read_obj_list
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72934
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2061		; 0000080dH
	jmp	$eva_err$72886
$L72934:

; 2062 : 					if(table_prepare_rows(cntxt, i_ctrl, "")) STACK_ERROR;

	push	OFFSET FLAT:$SG72936
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_prepare_rows
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72935
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2062		; 0000080eH
	jmp	$eva_err$72886
$L72935:

; 2063 : 					if(file_write_tabrc(cntxt, &ctrl->objtbl->cellval, "dump.txt")) CLEAR_ERROR;

	push	OFFSET FLAT:$SG72938
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	add	ecx, 240				; 000000f0H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_file_write_tabrc
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72937
	push	2063					; 0000080fH
	push	OFFSET FLAT:$SG72939
	push	OFFSET FLAT:$SG72940
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L72937:

; 2064 : 					memcpy(&ctrl->attr, &tmp, sizeof(tmp));

	push	20					; 00000014H
	lea	ecx, DWORD PTR _tmp$72927[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH

; 2065 : 					table_free(ctrl->objtbl);

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_table_free
	add	esp, 4

; 2066 : 					M_FREE(ctrl->objtbl);

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+232], 0

; 2067 : 					DYNBUF_ADD3(&pv.exportparams, "DataFile\t", filename, 0, NO_CONV, "\t");

	push	1
	push	OFFSET FLAT:$SG72943
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _filename$72928[ebp]
	push	edx
	push	9
	push	OFFSET FLAT:$SG72944
	lea	eax, DWORD PTR _pv$[ebp+94136]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L72942
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72946
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2067		; 00000813H
	jmp	$eva_err$72886
$L72942:

; 2068 : 					DYNBUF_ADD3_INT(&pv.exportparams, "", pv.srcdata->cell->IdObj, "\n");

	push	1
	push	OFFSET FLAT:$SG72948
	mov	eax, DWORD PTR _pv$[ebp+44]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [ecx+20]
	push	edx
	push	0
	push	OFFSET FLAT:$SG72949
	lea	eax, DWORD PTR _pv$[ebp+94136]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L72947
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG72951
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2068		; 00000814H
	jmp	$eva_err$72886
$L72947:

; 2070 : 				else

	jmp	SHORT $L72954
$L72924:

; 2072 : 					/* Export pivot table contents */
; 2073 : 					pivottable_free(cntxt, &pv);

	lea	eax, DWORD PTR _pv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_pivottable_free
	add	esp, 8

; 2074 : 					if(pvt_load_definition(cntxt, i_ctrl, &pv, &objdata)) STACK_ERROR;

	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	lea	eax, DWORD PTR _pv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pvt_load_definition
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L72953
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2074		; 0000081aH
	jmp	$eva_err$72886
$L72953:

; 2075 : 					if(ctrl_export_pivottable(cntxt, i_ctrl, htmname, &pv, &objdata)) STACK_ERROR;

	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	lea	edx, DWORD PTR _pv$[ebp]
	push	edx
	lea	eax, DWORD PTR _htmname$72893[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_export_pivottable
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72954
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2075		; 0000081bH
	jmp	$eva_err$72886
$L72954:

; 2077 : 			}

	jmp	$L72910
$L72911:

; 2078 : 
; 2079 : 			/* Launch excel file preparation */
; 2080 : 			printf("<li>Mise au format Office</li>\n"); fflush(stdout);

	push	OFFSET FLAT:$SG72955
	call	_printf
	add	esp, 4
	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4

; 2081 : 			if(office_launchproc(cntxt, "_EVA_EXCEL", "TableStats.xls")) CLEAR_ERROR;

	push	OFFSET FLAT:$SG72957
	push	OFFSET FLAT:$SG72958
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_office_launchproc
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L72956
	push	2081					; 00000821H
	push	OFFSET FLAT:$SG72959
	push	OFFSET FLAT:$SG72960
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L72956:

; 2082 : 
; 2083 : 			/* Prepare file name & cleanup temp files */
; 2084 : 			b_err = stat("TableStatsRes.xls", &fs);

	lea	eax, DWORD PTR _fs$72894[ebp]
	push	eax
	push	OFFSET FLAT:$SG72961
	call	_stat
	add	esp, 8
	mov	DWORD PTR _b_err$72896[ebp], eax

; 2085 : 			remove("TableStats.xls");

	push	OFFSET FLAT:$SG72962
	call	_remove
	add	esp, 4

; 2086 : 			remove("dumpfmt.txt");

	push	OFFSET FLAT:$SG72963
	call	_remove
	add	esp, 4

; 2087 : 			if(idlist.nbrows > 1)

	cmp	DWORD PTR _idlist$[ebp], 1
	jbe	$L72964

; 2088 : 				sz_fname = snprintf(add_sz_str(fname), "%s-%s", cntxt->dbname, *lbl ? lbl : ctrl->LABEL[0] ? ctrl->LABEL : "Rapport statistique");

	mov	ecx, DWORD PTR _lbl$72897[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L73414
	mov	eax, DWORD PTR _lbl$72897[ebp]
	mov	DWORD PTR -106752+[ebp], eax
	jmp	SHORT $L73415
$L73414:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L73412
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	mov	DWORD PTR -106756+[ebp], edx
	jmp	SHORT $L73413
$L73412:
	mov	DWORD PTR -106756+[ebp], OFFSET FLAT:$SG72965
$L73413:
	mov	eax, DWORD PTR -106756+[ebp]
	mov	DWORD PTR -106752+[ebp], eax
$L73415:
	mov	ecx, DWORD PTR -106752+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29804]
	push	eax
	push	OFFSET FLAT:$SG72966
	push	4095					; 00000fffH
	lea	ecx, DWORD PTR _fname$72889[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H
	mov	DWORD PTR _sz_fname$72890[ebp], eax

; 2089 : 			else

	jmp	SHORT $L72967
$L72964:

; 2090 : 				sz_fname = snprintf(add_sz_str(fname), "%s-%s", cntxt->dbname, pv.label ? pv.label : "Tableau statistique");

	cmp	DWORD PTR _pv$[ebp], 0
	je	SHORT $L73416
	mov	edx, DWORD PTR _pv$[ebp]
	mov	DWORD PTR -106760+[ebp], edx
	jmp	SHORT $L73417
$L73416:
	mov	DWORD PTR -106760+[ebp], OFFSET FLAT:$SG72968
$L73417:
	mov	eax, DWORD PTR -106760+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29804]
	push	edx
	push	OFFSET FLAT:$SG72969
	push	4095					; 00000fffH
	lea	eax, DWORD PTR _fname$72889[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H
	mov	DWORD PTR _sz_fname$72890[ebp], eax
$L72967:

; 2091 : 
; 2092 : 			DYNBUF_ADD_STR(&cntxt->html, "<hr>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG72972
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29784				; 00007458H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72971
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72974
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2092		; 0000082cH
	jmp	$eva_err$72886
$L72971:

; 2093 : 
; 2094 : 			/* Output error message if applicable */
; 2095 : 			if(b_err)

	cmp	DWORD PTR _b_err$72896[ebp], 0
	je	SHORT $L72975

; 2098 : 					"Erreur dans Microsoft Excel - le fichier n'a pas pu être produit au format Office<br><br>"
; 2099 : 					"Vous pouvez télécharger le fichier au format HTML et l'ouvrir avec un tableur sur votre poste<br><br>");

	push	0
	push	0
	push	190					; 000000beH
	push	OFFSET FLAT:$SG72978
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29784				; 00007458H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72977
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG72980
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2099		; 00000833H
	jmp	$eva_err$72886
$L72977:

; 2100 : 				rename(htmname, "TableStatsRes.xls");

	push	OFFSET FLAT:$SG72981
	lea	ecx, DWORD PTR _htmname$72893[ebp]
	push	ecx
	call	_rename
	add	esp, 8
$L72975:

; 2102 : 			remove(htmname);

	lea	edx, DWORD PTR _htmname$72893[ebp]
	push	edx
	call	_remove
	add	esp, 4

; 2103 : 
; 2104 : 			/* Output download dialog for word file if applicable */
; 2105 : 			if(idlist.nbrows > 1)

	cmp	DWORD PTR _idlist$[ebp], 1
	jbe	$L72987

; 2107 : 				sprintf(filename, "%s.doc", fname);

	lea	eax, DWORD PTR _fname$72889[ebp]
	push	eax
	push	OFFSET FLAT:$SG72983
	lea	ecx, DWORD PTR _filename$72891[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 2108 : 				sz_filename = file_compatible_name(filename);

	lea	edx, DWORD PTR _filename$72891[ebp]
	push	edx
	call	_file_compatible_name
	add	esp, 4
	mov	DWORD PTR _sz_filename$72892[ebp], eax

; 2109 : 				remove(filename);

	lea	eax, DWORD PTR _filename$72891[ebp]
	push	eax
	call	_remove
	add	esp, 4

; 2110 : 				rename("TableStatsRes.doc", filename);

	lea	ecx, DWORD PTR _filename$72891[ebp]
	push	ecx
	push	OFFSET FLAT:$SG72984
	call	_rename
	add	esp, 8

; 2111 : 				if(file_output_link(cntxt, &cntxt->html,
; 2112 : 							add_sz_str("<b><u>Fichier document</u></b> : "),
; 2113 : 							fname, sz_fname, filename, sz_filename, "#user", NULL, 0, NULL, 0, 3)) STACK_ERROR;

	push	3
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG72988
	mov	edx, DWORD PTR _sz_filename$72892[ebp]
	push	edx
	lea	eax, DWORD PTR _filename$72891[ebp]
	push	eax
	mov	ecx, DWORD PTR _sz_fname$72890[ebp]
	push	ecx
	lea	edx, DWORD PTR _fname$72889[ebp]
	push	edx
	push	33					; 00000021H
	push	OFFSET FLAT:$SG72989
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29784				; 00007458H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_file_output_link
	add	esp, 56					; 00000038H
	test	eax, eax
	je	SHORT $L72987
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2113		; 00000841H
	jmp	$eva_err$72886
$L72987:

; 2115 : 
; 2116 : 			/* Output download dialog for excel file */
; 2117 : 			sprintf(filename, "%s.xls", fname);

	lea	eax, DWORD PTR _fname$72889[ebp]
	push	eax
	push	OFFSET FLAT:$SG72990
	lea	ecx, DWORD PTR _filename$72891[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 2118 : 			sz_filename = file_compatible_name(filename);

	lea	edx, DWORD PTR _filename$72891[ebp]
	push	edx
	call	_file_compatible_name
	add	esp, 4
	mov	DWORD PTR _sz_filename$72892[ebp], eax

; 2119 : 			remove(filename);

	lea	eax, DWORD PTR _filename$72891[ebp]
	push	eax
	call	_remove
	add	esp, 4

; 2120 : 			rename("TableStatsRes.xls", filename);

	lea	ecx, DWORD PTR _filename$72891[ebp]
	push	ecx
	push	OFFSET FLAT:$SG72991
	call	_rename
	add	esp, 8

; 2121 : 			if(file_output_link(cntxt, &cntxt->html,
; 2122 : 						add_sz_str("<b><u>Fichier tableur</u></b> : "),
; 2123 : 						fname, sz_fname, filename, sz_filename, "#user", NULL, 0, NULL, 0,
; 2124 : 						(b_err ? 7 : 6) | (form->b_modified ? 0 : 8))) STACK_ERROR;

	xor	edx, edx
	cmp	DWORD PTR _b_err$72896[ebp], 0
	setne	dl
	add	edx, 6
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	neg	ecx
	sbb	ecx, ecx
	and	ecx, -8					; fffffff8H
	add	ecx, 8
	or	edx, ecx
	push	edx
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG72995
	mov	edx, DWORD PTR _sz_filename$72892[ebp]
	push	edx
	lea	eax, DWORD PTR _filename$72891[ebp]
	push	eax
	mov	ecx, DWORD PTR _sz_fname$72890[ebp]
	push	ecx
	lea	edx, DWORD PTR _fname$72889[ebp]
	push	edx
	push	32					; 00000020H
	push	OFFSET FLAT:$SG72996
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29784				; 00007458H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_file_output_link
	add	esp, 56					; 00000038H
	test	eax, eax
	je	SHORT $L72994
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2124		; 0000084cH
	jmp	$eva_err$72886
$L72994:

; 2125 : 			DYNBUF_ADD_STR(&cntxt->html, "<br><br>");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG72999
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29784				; 00007458H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L72998
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG73001
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2125		; 0000084dH
	jmp	$eva_err$72886
$L72998:

; 2126 : 			cntxt->b_terminate = 15;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29776], 15		; 0000000fH
$L72887:

; 2128 : 		break;

	jmp	$eva_noerr$73054
$L73002:

; 2129 : 
; 2130 : 	case HtmlEdit:
; 2131 : 	case HtmlPrint:
; 2132 : 	case HtmlView:
; 2133 : 		if(!form->html) break;

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+232], 0
	jne	SHORT $L73003
	jmp	$eva_noerr$73054
$L73003:

; 2134 : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73004
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2134		; 00000856H
	jmp	$eva_err$72886
$L73004:

; 2135 : 
; 2136 : 		if(*CTRL_ATTR_VAL(DEBUG_SQL) == '1') cntxt->sql_trace = DEBUG_SQL_RES;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73418
	push	0
	push	-1
	push	OFFSET FLAT:$SG73006
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -106764+[ebp], eax
	jmp	SHORT $L73419
$L73418:
	mov	DWORD PTR -106764+[ebp], OFFSET FLAT:$SG73007
$L73419:
	mov	eax, DWORD PTR -106764+[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L73005
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29852], 2
$L73005:

; 2137 : 
; 2138 : 		/* Call apropriate function for statistics type */
; 2139 : 		if(!strcmp(stats_type, "_EVA_STATS_FORM"))

	push	OFFSET FLAT:$SG73009
	mov	eax, DWORD PTR _stats_type$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L73008

; 2141 : 			if(ctrl_output_stats_fields(cntxt, i_ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_output_stats_fields
	add	esp, 8
	test	eax, eax
	je	SHORT $L73010
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2141		; 0000085dH
	jmp	$eva_err$72886
$L73010:

; 2143 : 		else if(!strcmp(stats_type, "_EVA_PVT_LIST"))

	jmp	$L73051
$L73008:
	push	OFFSET FLAT:$SG73013
	mov	ecx, DWORD PTR _stats_type$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L73012

; 2145 : 			/* Pivot tables list : output tables */
; 2146 : 			unsigned long i;
; 2147 : 			CTRL_ATTR(idlist, PVT_LIST);

	lea	edx, DWORD PTR _idlist$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG73017
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _idlist$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L73016
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG73019
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2147		; 00000863H
	jmp	$eva_err$72886
$L73016:

; 2148 : 
; 2149 : 			/* Handle display mode */
; 2150 : 			if(CTRL_ATTR_CELL(DISPMODE) && idlist.nbrows > 1)

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73420
	push	0
	push	-1
	push	OFFSET FLAT:$SG73022
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -106768+[ebp], eax
	jmp	SHORT $L73421
$L73420:
	mov	DWORD PTR -106768+[ebp], 0
$L73421:
	cmp	DWORD PTR -106768+[ebp], 0
	je	SHORT $L73021
	cmp	DWORD PTR _idlist$[ebp], 1
	jbe	SHORT $L73021

; 2152 : 				/* Selector : call selector display function */
; 2153 : 				if(ctrl_add_pivottable_selector(cntxt, i_ctrl, &idlist)) STACK_ERROR

	lea	edx, DWORD PTR _idlist$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_pivottable_selector
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73023
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2153		; 00000869H
	jmp	$eva_err$72886
$L73023:

; 2155 : 			else

	jmp	$L73027
$L73021:

; 2157 : 				/* No selector : read each pivot table and call display function */
; 2158 : 				for(i = 0; i < idlist.nbrows; i++)

	mov	DWORD PTR _i$73014[ebp], 0
	jmp	SHORT $L73025
$L73026:
	mov	eax, DWORD PTR _i$73014[ebp]
	add	eax, 1
	mov	DWORD PTR _i$73014[ebp], eax
$L73025:
	mov	ecx, DWORD PTR _i$73014[ebp]
	cmp	ecx, DWORD PTR _idlist$[ebp]
	jae	SHORT $L73027

; 2159 : 					if(qry_obj_idfield(cntxt, &objdata, DYNTAB_TOULRC(&idlist, i, 0), 0) ||
; 2160 : 						ctrl_output_pivottable(cntxt, i_ctrl, &objdata)) STACK_ERROR;

	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _i$73014[ebp]
	push	edx
	lea	eax, DWORD PTR _idlist$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L73030
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_output_pivottable
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73029
$L73030:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2160		; 00000870H
	jmp	$eva_err$72886
$L73029:
	jmp	$L73026
$L73027:

; 2163 : 		else if(!strcmp(stats_type, "_EVA_CURRENTOBJ"))

	jmp	$L73051
$L73012:
	push	OFFSET FLAT:$SG73033
	mov	ecx, DWORD PTR _stats_type$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L73032

; 2165 : 			/* Pivot table defined with current object : check for source field */
; 2166 : 			DynTableCell *c = CTRL_ATTR_CELL(SELOBJ_FIELD);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L73422
	push	0
	push	-1
	push	OFFSET FLAT:$SG73036
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -106772+[ebp], eax
	jmp	SHORT $L73423
$L73422:
	mov	DWORD PTR -106772+[ebp], 0
$L73423:
	mov	eax, DWORD PTR -106772+[ebp]
	mov	DWORD PTR _c$73034[ebp], eax

; 2167 : 			if(c && strpbrk(c->txt, ".-([") != NULL)

	cmp	DWORD PTR _c$73034[ebp], 0
	je	$L73038
	push	OFFSET FLAT:$SG73039
	mov	ecx, DWORD PTR _c$73034[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strpbrk
	add	esp, 8
	test	eax, eax
	je	SHORT $L73038

; 2169 : 				if(form_eval_fieldexpr(cntxt, &idlist, 0, 0, c->txt, c->len, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	mov	eax, DWORD PTR _c$73034[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _c$73034[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _idlist$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L73041
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2169		; 00000879H
	jmp	$eva_err$72886
$L73041:

; 2170 : 				if(ctrl_add_pivottable_selector(cntxt, i_ctrl, &idlist)) STACK_ERROR;

	lea	ecx, DWORD PTR _idlist$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_pivottable_selector
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73042
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2170		; 0000087aH
	jmp	$eva_err$72886
$L73042:

; 2172 : 			else

	jmp	$L73049
$L73038:

; 2174 : 				/* Current object : call display function with read data */
; 2175 : 				if(get_current_obj_field_data(cntxt, c ? c->txt : "", &objdata, &idlist)) STACK_ERROR;

	cmp	DWORD PTR _c$73034[ebp], 0
	je	SHORT $L73424
	mov	edx, DWORD PTR _c$73034[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -106776+[ebp], eax
	jmp	SHORT $L73425
$L73424:
	mov	DWORD PTR -106776+[ebp], OFFSET FLAT:$SG73045
$L73425:
	lea	ecx, DWORD PTR _idlist$[ebp]
	push	ecx
	lea	edx, DWORD PTR _objdata$[ebp]
	push	edx
	mov	eax, DWORD PTR -106776+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_get_current_obj_field_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L73044
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2175		; 0000087fH
	jmp	$eva_err$72886
$L73044:

; 2176 : 				if(idlist.nbrows > 1)

	cmp	DWORD PTR _idlist$[ebp], 1
	jbe	SHORT $L73046

; 2178 : 					/* Multiple tables : handle table selection */
; 2179 : 					if(ctrl_add_pivottable_selector(cntxt, i_ctrl, &idlist)) STACK_ERROR;

	lea	eax, DWORD PTR _idlist$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_pivottable_selector
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73047
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 2179		; 00000883H
	jmp	$eva_err$72886
$L73047:

; 2181 : 				else

	jmp	SHORT $L73049
$L73046:

; 2183 : 					/* Single table : call display function with read data */
; 2184 : 					if(ctrl_output_pivottable(cntxt, i_ctrl, &objdata)) STACK_ERROR;

	lea	ecx, DWORD PTR _objdata$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_output_pivottable
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73049
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 2184		; 00000888H
	jmp	SHORT $eva_err$72886
$L73049:

; 2188 : 		else

	jmp	SHORT $L73051
$L73032:

; 2190 : 			/* Pivot table defined with current control : call display function with control attributes */
; 2191 : 			if(ctrl_output_pivottable(cntxt, i_ctrl, &ctrl->attr)) STACK_ERROR;

	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_output_pivottable
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73051
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2191		; 0000088fH
	jmp	SHORT $eva_err$72886
$L73051:

; 2193 : 
; 2194 : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L73053
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 2194		; 00000892H
	jmp	SHORT $eva_err$72886
$L73053:
$eva_noerr$73054:

; 2199 : 
; 2200 : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG73055
	push	OFFSET FLAT:$SG73056
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$72886:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L73057
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG73058
	push	OFFSET FLAT:$SG73059
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L73057:
	lea	edx, DWORD PTR _idlist$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _objdata$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _pv$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_pivottable_free
	add	esp, 8
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [eax+29852], ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 2201 : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
$L73426:
	DD	$L72883
	DD	$L73053
	DD	$L73053
	DD	$L73053
	DD	$L73002
	DD	$L73053
	DD	$L73002
	DD	$L73002
_ctrl_add_output_stats ENDP
_TEXT	ENDS
END
