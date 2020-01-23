	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\err_utils.c
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
PUBLIC	_err_add_context
EXTRN	_basename:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_dyntab_add:NEAR
_DATA	SEGMENT
$SG70213 DB	'%s - %s:%d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_function$ = 12
_file$ = 16
_line$ = 20
_tmp$ = -1024
_err_add_context PROC NEAR

; 26   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1024				; 00000400H

; 27   : 	char tmp[1024];
; 28   : 
; 29   : 	dyntab_add(&cntxt->err.stack, cntxt->err.stack.nbrows, 0,
; 30   : 				tmp,
; 31   : 				snprintf(tmp, sizeof(tmp), "%s - %s:%d", function, basename(file, 0), line),
; 32   : 				NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _file$[ebp]
	push	ecx
	call	_basename
	add	esp, 8
	push	eax
	mov	edx, DWORD PTR _function$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70213
	push	1024					; 00000400H
	lea	eax, DWORD PTR _tmp$[ebp]
	push	eax
	call	__snprintf
	add	esp, 24					; 00000018H
	push	eax
	lea	ecx, DWORD PTR _tmp$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29880]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29880				; 000074b8H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH

; 33   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_err_add_context ENDP
_TEXT	ENDS
PUBLIC	_err_clear
PUBLIC	_err_save_context
EXTRN	_mem_free:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_dynbuf_add:NEAR
EXTRN	_dyntab_free:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70226 DB	'<table width=100% border=1 rules=none><tr><td bgcolor=#D'
	DB	'DDDDD>*** Warning : ', 00H
	ORG $+3
$SG70228 DB	'</td></tr><tr><td><font size=-1>', 00H
	ORG $+3
$SG70230 DB	'</font></td></tr></table>', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_function$ = 12
_file$ = 16
_line$ = 20
_err_clear PROC NEAR

; 44   : ){

	push	ebp
	mov	ebp, esp

; 45   : 	/* Save error context */
; 46   : 	if(cntxt->err.text)

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	$L70223

; 48   : 		if(function) err_add_context(cntxt, function, file, line);

	cmp	DWORD PTR _function$[ebp], 0
	je	SHORT $L70224
	mov	ecx, DWORD PTR _line$[ebp]
	push	ecx
	mov	edx, DWORD PTR _file$[ebp]
	push	edx
	mov	eax, DWORD PTR _function$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70224:

; 49   : 		dynbuf_add(&cntxt->debug_html, add_sz_str(
; 50   : 			"<table width=100% border=1 rules=none><tr><td bgcolor=#DDDDDD>*** Warning : "), NO_CONV);

	push	0
	push	0
	push	76					; 0000004cH
	push	OFFSET FLAT:$SG70226
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29868				; 000074acH
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 51   : 		dynbuf_add(&cntxt->debug_html, cntxt->err.text, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29872]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29868				; 000074acH
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 52   : 		dynbuf_add(&cntxt->debug_html, add_sz_str("</td></tr><tr><td><font size=-1>"), NO_CONV);

	push	0
	push	0
	push	32					; 00000020H
	push	OFFSET FLAT:$SG70228
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29868				; 000074acH
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 53   : 		err_save_context(cntxt);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_save_context
	add	esp, 4

; 54   : 		dynbuf_add(&cntxt->debug_html, add_sz_str("</font></td></tr></table>"), NO_CONV);

	push	0
	push	0
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70230
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29868				; 000074acH
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70223:

; 56   : 
; 57   : 	/* Clear error data */
; 58   : 	cntxt->err.text = NULL;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], 0

; 59   : 	M_FREE(cntxt->err.detail);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29876]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29876], 0

; 60   : 	DYNTAB_FREE(cntxt->err.stack);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29880				; 000074b8H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 61   : }

	pop	ebp
	ret	0
_err_clear ENDP
_TEXT	ENDS
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70240 DB	'Form : ', 00H
$SG70242 DB	'<br>', 00H
	ORG $+3
$SG70245 DB	'Control : ', 00H
	ORG $+1
$SG70247 DB	'<br>', 00H
	ORG $+3
$SG70254 DB	'<table cellspacing=0 cellpadding=0 bgcolor=#DDDDDD width'
	DB	'=100% border=0><tr>', 0aH, '<td>', 00H
	ORG $+3
$SG70256 DB	'</td>', 0aH, '</tr></table>', 00H
$SG70259 DB	'<br><b><u>Debug info</u></b><br><pre>', 00H
	ORG $+2
$SG70263 DB	'</pre></td>', 0aH, '</tr></table>', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i$ = -8
_form$ = -4
_err_save_context PROC NEAR

; 68   : {

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 69   : 	unsigned long i;
; 70   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 71   : 	if(!cntxt->err.text) return;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	jne	SHORT $L70237
	jmp	$L70234
$L70237:

; 72   : 	if(form && form->ctrl)

	cmp	DWORD PTR _form$[ebp], 0
	je	$L70243
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L70243

; 74   : 		dynbuf_add(&cntxt->debug_html, add_sz_str("Form : "), NO_CONV);

	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70240
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29868				; 000074acH
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 75   : 		dynbuf_add(&cntxt->debug_html, form->ctrl->LABEL, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29868				; 000074acH
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 76   : 		dynbuf_add(&cntxt->debug_html, add_sz_str("<br>"), NO_CONV);

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70242
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29868				; 000074acH
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 77   : 		if(form->i_ctrl && form->i_ctrl < form->nb_ctrl)

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+8], 0
	je	SHORT $L70243
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [edx+8]
	cmp	ecx, DWORD PTR [eax+4]
	jae	SHORT $L70243

; 79   : 			dynbuf_add(&cntxt->debug_html, add_sz_str("Control : "), NO_CONV);

	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70245
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29868				; 000074acH
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 80   : 			dynbuf_add(&cntxt->debug_html, form->ctrl[form->i_ctrl].LABEL, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+ecx+284]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29868				; 000074acH
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 81   : 			dynbuf_add(&cntxt->debug_html, add_sz_str("<br>"), NO_CONV);

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70247
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29868				; 000074acH
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70243:

; 84   : 	if(cntxt->err.detail) dynbuf_add(&cntxt->debug_html, DYNBUF_VAL_SZ(cntxt->err.detail), TO_HTML);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29876], 0
	je	SHORT $L70248
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29876], 0
	je	SHORT $L70564
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29876]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -12+[ebp], edx
	jmp	SHORT $L70565
$L70564:
	mov	DWORD PTR -12+[ebp], 0
$L70565:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29876], 0
	je	SHORT $L70566
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29876]
	add	edx, 8
	mov	DWORD PTR -16+[ebp], edx
	jmp	SHORT $L70567
$L70566:
	mov	DWORD PTR -16+[ebp], 0
$L70567:
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	eax, DWORD PTR -12+[ebp]
	push	eax
	mov	ecx, DWORD PTR -16+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29868				; 000074acH
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70248:

; 85   : 	for(i = 0; i < cntxt->err.stack.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70250
$L70251:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70250:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+29880]
	jae	$L70252

; 87   : 		dynbuf_add(&cntxt->debug_html, add_sz_str(
; 88   : 			"<table cellspacing=0 cellpadding=0 bgcolor=#DDDDDD width=100% border=0><tr>\n<td>"), NO_CONV);

	push	0
	push	0
	push	80					; 00000050H
	push	OFFSET FLAT:$SG70254
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29868				; 000074acH
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 89   : 		dynbuf_add(&cntxt->debug_html, DYNTAB_VAL_SZ(&cntxt->err.stack, i, 0), TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29880				; 000074b8H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29880				; 000074b8H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29868				; 000074acH
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 90   : 		dynbuf_add(&cntxt->debug_html, add_sz_str(
; 91   : 			"</td>\n</tr></table>"), NO_CONV);

	push	0
	push	0
	push	19					; 00000013H
	push	OFFSET FLAT:$SG70256
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29868				; 000074acH
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 92   : 	}

	jmp	$L70251
$L70252:

; 93   : 	if(cntxt->debug_msg)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29864], 0
	je	$L70257

; 95   : 		dynbuf_add(&cntxt->debug_html, add_sz_str(
; 96   : 			"<br><b><u>Debug info</u></b><br><pre>"), NO_CONV);

	push	0
	push	0
	push	37					; 00000025H
	push	OFFSET FLAT:$SG70259
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29868				; 000074acH
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 97   : 		dynbuf_add(&cntxt->debug_html, DYNBUF_VAL_SZ(cntxt->debug_msg), NO_CONV);

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29864], 0
	je	SHORT $L70568
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29864]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -20+[ebp], eax
	jmp	SHORT $L70569
$L70568:
	mov	DWORD PTR -20+[ebp], 0
$L70569:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29864], 0
	je	SHORT $L70570
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29864]
	add	eax, 8
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L70571
$L70570:
	mov	DWORD PTR -24+[ebp], 0
$L70571:
	push	0
	push	0
	mov	ecx, DWORD PTR -20+[ebp]
	push	ecx
	mov	edx, DWORD PTR -24+[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29868				; 000074acH
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 98   : 		dynbuf_add(&cntxt->debug_html, add_sz_str(
; 99   : 			"</pre></td>\n</tr></table>"), NO_CONV);

	push	0
	push	0
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70263
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29868				; 000074acH
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70257:

; 101  : 	M_FREE(cntxt->debug_msg);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29864]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29864], 0
$L70234:

; 102  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_err_save_context ENDP
_TEXT	ENDS
PUBLIC	_put_html_error
PUBLIC	_put_debug_msg
PUBLIC	_debug_put_info
EXTRN	_getpid:NEAR
EXTRN	__iob:BYTE
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fprintf:NEAR
EXTRN	_printf:NEAR
EXTRN	_file_compatible_name:NEAR
EXTRN	_time:NEAR
EXTRN	_free:NEAR
EXTRN	_chdir:NEAR
EXTRN	_getcwd:NEAR
EXTRN	_mkdir:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70272 DB	'%s-%lu-%lu.htm', 00H
	ORG $+1
$SG70273 DB	'<font face=Arial><hr><b><font size=+3>Erreur du serveur<'
	DB	'/font> : %s</b><hr>', 0aH, 00H
	ORG $+3
$SG70274 DB	'<br><p align=center>Le programme n''a pas pu ex', 0e9H, 'c'
	DB	'uter votre commande.<br>', 0aH, '<br>Retournez ', 0e0H, ' la '
	DB	'page pr', 0e9H, 'c', 0e9H, 'dente avec le bouton ou le menu d'
	DB	'e votre navigateur et essayez une autre commande.<br>', 0aH, '<'
	DB	'br>Contactez le <a href=''mailto:alain.boute@abing.fr?subject'
	DB	'=%s''>responsable du site</a> si cette erreur est bloquante ('
	DB	'conservez le titre du message).<br>', 0aH, '<br>Vous pouvez c'
	DB	'onsulter des <a href=''../errlog/%s''>informations d', 0e9H, 't'
	DB	'aill', 0e9H, 'es sur l''erreur</a> (pour les d', 0e9H, 'velop'
	DB	'peurs)<br>', 0aH, '</p>', 0aH, 00H
	ORG $+2
$SG70275 DB	'errlog', 00H
	ORG $+1
$SG70276 DB	'errlog', 00H
	ORG $+1
$SG70277 DB	'w', 00H
	ORG $+2
$SG70280 DB	'<font face=Arial><hr><b><font size=+3>Erreur du serveur<'
	DB	'/font> : %s</b><hr>', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_f$ = -4
_wd$ = -8
_put_html_error PROC NEAR

; 109  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 110  : 	FILE *f;
; 111  : 	char *wd = getcwd(NULL, 0);

	push	0
	push	0
	call	_getcwd
	add	esp, 8
	mov	DWORD PTR _wd$[ebp], eax

; 112  : 
; 113  : 	/* Build errlog file name */
; 114  : 	snprintf(cntxt->err.file, sizeof(cntxt->err.file), "%s-%lu-%lu.htm", cntxt->err.text, time(NULL), (long unsigned int)getpid());

	call	_getpid
	push	eax
	push	0
	call	_time
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29872]
	push	ecx
	push	OFFSET FLAT:$SG70272
	push	2048					; 00000800H
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29904				; 000074d0H
	push	edx
	call	__snprintf
	add	esp, 24					; 00000018H

; 115  : 	file_compatible_name(cntxt->err.file);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29904				; 000074d0H
	push	eax
	call	_file_compatible_name
	add	esp, 4

; 116  : 
; 117  : 	/* Output error message */
; 118  : 	cntxt->txsize += printf("<font face=Arial><hr><b><font size=+3>Erreur du serveur</font> : %s</b><hr>\n", cntxt->err.text);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29872]
	push	edx
	push	OFFSET FLAT:$SG70273
	call	_printf
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx

; 119  : 	cntxt->txsize += printf("<br><p align=center>Le programme n'a pas pu exécuter votre commande.<br>\n"
; 120  : 		"<br>Retournez à la page précédente avec le bouton ou le menu de votre navigateur et essayez une autre commande.<br>\n"
; 121  : 		"<br>Contactez le <a href='mailto:alain.boute@abing.fr?subject=%s'>responsable du site</a> "
; 122  : 		"si cette erreur est bloquante (conservez le titre du message).<br>\n"
; 123  : 		"<br>Vous pouvez consulter des <a href='../errlog/%s'>informations détaillées sur l'erreur</a> (pour les développeurs)<br>\n"
; 124  : 		"</p>\n", cntxt->err.file, cntxt->err.file);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29904				; 000074d0H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29904				; 000074d0H
	push	edx
	push	OFFSET FLAT:$SG70274
	call	_printf
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+32036]
	add	edx, eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+32036], edx

; 125  : 
; 126  : 	/* Open file in errlog directory */
; 127  : 	chdir(cntxt->rootdir);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29724]
	push	edx
	call	_chdir
	add	esp, 4

; 128  : 	MKDIR("errlog");

	push	OFFSET FLAT:$SG70275
	call	_mkdir
	add	esp, 4

; 129  : 	chdir("errlog");

	push	OFFSET FLAT:$SG70276
	call	_chdir
	add	esp, 4

; 130  : 	f = fopen(cntxt->err.file, "w");

	push	OFFSET FLAT:$SG70277
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29904				; 000074d0H
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 131  : 	if(!f)

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L70278

; 133  : 		f = stdout;

	mov	DWORD PTR _f$[ebp], OFFSET FLAT:__iob+32

; 134  : 		*cntxt->err.file = 0;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	BYTE PTR [ecx+29904], 0
$L70278:

; 136  : 	if(wd)

	cmp	DWORD PTR _wd$[ebp], 0
	je	SHORT $L70279

; 138  : 		chdir(wd);

	mov	edx, DWORD PTR _wd$[ebp]
	push	edx
	call	_chdir
	add	esp, 4

; 139  : 		free(wd);

	mov	eax, DWORD PTR _wd$[ebp]
	push	eax
	call	_free
	add	esp, 4
$L70279:

; 141  : 
; 142  : 	/* Clear focus settings */
; 143  : 	M_FREE(cntxt->focus1);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+84]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+84], 0

; 144  : 	M_FREE(cntxt->focus2);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+88]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+88], 0

; 145  : 	M_FREE(cntxt->focus3);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+92]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+92], 0

; 146  : 
; 147  : 	fprintf(f, "<font face=Arial><hr><b><font size=+3>Erreur du serveur</font> : %s</b><hr>\n", cntxt->err.text);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29872]
	push	edx
	push	OFFSET FLAT:$SG70280
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH

; 148  : 	err_save_context(cntxt);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_save_context
	add	esp, 4

; 149  : 	cntxt->err.text = NULL;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], 0

; 150  : 	err_clear(cntxt, NULL, NULL, 0);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H

; 151  : 	put_debug_msg(cntxt, f);

	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_debug_msg
	add	esp, 8

; 152  : 	M_FREE(cntxt->debug_html);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29868]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29868], 0

; 153  : 	cntxt->debug = DEBUG_CGI|DEBUG_ARGS|DEBUG_ENV;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29860], 52		; 00000034H

; 154  : 	debug_put_info(cntxt);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_debug_put_info
	add	esp, 4

; 155  : 	if(cntxt->err.file[0]) fclose(f);

	mov	edx, DWORD PTR _cntxt$[ebp]
	movsx	eax, BYTE PTR [edx+29904]
	test	eax, eax
	je	SHORT $L70284
	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fclose
	add	esp, 4
$L70284:

; 156  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_put_html_error ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70292 DB	0aH, 00H
	ORG $+2
$SG70293 DB	0aH, 00H
	ORG $+2
$SG70294 DB	0dH, 00H
	ORG $+2
$SG70295 DB	0dH, 00H
	ORG $+2
$SG70304 DB	'<pre>%s</pre><hr>', 00H
	ORG $+2
$SG70306 DB	'<font face=Courier size=-1>%s</font><hr>', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_f$ = 12
_lf_to_cr$70291 = -36
_tmp$70297 = -4
_tmp1$70299 = -40
_put_debug_msg PROC NEAR

; 163  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H

; 164  : 	if(cntxt->debug_msg)

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29864], 0
	je	$L70290

; 166  : 		ReplaceTable lf_to_cr[] = { { add_sz_str("\n"), add_sz_str("\r") },

	mov	DWORD PTR _lf_to_cr$70291[ebp], OFFSET FLAT:$SG70293
	mov	DWORD PTR _lf_to_cr$70291[ebp+4], 1
	mov	DWORD PTR _lf_to_cr$70291[ebp+8], OFFSET FLAT:$SG70295
	mov	DWORD PTR _lf_to_cr$70291[ebp+12], 1

; 167  : 									{ NULL } };

	mov	DWORD PTR _lf_to_cr$70291[ebp+16], 0
	xor	ecx, ecx
	mov	DWORD PTR _lf_to_cr$70291[ebp+20], ecx
	mov	DWORD PTR _lf_to_cr$70291[ebp+24], ecx
	mov	DWORD PTR _lf_to_cr$70291[ebp+28], ecx

; 168  : 		DynBuffer *tmp = NULL;

	mov	DWORD PTR _tmp$70297[ebp], 0

; 169  : 		DynBuffer *tmp1 = NULL;

	mov	DWORD PTR _tmp1$70299[ebp], 0

; 170  : 		dynbuf_add(&tmp1, DYNBUF_VAL_SZ(cntxt->debug_msg), lf_to_cr, 1);

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29864], 0
	je	SHORT $L70574
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29864]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -44+[ebp], edx
	jmp	SHORT $L70575
$L70574:
	mov	DWORD PTR -44+[ebp], 0
$L70575:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29864], 0
	je	SHORT $L70576
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29864]
	add	edx, 8
	mov	DWORD PTR -48+[ebp], edx
	jmp	SHORT $L70577
$L70576:
	mov	DWORD PTR -48+[ebp], 0
$L70577:
	push	1
	lea	eax, DWORD PTR _lf_to_cr$70291[ebp]
	push	eax
	mov	ecx, DWORD PTR -44+[ebp]
	push	ecx
	mov	edx, DWORD PTR -48+[ebp]
	push	edx
	lea	eax, DWORD PTR _tmp1$70299[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 171  : 		dynbuf_add(&tmp, DYNBUF_VAL_SZ(tmp1), TO_HTML);

	cmp	DWORD PTR _tmp1$70299[ebp], 0
	je	SHORT $L70578
	mov	ecx, DWORD PTR _tmp1$70299[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -52+[ebp], edx
	jmp	SHORT $L70579
$L70578:
	mov	DWORD PTR -52+[ebp], 0
$L70579:
	cmp	DWORD PTR _tmp1$70299[ebp], 0
	je	SHORT $L70580
	mov	eax, DWORD PTR _tmp1$70299[ebp]
	add	eax, 8
	mov	DWORD PTR -56+[ebp], eax
	jmp	SHORT $L70581
$L70580:
	mov	DWORD PTR -56+[ebp], 0
$L70581:
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR -52+[ebp]
	push	ecx
	mov	edx, DWORD PTR -56+[ebp]
	push	edx
	lea	eax, DWORD PTR _tmp$70297[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 172  : 		if(tmp && tmp->data && tmp->cnt) fprintf(f ? f : stdout, "<pre>%s</pre><hr>", tmp->data);

	cmp	DWORD PTR _tmp$70297[ebp], 0
	je	SHORT $L70303
	mov	ecx, DWORD PTR _tmp$70297[ebp]
	add	ecx, 8
	test	ecx, ecx
	je	SHORT $L70303
	mov	edx, DWORD PTR _tmp$70297[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	SHORT $L70303
	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70582
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR -60+[ebp], eax
	jmp	SHORT $L70583
$L70582:
	mov	DWORD PTR -60+[ebp], OFFSET FLAT:__iob+32
$L70583:
	mov	ecx, DWORD PTR _tmp$70297[ebp]
	add	ecx, 8
	push	ecx
	push	OFFSET FLAT:$SG70304
	mov	edx, DWORD PTR -60+[ebp]
	push	edx
	call	_fprintf
	add	esp, 12					; 0000000cH
$L70303:

; 173  : 		M_FREE(tmp);

	mov	eax, DWORD PTR _tmp$70297[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _tmp$70297[ebp], 0

; 174  : 		M_FREE(cntxt->debug_msg);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29864]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29864], 0
$L70290:

; 176  : 	if(cntxt->debug_html && cntxt->debug_html->data && cntxt->debug_html->cnt)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29868], 0
	je	SHORT $L70305
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29868]
	add	eax, 8
	test	eax, eax
	je	SHORT $L70305
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29868]
	cmp	DWORD PTR [edx+4], 0
	je	SHORT $L70305

; 178  : 		fprintf(f ? f : stdout, "<font face=Courier size=-1>%s</font><hr>", cntxt->debug_html->data);

	cmp	DWORD PTR _f$[ebp], 0
	je	SHORT $L70584
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L70585
$L70584:
	mov	DWORD PTR -64+[ebp], OFFSET FLAT:__iob+32
$L70585:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29868]
	add	edx, 8
	push	edx
	push	OFFSET FLAT:$SG70306
	mov	eax, DWORD PTR -64+[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH

; 179  : 		M_FREE(cntxt->debug_html);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29868]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29868], 0
$L70305:

; 181  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_put_debug_msg ENDP
_TEXT	ENDS
PUBLIC	_put_debug_sqltable
PUBLIC	_err_print_dyntab
EXTRN	_sql_exec_query:NEAR
EXTRN	_sql_get_table:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70315 DB	'SELECT * FROM %s ORDER BY IdObj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_table$ = 12
_printbuf$ = -1024
_sql_trace$ = -1028
_id_obj$ = -1048
_put_debug_sqltable PROC NEAR

; 188  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 1048				; 00000418H

; 189  : 	char printbuf[1024];
; 190  : 	unsigned long sql_trace = cntxt->sql_trace;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29852]
	mov	DWORD PTR _sql_trace$[ebp], ecx

; 191  : 	DynTable id_obj = {0};

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _id_obj$[ebp+4], edx
	mov	DWORD PTR _id_obj$[ebp+8], edx
	mov	DWORD PTR _id_obj$[ebp+12], edx
	mov	DWORD PTR _id_obj$[ebp+16], edx

; 192  : 	snprintf(add_sz_str(printbuf), "SELECT * FROM %s ORDER BY IdObj", table);

	mov	eax, DWORD PTR _table$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70315
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H

; 193  : 	sql_exec_query(cntxt, printbuf);

	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8

; 194  : 	cntxt->sql_trace = 0;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29852], 0

; 195  : 	sql_get_table(cntxt, &id_obj, 3);

	push	3
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH

; 196  : 	cntxt->sql_trace = sql_trace;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [ecx+29852], edx

; 197  : 	err_print_dyntab(&cntxt->debug_msg, &id_obj, 10, NO_CONV);

	push	0
	push	0
	push	10					; 0000000aH
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_err_print_dyntab
	add	esp, 20					; 00000014H

; 198  : 	dyntab_free(&id_obj);

	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 199  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_put_debug_sqltable ENDP
_TEXT	ENDS
PUBLIC	_err_print_filter
_DATA	SEGMENT
$SG70328 DB	'*', 00H
	ORG $+2
$SG70329 DB	0aH, '*** Filter : %lu nodes', 0aH, 'srctable=%s', 0aH, 00H
	ORG $+3
$SG70334 DB	'[%s]', 0aH, 00H
	ORG $+2
$SG70340 DB	'%2lu: ', 00H
	ORG $+1
$SG70343 DB	'%2lu#%lu ', 00H
	ORG $+2
$SG70346 DB	'[', 00H
	ORG $+2
$SG70352 DB	',', 00H
	ORG $+2
$SG70355 DB	']', 00H
	ORG $+2
$SG70359 DB	'F_Pkey', 00H
	ORG $+1
$SG70360 DB	'F_Obj', 00H
	ORG $+2
$SG70361 DB	'F_IdField', 00H
	ORG $+2
$SG70362 DB	'F_IdValue', 00H
	ORG $+2
$SG70363 DB	'F_Field', 00H
$SG70364 DB	'F_Value', 00H
$SG70365 DB	'F_RelObj', 00H
	ORG $+3
$SG70366 DB	'F_Num', 00H
	ORG $+2
$SG70367 DB	'F_Line', 00H
	ORG $+1
$SG70368 DB	'F_DateCr', 00H
	ORG $+3
$SG70369 DB	'F_WhoCr', 00H
$SG70370 DB	'F_DateDel', 00H
	ORG $+2
$SG70371 DB	'F_WhoDel', 00H
	ORG $+3
$SG70372 DB	'F_???', 00H
	ORG $+2
$SG70373 DB	'.%s ', 00H
	ORG $+3
$SG70377 DB	'ObjList', 00H
$SG70378 DB	'NotObjList', 00H
	ORG $+1
$SG70379 DB	'RelList', 00H
$SG70380 DB	'NotRelList', 00H
	ORG $+1
$SG70381 DB	'Like', 00H
	ORG $+3
$SG70382 DB	'NotLike', 00H
$SG70383 DB	'Contain', 00H
$SG70384 DB	'NotContain', 00H
	ORG $+1
$SG70385 DB	'IdValList', 00H
	ORG $+2
$SG70386 DB	'Smaller', 00H
$SG70387 DB	'SmallerEqual', 00H
	ORG $+3
$SG70388 DB	'Larger', 00H
	ORG $+1
$SG70389 DB	'LargerEqual', 00H
$SG70390 DB	'Begin', 00H
	ORG $+2
$SG70391 DB	'NotBegin', 00H
	ORG $+3
$SG70392 DB	'Different', 00H
	ORG $+2
$SG70393 DB	'Exact', 00H
	ORG $+2
$SG70394 DB	'InBound', 00H
$SG70395 DB	'NotInBound', 00H
	ORG $+1
$SG70396 DB	'Match???', 00H
	ORG $+3
$SG70397 DB	' %s', 00H
$SG70400 DB	' (', 00H
	ORG $+1
$SG70406 DB	',', 00H
	ORG $+2
$SG70409 DB	')', 00H
	ORG $+2
$SG70415 DB	'RelDirect', 00H
	ORG $+2
$SG70416 DB	'RelReverse', 00H
	ORG $+1
$SG70417 DB	'RelAny', 00H
	ORG $+1
$SG70418 DB	'RelBoth', 00H
$SG70419 DB	'Rel???', 00H
	ORG $+1
$SG70420 DB	' <%s>', 00H
	ORG $+2
$SG70422 DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_buf$ = 8
_flt$ = 12
_i$ = -1028
_j$ = -1032
_printbuf$ = -1024
_node$70338 = -1036
_err_print_filter PROC NEAR

; 208  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1184				; 000004a0H

; 209  : 	unsigned long i, j;
; 210  : 	char printbuf[1024];
; 211  : 
; 212  : 	if(!buf || !flt) return;

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70326
	cmp	DWORD PTR _flt$[ebp], 0
	jne	SHORT $L70325
$L70326:
	jmp	$L70337
$L70325:

; 213  : 
; 214  : 	/* Print filter names */
; 215  : 	dynbuf_print2(buf, "\n*** Filter : %lu nodes\nsrctable=%s\n", flt->nbnode, flt->srctable ? flt->srctable : "*");

	mov	eax, DWORD PTR _flt$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	SHORT $L70588
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	mov	DWORD PTR -1040+[ebp], edx
	jmp	SHORT $L70589
$L70588:
	mov	DWORD PTR -1040+[ebp], OFFSET FLAT:$SG70328
$L70589:
	push	0
	push	0
	mov	eax, DWORD PTR -1040+[ebp]
	push	eax
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR [ecx+4424]
	push	edx
	push	OFFSET FLAT:$SG70329
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 216  : 	for(i = 0; i < flt->name.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70330
$L70331:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70330:
	mov	ecx, DWORD PTR _flt$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	SHORT $L70332

; 217  : 		dynbuf_print(buf, "[%s]\n", dyntab_val(&flt->name, i, 0));

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _flt$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70334
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	jmp	SHORT $L70331
$L70332:

; 218  : 
; 219  : 	/* Print filter nodes */
; 220  : 	for(i = 0; i < flt->nbnode + 1; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70335
$L70336:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70335:
	mov	eax, DWORD PTR _flt$[ebp]
	mov	ecx, DWORD PTR [eax+4424]
	add	ecx, 1
	cmp	DWORD PTR _i$[ebp], ecx
	jae	$L70337

; 222  : 		/* Print index, source node & join index*/
; 223  : 		QryBuilNode *node = flt->node + i;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 136				; 00000088H
	mov	eax, DWORD PTR _flt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+72]
	mov	DWORD PTR _node$70338[ebp], ecx

; 224  : 		dynbuf_print(buf, "%2lu: ", i);

	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70340
	push	1023					; 000003ffH
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 225  : 		if(i) dynbuf_print2(buf, "%2lu#%lu ", node->srcjoin, node->curjoin);

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70341
	push	0
	push	0
	mov	eax, DWORD PTR _node$70338[ebp]
	mov	ecx, DWORD PTR [eax+60]
	push	ecx
	mov	edx, DWORD PTR _node$70338[ebp]
	mov	eax, DWORD PTR [edx+56]
	push	eax
	push	OFFSET FLAT:$SG70343
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70341:

; 226  : 
; 227  : 		/* Print fields */
; 228  : 		if(node->field.nbrows)

	mov	ecx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [ecx], 0
	je	$L70344

; 230  : 			dynbuf_add(buf, add_sz_str("["), NO_CONV);

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70346
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 231  : 			for(j = 0; j < node->field.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70347
$L70348:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70347:
	mov	ecx, DWORD PTR _node$70338[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	SHORT $L70349

; 233  : 				if(j) dynbuf_add(buf, add_sz_str(","), NO_CONV);

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70350
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70352
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70350:

; 234  : 				dynbuf_add(buf, DYNTAB_VAL_SZ(&node->field, j, 0), NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _node$70338[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _node$70338[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 235  : 			}

	jmp	$L70348
$L70349:

; 236  : 			dynbuf_add(buf, add_sz_str("]"), NO_CONV);

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70355
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70344:

; 238  : 
; 239  : 		/* Print field modifier */
; 240  : #define CP(n) node->modif == n ? #n :
; 241  : 		if(node->modif != F_None) dynbuf_print(buf, ".%s ",

	mov	ecx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [ecx+20], 0
	je	$L70357

; 242  : 					CP(F_Pkey) CP(F_Obj) CP(F_IdField) CP(F_IdValue) CP(F_Field) CP(F_Value) CP(F_RelObj) CP(F_Num) CP(F_Line)
; 243  : 					CP(F_DateCr) CP(F_WhoCr) CP(F_DateDel) CP(F_WhoDel) "F_???");

	mov	edx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [edx+20], 1
	jne	SHORT $L70614
	mov	DWORD PTR -1044+[ebp], OFFSET FLAT:$SG70359
	jmp	$L70615
$L70614:
	mov	eax, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [eax+20], 2
	jne	SHORT $L70612
	mov	DWORD PTR -1048+[ebp], OFFSET FLAT:$SG70360
	jmp	$L70613
$L70612:
	mov	ecx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [ecx+20], 3
	jne	SHORT $L70610
	mov	DWORD PTR -1052+[ebp], OFFSET FLAT:$SG70361
	jmp	$L70611
$L70610:
	mov	edx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [edx+20], 4
	jne	SHORT $L70608
	mov	DWORD PTR -1056+[ebp], OFFSET FLAT:$SG70362
	jmp	$L70609
$L70608:
	mov	eax, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [eax+20], 5
	jne	SHORT $L70606
	mov	DWORD PTR -1060+[ebp], OFFSET FLAT:$SG70363
	jmp	$L70607
$L70606:
	mov	ecx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [ecx+20], 6
	jne	SHORT $L70604
	mov	DWORD PTR -1064+[ebp], OFFSET FLAT:$SG70364
	jmp	$L70605
$L70604:
	mov	edx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [edx+20], 7
	jne	SHORT $L70602
	mov	DWORD PTR -1068+[ebp], OFFSET FLAT:$SG70365
	jmp	$L70603
$L70602:
	mov	eax, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [eax+20], 8
	jne	SHORT $L70600
	mov	DWORD PTR -1072+[ebp], OFFSET FLAT:$SG70366
	jmp	$L70601
$L70600:
	mov	ecx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [ecx+20], 9
	jne	SHORT $L70598
	mov	DWORD PTR -1076+[ebp], OFFSET FLAT:$SG70367
	jmp	$L70599
$L70598:
	mov	edx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [edx+20], 10			; 0000000aH
	jne	SHORT $L70596
	mov	DWORD PTR -1080+[ebp], OFFSET FLAT:$SG70368
	jmp	SHORT $L70597
$L70596:
	mov	eax, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [eax+20], 11			; 0000000bH
	jne	SHORT $L70594
	mov	DWORD PTR -1084+[ebp], OFFSET FLAT:$SG70369
	jmp	SHORT $L70595
$L70594:
	mov	ecx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [ecx+20], 12			; 0000000cH
	jne	SHORT $L70592
	mov	DWORD PTR -1088+[ebp], OFFSET FLAT:$SG70370
	jmp	SHORT $L70593
$L70592:
	mov	edx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [edx+20], 13			; 0000000dH
	jne	SHORT $L70590
	mov	DWORD PTR -1092+[ebp], OFFSET FLAT:$SG70371
	jmp	SHORT $L70591
$L70590:
	mov	DWORD PTR -1092+[ebp], OFFSET FLAT:$SG70372
$L70591:
	mov	eax, DWORD PTR -1092+[ebp]
	mov	DWORD PTR -1088+[ebp], eax
$L70593:
	mov	ecx, DWORD PTR -1088+[ebp]
	mov	DWORD PTR -1084+[ebp], ecx
$L70595:
	mov	edx, DWORD PTR -1084+[ebp]
	mov	DWORD PTR -1080+[ebp], edx
$L70597:
	mov	eax, DWORD PTR -1080+[ebp]
	mov	DWORD PTR -1076+[ebp], eax
$L70599:
	mov	ecx, DWORD PTR -1076+[ebp]
	mov	DWORD PTR -1072+[ebp], ecx
$L70601:
	mov	edx, DWORD PTR -1072+[ebp]
	mov	DWORD PTR -1068+[ebp], edx
$L70603:
	mov	eax, DWORD PTR -1068+[ebp]
	mov	DWORD PTR -1064+[ebp], eax
$L70605:
	mov	ecx, DWORD PTR -1064+[ebp]
	mov	DWORD PTR -1060+[ebp], ecx
$L70607:
	mov	edx, DWORD PTR -1060+[ebp]
	mov	DWORD PTR -1056+[ebp], edx
$L70609:
	mov	eax, DWORD PTR -1056+[ebp]
	mov	DWORD PTR -1052+[ebp], eax
$L70611:
	mov	ecx, DWORD PTR -1052+[ebp]
	mov	DWORD PTR -1048+[ebp], ecx
$L70613:
	mov	edx, DWORD PTR -1048+[ebp]
	mov	DWORD PTR -1044+[ebp], edx
$L70615:
	push	0
	push	0
	mov	eax, DWORD PTR -1044+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70373
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70357:

; 244  : #undef CP
; 245  : 
; 246  : 		/* Print match operator */
; 247  : #define CP(n) node->match == n ? #n :
; 248  : 		if(node->match != NoMatch) dynbuf_print(buf, " %s",

	mov	ecx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [ecx+24], 0
	je	$L70375

; 249  : 					CP(ObjList) CP(NotObjList) CP(RelList) CP(NotRelList) CP(Like) CP(NotLike) CP(Contain) CP(NotContain) CP(IdValList)
; 250  : 					CP(Smaller) CP(SmallerEqual) CP(Larger) CP(LargerEqual)
; 251  : 					CP(Begin) CP(NotBegin) CP(Different) CP(Exact) CP(InBound) CP(NotInBound) "Match???");

	mov	edx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [edx+24], 1
	jne	SHORT $L70652
	mov	DWORD PTR -1096+[ebp], OFFSET FLAT:$SG70377
	jmp	$L70653
$L70652:
	mov	eax, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [eax+24], 2
	jne	SHORT $L70650
	mov	DWORD PTR -1100+[ebp], OFFSET FLAT:$SG70378
	jmp	$L70651
$L70650:
	mov	ecx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [ecx+24], 3
	jne	SHORT $L70648
	mov	DWORD PTR -1104+[ebp], OFFSET FLAT:$SG70379
	jmp	$L70649
$L70648:
	mov	edx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [edx+24], 4
	jne	SHORT $L70646
	mov	DWORD PTR -1108+[ebp], OFFSET FLAT:$SG70380
	jmp	$L70647
$L70646:
	mov	eax, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [eax+24], 9
	jne	SHORT $L70644
	mov	DWORD PTR -1112+[ebp], OFFSET FLAT:$SG70381
	jmp	$L70645
$L70644:
	mov	ecx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [ecx+24], 10			; 0000000aH
	jne	SHORT $L70642
	mov	DWORD PTR -1116+[ebp], OFFSET FLAT:$SG70382
	jmp	$L70643
$L70642:
	mov	edx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [edx+24], 11			; 0000000bH
	jne	SHORT $L70640
	mov	DWORD PTR -1120+[ebp], OFFSET FLAT:$SG70383
	jmp	$L70641
$L70640:
	mov	eax, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [eax+24], 12			; 0000000cH
	jne	SHORT $L70638
	mov	DWORD PTR -1124+[ebp], OFFSET FLAT:$SG70384
	jmp	$L70639
$L70638:
	mov	ecx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [ecx+24], 7
	jne	SHORT $L70636
	mov	DWORD PTR -1128+[ebp], OFFSET FLAT:$SG70385
	jmp	$L70637
$L70636:
	mov	edx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [edx+24], 17			; 00000011H
	jne	SHORT $L70634
	mov	DWORD PTR -1132+[ebp], OFFSET FLAT:$SG70386
	jmp	$L70635
$L70634:
	mov	eax, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [eax+24], 18			; 00000012H
	jne	SHORT $L70632
	mov	DWORD PTR -1136+[ebp], OFFSET FLAT:$SG70387
	jmp	$L70633
$L70632:
	mov	ecx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [ecx+24], 15			; 0000000fH
	jne	SHORT $L70630
	mov	DWORD PTR -1140+[ebp], OFFSET FLAT:$SG70388
	jmp	$L70631
$L70630:
	mov	edx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [edx+24], 16			; 00000010H
	jne	SHORT $L70628
	mov	DWORD PTR -1144+[ebp], OFFSET FLAT:$SG70389
	jmp	$L70629
$L70628:
	mov	eax, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [eax+24], 13			; 0000000dH
	jne	SHORT $L70626
	mov	DWORD PTR -1148+[ebp], OFFSET FLAT:$SG70390
	jmp	$L70627
$L70626:
	mov	ecx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [ecx+24], 14			; 0000000eH
	jne	SHORT $L70624
	mov	DWORD PTR -1152+[ebp], OFFSET FLAT:$SG70391
	jmp	$L70625
$L70624:
	mov	edx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [edx+24], 5
	jne	SHORT $L70622
	mov	DWORD PTR -1156+[ebp], OFFSET FLAT:$SG70392
	jmp	SHORT $L70623
$L70622:
	mov	eax, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [eax+24], 6
	jne	SHORT $L70620
	mov	DWORD PTR -1160+[ebp], OFFSET FLAT:$SG70393
	jmp	SHORT $L70621
$L70620:
	mov	ecx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [ecx+24], 19			; 00000013H
	jne	SHORT $L70618
	mov	DWORD PTR -1164+[ebp], OFFSET FLAT:$SG70394
	jmp	SHORT $L70619
$L70618:
	mov	edx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [edx+24], 20			; 00000014H
	jne	SHORT $L70616
	mov	DWORD PTR -1168+[ebp], OFFSET FLAT:$SG70395
	jmp	SHORT $L70617
$L70616:
	mov	DWORD PTR -1168+[ebp], OFFSET FLAT:$SG70396
$L70617:
	mov	eax, DWORD PTR -1168+[ebp]
	mov	DWORD PTR -1164+[ebp], eax
$L70619:
	mov	ecx, DWORD PTR -1164+[ebp]
	mov	DWORD PTR -1160+[ebp], ecx
$L70621:
	mov	edx, DWORD PTR -1160+[ebp]
	mov	DWORD PTR -1156+[ebp], edx
$L70623:
	mov	eax, DWORD PTR -1156+[ebp]
	mov	DWORD PTR -1152+[ebp], eax
$L70625:
	mov	ecx, DWORD PTR -1152+[ebp]
	mov	DWORD PTR -1148+[ebp], ecx
$L70627:
	mov	edx, DWORD PTR -1148+[ebp]
	mov	DWORD PTR -1144+[ebp], edx
$L70629:
	mov	eax, DWORD PTR -1144+[ebp]
	mov	DWORD PTR -1140+[ebp], eax
$L70631:
	mov	ecx, DWORD PTR -1140+[ebp]
	mov	DWORD PTR -1136+[ebp], ecx
$L70633:
	mov	edx, DWORD PTR -1136+[ebp]
	mov	DWORD PTR -1132+[ebp], edx
$L70635:
	mov	eax, DWORD PTR -1132+[ebp]
	mov	DWORD PTR -1128+[ebp], eax
$L70637:
	mov	ecx, DWORD PTR -1128+[ebp]
	mov	DWORD PTR -1124+[ebp], ecx
$L70639:
	mov	edx, DWORD PTR -1124+[ebp]
	mov	DWORD PTR -1120+[ebp], edx
$L70641:
	mov	eax, DWORD PTR -1120+[ebp]
	mov	DWORD PTR -1116+[ebp], eax
$L70643:
	mov	ecx, DWORD PTR -1116+[ebp]
	mov	DWORD PTR -1112+[ebp], ecx
$L70645:
	mov	edx, DWORD PTR -1112+[ebp]
	mov	DWORD PTR -1108+[ebp], edx
$L70647:
	mov	eax, DWORD PTR -1108+[ebp]
	mov	DWORD PTR -1104+[ebp], eax
$L70649:
	mov	ecx, DWORD PTR -1104+[ebp]
	mov	DWORD PTR -1100+[ebp], ecx
$L70651:
	mov	edx, DWORD PTR -1100+[ebp]
	mov	DWORD PTR -1096+[ebp], edx
$L70653:
	push	0
	push	0
	mov	eax, DWORD PTR -1096+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70397
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70375:

; 252  : #undef CP
; 253  : 
; 254  : 		/* Print match values */
; 255  : 		if(node->value.nbrows)

	mov	ecx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [ecx+32], 0
	je	$L70398

; 257  : 			dynbuf_add(buf, add_sz_str(" ("), NO_CONV);

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70400
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 258  : 			for(j = 0; j < node->value.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70401
$L70402:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70401:
	mov	ecx, DWORD PTR _node$70338[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+32]
	jae	SHORT $L70403

; 260  : 				if(j) dynbuf_add(buf, add_sz_str(","), NO_CONV);

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70404
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70406
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70404:

; 261  : 				dynbuf_add(buf, DYNTAB_VAL_SZ(&node->value, j, 0), NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _node$70338[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _node$70338[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 262  : 			}

	jmp	$L70402
$L70403:

; 263  : 			dynbuf_add(buf, add_sz_str(")"), NO_CONV);

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70409
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70398:

; 265  : 
; 266  : 		/* Print node condition */
; 267  : 		if(node->cond && node->cond->cnt)

	mov	ecx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [ecx+124], 0
	je	SHORT $L70410
	mov	edx, DWORD PTR _node$70338[ebp]
	mov	eax, DWORD PTR [edx+124]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L70410

; 268  : 			dynbuf_add(buf, node->cond->data, node->cond->cnt, NO_CONV);

	push	0
	push	0
	mov	ecx, DWORD PTR _node$70338[ebp]
	mov	edx, DWORD PTR [ecx+124]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _node$70338[ebp]
	mov	edx, DWORD PTR [ecx+124]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70410:

; 269  : 
; 270  : 		/* Print relation to next node */
; 271  : #define CP(x) node->rel == x ? #x :
; 272  : 		if(node->rel != RelNone) dynbuf_print(buf, " <%s>", CP(RelDirect) CP(RelReverse) CP(RelAny) CP(RelBoth) "Rel???");

	mov	ecx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [ecx+52], 0
	je	$L70413
	mov	edx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [edx+52], 1
	jne	SHORT $L70660
	mov	DWORD PTR -1172+[ebp], OFFSET FLAT:$SG70415
	jmp	SHORT $L70661
$L70660:
	mov	eax, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [eax+52], 2
	jne	SHORT $L70658
	mov	DWORD PTR -1176+[ebp], OFFSET FLAT:$SG70416
	jmp	SHORT $L70659
$L70658:
	mov	ecx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [ecx+52], 3
	jne	SHORT $L70656
	mov	DWORD PTR -1180+[ebp], OFFSET FLAT:$SG70417
	jmp	SHORT $L70657
$L70656:
	mov	edx, DWORD PTR _node$70338[ebp]
	cmp	DWORD PTR [edx+52], 4
	jne	SHORT $L70654
	mov	DWORD PTR -1184+[ebp], OFFSET FLAT:$SG70418
	jmp	SHORT $L70655
$L70654:
	mov	DWORD PTR -1184+[ebp], OFFSET FLAT:$SG70419
$L70655:
	mov	eax, DWORD PTR -1184+[ebp]
	mov	DWORD PTR -1180+[ebp], eax
$L70657:
	mov	ecx, DWORD PTR -1180+[ebp]
	mov	DWORD PTR -1176+[ebp], ecx
$L70659:
	mov	edx, DWORD PTR -1176+[ebp]
	mov	DWORD PTR -1172+[ebp], edx
$L70661:
	push	0
	push	0
	mov	eax, DWORD PTR -1172+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70420
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70413:

; 273  : #undef CP
; 274  : 		dynbuf_add(buf, add_sz_str("\n"), NO_CONV);

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70422
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 275  : 	}

	jmp	$L70336
$L70337:

; 276  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_err_print_filter ENDP
_TEXT	ENDS
PUBLIC	_err_print_dyntab_line
EXTRN	_sprintf:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_memset:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70437 DB	'%lu:', 09H, 00H
	ORG $+2
$SG70443 DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_buf$ = 8
_tab$ = 12
_i$ = 16
_sr$ = 20
_sz_sr$ = 24
_j$ = -32
_col$ = -28
_txt$70441 = -36
_len$70442 = -40
_err_print_dyntab_line PROC NEAR

; 288  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	push	edi

; 289  : 	unsigned long j;
; 290  : 	char col[25] = {0};

	mov	BYTE PTR _col$[ebp], 0
	mov	ecx, 6
	xor	eax, eax
	lea	edi, DWORD PTR _col$[ebp+1]
	rep stosd

; 291  : 
; 292  : 	dynbuf_add(buf, col, sprintf(col,"%lu:\t", i), sr, sz_sr);

	mov	eax, DWORD PTR _sz_sr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70437
	lea	eax, DWORD PTR _col$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _col$[ebp]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 293  : 	for(j = 0; j < 20 && j < tab->nbcols; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70438
$L70439:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70438:
	cmp	DWORD PTR _j$[ebp], 20			; 00000014H
	jae	$L70440
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+8]
	jae	$L70440

; 295  : 		char *txt = dyntab_val(tab, i, j);

	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _txt$70441[ebp], eax

; 296  : 		size_t len = dyntab_sz(tab, i, j);

	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tab$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _len$70442[ebp], eax

; 297  : 		memset(col, ' ', sizeof(col) - 1);

	push	24					; 00000018H
	push	32					; 00000020H
	lea	eax, DWORD PTR _col$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH

; 298  : 		memcpy(col, txt, len < sizeof(col) - 1 ? len : sizeof(col) - 2);

	cmp	DWORD PTR _len$70442[ebp], 24		; 00000018H
	jae	SHORT $L70663
	mov	ecx, DWORD PTR _len$70442[ebp]
	mov	DWORD PTR -44+[ebp], ecx
	jmp	SHORT $L70664
$L70663:
	mov	DWORD PTR -44+[ebp], 23			; 00000017H
$L70664:
	mov	edx, DWORD PTR -44+[ebp]
	push	edx
	mov	eax, DWORD PTR _txt$70441[ebp]
	push	eax
	lea	ecx, DWORD PTR _col$[ebp]
	push	ecx
	call	_memcpy
	add	esp, 12					; 0000000cH

; 299  : 		dynbuf_add(buf, col, sizeof(col) - 1, sr, sz_sr);

	mov	edx, DWORD PTR _sz_sr$[ebp]
	push	edx
	mov	eax, DWORD PTR _sr$[ebp]
	push	eax
	push	24					; 00000018H
	lea	ecx, DWORD PTR _col$[ebp]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 300  : 	}

	jmp	$L70439
$L70440:

; 301  : 	dynbuf_add(buf, add_sz_str("\n"), sr, sz_sr);

	mov	eax, DWORD PTR _sz_sr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sr$[ebp]
	push	ecx
	push	1
	push	OFFSET FLAT:$SG70443
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 302  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_err_print_dyntab_line ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70460 DB	'(null)', 00H
	ORG $+1
$SG70466 DB	'...', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_buf$ = 8
_tab$ = 12
_rows$ = 16
_sr$ = 20
_sz_sr$ = 24
_i$ = -4
_j$ = -8
_err_print_dyntab PROC NEAR

; 314  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 315  : 	unsigned long i, j;
; 316  : 
; 317  : 	if(!buf) return;

	cmp	DWORD PTR _buf$[ebp], 0
	jne	SHORT $L70457
	jmp	$L70469
$L70457:

; 318  : 
; 319  : 	if(!tab || !tab->nbrows)

	cmp	DWORD PTR _tab$[ebp], 0
	je	SHORT $L70459
	mov	eax, DWORD PTR _tab$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L70458
$L70459:

; 321  : 		dynbuf_add(buf, add_sz_str("(null)"), sr, sz_sr);

	mov	ecx, DWORD PTR _sz_sr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sr$[ebp]
	push	edx
	push	6
	push	OFFSET FLAT:$SG70460
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 322  : 		return;

	jmp	$L70469
$L70458:

; 324  : 
; 325  : 	/* Output rows first lines */
; 326  : 	j = (!rows || rows > tab->nbrows) ? tab->nbrows : rows;

	cmp	DWORD PTR _rows$[ebp], 0
	je	SHORT $L70666
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _rows$[ebp]
	cmp	edx, DWORD PTR [ecx]
	ja	SHORT $L70666
	mov	eax, DWORD PTR _rows$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L70667
$L70666:
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -12+[ebp], edx
$L70667:
	mov	eax, DWORD PTR -12+[ebp]
	mov	DWORD PTR _j$[ebp], eax

; 327  : 	for(i = 0; i < j; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70461
$L70462:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70461:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _j$[ebp]
	jae	SHORT $L70463

; 328  : 		err_print_dyntab_line(buf, tab, i, sr, sz_sr);

	mov	eax, DWORD PTR _sz_sr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_err_print_dyntab_line
	add	esp, 20					; 00000014H
	jmp	SHORT $L70462
$L70463:

; 329  : 
; 330  : 	/* Output rows last lines */
; 331  : 	j = (2 * rows > tab->nbrows) ? rows : tab->nbrows - rows;

	mov	edx, DWORD PTR _rows$[ebp]
	shl	edx, 1
	mov	eax, DWORD PTR _tab$[ebp]
	cmp	edx, DWORD PTR [eax]
	jbe	SHORT $L70668
	mov	ecx, DWORD PTR _rows$[ebp]
	mov	DWORD PTR -16+[ebp], ecx
	jmp	SHORT $L70669
$L70668:
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR [edx]
	sub	eax, DWORD PTR _rows$[ebp]
	mov	DWORD PTR -16+[ebp], eax
$L70669:
	mov	ecx, DWORD PTR -16+[ebp]
	mov	DWORD PTR _j$[ebp], ecx

; 332  : 	if(rows && rows < tab->nbrows)

	cmp	DWORD PTR _rows$[ebp], 0
	je	SHORT $L70469
	mov	edx, DWORD PTR _tab$[ebp]
	mov	eax, DWORD PTR _rows$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L70469

; 334  : 		if(j > rows) dynbuf_add(buf, add_sz_str("...\n"), sr, sz_sr);

	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _rows$[ebp]
	jbe	SHORT $L70465
	mov	edx, DWORD PTR _sz_sr$[ebp]
	push	edx
	mov	eax, DWORD PTR _sr$[ebp]
	push	eax
	push	4
	push	OFFSET FLAT:$SG70466
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70465:

; 335  : 		for(i = j ;  i < tab->nbrows; i++)

	mov	edx, DWORD PTR _j$[ebp]
	mov	DWORD PTR _i$[ebp], edx
	jmp	SHORT $L70467
$L70468:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70467:
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jae	SHORT $L70469

; 336  : 			err_print_dyntab_line(buf, tab, i, sr, sz_sr);

	mov	eax, DWORD PTR _sz_sr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_err_print_dyntab_line
	add	esp, 20					; 00000014H
	jmp	SHORT $L70468
$L70469:

; 338  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_err_print_dyntab ENDP
_TEXT	ENDS
PUBLIC	_err_print_data
EXTRN	_dyntab_cell:NEAR
_BSS	SEGMENT
$SG70499 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70488 DB	'(null)', 0dH, 00H
$SG70489 DB	'      IdObj ValObj   N   L  C  R Field                  '
	DB	'Value', 0dH, 00H
	ORG $+1
$SG70497 DB	'%3lu: %6lu %6lu %3lu %3lu', 00H
	ORG $+2
$SG70500 DB	' %2lu %2lu %-20.20s %-50.50s', 0dH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_buf$ = 8
_tab$ = 12
_beg$ = 16
_end$ = 20
_sr$ = 24
_sz_sr$ = 28
_i$ = -1028
_printbuf$ = -1024
_c$70495 = -1032
_err_print_data PROC NEAR

; 351  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1036				; 0000040cH

; 352  : 	unsigned long i;
; 353  : 	char printbuf[1024];
; 354  : 
; 355  : 	if(!buf) return;

	cmp	DWORD PTR _buf$[ebp], 0
	jne	SHORT $L70485
	jmp	$L70494
$L70485:

; 356  : 
; 357  : 	if(!tab || !tab->nbrows)

	cmp	DWORD PTR _tab$[ebp], 0
	je	SHORT $L70487
	mov	eax, DWORD PTR _tab$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L70486
$L70487:

; 359  : 		dynbuf_add(buf, add_sz_str("(null)\r"), sr, sz_sr);

	mov	ecx, DWORD PTR _sz_sr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sr$[ebp]
	push	edx
	push	7
	push	OFFSET FLAT:$SG70488
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 360  : 		return;

	jmp	$L70494
$L70486:

; 362  : 	dynbuf_add(buf, add_sz_str("      IdObj ValObj   N   L  C  R Field                  Value\r"), sr, sz_sr);

	mov	ecx, DWORD PTR _sz_sr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sr$[ebp]
	push	edx
	push	62					; 0000003eH
	push	OFFSET FLAT:$SG70489
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 363  : 	if(!end || end > tab->nbrows) end = tab->nbrows;

	cmp	DWORD PTR _end$[ebp], 0
	je	SHORT $L70491
	mov	ecx, DWORD PTR _tab$[ebp]
	mov	edx, DWORD PTR _end$[ebp]
	cmp	edx, DWORD PTR [ecx]
	jbe	SHORT $L70490
$L70491:
	mov	eax, DWORD PTR _tab$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _end$[ebp], ecx
$L70490:

; 364  : 	for(i = beg; i < end; i++)

	mov	edx, DWORD PTR _beg$[ebp]
	mov	DWORD PTR _i$[ebp], edx
	jmp	SHORT $L70492
$L70493:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70492:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _end$[ebp]
	jae	$L70494

; 366  : 		DynTableCell *c = dyntab_cell(tab, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _tab$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70495[ebp], eax

; 367  : 		dynbuf_print5(buf, "%3lu: %6lu %6lu %3lu %3lu", i, c->IdObj, c->IdValObj, c->Num, c->Line);

	push	0
	push	0
	mov	ecx, DWORD PTR _c$70495[ebp]
	mov	edx, DWORD PTR [ecx+40]
	push	edx
	mov	eax, DWORD PTR _c$70495[ebp]
	mov	ecx, DWORD PTR [eax+36]
	push	ecx
	mov	edx, DWORD PTR _c$70495[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _c$70495[ebp]
	mov	edx, DWORD PTR [ecx+20]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70497
	push	1023					; 000003ffH
	lea	ecx, DWORD PTR _printbuf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 32					; 00000020H
	push	eax
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 368  : 		dynbuf_print4(buf, " %2lu %2lu %-20.20s %-50.50s\r", c->col, c->row, c->field ? c->field : "", c->txt);

	mov	ecx, DWORD PTR _c$70495[ebp]
	cmp	DWORD PTR [ecx+8], 0
	je	SHORT $L70671
	mov	edx, DWORD PTR _c$70495[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR -1036+[ebp], eax
	jmp	SHORT $L70672
$L70671:
	mov	DWORD PTR -1036+[ebp], OFFSET FLAT:$SG70499
$L70672:
	push	0
	push	0
	mov	ecx, DWORD PTR _c$70495[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR -1036+[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$70495[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	mov	eax, DWORD PTR _c$70495[ebp]
	mov	ecx, DWORD PTR [eax+56]
	push	ecx
	push	OFFSET FLAT:$SG70500
	push	1023					; 000003ffH
	lea	edx, DWORD PTR _printbuf$[ebp]
	push	edx
	call	__snprintf
	add	esp, 28					; 0000001cH
	push	eax
	lea	eax, DWORD PTR _printbuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 369  : 	}

	jmp	$L70493
$L70494:

; 370  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_err_print_data ENDP
_TEXT	ENDS
PUBLIC	_debug_put_cgi
_DATA	SEGMENT
	ORG $+2
$SG70508 DB	0aH, '*** CGI input :', 00H
	ORG $+3
$SG70511 DB	'(null)', 00H
	ORG $+1
$SG70513 DB	0aH, 00H
	ORG $+2
$SG70518 DB	'%lu:', 09H, 00H
	ORG $+2
$SG70522 DB	'=', 00H
	ORG $+2
$SG70525 DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i$ = -1028
_buf$ = -1024
_debug_put_cgi PROC NEAR

; 377  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 1028				; 00000404H

; 378  : 	unsigned long i;
; 379  : 	char buf[1024];
; 380  : 
; 381  : 	/* Output CGI data if applicable */
; 382  : 	if(cntxt->debug & DEBUG_CGI)

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 4
	test	ecx, ecx
	je	$L70516

; 384  : 		dynbuf_add(&cntxt->debug_msg, add_sz_str("\n*** CGI input :"), NO_CONV);

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70508
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 385  : 		if(!cntxt->cgi) dynbuf_add(&cntxt->debug_msg, add_sz_str("(null)"), NO_CONV);

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29648], 0
	jne	SHORT $L70509
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70511
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70509:

; 386  : 		dynbuf_add(&cntxt->debug_msg, add_sz_str("\n"), NO_CONV);

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70513
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 387  : 		for(i = 0; i < cntxt->nb_cgi; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70514
$L70515:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70514:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+29652]
	jae	$L70516

; 389  : 			dynbuf_add(&cntxt->debug_msg, buf, snprintf(buf, sizeof(buf),"%lu:\t",i), NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70518
	push	1024					; 00000400H
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	__snprintf
	add	esp, 16					; 00000010H
	push	eax
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 390  : 			if(cntxt->cgi[i].name[0])

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70519

; 391  : 				dynbuf_add(&cntxt->debug_msg, cntxt->cgi[i].name, cntxt->cgi[i].name_sz, NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+4]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
$L70519:

; 392  : 			dynbuf_add(&cntxt->debug_msg, add_sz_str("="), NO_CONV);

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70522
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 393  : 			dynbuf_add(&cntxt->debug_msg, cntxt->cgi[i].value, cntxt->cgi[i].value_sz, NO_CONV);

	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx+12]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx+8]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29864				; 000074a8H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 394  : 			dynbuf_add(&cntxt->debug_msg, add_sz_str("\n"), NO_CONV);

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70525
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 395  : 		}

	jmp	$L70515
$L70516:

; 397  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_debug_put_cgi ENDP
_TEXT	ENDS
PUBLIC	__real@8@4008fa00000000000000
EXTRN	__fltused:NEAR
EXTRN	_asctime:NEAR
EXTRN	_clock:NEAR
EXTRN	_localtime:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70538 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70536 DB	'*** Time : %s*** Duration : %1.2lf s', 0aH, '*** CWD : ', 00H
$SG70540 DB	0aH, '*** Args : %d', 0aH, 00H
$SG70545 DB	'%d:', 09H, 00H
	ORG $+3
$SG70549 DB	0aH, 00H
	ORG $+2
$SG70552 DB	0aH, '*** Env vars :', 0aH, 00H
	ORG $+3
$SG70558 DB	0aH, 00H
_DATA	ENDS
;	COMDAT __real@8@4008fa00000000000000
; File D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\err_utils.c
CONST	SEGMENT
__real@8@4008fa00000000000000 DQ 0408f400000000000r ; 1000
CONST	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i$ = -4
_t$70531 = -1032
_lt$70532 = -1036
_buf$70533 = -1028
_debug_put_info PROC NEAR

; 404  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 1040				; 00000410H

; 405  : 	int i;
; 406  : 
; 407  : 	/* Output CGI data */
; 408  : 	debug_put_cgi(cntxt);

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_debug_put_cgi
	add	esp, 4

; 409  : 
; 410  : 	if(cntxt->debug & DEBUG_ARGS)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29860]
	and	edx, 16					; 00000010H
	test	edx, edx
	je	$L70544

; 412  : 		time_t t;
; 413  : 		struct tm *lt;
; 414  : 		char buf[1024];
; 415  : 
; 416  : 		t = time(0);

	push	0
	call	_time
	add	esp, 4
	mov	DWORD PTR _t$70531[ebp], eax

; 417  : 		lt = localtime(&t);

	lea	eax, DWORD PTR _t$70531[ebp]
	push	eax
	call	_localtime
	add	esp, 4
	mov	DWORD PTR _lt$70532[ebp], eax

; 418  : 		dynbuf_add(&cntxt->debug_msg, buf, snprintf(buf, sizeof(buf),
; 419  : 				"*** Time : %s*** Duration : %1.2lf s\n*** CWD : ",
; 420  : 				asctime(lt), (double)clock()/CLOCKS_PER_SEC), NO_CONV);

	push	0
	push	0
	call	_clock
	mov	DWORD PTR -1040+[ebp], eax
	fild	DWORD PTR -1040+[ebp]
	fdiv	QWORD PTR __real@8@4008fa00000000000000
	sub	esp, 8
	fstp	QWORD PTR [esp]
	mov	ecx, DWORD PTR _lt$70532[ebp]
	push	ecx
	call	_asctime
	add	esp, 4
	push	eax
	push	OFFSET FLAT:$SG70536
	push	1024					; 00000400H
	lea	edx, DWORD PTR _buf$70533[ebp]
	push	edx
	call	__snprintf
	add	esp, 24					; 00000018H
	push	eax
	lea	eax, DWORD PTR _buf$70533[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 421  : 		dynbuf_add(&cntxt->debug_msg, add_sz_str(""), NO_CONV);

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70538
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 422  : 		getcwd(buf, sizeof(buf));

	push	1024					; 00000400H
	lea	eax, DWORD PTR _buf$70533[ebp]
	push	eax
	call	_getcwd
	add	esp, 8

; 423  : 		dynbuf_add(&cntxt->debug_msg, buf, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _buf$70533[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 424  : 		sprintf(buf, "\n*** Args : %d\n", cntxt->argc);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29692]
	push	ecx
	push	OFFSET FLAT:$SG70540
	lea	edx, DWORD PTR _buf$70533[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH

; 425  : 		dynbuf_add(&cntxt->debug_msg, buf, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _buf$70533[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 426  : 		for(i = 0; i < cntxt->argc; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70542
$L70543:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70542:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+29692]
	jge	$L70544

; 428  : 			sprintf(buf, "%d:\t", i);

	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70545
	lea	eax, DWORD PTR _buf$70533[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH

; 429  : 			dynbuf_add(&cntxt->debug_msg, buf, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _buf$70533[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 430  : 			dynbuf_add(&cntxt->debug_msg, cntxt->argv[i], 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29696]
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [ecx+edx*4]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 431  : 			dynbuf_add(&cntxt->debug_msg, add_sz_str("\n"), NO_CONV);

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70549
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 432  : 		}

	jmp	$L70543
$L70544:

; 434  : 	if(cntxt->debug & DEBUG_ENV)

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 32					; 00000020H
	test	ecx, ecx
	je	$L70555

; 436  : 		dynbuf_add(&cntxt->debug_msg, add_sz_str("\n*** Env vars :\n"), NO_CONV);

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70552
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 437  : 		i = 0;

	mov	DWORD PTR _i$[ebp], 0
$L70554:

; 438  : 		while(cntxt->envp[i])

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29700]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [ecx+edx*4], 0
	je	SHORT $L70555

; 440  : 			dynbuf_add(&cntxt->debug_msg, cntxt->envp[i], 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29700]
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [ecx+edx*4]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29864				; 000074a8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 441  : 			dynbuf_add(&cntxt->debug_msg, add_sz_str("\n"), NO_CONV);

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70558
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29864				; 000074a8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 442  : 			i++;

	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax

; 443  : 		}

	jmp	SHORT $L70554
$L70555:

; 445  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_debug_put_info ENDP
_TEXT	ENDS
END
