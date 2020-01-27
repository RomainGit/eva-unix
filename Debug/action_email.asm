	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c
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
PUBLIC	_sendmail_free
EXTRN	_remove:NEAR
EXTRN	_chdir_user_doc:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_dyntab_free:NEAR
_DATA	SEGMENT
$SG70221 DB	'dst.txt', 00H
$SG70222 DB	'cpy.txt', 00H
$SG70223 DB	'hid.txt', 00H
$SG70224 DB	'body.txt', 00H
	ORG $+3
$SG70225 DB	'err.txt', 00H
$SG70226 DB	'res.txt', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sm$ = 12
_sendmail_free PROC NEAR

; 45   : ){

	push	ebp
	mov	ebp, esp

; 46   : 	DYNTAB_FREE(sm->dst);

	mov	eax, DWORD PTR _sm$[ebp]
	add	eax, 8
	push	eax
	call	_dyntab_free
	add	esp, 4

; 47   : 	DYNTAB_FREE(sm->cpy);

	mov	ecx, DWORD PTR _sm$[ebp]
	add	ecx, 28					; 0000001cH
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 48   : 	DYNTAB_FREE(sm->hid);

	mov	edx, DWORD PTR _sm$[ebp]
	add	edx, 48					; 00000030H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 49   : 	DYNTAB_FREE(sm->att);

	mov	eax, DWORD PTR _sm$[ebp]
	add	eax, 68					; 00000044H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 50   : 	M_FREE(sm->txtsubj);

	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+92]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [eax+92], 0

; 51   : 	M_FREE(sm->txtbody);

	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+88]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	eax, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [eax+88], 0

; 52   : 	chdir_user_doc(cntxt);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_chdir_user_doc
	add	esp, 4

; 53   : 	remove("dst.txt");

	push	OFFSET FLAT:$SG70221
	call	_remove
	add	esp, 4

; 54   : 	remove("cpy.txt");

	push	OFFSET FLAT:$SG70222
	call	_remove
	add	esp, 4

; 55   : 	remove("hid.txt");

	push	OFFSET FLAT:$SG70223
	call	_remove
	add	esp, 4

; 56   : 	remove("body.txt");

	push	OFFSET FLAT:$SG70224
	call	_remove
	add	esp, 4

; 57   : 	remove("err.txt");

	push	OFFSET FLAT:$SG70225
	call	_remove
	add	esp, 4

; 58   : 	remove("res.txt");

	push	OFFSET FLAT:$SG70226
	call	_remove
	add	esp, 4

; 59   : }

	pop	ebp
	ret	0
_sendmail_free ENDP
_TEXT	ENDS
PUBLIC	_mailmerge_brackets
EXTRN	_ctrl_eval_fieldexpr:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_dynbuf_add:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_strchr:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_strstr:NEAR
_DATA	SEGMENT
$SG70258 DB	'}', 00H
	ORG $+2
$SG70265 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70271 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70282 DB	', ', 00H
	ORG $+1
$SG70284 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70287 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70288 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70289 DB	'mailmerge_brackets', 00H
	ORG $+1
$SG70291 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70292 DB	'mailmerge_brackets', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_str$ = 16
_sz_str$ = 20
_i_ctrl$ = 24
_conv$ = 28
_form$ = -4
_ctrl$ = -40
_start$ = -36
_data$ = -28
_expr$ = -8
_i$ = -32
_next$70255 = -48
_end$70256 = -44
_txt$70276 = -52
_sr$70277 = -56
_mailmerge_brackets PROC NEAR

; 77   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H

; 78   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 79   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 80   : 	char *start = str;

	mov	edx, DWORD PTR _str$[ebp]
	mov	DWORD PTR _start$[ebp], edx

; 81   : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 82   : 	DynBuffer *expr = NULL;

	mov	DWORD PTR _expr$[ebp], 0

; 83   : 	unsigned long i;
; 84   : 
; 85   : 	/* Init */
; 86   : 	if(!res) RETURN_OK;

	cmp	DWORD PTR _res$[ebp], 0
	jne	SHORT $L70249
	jmp	$eva_noerr$70250
$L70249:

; 87   : 
; 88   : 	/* For each SQL command */
; 89   : 	while(start && *start && (size_t)(start - str) < sz_str)

	cmp	DWORD PTR _start$[ebp], 0
	je	$eva_noerr$70250
	mov	ecx, DWORD PTR _start$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$eva_noerr$70250
	mov	eax, DWORD PTR _start$[ebp]
	sub	eax, DWORD PTR _str$[ebp]
	cmp	eax, DWORD PTR _sz_str$[ebp]
	jae	$eva_noerr$70250

; 91   : 		/* Locate start & end of brackets */
; 92   : 		char *next = strchr(start, '{');

	push	123					; 0000007bH
	mov	ecx, DWORD PTR _start$[ebp]
	push	ecx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _next$70255[ebp], eax

; 93   : 		char *end = next ? strstr(next, "}") : NULL;

	cmp	DWORD PTR _next$70255[ebp], 0
	je	SHORT $L70911
	push	OFFSET FLAT:$SG70258
	mov	edx, DWORD PTR _next$70255[ebp]
	push	edx
	call	_strstr
	add	esp, 8
	mov	DWORD PTR -60+[ebp], eax
	jmp	SHORT $L70912
$L70911:
	mov	DWORD PTR -60+[ebp], 0
$L70912:
	mov	eax, DWORD PTR -60+[ebp]
	mov	DWORD PTR _end$70256[ebp], eax

; 94   : 		if(!next) next = str + sz_str;

	cmp	DWORD PTR _next$70255[ebp], 0
	jne	SHORT $L70259
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _sz_str$[ebp]
	mov	DWORD PTR _next$70255[ebp], ecx
$L70259:

; 95   : 		if(!end) end = str + sz_str;

	cmp	DWORD PTR _end$70256[ebp], 0
	jne	SHORT $L70260
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _sz_str$[ebp]
	mov	DWORD PTR _end$70256[ebp], edx
$L70260:

; 96   : 
; 97   : 		/* Output text before brackets */
; 98   : 		if(next > start) DYNBUF_ADD(res, start, next - start, NO_CONV);

	mov	eax, DWORD PTR _next$70255[ebp]
	cmp	eax, DWORD PTR _start$[ebp]
	jbe	SHORT $L70263
	push	0
	push	0
	mov	ecx, DWORD PTR _next$70255[ebp]
	sub	ecx, DWORD PTR _start$[ebp]
	push	ecx
	mov	edx, DWORD PTR _start$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70263
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70265
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 98		; 00000062H
	jmp	$eva_err$70266
$L70263:

; 99   : 
; 100  : 		/* Evaluate SQL expression on current object */
; 101  : 		DYNTAB_FREE(data);

	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 102  : 		if(end > next + 1)

	mov	ecx, DWORD PTR _next$70255[ebp]
	add	ecx, 1
	cmp	DWORD PTR _end$70256[ebp], ecx
	jbe	$L70272

; 104  : 			M_FREE(expr);

	mov	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0

; 105  : 			DYNBUF_ADD(&expr, next + 1, end - next - 1, NO_CONV);

	push	0
	push	0
	mov	eax, DWORD PTR _end$70256[ebp]
	sub	eax, DWORD PTR _next$70255[ebp]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _next$70255[ebp]
	add	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70269
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70271
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 105		; 00000069H
	jmp	$eva_err$70266
$L70269:

; 106  : 			if(ctrl_eval_fieldexpr(cntxt, ctrl, &data, expr->data)) STACK_ERROR;

	mov	edx, DWORD PTR _expr$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_eval_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70272
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 106		; 0000006aH
	jmp	$eva_err$70266
$L70272:

; 108  : 
; 109  : 		/* Output results in place of brackets */
; 110  : 		for(i = 0; i < data.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70273
$L70274:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70273:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _data$[ebp]
	jae	$L70275

; 112  : 			char *txt = dyntab_val(&data, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _txt$70276[ebp], eax

; 113  : 			ReplaceTable *sr = (conv == 1 || (conv == 2 && *txt != '<')) ? plain_to_html : NULL;

	cmp	DWORD PTR _conv$[ebp], 1
	je	SHORT $L70914
	cmp	DWORD PTR _conv$[ebp], 2
	jne	SHORT $L70913
	mov	edx, DWORD PTR _txt$70276[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 60					; 0000003cH
	jne	SHORT $L70914
$L70913:
	mov	DWORD PTR -64+[ebp], 0
	jmp	SHORT $L70915
$L70914:
	mov	DWORD PTR -64+[ebp], OFFSET FLAT:_plain_to_html
$L70915:
	mov	ecx, DWORD PTR -64+[ebp]
	mov	DWORD PTR _sr$70277[ebp], ecx

; 114  : 			if(i) DYNBUF_ADD_STR(res, ", ");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70281
	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70282
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70281
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70284
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 114		; 00000072H
	jmp	SHORT $eva_err$70266
$L70281:

; 115  : 			if(dynbuf_add(res, txt, dyntab_sz(&data, i, 0), sr, sr ? 1 : 0)) RETURN_ERR_MEMORY;

	xor	edx, edx
	cmp	DWORD PTR _sr$70277[ebp], 0
	setne	dl
	push	edx
	mov	eax, DWORD PTR _sr$70277[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _txt$70276[ebp]
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70285
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70287
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 115		; 00000073H
	jmp	SHORT $eva_err$70266
$L70285:

; 116  : 		}

	jmp	$L70274
$L70275:

; 117  : 		start = end + 1;

	mov	ecx, DWORD PTR _end$70256[ebp]
	add	ecx, 1
	mov	DWORD PTR _start$[ebp], ecx

; 118  : 	}

	jmp	$L70249
$eva_noerr$70250:

; 119  :     RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70288
	push	OFFSET FLAT:$SG70289
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70266:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70290
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70291
	push	OFFSET FLAT:$SG70292
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70290:
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
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

; 120  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_mailmerge_brackets ENDP
_TEXT	ENDS
PUBLIC	_mail_file_link
EXTRN	_human_filesize:NEAR
EXTRN	_basename:NEAR
EXTRN	_cgi_output_string:NEAR
EXTRN	_no_quote:BYTE
EXTRN	_strtoul:NEAR
EXTRN	_qry_obj_field:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
$SG70350 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70315 DB	'_EVA_FILE_CLIENT_PATH', 00H
	ORG $+2
$SG70317 DB	'_EVA_FILE_SIZE', 00H
	ORG $+1
$SG70318 DB	'_EVA_FILE_SERVER_NAME', 00H
	ORG $+2
$SG70323 DB	'/docs/', 00H
	ORG $+1
$SG70324 DB	'http://', 00H
$SG70326 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70330 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70333 DB	'/', 00H
	ORG $+2
$SG70335 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70340 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70344 DB	''' target=_blank>', 00H
	ORG $+3
$SG70345 DB	'<a href=''', 00H
	ORG $+2
$SG70347 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70349 DB	'</a> - ', 00H
$SG70352 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70356 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70362 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70365 DB	0aH, 09H, 00H
	ORG $+1
$SG70366 DB	' - ', 00H
$SG70368 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70372 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70373 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70374 DB	'mail_file_link', 00H
	ORG $+1
$SG70376 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70377 DB	'mail_file_link', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_res$ = 12
_idobj$ = 16
_b_html$ = 20
_data$ = -32
_buf$ = -12
_fname$ = -4
_name$ = -36
_size$ = -8
__c$70337 = -40
_mail_file_link PROC NEAR

; 136  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H

; 137  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 138  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 139  : 	DynTableCell *fname, *name;
; 140  : 	char *size;
; 141  : 	if(qry_obj_field(cntxt, &data, idobj, NULL)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70313
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 141		; 0000008dH
	jmp	$eva_err$70314
$L70313:

; 142  : 	name = DYNTAB_FIELD_CELL(&data, FILE_CLIENT_PATH);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70315
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _name$[ebp], eax

; 143  : 	size = human_filesize(strtoul(DYNTAB_FIELD_VAL(&data, FILE_SIZE), NULL, 10));

	push	10					; 0000000aH
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70317
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	call	_human_filesize
	add	esp, 4
	mov	DWORD PTR _size$[ebp], eax

; 144  : 	fname = DYNTAB_FIELD_CELL(&data, FILE_SERVER_NAME);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70318
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _fname$[ebp], eax

; 145  : 	if(!fname) RETURN_OK;

	cmp	DWORD PTR _fname$[ebp], 0
	jne	SHORT $L70319
	jmp	$eva_noerr$70320
$L70319:

; 146  : 	DYNBUF_ADD3(&buf, "http://", cntxt->srvname, 0, NO_CONV, "/docs/");

	push	6
	push	OFFSET FLAT:$SG70323
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29744]
	push	eax
	push	7
	push	OFFSET FLAT:$SG70324
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70322
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70326
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 146		; 00000092H
	jmp	$eva_err$70314
$L70322:

; 147  : 	DYNBUF_ADD(&buf, cntxt->dbname, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29804]
	push	edx
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70328
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70330
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 147		; 00000093H
	jmp	$eva_err$70314
$L70328:

; 148  : 	DYNBUF_ADD_STR(&buf, "/");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70333
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70332
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70335
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 148		; 00000094H
	jmp	$eva_err$70314
$L70332:

; 149  : 	if(b_html)

	cmp	DWORD PTR _b_html$[ebp], 0
	je	$L70336

; 151  : 		DYNBUF_ADD_CELLP(&buf, fname, HTML_NO_QUOTE);

	mov	eax, DWORD PTR _fname$[ebp]
	mov	DWORD PTR __c$70337[ebp], eax
	cmp	DWORD PTR __c$70337[ebp], 0
	je	SHORT $L70338
	push	1
	push	OFFSET FLAT:_no_quote
	mov	ecx, DWORD PTR __c$70337[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR __c$70337[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70338
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70340
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 151		; 00000097H
	jmp	$eva_err$70314
$L70338:

; 152  : 		DYNBUF_ADD3_BUF(res, "<a href='", buf, NO_CONV, "' target=_blank>");

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70917
	mov	edx, DWORD PTR _buf$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L70918
$L70917:
	mov	DWORD PTR -44+[ebp], 0
$L70918:
	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70919
	mov	ecx, DWORD PTR _buf$[ebp]
	add	ecx, 8
	mov	DWORD PTR -48+[ebp], ecx
	jmp	SHORT $L70920
$L70919:
	mov	DWORD PTR -48+[ebp], 0
$L70920:
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70344
	push	0
	push	0
	mov	edx, DWORD PTR -44+[ebp]
	push	edx
	mov	eax, DWORD PTR -48+[ebp]
	push	eax
	push	9
	push	OFFSET FLAT:$SG70345
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70343
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70347
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 152		; 00000098H
	jmp	$eva_err$70314
$L70343:

; 153  :  		DYNBUF_ADD3(res, "", basename(name->txt, name->len), 0, TO_HTML, "</a> - ");

	push	7
	push	OFFSET FLAT:$SG70349
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_basename
	add	esp, 8
	push	eax
	push	0
	push	OFFSET FLAT:$SG70350
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70348
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70352
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 153		; 00000099H
	jmp	$eva_err$70314
$L70348:

; 154  : 		DYNBUF_ADD(res, size, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _size$[ebp]
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70354
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70356
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 154		; 0000009aH
	jmp	$eva_err$70314
$L70354:

; 156  : 	else

	jmp	$L70370
$L70336:

; 158  : 		if(cgi_output_string(cntxt, &buf, fname->txt, fname->len)) STACK_ERROR;

	mov	eax, DWORD PTR _fname$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _fname$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_output_string
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70358
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 158		; 0000009eH
	jmp	$eva_err$70314
$L70358:

; 159  : 		DYNBUF_ADD(res, basename(name->txt, name->len), 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_basename
	add	esp, 8
	push	eax
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70360
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70362
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 159		; 0000009fH
	jmp	$eva_err$70314
$L70360:

; 160  : 		DYNBUF_ADD3(res, " - ", size, 0, NO_CONV, "\n\t");

	push	2
	push	OFFSET FLAT:$SG70365
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _size$[ebp]
	push	edx
	push	3
	push	OFFSET FLAT:$SG70366
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70364
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70368
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 160		; 000000a0H
	jmp	SHORT $eva_err$70314
$L70364:

; 161  : 		DYNBUF_ADD_BUF(res, buf, NO_CONV);

	cmp	DWORD PTR _buf$[ebp], 0
	je	SHORT $L70370
	push	0
	push	0
	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70370
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70372
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 161		; 000000a1H
	jmp	SHORT $eva_err$70314
$L70370:
$eva_noerr$70320:

; 163  : 
; 164  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70373
	push	OFFSET FLAT:$SG70374
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70314:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70375
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70376
	push	OFFSET FLAT:$SG70377
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70375:
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 165  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_mail_file_link ENDP
_TEXT	ENDS
PUBLIC	_attach_list
EXTRN	_dynbuf_add3_int:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70394 DB	'<font face=Arial><b>Pi', 0c3H, 0a8H, 'ces jointes :</b>', 00H
	ORG $+2
$SG70396 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70402 DB	') ', 00H
	ORG $+1
$SG70403 DB	'<br>&nbsp;&nbsp;', 00H
	ORG $+3
$SG70405 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70410 DB	'</font><br>', 00H
$SG70412 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70416 DB	0aH, 'Pi', 0c3H, 0a8H, 'ces jointes :', 0aH, 00H
$SG70418 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70423 DB	') ', 00H
	ORG $+1
$SG70424 DB	0aH, '  ', 00H
$SG70426 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70431 DB	0aH, 00H
	ORG $+2
$SG70433 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70434 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70435 DB	'attach_list', 00H
$SG70437 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70438 DB	'attach_list', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sm$ = 12
_html$ = -4
_i$ = -8
_attach_list PROC NEAR

; 178  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 179  : 	DynBuffer **html = &sm->txtbody;

	mov	eax, DWORD PTR _sm$[ebp]
	add	eax, 88					; 00000058H
	mov	DWORD PTR _html$[ebp], eax

; 180  : 	unsigned long i;
; 181  : 	if(!sm->att.nbrows) RETURN_OK;

	mov	ecx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [ecx+68], 0
	jne	SHORT $L70389
	jmp	$eva_noerr$70390
$L70389:

; 182  : 
; 183  : 	/* Add attachements to body */
; 184  : 	if(sm->b_html)

	mov	edx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [edx+96], 0
	je	$L70391

; 186  : 		DYNBUF_ADD_STR(html, "<font face=Arial><b>Pièces jointes :</b>");

	push	0
	push	0
	push	41					; 00000029H
	push	OFFSET FLAT:$SG70394
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70393
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70396
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 186		; 000000baH
	jmp	$eva_err$70397
$L70393:

; 187  : 		for(i = 0; i < sm->att.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70398
$L70399:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70398:
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+68]
	jae	$L70400

; 189  : 			DYNBUF_ADD3_INT(html, "<br>&nbsp;&nbsp;", i + 1, ") ");

	push	2
	push	OFFSET FLAT:$SG70402
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70403
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70401
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70405
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 189		; 000000bdH
	jmp	$eva_err$70397
$L70401:

; 190  : 			if(mail_file_link(cntxt, html, DYNTAB_TOULRC(&sm->att, i, 0), 1)) STACK_ERROR;

	push	1
	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sm$[ebp]
	add	edx, 68					; 00000044H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_mail_file_link
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70407
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 190		; 000000beH
	jmp	$eva_err$70397
$L70407:

; 191  : 		}

	jmp	$L70399
$L70400:

; 192  : 		DYNBUF_ADD_STR(html, "</font><br>");

	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70410
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70409
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70412
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 192		; 000000c0H
	jmp	$eva_err$70397
$L70409:

; 194  : 	else

	jmp	$L70430
$L70391:

; 196  : 		DYNBUF_ADD_STR(html, "\nPièces jointes :\n");

	push	0
	push	0
	push	19					; 00000013H
	push	OFFSET FLAT:$SG70416
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70415
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70418
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 196		; 000000c4H
	jmp	$eva_err$70397
$L70415:

; 197  : 		for(i = 0; i < sm->att.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70419
$L70420:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70419:
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+68]
	jae	$L70421

; 199  : 			DYNBUF_ADD3_INT(html, "\n  ", i + 1, ") ");

	push	2
	push	OFFSET FLAT:$SG70423
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	push	3
	push	OFFSET FLAT:$SG70424
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70422
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70426
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 199		; 000000c7H
	jmp	$eva_err$70397
$L70422:

; 200  : 			if(mail_file_link(cntxt, html, DYNTAB_TOULRC(&sm->att, i, 0), 0)) STACK_ERROR;

	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sm$[ebp]
	add	edx, 68					; 00000044H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_mail_file_link
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70428
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 200		; 000000c8H
	jmp	SHORT $eva_err$70397
$L70428:

; 201  : 		}

	jmp	$L70420
$L70421:

; 202  : 		DYNBUF_ADD_STR(html, "\n");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70431
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70430
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70433
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 202		; 000000caH
	jmp	SHORT $eva_err$70397
$L70430:
$eva_noerr$70390:

; 204  : 
; 205  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70434
	push	OFFSET FLAT:$SG70435
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70397:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70436
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70437
	push	OFFSET FLAT:$SG70438
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70436:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 206  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_attach_list ENDP
_TEXT	ENDS
PUBLIC	_show_adr_dest
EXTRN	_dyntab_to_dynbuf:NEAR
_DATA	SEGMENT
$SG70456 DB	' :</nobr></td><td>', 00H
	ORG $+1
$SG70457 DB	'<tr><td align=right valign=top><nobr><b>', 00H
	ORG $+3
$SG70459 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70462 DB	', ', 00H
	ORG $+1
$SG70463 DB	',', 00H
	ORG $+2
$SG70465 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70468 DB	'</td></tr>', 00H
	ORG $+1
$SG70470 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70471 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70472 DB	'show_adr_dest', 00H
	ORG $+2
$SG70474 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70475 DB	'show_adr_dest', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_dst$ = 12
_title$ = 16
_sz_title$ = 20
_html$ = -4
_show_adr_dest PROC NEAR

; 220  : ){

	push	ebp
	mov	ebp, esp
	push	ecx

; 221  : 	DynBuffer **html = cntxt->form->html;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR _html$[ebp], edx

; 222  : 	if(!dst->nbrows) RETURN_OK;

	mov	eax, DWORD PTR _dst$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L70453
	jmp	$eva_noerr$70454
$L70453:

; 223  : 
; 224  : 	DYNBUF_ADD3(html, "<tr><td align=right valign=top><nobr><b>", title, sz_title, TO_HTML, " :</nobr></td><td>");

	push	18					; 00000012H
	push	OFFSET FLAT:$SG70456
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR _sz_title$[ebp]
	push	ecx
	mov	edx, DWORD PTR _title$[ebp]
	push	edx
	push	40					; 00000028H
	push	OFFSET FLAT:$SG70457
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70455
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70459
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 224		; 000000e0H
	jmp	$eva_err$70460
$L70455:

; 225  : 	if(dyntab_to_dynbuf(dst, html, add_sz_str(","), add_sz_str(", "), TO_HTML)) RETURN_ERR_MEMORY;

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	2
	push	OFFSET FLAT:$SG70462
	push	1
	push	OFFSET FLAT:$SG70463
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	mov	ecx, DWORD PTR _dst$[ebp]
	push	ecx
	call	_dyntab_to_dynbuf
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70461
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70465
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 225		; 000000e1H
	jmp	SHORT $eva_err$70460
$L70461:

; 226  : 	DYNBUF_ADD_STR(html, "</td></tr>");

	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70468
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70467
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70470
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 226		; 000000e2H
	jmp	SHORT $eva_err$70460
$L70467:
$eva_noerr$70454:

; 227  : 
; 228  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70471
	push	OFFSET FLAT:$SG70472
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70460:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70473
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70474
	push	OFFSET FLAT:$SG70475
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70473:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 229  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_show_adr_dest ENDP
_TEXT	ENDS
PUBLIC	_file_adr_dest
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fprintf:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70505 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70496 DB	'wc', 00H
	ORG $+1
$SG70499 DB	'Droits d''acc', 0e8H, 's incorrects sur un dossier', 00H
	ORG $+3
$SG70504 DB	',', 00H
	ORG $+2
$SG70506 DB	'%s%s', 00H
	ORG $+3
$SG70509 DB	' ', 00H
	ORG $+2
$SG70510 DB	' -', 00H
	ORG $+1
$SG70512 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70516 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70517 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70518 DB	'file_adr_dest', 00H
	ORG $+2
$SG70520 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70521 DB	'file_adr_dest', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cmd$ = 12
_dst$ = 16
_fname$ = 20
_opt$ = 24
_f$ = -4
_i$ = -8
_file_adr_dest PROC NEAR

; 245  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 246  : 	FILE *f = NULL;

	mov	DWORD PTR _f$[ebp], 0

; 247  : 	unsigned long i;
; 248  : 
; 249  : 	/* Return if email empty */
; 250  : 	if(!dyntab_sz(dst, 0, 0)) RETURN_OK;

	push	0
	push	0
	mov	eax, DWORD PTR _dst$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70494
	jmp	$eva_noerr$70495
$L70494:

; 251  : 
; 252  : 	/* Output adresses to file */
; 253  : 	f = fopen(fname, "wc");

	push	OFFSET FLAT:$SG70496
	mov	ecx, DWORD PTR _fname$[ebp]
	push	ecx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 254  : 	if(!f) RETURN_ERR_DIRECTORY(NOP);

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L70497
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70499
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 254		; 000000feH
	jmp	$eva_err$70500
$L70497:

; 255  : 	for(i = 0; i < dst->nbrows; i++) fprintf(f, "%s%s", i ? "," : "", dyntab_val(dst, i, 0));

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70501
$L70502:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70501:
	mov	edx, DWORD PTR _dst$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L70503
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70924
	mov	DWORD PTR -12+[ebp], OFFSET FLAT:$SG70504
	jmp	SHORT $L70925
$L70924:
	mov	DWORD PTR -12+[ebp], OFFSET FLAT:$SG70505
$L70925:
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _dst$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR -12+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70506
	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fprintf
	add	esp, 16					; 00000010H
	jmp	SHORT $L70502
$L70503:

; 256  : 	fclose(f);

	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	call	_fclose
	add	esp, 4

; 257  : 
; 258  : 	/* Add file to send mail command line */
; 259  : 	DYNBUF_ADD3(cmd, " -", opt, 2, NO_CONV, " ");

	push	1
	push	OFFSET FLAT:$SG70509
	push	0
	push	0
	push	2
	mov	eax, DWORD PTR _opt$[ebp]
	push	eax
	push	2
	push	OFFSET FLAT:$SG70510
	mov	ecx, DWORD PTR _cmd$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70508
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70512
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 259		; 00000103H
	jmp	SHORT $eva_err$70500
$L70508:

; 260  : 	DYNBUF_ADD(cmd, fname, 7, NO_CONV);

	push	0
	push	0
	push	7
	mov	ecx, DWORD PTR _fname$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cmd$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70514
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70516
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 260		; 00000104H
	jmp	SHORT $eva_err$70500
$L70514:
$eva_noerr$70495:

; 261  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70517
	push	OFFSET FLAT:$SG70518
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70500:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70519
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70520
	push	OFFSET FLAT:$SG70521
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70519:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 262  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_file_adr_dest ENDP
_TEXT	ENDS
PUBLIC	_send_mail
EXTRN	_ctrl_eval_valtyp:NEAR
EXTRN	_fputs:NEAR
EXTRN	_stat:NEAR
EXTRN	_syscmd_string:BYTE
EXTRN	_system:NEAR
EXTRN	_qry_add_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_dyntab_filter_field:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70553 DB	01H DUP (?)
	ALIGN	4

$SG70566 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70541 DB	'wc', 00H
	ORG $+1
$SG70542 DB	'body.txt', 00H
	ORG $+3
$SG70545 DB	'Droits d''acc', 0e8H, 's incorrects sur un dossier', 00H
	ORG $+3
$SG70549 DB	'<img src=''http://%s%s?MailRead=%s'' width=1 height=1>', 00H
	ORG $+3
$SG70552 DB	'\BLAT.EXE body.txt -debug -noh2', 00H
$SG70555 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70559 DB	' -html', 00H
	ORG $+1
$SG70561 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70567 DB	' -mailfrom ', 00H
$SG70569 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70572 DB	'tf', 00H
	ORG $+1
$SG70573 DB	'dst.txt', 00H
$SG70574 DB	'cf', 00H
	ORG $+1
$SG70575 DB	'cpy.txt', 00H
$SG70576 DB	'bf', 00H
	ORG $+1
$SG70577 DB	'hid.txt', 00H
$SG70580 DB	'" >res.txt 2>err.txt', 00H
	ORG $+3
$SG70581 DB	' -s "', 00H
	ORG $+2
$SG70583 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70584 DB	'err.txt', 00H
$SG70586 DB	'Erreur lors du lancement de la commande d''envoi du mess'
	DB	'age', 00H
	ORG $+1
$SG70587 DB	'err.txt', 00H
$SG70590 DB	'Erreur lors de la transmission au serveur de messagerie', 00H
$SG70591 DB	'res.txt', 00H
$SG70596 DB	'_EVA_STORE_SENT', 00H
$SG70598 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70602 DB	'_EVA_CURRENTOBJ', 00H
$SG70603 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70604 DB	'send_mail', 00H
	ORG $+2
$SG70608 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70616 DB	'_EVA_MAIL_SENT_FROM', 00H
$SG70620 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70621 DB	'send_mail', 00H
	ORG $+2
$SG70623 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70624 DB	'send_mail', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sm$ = 12
_form$ = -40
_ctrl$ = -92
_cmd$ = -96
_data$ = -64
_res$ = -88
_f$ = -68
_fs$ = -36
_err$ = -44
__c$70562 = -100
_c$70593 = -104
_end$70610 = -112
_idsent$70612 = -108
_send_mail PROC NEAR

; 277  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 132				; 00000084H

; 278  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 279  : 	EVA_ctrl *ctrl = form->ctrl + sm->i_ctrl;

	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 280  : 	DynBuffer *cmd = NULL;

	mov	DWORD PTR _cmd$[ebp], 0

; 281  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 282  : 	DynTable res = {0};

	mov	DWORD PTR _res$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _res$[ebp+4], ecx
	mov	DWORD PTR _res$[ebp+8], ecx
	mov	DWORD PTR _res$[ebp+12], ecx
	mov	DWORD PTR _res$[ebp+16], ecx

; 283  : 	FILE *f = NULL;

	mov	DWORD PTR _f$[ebp], 0

; 284  : 	struct stat fs;
; 285  : 	int err;
; 286  : 
; 287  : 	/* Create body text file */
; 288  : 	f = fopen("body.txt", "wc");

	push	OFFSET FLAT:$SG70541
	push	OFFSET FLAT:$SG70542
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax

; 289  : 	if(!f) RETURN_ERR_DIRECTORY(NOP);

	cmp	DWORD PTR _f$[ebp], 0
	jne	SHORT $L70543
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70545
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 289		; 00000121H
	jmp	$eva_err$70546
$L70543:

; 290  : 	if(sm->txtbody) fputs(sm->txtbody->data, f);

	mov	ecx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [ecx+88], 0
	je	SHORT $L70547
	mov	edx, DWORD PTR _f$[ebp]
	push	edx
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+88]
	add	ecx, 8
	push	ecx
	call	_fputs
	add	esp, 8
$L70547:

; 291  : 
; 292  : 	/* If HTML mode & object exists : add invisible image for read confirmation */
; 293  : 	if(sm->b_html && dyntab_sz(&form->id_obj, 0, 0))

	mov	edx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [edx+96], 0
	je	SHORT $L70548
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70548

; 295  : 		fprintf(f, "<img src='http://%s%s?MailRead=%s' width=1 height=1>",
; 296  : 					cntxt->srvname, cntxt->requri, dyntab_val(&form->id_obj, 0, 0));

	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29740]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29744]
	push	edx
	push	OFFSET FLAT:$SG70549
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_fprintf
	add	esp, 20					; 00000014H
$L70548:

; 298  : 	fclose(f);

	mov	ecx, DWORD PTR _f$[ebp]
	push	ecx
	call	_fclose
	add	esp, 4

; 299  : 
; 300  : 	/* Build BLAT command : exe, body & sender */
; 301  : 	DYNBUF_ADD3(&cmd, "", cntxt->path, 0, NO_CONV, DD "BLAT.EXE body.txt -debug -noh2");

	push	31					; 0000001fH
	push	OFFSET FLAT:$SG70552
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29728]
	push	eax
	push	0
	push	OFFSET FLAT:$SG70553
	lea	ecx, DWORD PTR _cmd$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70551
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70555
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 301		; 0000012dH
	jmp	$eva_err$70546
$L70551:

; 302  : 	if(sm->b_html) DYNBUF_ADD_STR(&cmd, " -html");

	mov	ecx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [ecx+96], 0
	je	SHORT $L70558
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70559
	lea	edx, DWORD PTR _cmd$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70558
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70561
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 302		; 0000012eH
	jmp	$eva_err$70546
$L70558:

; 303  : 	DYNBUF_ADD3_CELLP(&cmd, " -mailfrom ", sm->from, NO_CONV, "");

	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR __c$70562[ebp], eax
	cmp	DWORD PTR __c$70562[ebp], 0
	je	SHORT $L70927
	mov	ecx, DWORD PTR __c$70562[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -116+[ebp], edx
	jmp	SHORT $L70928
$L70927:
	mov	DWORD PTR -116+[ebp], 0
$L70928:
	cmp	DWORD PTR __c$70562[ebp], 0
	je	SHORT $L70929
	mov	eax, DWORD PTR __c$70562[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -120+[ebp], ecx
	jmp	SHORT $L70930
$L70929:
	mov	DWORD PTR -120+[ebp], 0
$L70930:
	push	0
	push	OFFSET FLAT:$SG70566
	push	0
	push	0
	mov	edx, DWORD PTR -116+[ebp]
	push	edx
	mov	eax, DWORD PTR -120+[ebp]
	push	eax
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70567
	lea	ecx, DWORD PTR _cmd$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70565
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70569
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 303		; 0000012fH
	jmp	$eva_err$70546
$L70565:

; 304  : 
; 305  : 	/* Build BLAT command : files with destination emails */
; 306  : 	if( file_adr_dest(cntxt, &cmd, &sm->dst, "dst.txt", "tf") ||
; 307  : 		file_adr_dest(cntxt, &cmd, &sm->cpy, "cpy.txt", "cf") ||
; 308  : 		file_adr_dest(cntxt, &cmd, &sm->hid, "hid.txt", "bf"))

	push	OFFSET FLAT:$SG70572
	push	OFFSET FLAT:$SG70573
	mov	ecx, DWORD PTR _sm$[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _cmd$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_file_adr_dest
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70571
	push	OFFSET FLAT:$SG70574
	push	OFFSET FLAT:$SG70575
	mov	ecx, DWORD PTR _sm$[ebp]
	add	ecx, 28					; 0000001cH
	push	ecx
	lea	edx, DWORD PTR _cmd$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_file_adr_dest
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70571
	push	OFFSET FLAT:$SG70576
	push	OFFSET FLAT:$SG70577
	mov	ecx, DWORD PTR _sm$[ebp]
	add	ecx, 48					; 00000030H
	push	ecx
	lea	edx, DWORD PTR _cmd$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_file_adr_dest
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70570
$L70571:

; 309  : 		STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 309		; 00000135H
	jmp	$eva_err$70546
$L70570:

; 310  : 
; 311  : 	/* Build BLAT command : subject */
; 312  : 	DYNBUF_ADD3_BUF(&cmd, " -s \"", sm->txtsubj, TO_SYSCMD, "\" >res.txt 2>err.txt");

	mov	edx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [edx+92], 0
	je	SHORT $L70931
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+92]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -124+[ebp], edx
	jmp	SHORT $L70932
$L70931:
	mov	DWORD PTR -124+[ebp], 0
$L70932:
	mov	eax, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [eax+92], 0
	je	SHORT $L70933
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+92]
	add	edx, 8
	mov	DWORD PTR -128+[ebp], edx
	jmp	SHORT $L70934
$L70933:
	mov	DWORD PTR -128+[ebp], 0
$L70934:
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70580
	push	1
	push	OFFSET FLAT:_syscmd_string
	mov	eax, DWORD PTR -124+[ebp]
	push	eax
	mov	ecx, DWORD PTR -128+[ebp]
	push	ecx
	push	5
	push	OFFSET FLAT:$SG70581
	lea	edx, DWORD PTR _cmd$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70579
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70583
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 312		; 00000138H
	jmp	$eva_err$70546
$L70579:

; 313  : 
; 314  : 	/* Launch BLAT command */
; 315  : 	err = system(cmd->data);

	mov	edx, DWORD PTR _cmd$[ebp]
	add	edx, 8
	push	edx
	call	_system
	add	esp, 4
	mov	DWORD PTR _err$[ebp], eax

; 316  : 	stat("err.txt", &fs);

	lea	eax, DWORD PTR _fs$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70584
	call	_stat
	add	esp, 8

; 317  : 
; 318  : 	/* Handle error */
; 319  : 	if(fs.st_size)

	cmp	DWORD PTR _fs$[ebp+20], 0
	je	SHORT $L70585

; 321  : 		sm->err = "Erreur lors du lancement de la commande d'envoi du message";

	mov	ecx, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [ecx+104], OFFSET FLAT:$SG70586

; 322  : 		sm->err_file = "err.txt";

	mov	edx, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [edx+108], OFFSET FLAT:$SG70587

; 324  : 	else if(err)

	jmp	$eva_noerr$70619
$L70585:
	cmp	DWORD PTR _err$[ebp], 0
	je	SHORT $L70589

; 326  : 		sm->err = "Erreur lors de la transmission au serveur de messagerie";

	mov	eax, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [eax+104], OFFSET FLAT:$SG70590

; 327  : 		sm->err_file = "res.txt";

	mov	ecx, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [ecx+108], OFFSET FLAT:$SG70591

; 329  : 	else

	jmp	$eva_noerr$70619
$L70589:

; 331  : 		/* No error : handle sent storage */
; 332  : 		DynTableCell *c;
; 333  : 		CTRL_ATTR(data, STORE_SENT);

	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70596
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70595
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70598
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 333		; 0000014dH
	jmp	$eva_err$70546
$L70595:

; 334  : 		if(data.nbrows)

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L70599

; 336  : 			/* Eval storage field if given */
; 337  : 			if(ctrl_eval_valtyp(cntxt, ctrl, &res, "_EVA_CURRENTOBJ", NULL, &data)) CLEAR_ERROR;

	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	0
	push	OFFSET FLAT:$SG70602
	lea	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_eval_valtyp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70601
	push	337					; 00000151H
	push	OFFSET FLAT:$SG70603
	push	OFFSET FLAT:$SG70604
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70601:

; 339  : 		else

	jmp	SHORT $L70606
$L70599:

; 340  : 			/* Use sender email as default value to store message sent */
; 341  : 			DYNTAB_ADD_CELLP(&res, 0, 0, sm->from);

	push	1
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70606
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70608
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 341		; 00000155H
	jmp	$eva_err$70546
$L70606:

; 342  : 
; 343  : 		/* Store message sent if applicable */
; 344  : 		c = dyntab_cell(&res, 0, 0);

	push	0
	push	0
	lea	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70593[ebp], eax

; 345  : 		if(c)

	cmp	DWORD PTR _c$70593[ebp], 0
	je	$L70618

; 347  : 			/* Check if message sent info is an IdObj */
; 348  : 			char *end = NULL;

	mov	DWORD PTR _end$70610[ebp], 0

; 349  : 			unsigned long idsent = c->txt ? strtoul(c->txt, &end, 10) : 0;

	mov	eax, DWORD PTR _c$70593[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70935
	push	10					; 0000000aH
	lea	ecx, DWORD PTR _end$70610[ebp]
	push	ecx
	mov	edx, DWORD PTR _c$70593[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -132+[ebp], eax
	jmp	SHORT $L70936
$L70935:
	mov	DWORD PTR -132+[ebp], 0
$L70936:
	mov	ecx, DWORD PTR -132+[ebp]
	mov	DWORD PTR _idsent$70612[ebp], ecx

; 350  : 			if(idsent && !*end)

	cmp	DWORD PTR _idsent$70612[ebp], 0
	je	SHORT $L70613
	mov	edx, DWORD PTR _end$70610[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70613

; 352  : 				c->IdValue = idsent;

	mov	ecx, DWORD PTR _c$70593[ebp]
	mov	edx, DWORD PTR _idsent$70612[ebp]
	mov	DWORD PTR [ecx+32], edx

; 353  : 				c->b_relation = 1;

	mov	eax, DWORD PTR _c$70593[ebp]
	mov	BYTE PTR [eax+12], 1
$L70613:

; 355  : 
; 356  : 			/* Prepare message sent record */
; 357  : 			c->IdObj = DYNTAB_TOUL(&form->id_obj);

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
	mov	edx, DWORD PTR _c$70593[ebp]
	mov	DWORD PTR [edx+20], eax

; 358  : 			if(!c->b_dontfreefield) M_FREE(c->field);

	mov	eax, DWORD PTR _c$70593[ebp]
	movsx	ecx, BYTE PTR [eax+15]
	test	ecx, ecx
	jne	SHORT $L70615
	mov	edx, DWORD PTR _c$70593[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _c$70593[ebp]
	mov	DWORD PTR [ecx+8], 0
$L70615:

; 359  : 			c->b_dontfreefield = 1;

	mov	edx, DWORD PTR _c$70593[ebp]
	mov	BYTE PTR [edx+15], 1

; 360  : 			c->field = "_EVA_MAIL_SENT_FROM";

	mov	eax, DWORD PTR _c$70593[ebp]
	mov	DWORD PTR [eax+8], OFFSET FLAT:$SG70616

; 361  : 			c->IdField = 0;

	mov	ecx, DWORD PTR _c$70593[ebp]
	mov	DWORD PTR [ecx+28], 0

; 362  : 			if(qry_add_val(cntxt, c, 0, NULL)) STACK_ERROR;

	push	0
	push	0
	mov	edx, DWORD PTR _c$70593[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_val
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70618
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 362		; 0000016aH
	jmp	SHORT $eva_err$70546
$L70618:

; 364  : 		sm->b_done = 1;

	mov	edx, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [edx+100], 1
$eva_noerr$70619:

; 366  : 
; 367  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70620
	push	OFFSET FLAT:$SG70621
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70546:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70622
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70623
	push	OFFSET FLAT:$SG70624
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70622:
	mov	edx, DWORD PTR _cmd$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _cmd$[ebp], 0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 368  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_send_mail ENDP
_TEXT	ENDS
PUBLIC	_preview_mail
EXTRN	_put_html_button_sz:NEAR
EXTRN	_ctrl_cgi_name:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70643 DB	'</td></tr>', 00H
	ORG $+1
$SG70644 DB	'<table border=0 bgcolor=#ffffff width=100%><tr><td><tabl'
	DB	'e border=0><tr><td align=right><b>Exp', 0c3H, 0a9H, 'diteur :'
	DB	'</td><td>', 00H
	ORG $+3
$SG70646 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70649 DB	'Destinataire', 00H
	ORG $+3
$SG70651 DB	'Copie ', 0c3H, 0a0H, 00H
	ORG $+3
$SG70653 DB	'Copie cach', 0c3H, 0a9H, 'e', 00H
	ORG $+2
$SG70656 DB	'</td></tr></table></td></tr><tr><td><hr>', 00H
	ORG $+3
$SG70657 DB	'<tr><td align=right valign=top><b>Sujet :</td><td>', 00H
	ORG $+1
$SG70659 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70664 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70668 DB	'</font>', 00H
$SG70669 DB	'<font face=courier size=-1>', 00H
$SG70671 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70674 DB	'<hr></td></tr></table><center>', 00H
	ORG $+1
$SG70676 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70679 DB	'SENDMAIL', 00H
	ORG $+3
$SG70685 DB	'Envoyer le message', 00H
	ORG $+1
$SG70688 DB	'</center>', 00H
	ORG $+2
$SG70690 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70692 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70693 DB	'preview_mail', 00H
	ORG $+3
$SG70695 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70696 DB	'preview_mail', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sm$ = 12
_form$ = -4
_ctrl$ = -16
_name$ = -12
_html$ = -8
__c$70639 = -20
_preview_mail PROC NEAR

; 381  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH

; 382  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 383  : 	EVA_ctrl *ctrl = form->ctrl + sm->i_ctrl;

	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 384  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 385  : 	DynBuffer **html = form->html;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR _html$[ebp], ecx

; 389  : 		"<table border=0><tr>"
; 390  : 		"<td align=right><b>Expéditeur :</td><td>", sm->from, NO_CONV, "</td></tr>");

	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR __c$70639[ebp], eax
	cmp	DWORD PTR __c$70639[ebp], 0
	je	SHORT $L70938
	mov	ecx, DWORD PTR __c$70639[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -24+[ebp], edx
	jmp	SHORT $L70939
$L70938:
	mov	DWORD PTR -24+[ebp], 0
$L70939:
	cmp	DWORD PTR __c$70639[ebp], 0
	je	SHORT $L70940
	mov	eax, DWORD PTR __c$70639[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR -28+[ebp], ecx
	jmp	SHORT $L70941
$L70940:
	mov	DWORD PTR -28+[ebp], 0
$L70941:
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70643
	push	0
	push	0
	mov	edx, DWORD PTR -24+[ebp]
	push	edx
	mov	eax, DWORD PTR -28+[ebp]
	push	eax
	push	112					; 00000070H
	push	OFFSET FLAT:$SG70644
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70642
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70646
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 390		; 00000186H
	jmp	$eva_err$70647
$L70642:

; 391  : 	if(show_adr_dest(cntxt, &sm->dst, add_sz_str("Destinataire"))) STACK_ERROR;

	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70649
	mov	ecx, DWORD PTR _sm$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_show_adr_dest
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70648
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 391		; 00000187H
	jmp	$eva_err$70647
$L70648:

; 392  : 	if(show_adr_dest(cntxt, &sm->cpy, add_sz_str("Copie à"))) STACK_ERROR;

	push	8
	push	OFFSET FLAT:$SG70651
	mov	ecx, DWORD PTR _sm$[ebp]
	add	ecx, 28					; 0000001cH
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_show_adr_dest
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70650
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 392		; 00000188H
	jmp	$eva_err$70647
$L70650:

; 393  : 	if(show_adr_dest(cntxt, &sm->hid, add_sz_str("Copie cachée"))) STACK_ERROR;

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70653
	mov	ecx, DWORD PTR _sm$[ebp]
	add	ecx, 48					; 00000030H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_show_adr_dest
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70652
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 393		; 00000189H
	jmp	$eva_err$70647
$L70652:

; 395  : 							"<b>Sujet :</td><td>", sm->txtsubj, TO_HTML, "</td>"
; 396  : 							"</tr></table></td></tr><tr><td><hr>");

	mov	ecx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [ecx+92], 0
	je	SHORT $L70942
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+92]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -32+[ebp], ecx
	jmp	SHORT $L70943
$L70942:
	mov	DWORD PTR -32+[ebp], 0
$L70943:
	mov	edx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [edx+92], 0
	je	SHORT $L70944
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+92]
	add	ecx, 8
	mov	DWORD PTR -36+[ebp], ecx
	jmp	SHORT $L70945
$L70944:
	mov	DWORD PTR -36+[ebp], 0
$L70945:
	push	40					; 00000028H
	push	OFFSET FLAT:$SG70656
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	edx, DWORD PTR -32+[ebp]
	push	edx
	mov	eax, DWORD PTR -36+[ebp]
	push	eax
	push	50					; 00000032H
	push	OFFSET FLAT:$SG70657
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70655
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70659
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 396		; 0000018cH
	jmp	$eva_err$70647
$L70655:

; 397  : 	if(sm->b_html)

	mov	ecx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [ecx+96], 0
	je	SHORT $L70660

; 398  : 		DYNBUF_ADD_BUF(html, sm->txtbody, NO_CONV)

	mov	edx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [edx+88], 0
	je	SHORT $L70662
	push	0
	push	0
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+88]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+88]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70662
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70664
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 398		; 0000018eH
	jmp	$eva_err$70647
$L70662:

; 399  : 	else

	jmp	$L70667
$L70660:

; 400  : 		DYNBUF_ADD3_BUF(html, "<font face=courier size=-1>", sm->txtbody, TO_HTML, "</font>");

	mov	edx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [edx+88], 0
	je	SHORT $L70946
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+88]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -40+[ebp], edx
	jmp	SHORT $L70947
$L70946:
	mov	DWORD PTR -40+[ebp], 0
$L70947:
	mov	eax, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [eax+88], 0
	je	SHORT $L70948
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+88]
	add	edx, 8
	mov	DWORD PTR -44+[ebp], edx
	jmp	SHORT $L70949
$L70948:
	mov	DWORD PTR -44+[ebp], 0
$L70949:
	push	7
	push	OFFSET FLAT:$SG70668
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	eax, DWORD PTR -40+[ebp]
	push	eax
	mov	ecx, DWORD PTR -44+[ebp]
	push	ecx
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG70669
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70667
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70671
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 400		; 00000190H
	jmp	$eva_err$70647
$L70667:

; 401  : 	DYNBUF_ADD_STR(html, "<hr></td></tr></table><center>");

	push	0
	push	0
	push	30					; 0000001eH
	push	OFFSET FLAT:$SG70674
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70673
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70676
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 401		; 00000191H
	jmp	$eva_err$70647
$L70673:

; 402  : 	CTRL_CGINAMEBTN(&name, NULL, add_sz_str("SENDMAIL"));

	push	8
	push	OFFSET FLAT:$SG70679
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
	je	SHORT $L70678
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 402		; 00000192H
	jmp	$eva_err$70647
$L70678:

; 403  : 	if(put_html_button(cntxt, name->data, "Envoyer le message", NULL, NULL, NULL, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70685
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70684
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 403		; 00000193H
	jmp	SHORT $eva_err$70647
$L70684:

; 404  : 	DYNBUF_ADD_STR(html, "</center>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70688
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70687
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70690
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 404		; 00000194H
	jmp	SHORT $eva_err$70647
$L70687:
$eva_noerr$70691:

; 405  : 
; 406  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70692
	push	OFFSET FLAT:$SG70693
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70647:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70694
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70695
	push	OFFSET FLAT:$SG70696
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70694:
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

; 407  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_preview_mail ENDP
_TEXT	ENDS
PUBLIC	_prepare_mail
EXTRN	_sprintf:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70712 DB	01H DUP (?)
	ALIGN	4

$SG70793 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70711 DB	'_EVA_DOC_LINK_POS', 00H
	ORG $+2
$SG70715 DB	'_EVA_EMAIL_DEST', 00H
$SG70717 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70721 DB	'_EVA_CURRENTOBJ', 00H
$SG70722 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70723 DB	'prepare_mail', 00H
	ORG $+3
$SG70726 DB	'_EVA_EMAIL_DESTCOPY', 00H
$SG70728 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70731 DB	'_EVA_CURRENTOBJ', 00H
$SG70732 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70733 DB	'prepare_mail', 00H
	ORG $+3
$SG70736 DB	'_EVA_EMAIL_DESTHIDDEN', 00H
	ORG $+2
$SG70738 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70741 DB	'_EVA_CURRENTOBJ', 00H
$SG70742 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70743 DB	'prepare_mail', 00H
	ORG $+3
$SG70745 DB	'Le message n''a pas de destinataire', 00H
	ORG $+1
$SG70748 DB	'_EVA_EMAIL_SUBJECT', 00H
	ORG $+1
$SG70750 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70751 DB	'prepare_mail', 00H
	ORG $+3
$SG70753 DB	'Le message n''a pas de sujet', 00H
$SG70755 DB	'...', 00H
$SG70757 DB	'_EVA_EMAIL_BODY', 00H
$SG70760 DB	'_EVA_EMAIL_ATTACH', 00H
	ORG $+2
$SG70762 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70765 DB	'_EVA_CURRENTOBJ', 00H
$SG70766 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70767 DB	'prepare_mail', 00H
	ORG $+3
$SG70772 DB	'<hr>', 00H
	ORG $+3
$SG70773 DB	0aH, 00H
	ORG $+2
$SG70775 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70777 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70778 DB	'prepare_mail', 00H
	ORG $+3
$SG70782 DB	'<hr>', 00H
	ORG $+3
$SG70783 DB	0aH, 00H
	ORG $+2
$SG70785 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70787 DB	'_EVA_EMAIL_SENDER', 00H
	ORG $+2
$SG70789 DB	'EMAIL', 00H
	ORG $+2
$SG70792 DB	'_EVA_NO_SENDER_COPY', 00H
$SG70794 DB	'EMAIL', 00H
	ORG $+2
$SG70798 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70799 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70800 DB	'prepare_mail', 00H
	ORG $+3
$SG70802 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70803 DB	'prepare_mail', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sm$ = 12
_form$ = -8
_ctrl$ = -36
_data$ = -32
_c$ = -12
_link_pos$ = -4
_prepare_mail PROC NEAR

; 420  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H

; 421  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 422  : 	EVA_ctrl *ctrl = form->ctrl + sm->i_ctrl;

	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 423  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 424  : 	DynTableCell *c;
; 425  : 	char *link_pos = CTRL_ATTR_VAL(DOC_LINK_POS);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70951
	push	0
	push	-1
	push	OFFSET FLAT:$SG70711
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -40+[ebp], eax
	jmp	SHORT $L70952
$L70951:
	mov	DWORD PTR -40+[ebp], OFFSET FLAT:$SG70712
$L70952:
	mov	edx, DWORD PTR -40+[ebp]
	mov	DWORD PTR _link_pos$[ebp], edx

; 426  : 
; 427  : 	/* Build destination adress list */
; 428  : 	CTRL_ATTR(data, EMAIL_DEST);

	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70715
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70714
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70717
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 428		; 000001acH
	jmp	$eva_err$70718
$L70714:

; 429  : 	if(data.nbrows && ctrl_eval_valtyp(cntxt, ctrl, &sm->dst, "_EVA_CURRENTOBJ", NULL, &data)) CLEAR_ERROR;

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L70720
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	push	0
	push	OFFSET FLAT:$SG70721
	mov	eax, DWORD PTR _sm$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_eval_valtyp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70720
	push	429					; 000001adH
	push	OFFSET FLAT:$SG70722
	push	OFFSET FLAT:$SG70723
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70720:

; 430  : 	CTRL_ATTR(data, EMAIL_DESTCOPY);

	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70726
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70725
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70728
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 430		; 000001aeH
	jmp	$eva_err$70718
$L70725:

; 431  : 	if(data.nbrows && ctrl_eval_valtyp(cntxt, ctrl, &sm->cpy, "_EVA_CURRENTOBJ", NULL, &data)) CLEAR_ERROR;

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L70730
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	push	OFFSET FLAT:$SG70731
	mov	ecx, DWORD PTR _sm$[ebp]
	add	ecx, 28					; 0000001cH
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_eval_valtyp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70730
	push	431					; 000001afH
	push	OFFSET FLAT:$SG70732
	push	OFFSET FLAT:$SG70733
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70730:

; 432  : 	CTRL_ATTR(data, EMAIL_DESTHIDDEN);

	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70736
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70735
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70738
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 432		; 000001b0H
	jmp	$eva_err$70718
$L70735:

; 433  : 	if(data.nbrows && ctrl_eval_valtyp(cntxt, ctrl, &sm->hid, "_EVA_CURRENTOBJ", NULL, &data)) CLEAR_ERROR;

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L70740
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	0
	push	OFFSET FLAT:$SG70741
	mov	edx, DWORD PTR _sm$[ebp]
	add	edx, 48					; 00000030H
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_eval_valtyp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70740
	push	433					; 000001b1H
	push	OFFSET FLAT:$SG70742
	push	OFFSET FLAT:$SG70743
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70740:

; 434  : 
; 435  : 	/* Return error if no destination adress */
; 436  : 	if(sm->dst.nbrows + sm->cpy.nbrows + sm->hid.nbrows == 0)

	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR _sm$[ebp]
	add	ecx, DWORD PTR [edx+28]
	mov	eax, DWORD PTR _sm$[ebp]
	add	ecx, DWORD PTR [eax+48]
	test	ecx, ecx
	jne	SHORT $L70744

; 438  : 		sm->err = "Le message n'a pas de destinataire";

	mov	ecx, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [ecx+104], OFFSET FLAT:$SG70745

; 439  : 		RETURN_OK;

	jmp	$eva_noerr$70746
$L70744:

; 441  : 
; 442  : 	/* Buil subject */
; 443  : 	c = CTRL_ATTR_CELL(EMAIL_SUBJECT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70953
	push	0
	push	-1
	push	OFFSET FLAT:$SG70748
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L70954
$L70953:
	mov	DWORD PTR -44+[ebp], 0
$L70954:
	mov	eax, DWORD PTR -44+[ebp]
	mov	DWORD PTR _c$[ebp], eax

; 444  : 	if(c && mailmerge_brackets(cntxt, &sm->txtsubj, c->txt, c->len, sm->i_ctrl, 0)) CLEAR_ERROR;

	cmp	DWORD PTR _c$[ebp], 0
	je	SHORT $L70749
	push	0
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _c$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _sm$[ebp]
	add	ecx, 92					; 0000005cH
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_mailmerge_brackets
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70749
	push	444					; 000001bcH
	push	OFFSET FLAT:$SG70750
	push	OFFSET FLAT:$SG70751
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70749:

; 445  : 
; 446  : 	/* Return error if no subject */
; 447  : 	if(!sm->txtsubj)

	mov	ecx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [ecx+92], 0
	jne	SHORT $L70752

; 449  : 		sm->err = "Le message n'a pas de sujet";

	mov	edx, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [edx+104], OFFSET FLAT:$SG70753

; 450  : 		RETURN_OK;

	jmp	$eva_noerr$70746
$L70752:

; 452  : 
; 453  : 	/* Limit subject length */
; 454  : 	if(sm->txtsubj && sm->txtsubj->cnt > 100)

	mov	eax, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [eax+92], 0
	je	SHORT $L70754
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+92]
	cmp	DWORD PTR [edx+4], 100			; 00000064H
	jbe	SHORT $L70754

; 456  : 		sprintf(sm->txtsubj->data + 97, "...");

	push	OFFSET FLAT:$SG70755
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+92]
	add	ecx, 105				; 00000069H
	push	ecx
	call	_sprintf
	add	esp, 8

; 457  : 		sm->txtsubj->cnt = 100;

	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+92]
	mov	DWORD PTR [eax+4], 100			; 00000064H
$L70754:

; 459  : 
; 460  : 	/* Check HTML format */
; 461  : 	c = CTRL_ATTR_CELL(EMAIL_BODY);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70955
	push	0
	push	-1
	push	OFFSET FLAT:$SG70757
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L70956
$L70955:
	mov	DWORD PTR -48+[ebp], 0
$L70956:
	mov	edx, DWORD PTR -48+[ebp]
	mov	DWORD PTR _c$[ebp], edx

; 462  : 	sm->b_html = c && c->txt[0] == '<';

	cmp	DWORD PTR _c$[ebp], 0
	je	SHORT $L70957
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 60					; 0000003cH
	jne	SHORT $L70957
	mov	DWORD PTR -52+[ebp], 1
	jmp	SHORT $L70958
$L70957:
	mov	DWORD PTR -52+[ebp], 0
$L70958:
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR -52+[ebp]
	mov	DWORD PTR [eax+96], ecx

; 463  : 
; 464  : 	/* Build attachements list & output to top of body if applicable */
; 465  : 	CTRL_ATTR(data, EMAIL_ATTACH);

	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70760
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70759
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70762
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 465		; 000001d1H
	jmp	$eva_err$70718
$L70759:

; 466  : 	if(data.nbrows && ctrl_eval_valtyp(cntxt, ctrl, &sm->att, "_EVA_CURRENTOBJ", NULL, &data)) CLEAR_ERROR;

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L70764
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	push	0
	push	OFFSET FLAT:$SG70765
	mov	edx, DWORD PTR _sm$[ebp]
	add	edx, 68					; 00000044H
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_eval_valtyp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70764
	push	466					; 000001d2H
	push	OFFSET FLAT:$SG70766
	push	OFFSET FLAT:$SG70767
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70764:

; 467  : 	if(*link_pos != '1' && sm->att.nbrows)

	mov	eax, DWORD PTR _link_pos$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 49					; 00000031H
	je	$L70771
	mov	edx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [edx+68], 0
	je	SHORT $L70771

; 469  : 		if(attach_list(cntxt, sm)) STACK_ERROR;

	mov	eax, DWORD PTR _sm$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_attach_list
	add	esp, 8
	test	eax, eax
	je	SHORT $L70769
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 469		; 000001d5H
	jmp	$eva_err$70718
$L70769:

; 470  : 		DYNBUF_ADD(&sm->txtbody, sm->b_html ? "<hr>" : "\n", 0, NO_CONV);

	mov	eax, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [eax+96], 0
	je	SHORT $L70959
	mov	DWORD PTR -56+[ebp], OFFSET FLAT:$SG70772
	jmp	SHORT $L70960
$L70959:
	mov	DWORD PTR -56+[ebp], OFFSET FLAT:$SG70773
$L70960:
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR -56+[ebp]
	push	ecx
	mov	edx, DWORD PTR _sm$[ebp]
	add	edx, 88					; 00000058H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70771
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70775
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 470		; 000001d6H
	jmp	$eva_err$70718
$L70771:

; 472  : 
; 473  : 	/* Build body */
; 474  : 	if(mailmerge_brackets(cntxt, &sm->txtbody, c->txt, c->len, sm->i_ctrl, sm->b_html ? 2 : 0)) CLEAR_ERROR;

	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+96]
	neg	eax
	sbb	eax, eax
	and	eax, 2
	push	eax
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _c$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _sm$[ebp]
	add	ecx, 88					; 00000058H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_mailmerge_brackets
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70776
	push	474					; 000001daH
	push	OFFSET FLAT:$SG70777
	push	OFFSET FLAT:$SG70778
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70776:

; 475  : 
; 476  : 	/* Output attachements list to end of body if applicable */
; 477  : 	if(*link_pos != '0' && sm->att.nbrows)

	mov	ecx, DWORD PTR _link_pos$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 48					; 00000030H
	je	$L70786
	mov	eax, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [eax+68], 0
	je	SHORT $L70786

; 479  : 		DYNBUF_ADD(&sm->txtbody, sm->b_html ? "<hr>" : "\n", 0, NO_CONV);

	mov	ecx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [ecx+96], 0
	je	SHORT $L70961
	mov	DWORD PTR -60+[ebp], OFFSET FLAT:$SG70782
	jmp	SHORT $L70962
$L70961:
	mov	DWORD PTR -60+[ebp], OFFSET FLAT:$SG70783
$L70962:
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR -60+[ebp]
	push	edx
	mov	eax, DWORD PTR _sm$[ebp]
	add	eax, 88					; 00000058H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70781
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70785
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 479		; 000001dfH
	jmp	$eva_err$70718
$L70781:

; 480  : 		if(attach_list(cntxt, sm)) STACK_ERROR;

	mov	eax, DWORD PTR _sm$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_attach_list
	add	esp, 8
	test	eax, eax
	je	SHORT $L70786
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 480		; 000001e0H
	jmp	$eva_err$70718
$L70786:

; 482  : 
; 483  : 	/* Handle from adress */
; 484  : 	sm->from = dyntab_field_cell(&ctrl->attr, "_EVA_EMAIL_SENDER", ~0UL, 0);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70787
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [ecx+4], eax

; 485  : 	if(!sm->from) sm->from = dyntab_field_cell(&cntxt->user_data, "EMAIL", ~0UL, 0);

	mov	edx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L70788
	push	0
	push	-1
	push	OFFSET FLAT:$SG70789
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29428				; 000072f4H
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L70788:

; 486  : 	if(!sm->from) sm->from = dyntab_cell(&cntxt->mail_admin, 0, 0);

	mov	edx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L70790
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29620				; 000073b4H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L70790:

; 487  : 
; 488  : 	/* Handle copy to sender if applicable */
; 489  : 	if(*CTRL_ATTR_VAL(NO_SENDER_COPY) != '1')

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70963
	push	0
	push	-1
	push	OFFSET FLAT:$SG70792
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L70964
$L70963:
	mov	DWORD PTR -64+[ebp], OFFSET FLAT:$SG70793
$L70964:
	mov	eax, DWORD PTR -64+[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 49					; 00000031H
	je	SHORT $L70796

; 491  : 		c = dyntab_field_cell(&cntxt->user_data, "EMAIL", ~0UL, 0);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70794
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29428				; 000072f4H
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _c$[ebp], eax

; 492  : 		if(!c) c = sm->from;

	cmp	DWORD PTR _c$[ebp], 0
	jne	SHORT $L70795
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _c$[ebp], ecx
$L70795:

; 493  : 		DYNTAB_ADD_CELLP(&sm->hid, sm->hid.nbrows, 0, c);

	push	1
	mov	edx, DWORD PTR _c$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+48]
	push	ecx
	mov	edx, DWORD PTR _sm$[ebp]
	add	edx, 48					; 00000030H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70796
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70798
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 493		; 000001edH
	jmp	SHORT $eva_err$70718
$L70796:
$eva_noerr$70746:

; 495  : 
; 496  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70799
	push	OFFSET FLAT:$SG70800
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70718:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70801
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70802
	push	OFFSET FLAT:$SG70803
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70801:
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 497  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_prepare_mail ENDP
_TEXT	ENDS
PUBLIC	_action_email
EXTRN	_file_to_dynbuf:NEAR
EXTRN	_form_save_dialog:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strlen:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70819 DB	01H DUP (?)
	ALIGN	4

$SG70824 DB	01H DUP (?)
	ALIGN	4

$SG70830 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70818 DB	'_EVA_EMAIL_DIALOG', 00H
	ORG $+2
$SG70821 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70823 DB	'SENDMAIL', 00H
	ORG $+3
$SG70829 DB	'_EVA_CONFIRM', 00H
	ORG $+3
$SG70836 DB	'_EVA_AFTER', 00H
	ORG $+1
$SG70837 DB	'_EVA_AFTER', 00H
	ORG $+1
$SG70838 DB	'_EVA_ALWAYS', 00H
$SG70844 DB	'<font face=Arial><center><b>Envoi d''un email</b></cente'
	DB	'r><hr>', 00H
	ORG $+2
$SG70846 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70850 DB	'</b></center><br>', 00H
	ORG $+2
$SG70851 DB	'<center>Le message n''a pas ', 0c3H, 0a9H, 't', 0c3H, 0a9H
	DB	' envoy', 0c3H, 0a9H, ' pour la raison suivante :<br><br><b>', 00H
	ORG $+2
$SG70853 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70858 DB	'<br>', 00H
	ORG $+3
$SG70859 DB	'D', 0c3H, 0a9H, 'tail de l''erreur :<hr>', 00H
	ORG $+2
$SG70861 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70866 DB	'<center><b>Le message a bien ', 0c3H, 0a9H, 't', 0c3H, 0a9H
	DB	' envoy', 0c3H, 0a9H, '</b></center>', 00H
$SG70868 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70873 DB	'<hr><br><table width=100%><tr><td align=center>', 00H
$SG70875 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70878 DB	'Retourne ', 0c3H, 0a0H, ' la page pr', 0c3H, 0a9H, 'c', 0c3H
	DB	0a9H, 'dente', 00H
	ORG $+3
$SG70879 DB	'_eva_btn_gobackobj_fr_s.gif', 00H
$SG70880 DB	'_eva_btn_gobackobj_fr.gif', 00H
	ORG $+2
$SG70881 DB	'Revenir', 00H
$SG70882 DB	'NOP', 00H
$SG70886 DB	'</td><td align=center>', 00H
	ORG $+1
$SG70888 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70891 DB	'Retourne au formulaire pr', 0c3H, 0a9H, 'c', 0c3H, 0a9H, 'd'
	DB	'ent', 00H
	ORG $+1
$SG70892 DB	'_eva_btn_close_fr_s.gif', 00H
$SG70893 DB	'_eva_btn_close_fr.gif', 00H
	ORG $+2
$SG70894 DB	'Fermer', 00H
	ORG $+1
$SG70895 DB	'B$#.CLOSE', 00H
	ORG $+2
$SG70898 DB	'</td></tr></table><br>', 00H
	ORG $+1
$SG70900 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70901 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70902 DB	'action_email', 00H
	ORG $+3
$SG70904 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_email.c', 00H
	ORG $+1
$SG70905 DB	'action_email', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -116
_ctrl$ = -132
_sm$ = -112
_errfile$ = -140
_dlgmode$ = -128
_b_dlg$ = -136
_b_send$ = -120
_b_err$ = -124
_b_done$70827 = -144
_html$70841 = -148
_action_email PROC NEAR

; 511  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 180				; 000000b4H
	push	edi

; 512  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 513  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 514  : 	EVA_sendmail sm = {0};

	mov	DWORD PTR _sm$[ebp], 0
	mov	ecx, 27					; 0000001bH
	xor	eax, eax
	lea	edi, DWORD PTR _sm$[ebp+4]
	rep stosd

; 515  : 	DynBuffer *errfile = NULL;

	mov	DWORD PTR _errfile$[ebp], 0

; 516  : 	char *dlgmode = CTRL_ATTR_VAL(EMAIL_DIALOG);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70966
	push	0
	push	-1
	push	OFFSET FLAT:$SG70818
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -152+[ebp], eax
	jmp	SHORT $L70967
$L70966:
	mov	DWORD PTR -152+[ebp], OFFSET FLAT:$SG70819
$L70967:
	mov	eax, DWORD PTR -152+[ebp]
	mov	DWORD PTR _dlgmode$[ebp], eax

; 517  : 	unsigned long b_dlg = strcmp(dlgmode, "_EVA_NONE");

	push	OFFSET FLAT:$SG70821
	mov	ecx, DWORD PTR _dlgmode$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	mov	DWORD PTR _b_dlg$[ebp], eax

; 518  : 	unsigned long b_send = !strcmp(CGI_CLICK_BTN_SUBFIELD, "SENDMAIL");

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29648], 0
	je	SHORT $L70968
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 66					; 00000042H
	jne	SHORT $L70968
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	cmp	DWORD PTR [eax+ecx+32], 0
	je	SHORT $L70968
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx+32]
	mov	DWORD PTR -156+[ebp], edx
	jmp	SHORT $L70969
$L70968:
	mov	DWORD PTR -156+[ebp], OFFSET FLAT:$SG70824
$L70969:
	push	OFFSET FLAT:$SG70823
	mov	eax, DWORD PTR -156+[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_send$[ebp], eax

; 519  : 	unsigned long b_err = 0;

	mov	DWORD PTR _b_err$[ebp], 0

; 520  : 
; 521  : 	/* Handle save before */
; 522  : 	if(!b_send)

	cmp	DWORD PTR _b_send$[ebp], 0
	jne	$L70832

; 524  : 		int b_done = BUTN_SAVE_NEXT;

	mov	DWORD PTR _b_done$70827[ebp], 1

; 525  : 		if(form_save_dialog(cntxt, i_ctrl, CTRL_ATTR_VAL(CONFIRM), BUTN_SAVE_NEXT, &b_done)) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70970
	push	0
	push	-1
	push	OFFSET FLAT:$SG70829
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -160+[ebp], eax
	jmp	SHORT $L70971
$L70970:
	mov	DWORD PTR -160+[ebp], OFFSET FLAT:$SG70830
$L70971:
	lea	edx, DWORD PTR _b_done$70827[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR -160+[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_save_dialog
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70828
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 525		; 0000020dH
	jmp	$eva_err$70831
$L70828:

; 526  : 		if(b_done != BUTN_SAVE_NEXT) RETURN_OK;

	cmp	DWORD PTR _b_done$70827[ebp], 1
	je	SHORT $L70832
	jmp	$eva_noerr$70833
$L70832:

; 528  : 
; 529  : 	/* Prepare message */
; 530  : 	sendmail_free(cntxt, &sm);

	lea	ecx, DWORD PTR _sm$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sendmail_free
	add	esp, 8

; 531  : 	sm.i_ctrl = i_ctrl;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	mov	DWORD PTR _sm$[ebp], eax

; 532  : 	b_err = prepare_mail(cntxt, &sm) || sm.err;

	lea	ecx, DWORD PTR _sm$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_prepare_mail
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70972
	cmp	DWORD PTR _sm$[ebp+104], 0
	jne	SHORT $L70972
	mov	DWORD PTR -164+[ebp], 0
	jmp	SHORT $L70973
$L70972:
	mov	DWORD PTR -164+[ebp], 1
$L70973:
	mov	eax, DWORD PTR -164+[ebp]
	mov	DWORD PTR _b_err$[ebp], eax

; 533  : 
; 534  : 	/* Send mail if applicable */
; 535  : 	if(!b_err && (b_send || !b_dlg || !strcmp(dlgmode, "_EVA_AFTER")))

	cmp	DWORD PTR _b_err$[ebp], 0
	jne	$L70834
	cmp	DWORD PTR _b_send$[ebp], 0
	jne	SHORT $L70835
	cmp	DWORD PTR _b_dlg$[ebp], 0
	je	SHORT $L70835
	push	OFFSET FLAT:$SG70836
	mov	ecx, DWORD PTR _dlgmode$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70834
$L70835:

; 537  : 		b_err = send_mail(cntxt, &sm) || sm.err;

	lea	edx, DWORD PTR _sm$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_send_mail
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70974
	cmp	DWORD PTR _sm$[ebp+104], 0
	jne	SHORT $L70974
	mov	DWORD PTR -168+[ebp], 0
	jmp	SHORT $L70975
$L70974:
	mov	DWORD PTR -168+[ebp], 1
$L70975:
	mov	ecx, DWORD PTR -168+[ebp]
	mov	DWORD PTR _b_err$[ebp], ecx

; 538  : 		b_dlg = !*dlgmode || !strcmp(dlgmode, "_EVA_AFTER") || !strcmp(dlgmode, "_EVA_ALWAYS");

	mov	edx, DWORD PTR _dlgmode$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70976
	push	OFFSET FLAT:$SG70837
	mov	ecx, DWORD PTR _dlgmode$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70976
	push	OFFSET FLAT:$SG70838
	mov	edx, DWORD PTR _dlgmode$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70976
	mov	DWORD PTR -172+[ebp], 0
	jmp	SHORT $L70977
$L70976:
	mov	DWORD PTR -172+[ebp], 1
$L70977:
	mov	eax, DWORD PTR -172+[ebp]
	mov	DWORD PTR _b_dlg$[ebp], eax
$L70834:

; 540  : 
; 541  : 	/* Handle message dialog */
; 542  : 	if(b_err || b_dlg)

	cmp	DWORD PTR _b_err$[ebp], 0
	jne	SHORT $L70840
	cmp	DWORD PTR _b_dlg$[ebp], 0
	je	$eva_noerr$70833
$L70840:

; 544  : 		/* Set buffer & output dialog header */
; 545  : 		DynBuffer **html = &form->html_top;

	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 216				; 000000d8H
	mov	DWORD PTR _html$70841[ebp], ecx

; 546  : 		form->html = html;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _html$70841[ebp]
	mov	DWORD PTR [edx+232], eax

; 547  : 		DYNBUF_ADD_STR(html, "<font face=Arial><center><b>Envoi d'un email</b></center><hr>");

	push	0
	push	0
	push	61					; 0000003dH
	push	OFFSET FLAT:$SG70844
	mov	ecx, DWORD PTR _html$70841[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70843
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70846
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 547		; 00000223H
	jmp	$eva_err$70831
$L70843:

; 548  : 
; 549  : 		if(b_err)

	cmp	DWORD PTR _b_err$[ebp], 0
	je	$L70847

; 551  : 			/* Display error for unsent message */
; 552  : 			if(!sm.err) sm.err = cntxt->err.text;

	cmp	DWORD PTR _sm$[ebp+104], 0
	jne	SHORT $L70848
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29872]
	mov	DWORD PTR _sm$[ebp+104], edx
$L70848:

; 554  : 								sm.err, strlen(sm.err), TO_HTML, "</b></center><br>");

	push	17					; 00000011H
	push	OFFSET FLAT:$SG70850
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	eax, DWORD PTR _sm$[ebp+104]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _sm$[ebp+104]
	push	ecx
	push	77					; 0000004dH
	push	OFFSET FLAT:$SG70851
	mov	edx, DWORD PTR _html$70841[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70849
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70853
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 554		; 0000022aH
	jmp	$eva_err$70831
$L70849:

; 555  : 			if(sm.err_file)

	cmp	DWORD PTR _sm$[ebp+108], 0
	je	$L70857

; 557  : 				if(file_to_dynbuf(cntxt, &errfile, sm.err_file)) STACK_ERROR;

	mov	edx, DWORD PTR _sm$[ebp+108]
	push	edx
	lea	eax, DWORD PTR _errfile$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_file_to_dynbuf
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70855
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 557		; 0000022dH
	jmp	$eva_err$70831
$L70855:

; 558  : 				DYNBUF_ADD3_BUF(html, "Détail de l'erreur :<hr>", errfile, TO_HTML, "<br>");

	cmp	DWORD PTR _errfile$[ebp], 0
	je	SHORT $L70978
	mov	eax, DWORD PTR _errfile$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -176+[ebp], ecx
	jmp	SHORT $L70979
$L70978:
	mov	DWORD PTR -176+[ebp], 0
$L70979:
	cmp	DWORD PTR _errfile$[ebp], 0
	je	SHORT $L70980
	mov	edx, DWORD PTR _errfile$[ebp]
	add	edx, 8
	mov	DWORD PTR -180+[ebp], edx
	jmp	SHORT $L70981
$L70980:
	mov	DWORD PTR -180+[ebp], 0
$L70981:
	push	4
	push	OFFSET FLAT:$SG70858
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	eax, DWORD PTR -176+[ebp]
	push	eax
	mov	ecx, DWORD PTR -180+[ebp]
	push	ecx
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70859
	mov	edx, DWORD PTR _html$70841[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70857
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70861
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 558		; 0000022eH
	jmp	$eva_err$70831
$L70857:

; 561  : 		else if(sm.b_done)

	jmp	SHORT $L70870
$L70847:
	cmp	DWORD PTR _sm$[ebp+100], 0
	je	SHORT $L70863

; 563  : 			/* Confirm after message sent */
; 564  : 			DYNBUF_ADD_STR(html, "<center><b>Le message a bien été envoyé</b></center>");

	push	0
	push	0
	push	55					; 00000037H
	push	OFFSET FLAT:$SG70866
	mov	edx, DWORD PTR _html$70841[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70865
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70868
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 564		; 00000234H
	jmp	$eva_err$70831
$L70865:

; 566  : 		else

	jmp	SHORT $L70870
$L70863:

; 568  : 			/* Preview message */
; 569  : 			if(preview_mail(cntxt, &sm)) STACK_ERROR;

	lea	edx, DWORD PTR _sm$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_preview_mail
	add	esp, 8
	test	eax, eax
	je	SHORT $L70870
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 569		; 00000239H
	jmp	$eva_err$70831
$L70870:

; 571  : 
; 572  : 		/* Output page footer */
; 573  : 		DYNBUF_ADD_STR(html, "<hr><br><table width=100%><tr><td align=center>");

	push	0
	push	0
	push	47					; 0000002fH
	push	OFFSET FLAT:$SG70873
	mov	edx, DWORD PTR _html$70841[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70872
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70875
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 573		; 0000023dH
	jmp	$eva_err$70831
$L70872:

; 574  : 		if(put_html_button(cntxt, "NOP", "Revenir", "_eva_btn_gobackobj_fr.gif", "_eva_btn_gobackobj_fr_s.gif",
; 575  : 								"Retourne à la page précédente", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70878
	push	OFFSET FLAT:$SG70879
	push	OFFSET FLAT:$SG70880
	push	OFFSET FLAT:$SG70881
	push	OFFSET FLAT:$SG70882
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70877
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 575		; 0000023fH
	jmp	$eva_err$70831
$L70877:

; 576  : 		if(sm.b_done)

	cmp	DWORD PTR _sm$[ebp+100], 0
	je	SHORT $L70890

; 578  : 			DYNBUF_ADD_STR(html, "</td><td align=center>");

	push	0
	push	0
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70886
	mov	ecx, DWORD PTR _html$70841[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70885
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70888
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 578		; 00000242H
	jmp	$eva_err$70831
$L70885:

; 579  : 			if(put_html_button(cntxt, "B$#.CLOSE", "Fermer", "_eva_btn_close_fr.gif", "_eva_btn_close_fr_s.gif",
; 580  : 								"Retourne au formulaire précédent", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70891
	push	OFFSET FLAT:$SG70892
	push	OFFSET FLAT:$SG70893
	push	OFFSET FLAT:$SG70894
	push	OFFSET FLAT:$SG70895
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70890
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 580		; 00000244H
	jmp	SHORT $eva_err$70831
$L70890:

; 582  : 		DYNBUF_ADD_STR(html, "</td></tr></table><br>");

	push	0
	push	0
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70898
	mov	eax, DWORD PTR _html$70841[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70897
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70900
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 582		; 00000246H
	jmp	SHORT $eva_err$70831
$L70897:

; 583  : 		cntxt->b_terminate = 15;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29776], 15		; 0000000fH

; 584  : 		cntxt->html = *form->html;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [edx]
	mov	DWORD PTR [eax+29784], ecx
$eva_noerr$70833:

; 586  : 
; 587  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70901
	push	OFFSET FLAT:$SG70902
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70831:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70903
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70904
	push	OFFSET FLAT:$SG70905
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70903:
	mov	ecx, DWORD PTR _errfile$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _errfile$[ebp], 0
	lea	edx, DWORD PTR _sm$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sendmail_free
	add	esp, 8
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 588  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_action_email ENDP
_TEXT	ENDS
END
