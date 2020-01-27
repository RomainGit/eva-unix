	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sql_script.c
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
PUBLIC	_mark_lab
_BSS	SEGMENT
$SG70202 DB	01H DUP (?)
	ALIGN	4

$SG70203 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
_mark_lab DD	FLAT:$SG70202
	DD	FLAT:$SG70203
	DD	FLAT:$SG70204
	DD	FLAT:$SG70205
	DD	FLAT:$SG70206
	DD	FLAT:$SG70207
	DD	FLAT:$SG70208
	DD	FLAT:$SG70209
$SG70204 DB	'FOR EACH FILE ', 00H
	ORG $+1
$SG70205 DB	'FOR EACH VALUE ', 00H
$SG70206 DB	'IF ', 00H
$SG70207 DB	'ELSEIF ', 00H
$SG70208 DB	'END ', 00H
	ORG $+3
$SG70209 DB	'NEXT ', 00H
_DATA	ENDS
PUBLIC	_flush_sm
EXTRN	__iob:BYTE
EXTRN	_fflush:NEAR
EXTRN	_printf:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70281 DB	'%s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_sm$ = 8
_flush_sm PROC NEAR

; 117  : {

	push	ebp
	mov	ebp, esp

; 118  : 	if(!sm || !sm->html || !sm->html->data) return;

	cmp	DWORD PTR _sm$[ebp], 0
	je	SHORT $L70280
	mov	eax, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L70280
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	add	edx, 8
	test	edx, edx
	jne	SHORT $L70279
$L70280:
	jmp	SHORT $L70278
$L70279:

; 119  : 	printf("%s", sm->html->data + sm->outcnt);

	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+8]
	lea	ecx, DWORD PTR [ecx+eax+8]
	push	ecx
	push	OFFSET FLAT:$SG70281
	call	_printf
	add	esp, 8

; 120  : 	sm->outcnt = sm->html->cnt;

	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+8], edx

; 121  : 	fflush(stdout);

	push	OFFSET FLAT:__iob+32
	call	_fflush
	add	esp, 4
$L70278:

; 122  : }

	pop	ebp
	ret	0
_flush_sm ENDP
_TEXT	ENDS
PUBLIC	_mark_eval_sqlexpr_var
EXTRN	_dynbuf_add:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_strlen:NEAR
EXTRN	_strchr:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_strstr:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70306 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70318 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70320 DB	'"[(''`.,;=<>-+ ', 00H
	ORG $+1
$SG70321 DB	'"])''`.,;=<>-+ ', 00H
	ORG $+1
$SG70325 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70329 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70330 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sql_scrip'
	DB	't.c', 00H
$SG70331 DB	'mark_eval_sqlexpr_var', 00H
	ORG $+2
$SG70333 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sql_scrip'
	DB	't.c', 00H
$SG70334 DB	'mark_eval_sqlexpr_var', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sm$ = 12
_sqlexpr$ = 16
_expr$ = 20
_i$ = -12
_beg$ = -4
_next$ = -20
_var$ = -8
_lenvar$ = -16
_mark_eval_sqlexpr_var PROC NEAR

; 135  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 136  : 	unsigned long i;
; 137  : 	char *beg, *next ,*var ;
; 138  : 	unsigned long lenvar ;
; 139  : 
; 140  : 	if(!expr || !*expr || !sm) STACK_ERROR;

	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L70300
	mov	eax, DWORD PTR _expr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70300
	cmp	DWORD PTR _sm$[ebp], 0
	jne	SHORT $L70299
$L70300:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 140		; 0000008cH
	jmp	$eva_err$70301
$L70299:

; 141  : 
; 142  : 	/* No var to replace, copy expr in sqlexpr & exit */
; 143  : 	if(!sm->markvar.nbrows)

	mov	eax, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	SHORT $L70302

; 145  : 		DYNBUF_ADD(sqlexpr, expr, strlen(expr), NO_CONV)

	push	0
	push	0
	mov	ecx, DWORD PTR _expr$[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	push	eax
	mov	edx, DWORD PTR _expr$[ebp]
	push	edx
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70304
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70306
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 145		; 00000091H
	jmp	$eva_err$70301
$L70304:

; 146  : 		RETURN_OK;

	jmp	$eva_noerr$70307
$L70302:

; 148  : 
; 149  : 	/* Scan variables in sm->marvar */
; 150  : 	for(i = 0; i < sm->markvar.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70308
$L70309:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70308:
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+24]
	jae	$eva_noerr$70307

; 152  : 		var = dyntab_val(&sm->markvar, i, COLNAME);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sm$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _var$[ebp], eax

; 153  : 		lenvar = dyntab_sz(&sm->markvar, i, COLNAME);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _sm$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _lenvar$[ebp], eax

; 154  : 		next = expr;

	mov	ecx, DWORD PTR _expr$[ebp]
	mov	DWORD PTR _next$[ebp], ecx

; 155  : 		beg = next;

	mov	edx, DWORD PTR _next$[ebp]
	mov	DWORD PTR _beg$[ebp], edx
$L70312:

; 156  : 		while(*next)

	mov	eax, DWORD PTR _next$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L70313

; 158  : 			next = strstr(next, var);

	mov	edx, DWORD PTR _var$[ebp]
	push	edx
	mov	eax, DWORD PTR _next$[ebp]
	push	eax
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _next$[ebp], eax

; 159  : 
; 160  : 			if(!next)

	cmp	DWORD PTR _next$[ebp], 0
	jne	SHORT $L70314

; 162  : 				DYNBUF_ADD(sqlexpr, beg, strlen(beg), NO_CONV)

	push	0
	push	0
	mov	ecx, DWORD PTR _beg$[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	push	eax
	mov	edx, DWORD PTR _beg$[ebp]
	push	edx
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70316
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70318
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 162		; 000000a2H
	jmp	$eva_err$70301
$L70316:

; 163  : 				break;

	jmp	$L70313
$L70314:

; 165  : 
; 166  : 			/* Replace only independant words (' xxxx ', '(xxx)', ' xxx.' ...) */
; 167  : 			if(!strchr("\"[('`.,;=<>-+ ", *next - 1) && !strchr("\"])'`.,;=<>-+ ", *next + lenvar))

	mov	eax, DWORD PTR _next$[ebp]
	movsx	ecx, BYTE PTR [eax]
	sub	ecx, 1
	push	ecx
	push	OFFSET FLAT:$SG70320
	call	_strchr
	add	esp, 8
	test	eax, eax
	jne	$L70319
	mov	edx, DWORD PTR _next$[ebp]
	movsx	eax, BYTE PTR [edx]
	add	eax, DWORD PTR _lenvar$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70321
	call	_strchr
	add	esp, 8
	test	eax, eax
	jne	$L70319

; 169  : 				DYNBUF_ADD(sqlexpr, beg, next - beg, NO_CONV)

	push	0
	push	0
	mov	ecx, DWORD PTR _next$[ebp]
	sub	ecx, DWORD PTR _beg$[ebp]
	push	ecx
	mov	edx, DWORD PTR _beg$[ebp]
	push	edx
	mov	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70323
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70325
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 169		; 000000a9H
	jmp	$eva_err$70301
$L70323:

; 170  : 				DYNBUF_ADD_CELL(sqlexpr, &sm->markvar, i, COLVAL, NO_CONV)

	push	0
	push	0
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sm$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _sm$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _sqlexpr$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70327
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70329
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 170		; 000000aaH
	jmp	SHORT $eva_err$70301
$L70327:

; 171  : 				next = next + lenvar;

	mov	ecx, DWORD PTR _next$[ebp]
	add	ecx, DWORD PTR _lenvar$[ebp]
	mov	DWORD PTR _next$[ebp], ecx

; 172  : 				beg = next;

	mov	edx, DWORD PTR _next$[ebp]
	mov	DWORD PTR _beg$[ebp], edx
$L70319:

; 174  : 		}

	jmp	$L70312
$L70313:

; 175  : 	}

	jmp	$L70309
$eva_noerr$70307:

; 176  : 
; 177  : 
; 178  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70330
	push	OFFSET FLAT:$SG70331
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70301:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70332
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70333
	push	OFFSET FLAT:$SG70334
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70332:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 179  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_mark_eval_sqlexpr_var ENDP
_TEXT	ENDS
PUBLIC	_exec_sql_qry
EXTRN	__snprintf:NEAR
EXTRN	__fltused:NEAR
EXTRN	_sql_exec_query:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_sql_get_table:NEAR
EXTRN	_qry_eval_sqlexpr_var:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70361 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70368 DB	'</u>', 00H
	ORG $+3
$SG70369 DB	'<br><u>+++ Commande n', 0b0H, ' ', 00H
$SG70371 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70375 DB	'</font>', 00H
$SG70376 DB	'<br><font face=Courier size=-1>', 00H
$SG70378 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70382 DB	'</font><br>', 00H
$SG70383 DB	'<br><font face=Courier>', 00H
$SG70385 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70387 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sql_scrip'
	DB	't.c', 00H
$SG70388 DB	'exec_sql_qry', 00H
	ORG $+3
$SG70397 DB	'<br><u>=== R', 0e9H, 'sultat : %lu lignes - %.2f s</u><b'
	DB	'r>', 00H
	ORG $+2
$SG70400 DB	'<table border bgcolor=white>', 00H
	ORG $+3
$SG70402 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70408 DB	'<tr>', 00H
	ORG $+3
$SG70410 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70415 DB	'</td>', 00H
	ORG $+2
$SG70416 DB	'<td>', 00H
	ORG $+3
$SG70418 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70421 DB	'</tr>', 00H
	ORG $+2
$SG70423 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70426 DB	'</table>', 00H
	ORG $+3
$SG70428 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70432 DB	'<br><u>### R', 0e9H, 'sultat : %lu lignes modifi', 0e9H, 'e'
	DB	's - %.2f s</u><br>', 00H
$SG70434 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sql_scrip'
	DB	't.c', 00H
$SG70435 DB	'exec_sql_qry', 00H
	ORG $+3
$SG70437 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sql_scrip'
	DB	't.c', 00H
$SG70438 DB	'exec_sql_qry', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sm$ = 12
_i$ = 16
_form$ = -12
_ctrl$ = -1072
_sql$ = -8
_buf$ = -1040
_sqlexpr$ = -1068
_html$ = -1044
_res$ = -1064
_qry$ = -4
_printbuf$ = -1036
_i$70392 = -1076
_j$70393 = -1080
_exec_sql_qry PROC NEAR

; 196  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1096				; 00000448H

; 197  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 198  : 	EVA_ctrl *ctrl = form->ctrl + sm->i_ctrl;

	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 199  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 200  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 201  : 	DynBuffer *sqlexpr = NULL;

	mov	DWORD PTR _sqlexpr$[ebp], 0

; 202  : 	DynBuffer **html = &sm->html;

	mov	eax, DWORD PTR _sm$[ebp]
	add	eax, 4
	mov	DWORD PTR _html$[ebp], eax

; 203  : 	DynTable res = {0};

	mov	DWORD PTR _res$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _res$[ebp+4], ecx
	mov	DWORD PTR _res$[ebp+8], ecx
	mov	DWORD PTR _res$[ebp+12], ecx
	mov	DWORD PTR _res$[ebp+16], ecx

; 204  : 	struct _Qry *qry = sm->qry + i;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+48]
	add	ecx, edx
	mov	DWORD PTR _qry$[ebp], ecx

; 205  : 	char printbuf[1024];
; 206  : 
; 207  : 	/* Replace parameters in query */
; 208  : 	DYNBUF_ADD(&sql, qry->txt, qry->len, NO_CONV);

	push	0
	push	0
	mov	edx, DWORD PTR _qry$[ebp]
	mov	eax, DWORD PTR [edx+12]
	push	eax
	mov	ecx, DWORD PTR _qry$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	lea	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70359
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70361
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 208		; 000000d0H
	jmp	$eva_err$70362
$L70359:

; 209  : 	if(qry_eval_sqlexpr_var(cntxt, &buf, sql->data, &ctrl->attr, NULL)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	mov	ecx, DWORD PTR _sql$[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _buf$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70364
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 209		; 000000d1H
	jmp	$eva_err$70362
$L70364:

; 210  : 
; 211  : 	/* Replace variables in query */
; 212  : 	if(mark_eval_sqlexpr_var(cntxt, sm, &sqlexpr, buf->data)) STACK_ERROR;

	mov	edx, DWORD PTR _buf$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sm$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_mark_eval_sqlexpr_var
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70365
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 212		; 000000d4H
	jmp	$eva_err$70362
$L70365:

; 213  : 
; 214  : 
; 215  : 	/* Display & exec query */
; 216  : 	if(sm->options & 2)

	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	and	edx, 2
	test	edx, edx
	je	$L70374

; 218  : 		DYNBUF_ADD3_INT(html, "<br><u>+++ Commande n° ", i + 1, "</u>");

	push	4
	push	OFFSET FLAT:$SG70368
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	push	eax
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70369
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70367
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70371
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 218		; 000000daH
	jmp	$eva_err$70362
$L70367:

; 219  : 		if(sm->options == 3) DYNBUF_ADD3_BUF(html, "<br><font face=Courier size=-1>", sqlexpr, TO_HTML, "</font>");

	mov	ecx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [ecx+60], 3
	jne	$L70374
	cmp	DWORD PTR _sqlexpr$[ebp], 0
	je	SHORT $L70966
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -1084+[ebp], eax
	jmp	SHORT $L70967
$L70966:
	mov	DWORD PTR -1084+[ebp], 0
$L70967:
	cmp	DWORD PTR _sqlexpr$[ebp], 0
	je	SHORT $L70968
	mov	ecx, DWORD PTR _sqlexpr$[ebp]
	add	ecx, 8
	mov	DWORD PTR -1088+[ebp], ecx
	jmp	SHORT $L70969
$L70968:
	mov	DWORD PTR -1088+[ebp], 0
$L70969:
	push	7
	push	OFFSET FLAT:$SG70375
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	edx, DWORD PTR -1084+[ebp]
	push	edx
	mov	eax, DWORD PTR -1088+[ebp]
	push	eax
	push	31					; 0000001fH
	push	OFFSET FLAT:$SG70376
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70374
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70378
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 219		; 000000dbH
	jmp	$eva_err$70362
$L70374:

; 221  : 
; 222  : 	flush_sm(sm);

	mov	ecx, DWORD PTR _sm$[ebp]
	push	ecx
	call	_flush_sm
	add	esp, 4

; 223  : 	if(sql_exec_query(cntxt, sqlexpr->data))

	mov	edx, DWORD PTR _sqlexpr$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	je	$L70379

; 225  : 		/* SQL error : display & stop processing */
; 226  : 		sm->err = cntxt->err.text;

	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29872]
	mov	DWORD PTR [ecx+12], eax

; 227  : 		DYNBUF_ADD3_BUF(html, "<br><font face=Courier>", cntxt->err.detail, TO_HTML, "</font><br>");

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29876], 0
	je	SHORT $L70970
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29876]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -1092+[ebp], ecx
	jmp	SHORT $L70971
$L70970:
	mov	DWORD PTR -1092+[ebp], 0
$L70971:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29876], 0
	je	SHORT $L70972
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29876]
	add	ecx, 8
	mov	DWORD PTR -1096+[ebp], ecx
	jmp	SHORT $L70973
$L70972:
	mov	DWORD PTR -1096+[ebp], 0
$L70973:
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70382
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	edx, DWORD PTR -1092+[ebp]
	push	edx
	mov	eax, DWORD PTR -1096+[ebp]
	push	eax
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70383
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70381
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70385
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 227		; 000000e3H
	jmp	$eva_err$70362
$L70381:

; 228  : 		CLEAR_ERROR_NOWARN;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], 0
	push	228					; 000000e4H
	push	OFFSET FLAT:$SG70387
	push	OFFSET FLAT:$SG70388
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H

; 230  : 	else if(cntxt->sql_result && sm->options && (sm->display == 1 || sm->options & 2))

	jmp	$L70430
$L70379:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29832], 0
	je	$L70390
	mov	ecx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [ecx+60], 0
	je	$L70390
	mov	edx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [edx+56], 1
	je	SHORT $L70391
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+60]
	and	ecx, 2
	test	ecx, ecx
	je	$L70390
$L70391:

; 232  : 		/* If display allowed, there is a result to display : get result table */
; 233  : 		unsigned long i, j;
; 234  : 		if(sql_get_table(cntxt, &res, 3)) STACK_ERROR;

	push	3
	lea	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70394
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 234		; 000000eaH
	jmp	$eva_err$70362
$L70394:

; 235  : 
; 236  : 		/* Display as HTML table */
; 237  : 		M_FREE(buf);

	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0

; 238  : 		if(sm->options & 2) dynbuf_print2(html, "<br><u>=== Résultat : %lu lignes - %.2f s</u><br>", res.nbrows, cntxt->sql_restime);

	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+60]
	and	ecx, 2
	test	ecx, ecx
	je	SHORT $L70395
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29844]
	push	eax
	mov	ecx, DWORD PTR [edx+29840]
	push	ecx
	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70397
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
$L70395:

; 239  : 		DYNBUF_ADD_STR(html, "<table border bgcolor=white>");

	push	0
	push	0
	push	28					; 0000001cH
	push	OFFSET FLAT:$SG70400
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70399
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70402
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 239		; 000000efH
	jmp	$eva_err$70362
$L70399:

; 240  : 		for(i = 0; i < res.nbrows; i++)

	mov	DWORD PTR _i$70392[ebp], 0
	jmp	SHORT $L70403
$L70404:
	mov	eax, DWORD PTR _i$70392[ebp]
	add	eax, 1
	mov	DWORD PTR _i$70392[ebp], eax
$L70403:
	mov	ecx, DWORD PTR _i$70392[ebp]
	cmp	ecx, DWORD PTR _res$[ebp]
	jae	$L70405

; 242  : 			DYNBUF_ADD_STR(html, "<tr>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70408
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70407
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70410
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 242		; 000000f2H
	jmp	$eva_err$70362
$L70407:

; 243  : 			for(j = 0; j < res.nbcols; j++)

	mov	DWORD PTR _j$70393[ebp], 0
	jmp	SHORT $L70411
$L70412:
	mov	edx, DWORD PTR _j$70393[ebp]
	add	edx, 1
	mov	DWORD PTR _j$70393[ebp], edx
$L70411:
	mov	eax, DWORD PTR _j$70393[ebp]
	cmp	eax, DWORD PTR _res$[ebp+8]
	jae	$L70413

; 244  : 				DYNBUF_ADD3_CELL(html, "<td>", &res, i, j, TO_HTML, "</td>");

	push	5
	push	OFFSET FLAT:$SG70415
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR _j$70393[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$70392[ebp]
	push	edx
	lea	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _j$70393[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$70392[ebp]
	push	edx
	lea	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	4
	push	OFFSET FLAT:$SG70416
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70414
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70418
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 244		; 000000f4H
	jmp	$eva_err$70362
$L70414:
	jmp	$L70412
$L70413:

; 245  : 			DYNBUF_ADD_STR(html, "</tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70421
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70420
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70423
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 245		; 000000f5H
	jmp	$eva_err$70362
$L70420:

; 246  : 		}

	jmp	$L70404
$L70405:

; 247  : 		DYNBUF_ADD_STR(html, "</table>");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70426
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70425
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70428
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 247		; 000000f7H
	jmp	$eva_err$70362
$L70425:

; 249  : 	else

	jmp	SHORT $L70430
$L70390:

; 251  : 		/* No result to display : output affected rows */
; 252  : 		if(sm->options & 2) dynbuf_print2(html,"<br><u>### Résultat : %lu lignes modifiées - %.2f s</u><br>", cntxt->sql_nbrows, cntxt->sql_restime);

	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	and	edx, 2
	test	edx, edx
	je	SHORT $L70430
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29844]
	push	ecx
	mov	edx, DWORD PTR [eax+29840]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29848]
	push	ecx
	push	OFFSET FLAT:$SG70432
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
$L70430:

; 254  : 
; 255  : 	/* Output result */
; 256  : 	flush_sm(sm);

	mov	edx, DWORD PTR _sm$[ebp]
	push	edx
	call	_flush_sm
	add	esp, 4
$eva_noerr$70433:

; 257  : 
; 258  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70434
	push	OFFSET FLAT:$SG70435
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70362:
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
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	mov	ecx, DWORD PTR _sqlexpr$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sqlexpr$[ebp], 0
	lea	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 259  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_exec_sql_qry ENDP
_TEXT	ENDS
PUBLIC	_eval_mark_expr
EXTRN	_find_files:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_strrchr:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70474 DB	01H DUP (?)
	ALIGN	4

$SG70476 DB	01H DUP (?)
	ALIGN	4

$SG70506 DB	01H DUP (?)
	ALIGN	4

$SG70507 DB	01H DUP (?)
	ALIGN	4

$SG70532 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70482 DB	' IN ', 00H
	ORG $+3
$SG70484 DB	'FOR EACH without IN', 00H
$SG70494 DB	'FOR EACH without variable', 00H
	ORG $+2
$SG70498 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70508 DB	'Variable already definite', 00H
	ORG $+2
$SG70509 DB	' IN ', 00H
	ORG $+3
$SG70515 DB	'Mark FOR/IF/ELSEIF without sql expression', 00H
	ORG $+2
$SG70517 DB	'SELECT ', 00H
$SG70520 DB	'SELECT ', 00H
$SG70522 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70526 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70533 DB	'<br><b>', 00H
$SG70535 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70537 DB	'</b>', 0aH, 00H
	ORG $+2
$SG70538 DB	' ', 00H
	ORG $+2
$SG70540 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70544 DB	'../', 00H
$SG70549 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70553 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70555 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sql_scrip'
	DB	't.c', 00H
$SG70556 DB	'eval_mark_expr', 00H
	ORG $+1
$SG70558 DB	'FOR EACH FILE : No such files', 00H
	ORG $+2
$SG70562 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70566 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sql_scrip'
	DB	't.c', 00H
$SG70567 DB	'eval_mark_expr', 00H
	ORG $+1
$SG70569 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sql_scrip'
	DB	't.c', 00H
$SG70570 DB	'eval_mark_expr', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sm$ = 12
_attr$ = 16
_res$ = 20
_num$ = 24
_type$ = 28
_sql$ = -28
_buf$ = -36
_bufpath$ = -24
_sqlexpr$ = -56
_html$ = -40
_result$ = -20
_len$ = -68
_i$ = -64
_newvar$ = -76
_var_i$ = -72
_mark$ = -52
_txt$ = -48
_txtlen$ = -60
_beg$ = -32
_end$ = -44
_eval_mark_expr PROC NEAR

; 278  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 88					; 00000058H

; 279  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 280  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 281  : 	DynBuffer *bufpath = NULL;

	mov	DWORD PTR _bufpath$[ebp], 0

; 282  : 	DynBuffer *sqlexpr = NULL;

	mov	DWORD PTR _sqlexpr$[ebp], 0

; 283  : 	DynBuffer **html = &sm->html;

	mov	eax, DWORD PTR _sm$[ebp]
	add	eax, 4
	mov	DWORD PTR _html$[ebp], eax

; 284  : 	DynTable result = {0};

	mov	DWORD PTR _result$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _result$[ebp+4], ecx
	mov	DWORD PTR _result$[ebp+8], ecx
	mov	DWORD PTR _result$[ebp+12], ecx
	mov	DWORD PTR _result$[ebp+16], ecx

; 285  : 	unsigned long len = 0, i = 0;

	mov	DWORD PTR _len$[ebp], 0
	mov	DWORD PTR _i$[ebp], 0

; 286  : 	DynTableCell *newvar, *var_i;
; 287  : 	struct _Mark *mark = sm->mark + num;

	mov	edx, DWORD PTR _num$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	add	ecx, edx
	mov	DWORD PTR _mark$[ebp], ecx

; 288  : 	char *txt = mark->txt;

	mov	edx, DWORD PTR _mark$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _txt$[ebp], eax

; 289  : 	size_t txtlen = mark->len;

	mov	ecx, DWORD PTR _mark$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR _txtlen$[ebp], edx

; 290  : 
; 291  : 
; 292  : 	char *beg = "", *end ="";

	mov	DWORD PTR _beg$[ebp], OFFSET FLAT:$SG70474
	mov	DWORD PTR _end$[ebp], OFFSET FLAT:$SG70476

; 293  : 	len = strlen(mark_lab[type]) + 4;

	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _mark_lab[eax*4]
	push	ecx
	call	_strlen
	add	esp, 4
	add	eax, 4
	mov	DWORD PTR _len$[ebp], eax

; 294  : 	beg = txt + len;

	mov	edx, DWORD PTR _txt$[ebp]
	add	edx, DWORD PTR _len$[ebp]
	mov	DWORD PTR _beg$[ebp], edx

; 295  : 
; 296  : 	switch(type)
; 297  : 	{

	mov	eax, DWORD PTR _type$[ebp]
	mov	DWORD PTR -80+[ebp], eax
	mov	ecx, DWORD PTR -80+[ebp]
	sub	ecx, 2
	mov	DWORD PTR -80+[ebp], ecx
	cmp	DWORD PTR -80+[ebp], 4
	ja	$eva_noerr$70485
	mov	edx, DWORD PTR -80+[ebp]
	jmp	DWORD PTR $L70980[edx*4]
$L70481:

; 298  : 	case MrkForFile:
; 299  : 	case MrkForVal:
; 300  : 
; 301  : 		/* Search for the sql variable in mark 'FOR EACH XXX xxx IN xxxxxx' */
; 302  : 		end = strstr(beg, " IN ");

	push	OFFSET FLAT:$SG70482
	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _end$[ebp], eax

; 303  : 		if(!end) STOP_EXE("FOR EACH without IN")

	cmp	DWORD PTR _end$[ebp], 0
	jne	SHORT $L70483
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [ecx+12], OFFSET FLAT:$SG70484
	jmp	$eva_noerr$70485
$L70483:

; 304  : 
; 305  : 		while(*beg == ' ') beg++;

	mov	edx, DWORD PTR _beg$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 32					; 00000020H
	jne	SHORT $L70488
	mov	ecx, DWORD PTR _beg$[ebp]
	add	ecx, 1
	mov	DWORD PTR _beg$[ebp], ecx
	jmp	SHORT $L70483
$L70488:

; 306  : 		while(*end == ' ') end--;

	mov	edx, DWORD PTR _end$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 32					; 00000020H
	jne	SHORT $L70491
	mov	ecx, DWORD PTR _end$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _end$[ebp], ecx
	jmp	SHORT $L70488
$L70491:

; 307  : 
; 308  : 		if(beg >= end || (end > beg + txtlen - len)) STOP_EXE("FOR EACH without variable")

	mov	edx, DWORD PTR _beg$[ebp]
	cmp	edx, DWORD PTR _end$[ebp]
	jae	SHORT $L70493
	mov	eax, DWORD PTR _beg$[ebp]
	add	eax, DWORD PTR _txtlen$[ebp]
	sub	eax, DWORD PTR _len$[ebp]
	cmp	DWORD PTR _end$[ebp], eax
	jbe	SHORT $L70492
$L70493:
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [ecx+12], OFFSET FLAT:$SG70494
	jmp	$eva_noerr$70485
$L70492:

; 309  : 
; 310  : 		/* Save variable name  */
; 311  : 		DYNTAB_ADD(&sm->markvar, sm->markvar.nbrows, COLNAME, beg, end - beg + 1, NO_CONV)

	push	0
	push	0
	mov	edx, DWORD PTR _end$[ebp]
	sub	edx, DWORD PTR _beg$[ebp]
	add	edx, 1
	push	edx
	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	mov	eax, DWORD PTR _sm$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70496
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70498
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 311		; 00000137H
	jmp	$eva_err$70499
$L70496:

; 312  : 
; 313  : 		/* Search if the variable is already definite in the parent's structures */
; 314  : 		newvar = dyntab_cell(&sm->markvar, sm->markvar.nbrows - 1, COLNAME);

	push	0
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	sub	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _sm$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newvar$[ebp], eax

; 315  : 		if(sm->markvar.nbrows > 1)

	mov	eax, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [eax+24], 1
	jbe	$L70503

; 316  : 			for(i = 0; i < sm->markvar.nbrows - 1; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70501
$L70502:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70501:
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+24]
	sub	eax, 1
	cmp	DWORD PTR _i$[ebp], eax
	jae	$L70503

; 318  : 				var_i = dyntab_cell(&sm->markvar, i, COLNAME);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sm$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _var_i$[ebp], eax

; 319  : 				if(!DYNTAB_SAMEVAL(newvar, var_i)) STOP_EXE("Variable already definite")

	mov	eax, DWORD PTR _newvar$[ebp]
	mov	ecx, DWORD PTR _var_i$[ebp]
	mov	edx, DWORD PTR [eax+4]
	cmp	edx, DWORD PTR [ecx+4]
	jne	SHORT $L70505
	mov	eax, DWORD PTR _newvar$[ebp]
	mov	ecx, DWORD PTR _var_i$[ebp]
	mov	edx, DWORD PTR [eax+36]
	cmp	edx, DWORD PTR [ecx+36]
	jne	SHORT $L70505
	mov	eax, DWORD PTR _newvar$[ebp]
	mov	ecx, DWORD PTR _var_i$[ebp]
	mov	edx, DWORD PTR [eax+40]
	cmp	edx, DWORD PTR [ecx+40]
	jne	SHORT $L70505
	mov	eax, DWORD PTR _newvar$[ebp]
	mov	ecx, DWORD PTR _var_i$[ebp]
	mov	edx, DWORD PTR [eax+4]
	cmp	edx, DWORD PTR [ecx+4]
	jne	SHORT $L70505
	mov	eax, DWORD PTR _var_i$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70976
	mov	ecx, DWORD PTR _var_i$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -84+[ebp], edx
	jmp	SHORT $L70977
$L70976:
	mov	DWORD PTR -84+[ebp], OFFSET FLAT:$SG70506
$L70977:
	mov	eax, DWORD PTR _newvar$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70978
	mov	ecx, DWORD PTR _newvar$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -88+[ebp], edx
	jmp	SHORT $L70979
$L70978:
	mov	DWORD PTR -88+[ebp], OFFSET FLAT:$SG70507
$L70979:
	mov	eax, DWORD PTR -84+[ebp]
	push	eax
	mov	ecx, DWORD PTR -88+[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70504
$L70505:
	mov	edx, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [edx+12], OFFSET FLAT:$SG70508
	jmp	$eva_noerr$70485
$L70504:

; 320  : 			}

	jmp	$L70502
$L70503:

; 321  : 
; 322  : 		/* Search for 'SELECT xxx' SQL expression */
; 323  : 		beg = strstr(end, " IN ") + 4;

	push	OFFSET FLAT:$SG70509
	mov	eax, DWORD PTR _end$[ebp]
	push	eax
	call	_strstr
	add	esp, 8
	add	eax, 4
	mov	DWORD PTR _beg$[ebp], eax
$L70510:

; 324  : 
; 325  : 	case MrkIf:
; 326  : 	case MrkElseIf:
; 327  : 
; 328  : 		while(*beg == ' ') beg++;

	mov	ecx, DWORD PTR _beg$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 32					; 00000020H
	jne	SHORT $L70513
	mov	eax, DWORD PTR _beg$[ebp]
	add	eax, 1
	mov	DWORD PTR _beg$[ebp], eax
	jmp	SHORT $L70510
$L70513:

; 329  : 		if(beg == txt + txtlen) STOP_EXE("Mark FOR/IF/ELSEIF without sql expression")

	mov	ecx, DWORD PTR _txt$[ebp]
	add	ecx, DWORD PTR _txtlen$[ebp]
	cmp	DWORD PTR _beg$[ebp], ecx
	jne	SHORT $L70514
	mov	edx, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [edx+12], OFFSET FLAT:$SG70515
	jmp	$eva_noerr$70485
$L70514:

; 330  : 		if(strncmp(beg, add_sz_str("SELECT "))) DYNBUF_ADD_STR(&sql, "SELECT ")

	push	7
	push	OFFSET FLAT:$SG70517
	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70519
	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70520
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70519
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70522
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 330		; 0000014aH
	jmp	$eva_err$70499
$L70519:

; 331  : 		DYNBUF_ADD(&sql, beg, txtlen -(beg - txt), NO_CONV)

	push	0
	push	0
	mov	ecx, DWORD PTR _beg$[ebp]
	sub	ecx, DWORD PTR _txt$[ebp]
	mov	edx, DWORD PTR _txtlen$[ebp]
	sub	edx, ecx
	push	edx
	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70524
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70526
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 331		; 0000014bH
	jmp	$eva_err$70499
$L70524:

; 332  : 
; 333  : 		/* Replace parameters in mark query */
; 334  : 		if(qry_eval_sqlexpr_var(cntxt, &sqlexpr, sql->data, attr, NULL)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _attr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _sqlexpr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70528
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 334		; 0000014eH
	jmp	$eva_err$70499
$L70528:

; 335  : 
; 336  : 		/* Replace variables in mark query */
; 337  : 		if(mark_eval_sqlexpr_var(cntxt, sm, &buf, sqlexpr->data)) STACK_ERROR;

	mov	eax, DWORD PTR _sqlexpr$[ebp]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sm$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_mark_eval_sqlexpr_var
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70529
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 337		; 00000151H
	jmp	$eva_err$70499
$L70529:

; 338  : 
; 339  : 		/* Display mark is applicable */
; 340  : 		if(sm->options & 2)

	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+60]
	and	eax, 2
	test	eax, eax
	je	$L70536

; 342  : 			DYNBUF_ADD3(html, "<br><b>", mark_lab[type], 0, TO_HTML, "");

	push	0
	push	OFFSET FLAT:$SG70532
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _type$[ebp]
	mov	edx, DWORD PTR _mark_lab[ecx*4]
	push	edx
	push	7
	push	OFFSET FLAT:$SG70533
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70531
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70535
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 342		; 00000156H
	jmp	$eva_err$70499
$L70531:

; 343  : 			DYNBUF_ADD3(html, " ", buf->data + 7, buf->cnt - 7, TO_HTML, "</b>\n");

	push	5
	push	OFFSET FLAT:$SG70537
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	eax, DWORD PTR _buf$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	sub	ecx, 7
	push	ecx
	mov	edx, DWORD PTR _buf$[ebp]
	add	edx, 15					; 0000000fH
	push	edx
	push	1
	push	OFFSET FLAT:$SG70538
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70536
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70540
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 343		; 00000157H
	jmp	$eva_err$70499
$L70536:

; 345  : 
; 346  : 
; 347  : 		/* Build & save variable value */
; 348  : 		if(type == MrkForFile)

	cmp	DWORD PTR _type$[ebp], 2
	jne	$L70541

; 350  : 			/* Exec qry & find files */
; 351  : 			if(sql_exec_query(cntxt, buf->data) || sql_get_table(cntxt, &result, 2)) STACK_ERROR;

	mov	eax, DWORD PTR _buf$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70543
	push	2
	lea	edx, DWORD PTR _result$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70542
$L70543:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 351		; 0000015fH
	jmp	$eva_err$70499
$L70542:

; 352  : 
; 353  : 			/* Replace mysql path (../../) by cgi path (../) */
; 354  : 			beg = dyntab_val(&result, 0, 0);

	push	0
	push	0
	lea	edx, DWORD PTR _result$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _beg$[ebp], eax

; 355  : 			end = strstr(beg, "../");

	push	OFFSET FLAT:$SG70544
	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _end$[ebp], eax

; 356  : 			if(beg != end) DYNBUF_ADD(&bufpath, beg, end - beg, NO_CONV)

	mov	ecx, DWORD PTR _beg$[ebp]
	cmp	ecx, DWORD PTR _end$[ebp]
	je	SHORT $L70547
	push	0
	push	0
	mov	edx, DWORD PTR _end$[ebp]
	sub	edx, DWORD PTR _beg$[ebp]
	push	edx
	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	lea	ecx, DWORD PTR _bufpath$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70547
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70549
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 356		; 00000164H
	jmp	$eva_err$70499
$L70547:

; 357  : 			DYNBUF_ADD(&bufpath, end + 3, strlen(end) - 3, NO_CONV)

	push	0
	push	0
	mov	ecx, DWORD PTR _end$[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	sub	eax, 3
	push	eax
	mov	edx, DWORD PTR _end$[ebp]
	add	edx, 3
	push	edx
	lea	eax, DWORD PTR _bufpath$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70551
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70553
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 357		; 00000165H
	jmp	$eva_err$70499
$L70551:

; 358  : 
; 359  : 			if(find_files(cntxt, res, bufpath->data, IncludeInfos)) CLEAR_ERROR;

	push	8
	mov	eax, DWORD PTR _bufpath$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_find_files
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70554
	push	359					; 00000167H
	push	OFFSET FLAT:$SG70555
	push	OFFSET FLAT:$SG70556
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70554:

; 360  : 			if(!res->nbrows) STOP_EXE("FOR EACH FILE : No such files")

	mov	ecx, DWORD PTR _res$[ebp]
	cmp	DWORD PTR [ecx], 0
	jne	SHORT $L70557
	mov	edx, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [edx+12], OFFSET FLAT:$SG70558
	jmp	$eva_noerr$70485
$L70557:

; 361  : 
; 362  : 			/* Save the file path for the later qry */
; 363  : 			beg = dyntab_val(&result, 0, 0);

	push	0
	push	0
	lea	eax, DWORD PTR _result$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _beg$[ebp], eax

; 364  : 			end = strrchr(beg,'/');

	push	47					; 0000002fH
	mov	ecx, DWORD PTR _beg$[ebp]
	push	ecx
	call	_strrchr
	add	esp, 8
	mov	DWORD PTR _end$[ebp], eax

; 365  : 			DYNTAB_ADD(&sm->markvar, sm->markvar.nbrows - 1, COLPATH, beg, end - beg + 1, NO_CONV)

	push	0
	push	0
	mov	edx, DWORD PTR _end$[ebp]
	sub	edx, DWORD PTR _beg$[ebp]
	add	edx, 1
	push	edx
	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	push	2
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _sm$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70560
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70562
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 365		; 0000016dH
	jmp	SHORT $eva_err$70499
$L70560:

; 366  : 
; 367  : 			DYNTAB_FREE(result);

	lea	eax, DWORD PTR _result$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 368  : 			M_FREE(bufpath);

	mov	ecx, DWORD PTR _bufpath$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _bufpath$[ebp], 0

; 370  : 		else

	jmp	SHORT $L70564
$L70541:

; 371  : 			if(sql_exec_query(cntxt, buf->data) || sql_get_table(cntxt, res, 2)) STACK_ERROR;

	mov	edx, DWORD PTR _buf$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70565
	push	2
	mov	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70564
$L70565:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 371		; 00000173H
	jmp	SHORT $eva_err$70499
$L70564:
$eva_noerr$70485:

; 375  : 
; 376  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70566
	push	OFFSET FLAT:$SG70567
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70499:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70568
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70569
	push	OFFSET FLAT:$SG70570
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70568:
	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	mov	edx, DWORD PTR _sqlexpr$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sqlexpr$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 377  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70980:
	DD	$L70481
	DD	$L70481
	DD	$L70510
	DD	$eva_noerr$70485
	DD	$L70510
_eval_mark_expr ENDP
_TEXT	ENDS
PUBLIC	_exec_script_struct
PUBLIC	_exec_child_structures
_DATA	SEGMENT
	ORG $+1
$SG70603 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sql_scrip'
	DB	't.c', 00H
$SG70604 DB	'exec_child_structures', 00H
	ORG $+2
$SG70606 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sql_scrip'
	DB	't.c', 00H
$SG70607 DB	'exec_child_structures', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sm$ = 12
_i$ = 16
_j$ = -8
_k$ = -16
_endstruct$ = -4
_prev_child_struc$ = -12
_exec_child_structures PROC NEAR

; 391  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	esi

; 392  : 	unsigned long j, k, endstruct, prev_child_struc;
; 393  : 
; 394  : 	/* Run queries following mark 'i' if exist */
; 395  : 	k = sm->mark[i].qry;

	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	eax, DWORD PTR [edx+eax+20]
	mov	DWORD PTR _k$[ebp], eax
$L70587:

; 396  : 	while(k != ~0UL && k < sm->nbqry && sm->qry[k].L0 > sm->mark[i].L && ((i == sm->nbmarks - 1) ? 1 :  sm->qry[k].L0 < sm->mark[i + 1].L))

	cmp	DWORD PTR _k$[ebp], -1
	je	$L70588
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR [ecx+52]
	jae	$L70588
	mov	eax, DWORD PTR _k$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+48]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	esi, DWORD PTR _sm$[ebp]
	mov	esi, DWORD PTR [esi+16]
	mov	edx, DWORD PTR [edx+eax+16]
	cmp	edx, DWORD PTR [esi+ecx+24]
	jbe	$L70588
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	sub	ecx, 1
	cmp	DWORD PTR _i$[ebp], ecx
	jne	SHORT $L70982
	mov	DWORD PTR -20+[ebp], 1
	jmp	SHORT $L70983
$L70982:
	mov	edx, DWORD PTR _k$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+48]
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	shl	eax, 5
	mov	esi, DWORD PTR _sm$[ebp]
	mov	esi, DWORD PTR [esi+16]
	mov	ecx, DWORD PTR [ecx+edx+16]
	cmp	ecx, DWORD PTR [esi+eax+24]
	sbb	edx, edx
	neg	edx
	mov	DWORD PTR -20+[ebp], edx
$L70983:
	cmp	DWORD PTR -20+[ebp], 0
	je	SHORT $L70588

; 398  : 		if(exec_sql_qry(cntxt, sm, k)) STACK_ERROR;

	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sm$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_exec_sql_qry
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70589
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 398		; 0000018eH
	jmp	$eva_err$70590
$L70589:

; 399  : 		if(sm->err) RETURN_OK;

	mov	ecx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [ecx+12], 0
	je	SHORT $L70591
	jmp	$eva_noerr$70592
$L70591:

; 400  : 		k++;

	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx

; 401  : 	}

	jmp	$L70587
$L70588:

; 402  : 
; 403  : 	if(COMSTRUCT(i)) RETURN_OK;

	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	cmp	DWORD PTR [edx+eax+12], 0
	je	SHORT $L70594
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	cmp	DWORD PTR [edx+eax+12], 1
	jne	SHORT $L70593
$L70594:
	jmp	$eva_noerr$70592
$L70593:

; 404  : 
; 405  : 	/* Run children marks following this mark */
; 406  : 	prev_child_struc = i;

	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _prev_child_struc$[ebp], eax

; 407  : 	j = i + 1;

	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx

; 408  : 	endstruct = sm->mark[i].end;

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [ecx+edx+16]
	mov	DWORD PTR _endstruct$[ebp], edx
$L70596:

; 409  : 	while(j < endstruct && j < sm->nbmarks && !sm->err)

	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _endstruct$[ebp]
	jae	$eva_noerr$70592
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+20]
	jae	$eva_noerr$70592
	mov	eax, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$eva_noerr$70592

; 411  : 		if(!sm->err && sm->mark[j].type != MrkNext && sm->mark[j].type != MrkEnd && j >= prev_child_struc)

	mov	ecx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [ecx+12], 0
	jne	$L70602
	mov	edx, DWORD PTR _j$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	cmp	DWORD PTR [ecx+edx+12], 8
	je	$L70602
	mov	edx, DWORD PTR _j$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	cmp	DWORD PTR [ecx+edx+12], 7
	je	$L70602
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _prev_child_struc$[ebp]
	jb	$L70602

; 413  : 			if(exec_script_struct(cntxt, sm, j)) STACK_ERROR;

	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sm$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_exec_script_struct
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70599
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 413		; 0000019dH
	jmp	$eva_err$70590
$L70599:

; 414  : 
; 415  : 			if(COMSTRUCT(j)) prev_child_struc = j + 1;

	mov	ecx, DWORD PTR _j$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+16]
	cmp	DWORD PTR [eax+ecx+12], 0
	je	SHORT $L70601
	mov	ecx, DWORD PTR _j$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+16]
	cmp	DWORD PTR [eax+ecx+12], 1
	jne	SHORT $L70600
$L70601:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _prev_child_struc$[ebp], ecx

; 416  : 			else prev_child_struc = (sm->mark[i].next == ~0UL) ? sm->mark[j].end : sm->mark[j].next;

	jmp	SHORT $L70602
$L70600:
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	cmp	DWORD PTR [ecx+edx+28], -1
	jne	SHORT $L70984
	mov	edx, DWORD PTR _j$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [ecx+edx+16]
	mov	DWORD PTR -24+[ebp], edx
	jmp	SHORT $L70985
$L70984:
	mov	eax, DWORD PTR _j$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	eax, DWORD PTR [edx+eax+28]
	mov	DWORD PTR -24+[ebp], eax
$L70985:
	mov	ecx, DWORD PTR -24+[ebp]
	mov	DWORD PTR _prev_child_struc$[ebp], ecx
$L70602:

; 418  : 		j++;

	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx

; 419  : 	}

	jmp	$L70596
$eva_noerr$70592:

; 420  : 
; 421  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70603
	push	OFFSET FLAT:$SG70604
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70590:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70605
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70606
	push	OFFSET FLAT:$SG70607
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70605:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 422  : }

	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_exec_child_structures ENDP
_TEXT	ENDS
EXTRN	_dyntab_free_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	__strnicmp:NEAR
EXTRN	_dyntab_txt_cmp:NEAR
EXTRN	_dyntab_del_rows:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70638 DB	'#DISPLAY', 00H
	ORG $+3
$SG70639 DB	'display', 00H
$SG70643 DB	'</b>', 0aH, 00H
	ORG $+2
$SG70644 DB	'<br><b>', 00H
$SG70646 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70661 DB	'''', 00H
	ORG $+2
$SG70663 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70667 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70671 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70674 DB	'''', 00H
	ORG $+2
$SG70676 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70681 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70687 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70691 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70697 DB	'<br><b>END</b>', 00H
	ORG $+1
$SG70699 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70706 DB	'</b>', 00H
	ORG $+3
$SG70707 DB	'<br><b>R', 0e9H, 'sultat de la requ', 0eaH, 'te IF : ', 00H
$SG70709 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70711 DB	'1', 00H
	ORG $+2
$SG70719 DB	'</b>', 00H
	ORG $+3
$SG70720 DB	'<br><b>', 00H
$SG70722 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70728 DB	'<br><b>ENDIF</b>', 00H
	ORG $+3
$SG70730 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70746 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sql_scrip'
	DB	't.c', 00H
$SG70747 DB	'exec_script_struct', 00H
	ORG $+1
$SG70749 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sql_scrip'
	DB	't.c', 00H
$SG70750 DB	'exec_script_struct', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_sm$ = 12
_i$ = 16
_form$ = -12
_ctrl$ = -56
_sql$ = -4
_buf$ = -20
_html$ = -24
_res$ = -48
_mark$ = -28
_sqlmrk$ = -8
_file$ = -60
_k$ = -52
_row$ = -16
_exec_script_struct PROC NEAR

; 439  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 76					; 0000004cH
	push	esi

; 440  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 441  : 	EVA_ctrl *ctrl = form->ctrl + sm->i_ctrl;

	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 442  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 443  : 	DynBuffer *buf = NULL;

	mov	DWORD PTR _buf$[ebp], 0

; 444  : 	DynBuffer **html = &sm->html;

	mov	eax, DWORD PTR _sm$[ebp]
	add	eax, 4
	mov	DWORD PTR _html$[ebp], eax

; 445  : 	DynTable res = {0};

	mov	DWORD PTR _res$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _res$[ebp+4], ecx
	mov	DWORD PTR _res$[ebp+8], ecx
	mov	DWORD PTR _res$[ebp+12], ecx
	mov	DWORD PTR _res$[ebp+16], ecx

; 446  : 	struct _Mark *mark = sm->mark + i;

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	add	ecx, edx
	mov	DWORD PTR _mark$[ebp], ecx

; 447  : 	DynBuffer *sqlmrk = NULL;

	mov	DWORD PTR _sqlmrk$[ebp], 0

; 448  : 	DynBuffer *file = NULL;

	mov	DWORD PTR _file$[ebp], 0

; 449  : 	unsigned long k, row;
; 450  : 
; 451  : 	/* Switch on structure type */
; 452  : 	switch(sm->mark[i].type)
; 453  : 	{

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [ecx+edx+12]
	mov	DWORD PTR -64+[ebp], edx
	cmp	DWORD PTR -64+[ebp], 6
	ja	$L70736
	mov	eax, DWORD PTR -64+[ebp]
	jmp	DWORD PTR $L70993[eax*4]
$L70637:

; 454  : 	case MrkComment:
; 455  : 	case MrkUnknown:
; 456  : 
; 457  : 		/* Comment : skip if applicable */
; 458  : 		sm->display = !strncmp(mark->txt + 3, add_sz_str("#DISPLAY")) || !STRNCMPCASE(mark->txt + 3, "display", sizeof("display")-1);

	push	8
	push	OFFSET FLAT:$SG70638
	mov	ecx, DWORD PTR _mark$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	add	edx, 3
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70987
	push	7
	push	OFFSET FLAT:$SG70639
	mov	eax, DWORD PTR _mark$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	add	ecx, 3
	push	ecx
	call	__strnicmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70987
	mov	DWORD PTR -68+[ebp], 0
	jmp	SHORT $L70988
$L70987:
	mov	DWORD PTR -68+[ebp], 1
$L70988:
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR -68+[ebp]
	mov	DWORD PTR [edx+56], eax

; 459  : 		if(((sm->options & 2) || sm->display) && sm->options)

	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	and	edx, 2
	test	edx, edx
	jne	SHORT $L70641
	mov	eax, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	SHORT $L70642
$L70641:
	mov	ecx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [ecx+60], 0
	je	SHORT $L70642

; 460  : 			DYNBUF_ADD3(html, "<br><b>", mark->txt + (sm->display ? 11 : 3), mark->len - (sm->display ? 11 : 3), TO_HTML, "</b>\n");

	push	5
	push	OFFSET FLAT:$SG70643
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+56]
	neg	eax
	sbb	eax, eax
	and	eax, 8
	add	eax, 3
	mov	ecx, DWORD PTR _mark$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	sub	edx, eax
	push	edx
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 8
	add	ecx, 3
	mov	edx, DWORD PTR _mark$[ebp]
	mov	eax, DWORD PTR [edx+4]
	add	eax, ecx
	push	eax
	push	7
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
	mov	DWORD PTR [eax+29900], 460		; 000001ccH
	jmp	$eva_err$70647
$L70642:

; 461  : 
; 462  : 		/* Run queries following this mark */
; 463  : 		if(exec_child_structures(cntxt, sm, i)) STACK_ERROR;

	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sm$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_exec_child_structures
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70648
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 463		; 000001cfH
	jmp	$eva_err$70647
$L70648:

; 464  : 		if(sm->err) RETURN_OK;

	mov	edx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [edx+12], 0
	je	SHORT $L70649
	jmp	$eva_noerr$70650
$L70649:

; 465  : 		sm->display = ~0UL;

	mov	eax, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [eax+56], -1

; 466  : 
; 467  : 		/* Next ancester mark to run */
; 468  : 		if(sm->nextmark == i)

	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	cmp	edx, DWORD PTR _i$[ebp]
	jne	SHORT $L70651

; 469  : 			sm->nextmark = i + 1;

	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [ecx+44], eax
$L70651:

; 470  : 
; 471  : 		break;

	jmp	$L70634
$L70652:

; 472  : 
; 473  : 	case MrkForFile:
; 474  : 	case MrkForVal:
; 475  : 
; 476  : 		/* Control & save mark variable (name & value) */
; 477  : 		if(eval_mark_expr(cntxt, sm, &ctrl->attr, &res, i, sm->mark[i].type)) STACK_ERROR;

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [ecx+edx+12]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	mov	eax, DWORD PTR _sm$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_eval_mark_expr
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70653
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 477		; 000001ddH
	jmp	$eva_err$70647
$L70653:

; 478  : 		if(sm->err) RETURN_OK;

	mov	eax, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	SHORT $L70654
	jmp	$eva_noerr$70650
$L70654:

; 479  : 
; 480  : 		/* Execute qry mark  */
; 481  : 		for(row = 0; row < res.nbrows; row++)

	mov	DWORD PTR _row$[ebp], 0
	jmp	SHORT $L70655
$L70656:
	mov	ecx, DWORD PTR _row$[ebp]
	add	ecx, 1
	mov	DWORD PTR _row$[ebp], ecx
$L70655:
	mov	edx, DWORD PTR _row$[ebp]
	cmp	edx, DWORD PTR _res$[ebp]
	jae	$L70657

; 483  : 			if(sm->mark[i].type == MrkForFile)

	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	cmp	DWORD PTR [edx+eax+12], 2
	jne	$L70658

; 485  : 				/* Copy actual file name in sm->markvar to be replaced in child queries */
; 486  : 				DYNBUF_ADD_STR(&file, "'")

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70661
	lea	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70660
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70663
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 486		; 000001e6H
	jmp	$eva_err$70647
$L70660:

; 487  : 				DYNBUF_ADD_CELL(&file, &sm->markvar, sm->markvar.nbrows - 1, COLPATH, NO_CONV)

	push	0
	push	0
	push	2
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	sub	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _sm$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	2
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	sub	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _sm$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70665
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70667
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 487		; 000001e7H
	jmp	$eva_err$70647
$L70665:

; 488  : 				DYNBUF_ADD_CELL(&file, &res, row, 0, NO_CONV)

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _row$[ebp]
	push	eax
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _row$[ebp]
	push	edx
	lea	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _file$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70669
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70671
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 488		; 000001e8H
	jmp	$eva_err$70647
$L70669:

; 489  : 				DYNBUF_ADD_STR(&file, "'")

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70674
	lea	ecx, DWORD PTR _file$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70673
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70676
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 489		; 000001e9H
	jmp	$eva_err$70647
$L70673:

; 490  : 
; 491  : 				DYNTAB_ADD_BUF(&sm->markvar, sm->markvar.nbrows - 1, COLVAL, file)

	cmp	DWORD PTR _file$[ebp], 0
	je	SHORT $L70677
	mov	ecx, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L70677
	push	0
	push	0
	mov	edx, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _file$[ebp]
	add	ecx, 8
	push	ecx
	push	1
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+24]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _sm$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70679
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70681
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 491		; 000001ebH
	jmp	$eva_err$70647
$L70679:
	jmp	SHORT $L70685
$L70677:
	push	0
	push	0
	push	0
	push	0
	push	1
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	sub	edx, 1
	push	edx
	mov	eax, DWORD PTR _sm$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70685
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70687
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 491		; 000001ebH
	jmp	$eva_err$70647
$L70685:

; 492  : 				M_FREE(file);

	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _file$[ebp], 0

; 494  : 			else

	jmp	SHORT $L70689
$L70658:

; 496  : 				/* Save the current value of the variable in sm->markvar */
; 497  : 				DYNTAB_ADD_CELL(&sm->markvar, sm->markvar.nbrows - 1, COLVAL, &res, row, 0)

	push	1
	push	0
	mov	ecx, DWORD PTR _row$[ebp]
	push	ecx
	lea	edx, DWORD PTR _res$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	sub	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _sm$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70689
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70691
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 497		; 000001f1H
	jmp	$eva_err$70647
$L70689:

; 499  : 
; 500  : 			/* Run qry & children marks of the current mark */
; 501  : 			if(exec_child_structures(cntxt, sm, i)) STACK_ERROR;

	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _sm$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_exec_child_structures
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70692
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 501		; 000001f5H
	jmp	$eva_err$70647
$L70692:

; 502  : 			if(sm->err) RETURN_OK;

	mov	eax, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	SHORT $L70693
	jmp	$eva_noerr$70650
$L70693:

; 503  : 
; 504  : 			/* Free variable or file name value */
; 505  : 			dyntab_free_cell(&sm->markvar, ((COLVAL) + ((sm->markvar.nbrows - 1) * sm->markvar.szcols)));

	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	sub	edx, 1
	mov	eax, DWORD PTR _sm$[ebp]
	imul	edx, DWORD PTR [eax+36]
	add	edx, 1
	push	edx
	mov	ecx, DWORD PTR _sm$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_free_cell
	add	esp, 8

; 506  : 		}

	jmp	$L70656
$L70657:

; 507  : 
; 508  : 		if(sm->options & 2)

	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+60]
	and	eax, 2
	test	eax, eax
	je	SHORT $L70696

; 509  : 			DYNBUF_ADD_STR(html, "<br><b>END</b>");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70697
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70696
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70699
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 509		; 000001fdH
	jmp	$eva_err$70647
$L70696:

; 510  : 
; 511  : 		/* Next parent mark to run */
; 512  : 		if(sm->nextmark == i)

	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	cmp	edx, DWORD PTR _i$[ebp]
	jne	SHORT $L70700

; 513  : 			sm->nextmark = sm->mark[i].end + 1;

	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	eax, DWORD PTR [edx+eax+16]
	add	eax, 1
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [ecx+44], eax
$L70700:

; 514  : 
; 515  : 		/* Free variable */
; 516  : 		dyntab_del_rows(&sm->markvar, sm->markvar.nbrows - 1, 1);

	push	1
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+24]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _sm$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_del_rows
	add	esp, 12					; 0000000cH

; 517  : 
; 518  : 		break;

	jmp	$L70634
$L70701:

; 519  : 
; 520  : 	case MrkIf:
; 521  : 	case MrkElseIf:
; 522  : 
; 523  : 		if(eval_mark_expr(cntxt, sm, &ctrl->attr, &res, i, sm->mark[i].type)) STACK_ERROR;

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [ecx+edx+12]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	mov	eax, DWORD PTR _sm$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_eval_mark_expr
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70702
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 523		; 0000020bH
	jmp	$eva_err$70647
$L70702:

; 524  : 		if(sm->err) RETURN_OK;

	mov	eax, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	SHORT $L70703
	jmp	$eva_noerr$70650
$L70703:

; 525  : 
; 526  : 		sm->mark[i].next = ~0UL;

	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	DWORD PTR [eax+ecx+28], -1

; 527  : 
; 528  : 		/* If Mark qry don't success, exec next mark */
; 529  : 
; 530  : 		if(sm->options & 2)

	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	and	edx, 2
	test	edx, edx
	je	SHORT $L70705

; 531  : 			DYNBUF_ADD3_CELL(html, "<br><b>Résultat de la requête IF : ", &res, 0, 0, TO_HTML, "</b>")

	push	4
	push	OFFSET FLAT:$SG70706
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	push	0
	lea	eax, DWORD PTR _res$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	35					; 00000023H
	push	OFFSET FLAT:$SG70707
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70705
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70709
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 531		; 00000213H
	jmp	$eva_err$70647
$L70705:

; 532  : 
; 533  : 		if(dyntab_txt_cmp("1", 1, &res, 0, 0))

	push	0
	push	0
	lea	edx, DWORD PTR _res$[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70711
	call	_dyntab_txt_cmp
	add	esp, 20					; 00000014H
	test	eax, eax
	je	$L70710

; 535  : 			if(sm->nextmark == i)

	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	cmp	ecx, DWORD PTR _i$[ebp]
	jne	SHORT $L70712

; 537  : 				if(sm->mark[sm->mark[i].end].type != MrkEnd) sm->nextmark = sm->mark[i].end;

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [ecx+edx+16]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	cmp	DWORD PTR [ecx+edx+12], 7
	je	SHORT $L70713
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [ecx+edx+16]
	mov	DWORD PTR [eax+44], ecx

; 538  : 				else sm->nextmark = sm->mark[i].end + 1;

	jmp	SHORT $L70714
$L70713:
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [ecx+edx+16]
	add	edx, 1
	mov	eax, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [eax+44], edx
$L70714:

; 540  : 			else sm->mark[i].next = (sm->mark[i].end != MrkEnd) ? sm->mark[i].end : sm->mark[i].end + 1;

	jmp	SHORT $L70715
$L70712:
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+16]
	cmp	DWORD PTR [eax+ecx+16], 7
	je	SHORT $L70989
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+ecx+16]
	mov	DWORD PTR -72+[ebp], ecx
	jmp	SHORT $L70990
$L70989:
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [ecx+edx+16]
	add	edx, 1
	mov	DWORD PTR -72+[ebp], edx
$L70990:
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	ecx, DWORD PTR -72+[ebp]
	mov	DWORD PTR [edx+eax+28], ecx
$L70715:

; 541  : 
; 542  : 			break;

	jmp	$L70634
$L70710:

; 544  : 
; 545  : 	case MrkElse:
; 546  : 
; 547  : 		if(sm->options & 2 && sm->mark[i].type == MrkElse)

	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+60]
	and	eax, 2
	test	eax, eax
	je	SHORT $L70718
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+16]
	cmp	DWORD PTR [eax+ecx+12], 5
	jne	SHORT $L70718

; 548  : 			DYNBUF_ADD3(html, "<br><b>", mark_lab[sm->mark[i].type], 0, TO_HTML, "</b>");

	push	4
	push	OFFSET FLAT:$SG70719
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+ecx+12]
	mov	edx, DWORD PTR _mark_lab[ecx*4]
	push	edx
	push	7
	push	OFFSET FLAT:$SG70720
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70718
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70722
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 548		; 00000224H
	jmp	$eva_err$70647
$L70718:

; 549  : 
; 550  : 		/* Run queries & children marks following this mark */
; 551  : 		if(exec_child_structures(cntxt, sm, i)) STACK_ERROR;

	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sm$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_exec_child_structures
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70723
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 551		; 00000227H
	jmp	$eva_err$70647
$L70723:

; 552  : 		if(sm->err) RETURN_OK;

	mov	ecx, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [ecx+12], 0
	je	SHORT $L70724
	jmp	$eva_noerr$70650
$L70724:

; 553  : 
; 554  : 		if(sm->options & 2)

	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+60]
	and	eax, 2
	test	eax, eax
	je	SHORT $L70727

; 555  : 			DYNBUF_ADD_STR(html, "<br><b>ENDIF</b>");

	push	0
	push	0
	push	16					; 00000010H
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
	mov	DWORD PTR [eax+29900], 555		; 0000022bH
	jmp	$eva_err$70647
$L70727:

; 556  : 
; 557  : 		/* Next parent mark to run */
; 558  : 		k = sm->mark[i].end;

	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+ecx+16]
	mov	DWORD PTR _k$[ebp], ecx
$L70732:

; 559  : 		while(sm->mark[k].type != MrkEnd) k++;

	mov	edx, DWORD PTR _k$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	cmp	DWORD PTR [ecx+edx+12], 7
	je	SHORT $L70733
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
	jmp	SHORT $L70732
$L70733:

; 560  : 		if(sm->nextmark == i) sm->nextmark = k + 1;

	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	cmp	ecx, DWORD PTR _i$[ebp]
	jne	SHORT $L70734
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	eax, DWORD PTR _sm$[ebp]
	mov	DWORD PTR [eax+44], edx

; 561  : 		else sm->mark[i].next = k + 1;

	jmp	SHORT $L70736
$L70734:
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR [eax+edx+28], ecx
$L70736:
$L70634:

; 568  : 
; 569  : 		/* Run queries following NEXT mark */
; 570  : 	if(sm->mark[i].type != MrkComment && sm->mark[i].type != MrkUnknown \
; 571  : 		&& (sm->mark[sm->mark[i].end].type == MrkEnd || sm->mark[sm->mark[i].end].type == MrkNext))

	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+16]
	cmp	DWORD PTR [eax+ecx+12], 1
	je	$L70744
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+16]
	cmp	DWORD PTR [eax+ecx+12], 0
	je	$L70744
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+ecx+16]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+16]
	cmp	DWORD PTR [eax+ecx+12], 7
	je	SHORT $L70738
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+ecx+16]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+16]
	cmp	DWORD PTR [eax+ecx+12], 8
	jne	$L70744
$L70738:

; 573  : 		k = sm->mark[sm->mark[i].end].qry;

	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+ecx+16]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+ecx+20]
	mov	DWORD PTR _k$[ebp], ecx
$L70740:

; 574  : 		while(sm->qry[k].L0 < sm->mark[sm->mark[i].end].L) k++;

	mov	edx, DWORD PTR _k$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+48]
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	esi, DWORD PTR _sm$[ebp]
	mov	esi, DWORD PTR [esi+16]
	mov	eax, DWORD PTR [esi+eax+16]
	shl	eax, 5
	mov	esi, DWORD PTR _sm$[ebp]
	mov	esi, DWORD PTR [esi+16]
	mov	ecx, DWORD PTR [ecx+edx+16]
	cmp	ecx, DWORD PTR [esi+eax+24]
	jae	SHORT $L70741
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
	jmp	SHORT $L70740
$L70741:

; 575  : 
; 576  : 		while(!sm->err && k != ~0UL && k < sm->nbqry && sm->qry[k].L0 > sm->mark[sm->mark[i].end].L && ((i == sm->nbmarks - 1) ? 1 :  sm->qry[k].L0 < sm->mark[sm->mark[i].end + 1].L))

	mov	eax, DWORD PTR _sm$[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$L70744
	cmp	DWORD PTR _k$[ebp], -1
	je	$L70744
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR [ecx+52]
	jae	$L70744
	mov	eax, DWORD PTR _k$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _sm$[ebp]
	mov	edx, DWORD PTR [ecx+48]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	esi, DWORD PTR _sm$[ebp]
	mov	esi, DWORD PTR [esi+16]
	mov	ecx, DWORD PTR [esi+ecx+16]
	shl	ecx, 5
	mov	esi, DWORD PTR _sm$[ebp]
	mov	esi, DWORD PTR [esi+16]
	mov	edx, DWORD PTR [edx+eax+16]
	cmp	edx, DWORD PTR [esi+ecx+24]
	jbe	$L70744
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	sub	ecx, 1
	cmp	DWORD PTR _i$[ebp], ecx
	jne	SHORT $L70991
	mov	DWORD PTR -76+[ebp], 1
	jmp	SHORT $L70992
$L70991:
	mov	edx, DWORD PTR _k$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _sm$[ebp]
	mov	ecx, DWORD PTR [eax+48]
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	esi, DWORD PTR _sm$[ebp]
	mov	esi, DWORD PTR [esi+16]
	mov	eax, DWORD PTR [esi+eax+16]
	add	eax, 1
	shl	eax, 5
	mov	esi, DWORD PTR _sm$[ebp]
	mov	esi, DWORD PTR [esi+16]
	mov	ecx, DWORD PTR [ecx+edx+16]
	cmp	ecx, DWORD PTR [esi+eax+24]
	sbb	edx, edx
	neg	edx
	mov	DWORD PTR -76+[ebp], edx
$L70992:
	cmp	DWORD PTR -76+[ebp], 0
	je	SHORT $L70744

; 578  : 			if(exec_sql_qry(cntxt, sm, k)) STACK_ERROR;

	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sm$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_exec_sql_qry
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70745
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 578		; 00000242H
	jmp	SHORT $eva_err$70647
$L70745:

; 579  : 			k++;

	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx

; 580  : 		}

	jmp	$L70741
$L70744:
$eva_noerr$70650:

; 582  : 
; 583  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70746
	push	OFFSET FLAT:$SG70747
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70647:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70748
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70749
	push	OFFSET FLAT:$SG70750
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70748:
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	edx, DWORD PTR _buf$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _buf$[ebp], 0
	mov	eax, DWORD PTR _sqlmrk$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sqlmrk$[ebp], 0
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 584  : }

	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
$L70993:
	DD	$L70637
	DD	$L70637
	DD	$L70652
	DD	$L70652
	DD	$L70701
	DD	$L70710
	DD	$L70701
_exec_script_struct ENDP
_TEXT	ENDS
PUBLIC	_action_sql_script
EXTRN	_put_html_page_header:NEAR
EXTRN	_put_html_button_sz:NEAR
EXTRN	_mem_alloc:NEAR
EXTRN	_mem_realloc:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_form_btn_do_save:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70781 DB	01H DUP (?)
	ALIGN	4

$SG70795 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70780 DB	'_EVA_DISPLAY_MSG', 00H
	ORG $+3
$SG70788 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70789 DB	'_EVA_MINIMAL', 00H
	ORG $+3
$SG70790 DB	'_EVA_SIMPLE', 00H
$SG70791 DB	'_EVA_DETAIL', 00H
$SG70794 DB	'_EVA_SQL_SCRIPT', 00H
$SG70800 DB	'SQL Script', 00H
	ORG $+1
$SG70802 DB	'</b></center><hr>', 00H
	ORG $+2
$SG70803 DB	'<font face=Arial><center><b>Ex', 0e9H, 'cution d''un scr'
	DB	'ipt de commandes SQL : ', 00H
	ORG $+2
$SG70805 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70809 DB	0aH, 00H
	ORG $+2
$SG70815 DB	09H, ' ', 00H
	ORG $+1
$SG70819 DB	'-- ', 00H
$SG70825 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70828 DB	'FOR EACH VALUE ', 00H
$SG70829 DB	'FOR EACH FILE ', 00H
	ORG $+1
$SG70830 DB	'NEXT', 00H
	ORG $+3
$SG70831 DB	'IF ', 00H
$SG70832 DB	'ELSE', 00H
	ORG $+3
$SG70833 DB	'ELSEIF ', 00H
$SG70834 DB	'END', 00H
$SG70843 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70848 DB	' ', 09H, 00H
	ORG $+1
$SG70856 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70872 DB	'Query error : query ride a mark structure', 00H
	ORG $+2
$SG70900 DB	'IF without END', 00H
	ORG $+1
$SG70903 DB	'FOR without NEXT', 00H
	ORG $+3
$SG70910 DB	'NEXT without FOR', 00H
	ORG $+3
$SG70913 DB	'ELSE/ELSEIF/END without IF', 00H
	ORG $+1
$SG70916 DB	'</font><br>', 00H
$SG70917 DB	'<br><font face=Courier>', 00H
$SG70919 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70933 DB	'<hr><center>', 00H
	ORG $+3
$SG70935 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70938 DB	'Retourne ', 0e0H, ' la page pr', 0e9H, 'c', 0e9H, 'dente'
	DB	00H
	ORG $+2
$SG70939 DB	'_eva_btn_gobackobj_fr_s.gif', 00H
$SG70940 DB	'_eva_btn_gobackobj_fr.gif', 00H
	ORG $+2
$SG70941 DB	'Revenir', 00H
$SG70942 DB	'NOP', 00H
$SG70945 DB	'</center><hr>', 00H
	ORG $+2
$SG70947 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70952 DB	' ', 00H
	ORG $+2
$SG70954 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70955 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sql_scrip'
	DB	't.c', 00H
$SG70956 DB	'action_sql_script', 00H
	ORG $+2
$SG70958 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\action_sql_scrip'
	DB	't.c', 00H
$SG70959 DB	'action_sql_script', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -72
_ctrl$ = -136
_script$ = -96
_sm$ = -68
_i$ = -100
_cnt$ = -84
_j$ = -112
_k$ = -120
_cntstruc$ = -140
_curqry$ = -92
_endstruct$ = -108
_typstruc$ = -4
_next$ = -132
_end$ = -80
_scriptend$ = -128
_cmp$ = -116
_b_empty$ = -124
_sql_trace$ = -76
_dispmode$ = -88
_b_done$ = -104
_newdest$70820 = -144
_newdest$70838 = -148
_size1$70852 = -152
_action_sql_script PROC NEAR

; 603  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 208				; 000000d0H
	push	esi
	push	edi

; 604  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 605  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 606  : 	DynBuffer *script = NULL;

	mov	DWORD PTR _script$[ebp], 0

; 607  : 	ScriptMark sm = {0};

	mov	DWORD PTR _sm$[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _sm$[ebp+4]
	rep stosd

; 608  : 	unsigned long i, cnt = 0,j, k, cntstruc, curqry = ~0UL, endstruct;

	mov	DWORD PTR _cnt$[ebp], 0
	mov	DWORD PTR _curqry$[ebp], -1

; 609  : 	unsigned long *typstruc = NULL;

	mov	DWORD PTR _typstruc$[ebp], 0

; 610  : 	char *next, *end, *scriptend, *cmp;
; 611  : 	int b_empty;
; 612  : 	int sql_trace = cntxt->sql_trace;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29852]
	mov	DWORD PTR _sql_trace$[ebp], eax

; 613  : 	char *dispmode = CTRL_ATTR_VAL(DISPLAY_MSG);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70995
	push	0
	push	-1
	push	OFFSET FLAT:$SG70780
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -156+[ebp], eax
	jmp	SHORT $L70996
$L70995:
	mov	DWORD PTR -156+[ebp], OFFSET FLAT:$SG70781
$L70996:
	mov	edx, DWORD PTR -156+[ebp]
	mov	DWORD PTR _dispmode$[ebp], edx

; 614  : 
; 615  : 	/* Handle save before */
; 616  : 	int b_done = 1;

	mov	DWORD PTR _b_done$[ebp], 1

; 617  : 	if((form->b_modified || form->prevstep == HtmlSaveDlg || form->b_newobj) &&
; 618  : 		form_btn_do_save(cntxt, i_ctrl, &b_done)) STACK_ERROR;

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+128], 0
	jne	SHORT $L70784
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+168], 3
	je	SHORT $L70784
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+72], 0
	je	SHORT $L70783
$L70784:
	lea	eax, DWORD PTR _b_done$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_btn_do_save
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70783
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 618		; 0000026aH
	jmp	$eva_err$70785
$L70783:

; 619  : 	if(!b_done) RETURN_OK;

	cmp	DWORD PTR _b_done$[ebp], 0
	jne	SHORT $L70786
	jmp	$eva_noerr$70787
$L70786:

; 620  : 	form = cntxt->form;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	DWORD PTR _form$[ebp], edx

; 621  : 	ctrl = form->ctrl + i_ctrl;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 622  : 
; 623  : 	/* Initialize script structure */
; 624  : 
; 625  : 	sm.options |= !strcmp(dispmode, "_EVA_NONE") ? 0 :
; 626  : 				!strcmp(dispmode, "_EVA_MINIMAL") ? 1 :
; 627  : 				!strcmp(dispmode, "_EVA_SIMPLE") ? 2 :
; 628  : 				!strcmp(dispmode, "_EVA_DETAIL") ? 3 : 1;

	push	OFFSET FLAT:$SG70788
	mov	eax, DWORD PTR _dispmode$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71001
	mov	DWORD PTR -160+[ebp], 0
	jmp	SHORT $L71002
$L71001:
	push	OFFSET FLAT:$SG70789
	mov	ecx, DWORD PTR _dispmode$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70999
	mov	DWORD PTR -164+[ebp], 1
	jmp	SHORT $L71000
$L70999:
	push	OFFSET FLAT:$SG70790
	mov	edx, DWORD PTR _dispmode$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70997
	mov	DWORD PTR -168+[ebp], 2
	jmp	SHORT $L70998
$L70997:
	push	OFFSET FLAT:$SG70791
	mov	eax, DWORD PTR _dispmode$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	and	al, -2					; fffffffeH
	add	eax, 3
	mov	DWORD PTR -168+[ebp], eax
$L70998:
	mov	ecx, DWORD PTR -168+[ebp]
	mov	DWORD PTR -164+[ebp], ecx
$L71000:
	mov	edx, DWORD PTR -164+[ebp]
	mov	DWORD PTR -160+[ebp], edx
$L71002:
	mov	eax, DWORD PTR _sm$[ebp+60]
	or	eax, DWORD PTR -160+[ebp]
	mov	DWORD PTR _sm$[ebp+60], eax

; 629  : 	sm.display = ~0UL;

	mov	DWORD PTR _sm$[ebp+56], -1

; 630  : 
; 631  : 
; 632  : 	/* Handle variables in script */
; 633  : 	if(qry_eval_sqlexpr_var(cntxt, &script, CTRL_ATTR_VAL(SQL_SCRIPT), &ctrl->attr, NULL)) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71003
	push	0
	push	-1
	push	OFFSET FLAT:$SG70794
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -172+[ebp], eax
	jmp	SHORT $L71004
$L71003:
	mov	DWORD PTR -172+[ebp], OFFSET FLAT:$SG70795
$L71004:
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	mov	eax, DWORD PTR -172+[ebp]
	push	eax
	lea	ecx, DWORD PTR _script$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70793
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 633		; 00000279H
	jmp	$eva_err$70785
$L70793:

; 634  : 	if(!script) RETURN_OK;

	cmp	DWORD PTR _script$[ebp], 0
	jne	SHORT $L70796
	jmp	$eva_noerr$70787
$L70796:

; 635  : 
; 636  : 	/* Output page header */
; 637  : 	if(sm.options)

	cmp	DWORD PTR _sm$[ebp+60], 0
	je	$L70801

; 639  : 		put_html_page_header(cntxt, NULL, "SQL Script", NULL, 3);

	push	3
	push	0
	push	OFFSET FLAT:$SG70800
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_page_header
	add	esp, 20					; 00000014H

; 640  : 		cntxt->b_terminate = 15;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29776], 15		; 0000000fH

; 641  : 		form->html = &sm.html;

	mov	eax, DWORD PTR _form$[ebp]
	lea	ecx, DWORD PTR _sm$[ebp+4]
	mov	DWORD PTR [eax+232], ecx

; 642  : 		DYNBUF_ADD3(form->html, "<font face=Arial><center><b>Exécution d'un script de commandes SQL : ", ctrl->LABEL, 0, TO_HTML, "</b></center><hr>");

	push	17					; 00000011H
	push	OFFSET FLAT:$SG70802
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	push	69					; 00000045H
	push	OFFSET FLAT:$SG70803
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70801
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70805
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 642		; 00000282H
	jmp	$eva_err$70785
$L70801:

; 644  : 
; 645  : 
; 646  : 	/* Locate script markers in SQL comment */
; 647  : 	next = script->data;

	mov	edx, DWORD PTR _script$[ebp]
	add	edx, 8
	mov	DWORD PTR _next$[ebp], edx

; 648  : 	scriptend = script->data + script->cnt;

	mov	eax, DWORD PTR _script$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _script$[ebp]
	lea	eax, DWORD PTR [edx+ecx+8]
	mov	DWORD PTR _scriptend$[ebp], eax
$L70807:

; 649  : 	while(next && *next && next < scriptend)

	cmp	DWORD PTR _next$[ebp], 0
	je	$L70808
	mov	ecx, DWORD PTR _next$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L70808
	mov	eax, DWORD PTR _next$[ebp]
	cmp	eax, DWORD PTR _scriptend$[ebp]
	jae	$L70808

; 651  : 		/* Scan lines */
; 652  : 		end = strstr(next, "\n");

	push	OFFSET FLAT:$SG70809
	mov	ecx, DWORD PTR _next$[ebp]
	push	ecx
	call	_strstr
	add	esp, 8
	mov	DWORD PTR _end$[ebp], eax

; 653  : 		if(!end) end = scriptend;

	cmp	DWORD PTR _end$[ebp], 0
	jne	SHORT $L70810
	mov	edx, DWORD PTR _scriptend$[ebp]
	mov	DWORD PTR _end$[ebp], edx
$L70810:

; 654  : 		cnt++;

	mov	eax, DWORD PTR _cnt$[ebp]
	add	eax, 1
	mov	DWORD PTR _cnt$[ebp], eax

; 655  : 		b_empty = 1;

	mov	DWORD PTR _b_empty$[ebp], 1

; 656  : 		cmp = next;

	mov	ecx, DWORD PTR _next$[ebp]
	mov	DWORD PTR _cmp$[ebp], ecx
$L70812:

; 657  : 		while(b_empty && cmp < end) if(strchr("\t ", *cmp)) cmp++; else b_empty = 0;

	cmp	DWORD PTR _b_empty$[ebp], 0
	je	SHORT $L70813
	mov	edx, DWORD PTR _cmp$[ebp]
	cmp	edx, DWORD PTR _end$[ebp]
	jae	SHORT $L70813
	mov	eax, DWORD PTR _cmp$[ebp]
	movsx	ecx, BYTE PTR [eax]
	push	ecx
	push	OFFSET FLAT:$SG70815
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70814
	mov	edx, DWORD PTR _cmp$[ebp]
	add	edx, 1
	mov	DWORD PTR _cmp$[ebp], edx
	jmp	SHORT $L70816
$L70814:
	mov	DWORD PTR _b_empty$[ebp], 0
$L70816:
	jmp	SHORT $L70812
$L70813:

; 658  : 
; 659  : 		/* If not empty line */
; 660  : 		if(!b_empty)

	cmp	DWORD PTR _b_empty$[ebp], 0
	jne	$L70849

; 662  : 			/* Mark comments */
; 663  : 			if(!strncmp(next, add_sz_str("-- ")))

	push	3
	push	OFFSET FLAT:$SG70819
	mov	eax, DWORD PTR _next$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70818

; 665  : 				cmp = next + 4;

	mov	ecx, DWORD PTR _next$[ebp]
	add	ecx, 4
	mov	DWORD PTR _cmp$[ebp], ecx

; 666  : 				i = sm.nbmarks;

	mov	edx, DWORD PTR _sm$[ebp+20]
	mov	DWORD PTR _i$[ebp], edx

; 667  : 				M_REALLOC(struct _Mark, sm.mark, sm.nbmarks);

	push	64					; 00000040H
	mov	eax, DWORD PTR _sm$[ebp+20]
	shl	eax, 5
	push	eax
	mov	ecx, DWORD PTR _sm$[ebp+16]
	push	ecx
	call	_mem_realloc
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newdest$70820[ebp], eax
	cmp	DWORD PTR _newdest$70820[ebp], 0
	jne	SHORT $L70823
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70825
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 667		; 0000029bH
	jmp	$eva_err$70785
$L70823:
	mov	ecx, DWORD PTR _newdest$70820[ebp]
	mov	DWORD PTR _sm$[ebp+16], ecx
	mov	edx, DWORD PTR _sm$[ebp+20]
	add	edx, 1
	mov	DWORD PTR _sm$[ebp+20], edx

; 668  : 				sm.mark[i].txt = next;

	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	mov	edx, DWORD PTR _next$[ebp]
	mov	DWORD PTR [ecx+eax+4], edx

; 669  : 				sm.mark[i].len = end - next;

	mov	eax, DWORD PTR _end$[ebp]
	sub	eax, DWORD PTR _next$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp+16]
	mov	DWORD PTR [edx+ecx+8], eax

; 670  : 				sm.mark[i].L = cnt;

	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	mov	edx, DWORD PTR _cnt$[ebp]
	mov	DWORD PTR [ecx+eax+24], edx

; 671  : 				sm.mark[i].qry = ~0UL;

	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	mov	DWORD PTR [ecx+eax+20], -1

; 672  : 				sm.mark[i].end = ~0UL;

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	mov	DWORD PTR [eax+edx+16], -1

; 673  : 				if(next[3] == '#')

	mov	ecx, DWORD PTR _next$[ebp]
	movsx	edx, BYTE PTR [ecx+3]
	cmp	edx, 35					; 00000023H
	jne	$L70827

; 675  : 					/* Structure keyword : get type */
; 676  : 					sm.mark[i].type =
; 677  : 						!strncmp(cmp, add_sz_str("FOR EACH VALUE ")) ? MrkForVal :
; 678  : 						!strncmp(cmp, add_sz_str("FOR EACH FILE ")) ? MrkForFile :
; 679  : 						!strncmp(cmp, add_sz_str("NEXT")) ? MrkNext :
; 680  : 						!strncmp(cmp, add_sz_str("IF ")) ? MrkIf :
; 681  : 						!strncmp(cmp, add_sz_str("ELSE")) ? MrkElse :
; 682  : 						!strncmp(cmp, add_sz_str("ELSEIF ")) ? MrkElseIf :
; 683  : 						!strncmp(cmp, add_sz_str("END")) ? MrkEnd :
; 684  : 						MrkUnknown;

	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70828
	mov	eax, DWORD PTR _cmp$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71015
	mov	DWORD PTR -176+[ebp], 3
	jmp	$L71016
$L71015:
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70829
	mov	ecx, DWORD PTR _cmp$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71013
	mov	DWORD PTR -180+[ebp], 2
	jmp	$L71014
$L71013:
	push	4
	push	OFFSET FLAT:$SG70830
	mov	edx, DWORD PTR _cmp$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71011
	mov	DWORD PTR -184+[ebp], 8
	jmp	$L71012
$L71011:
	push	3
	push	OFFSET FLAT:$SG70831
	mov	eax, DWORD PTR _cmp$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71009
	mov	DWORD PTR -188+[ebp], 4
	jmp	$L71010
$L71009:
	push	4
	push	OFFSET FLAT:$SG70832
	mov	ecx, DWORD PTR _cmp$[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71007
	mov	DWORD PTR -192+[ebp], 5
	jmp	SHORT $L71008
$L71007:
	push	7
	push	OFFSET FLAT:$SG70833
	mov	edx, DWORD PTR _cmp$[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71005
	mov	DWORD PTR -196+[ebp], 6
	jmp	SHORT $L71006
$L71005:
	push	3
	push	OFFSET FLAT:$SG70834
	mov	eax, DWORD PTR _cmp$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	neg	eax
	sbb	eax, eax
	and	al, -7					; fffffff9H
	add	eax, 7
	mov	DWORD PTR -196+[ebp], eax
$L71006:
	mov	ecx, DWORD PTR -196+[ebp]
	mov	DWORD PTR -192+[ebp], ecx
$L71008:
	mov	edx, DWORD PTR -192+[ebp]
	mov	DWORD PTR -188+[ebp], edx
$L71010:
	mov	eax, DWORD PTR -188+[ebp]
	mov	DWORD PTR -184+[ebp], eax
$L71012:
	mov	ecx, DWORD PTR -184+[ebp]
	mov	DWORD PTR -180+[ebp], ecx
$L71014:
	mov	edx, DWORD PTR -180+[ebp]
	mov	DWORD PTR -176+[ebp], edx
$L71016:
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	mov	edx, DWORD PTR -176+[ebp]
	mov	DWORD PTR [ecx+eax+12], edx

; 686  : 				else

	jmp	SHORT $L70835
$L70827:

; 687  : 					sm.mark[i].type = MrkComment;

	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	mov	DWORD PTR [ecx+eax+12], 1
$L70835:

; 688  : 
; 689  : 				sm.mark[i].qry = curqry;

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	mov	ecx, DWORD PTR _curqry$[ebp]
	mov	DWORD PTR [eax+edx+20], ecx

; 691  : 
; 692  : 			/* Mark queries start */
; 693  : 			else if(curqry == ~0UL)

	jmp	$L70837
$L70818:
	cmp	DWORD PTR _curqry$[ebp], -1
	jne	$L70837

; 695  : 				i = sm.nbqry;

	mov	edx, DWORD PTR _sm$[ebp+52]
	mov	DWORD PTR _i$[ebp], edx

; 696  : 				curqry = i;

	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _curqry$[ebp], eax

; 697  : 				M_REALLOC(struct _Qry, sm.qry, sm.nbqry);

	push	48					; 00000030H
	mov	ecx, DWORD PTR _sm$[ebp+52]
	imul	ecx, 24					; 00000018H
	push	ecx
	mov	edx, DWORD PTR _sm$[ebp+48]
	push	edx
	call	_mem_realloc
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newdest$70838[ebp], eax
	cmp	DWORD PTR _newdest$70838[ebp], 0
	jne	SHORT $L70841
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70843
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 697		; 000002b9H
	jmp	$eva_err$70785
$L70841:
	mov	edx, DWORD PTR _newdest$70838[ebp]
	mov	DWORD PTR _sm$[ebp+48], edx
	mov	eax, DWORD PTR _sm$[ebp+52]
	add	eax, 1
	mov	DWORD PTR _sm$[ebp+52], eax

; 698  : 				sm.qry[i].txt = next;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _sm$[ebp+48]
	mov	eax, DWORD PTR _next$[ebp]
	mov	DWORD PTR [edx+ecx+8], eax

; 699  : 				sm.qry[i].L0 = cnt;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _sm$[ebp+48]
	mov	eax, DWORD PTR _cnt$[ebp]
	mov	DWORD PTR [edx+ecx+16], eax

; 700  : 				sm.qry[i].beg = sm.nbmarks;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _sm$[ebp+48]
	mov	eax, DWORD PTR _sm$[ebp+20]
	mov	DWORD PTR [edx+ecx], eax
$L70837:

; 702  : 
; 703  : 			/* Mark queries end */
; 704  : 			cmp = end - 1;

	mov	ecx, DWORD PTR _end$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _cmp$[ebp], ecx
$L70846:

; 705  : 			while(cmp > next && strchr(" \t", *cmp)) cmp--;

	mov	edx, DWORD PTR _cmp$[ebp]
	cmp	edx, DWORD PTR _next$[ebp]
	jbe	SHORT $L70847
	mov	eax, DWORD PTR _cmp$[ebp]
	movsx	ecx, BYTE PTR [eax]
	push	ecx
	push	OFFSET FLAT:$SG70848
	call	_strchr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70847
	mov	edx, DWORD PTR _cmp$[ebp]
	sub	edx, 1
	mov	DWORD PTR _cmp$[ebp], edx
	jmp	SHORT $L70846
$L70847:

; 706  : 			if(curqry != ~0UL && (*cmp == ';' || end == scriptend))

	cmp	DWORD PTR _curqry$[ebp], -1
	je	SHORT $L70849
	mov	eax, DWORD PTR _cmp$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 59					; 0000003bH
	je	SHORT $L70850
	mov	edx, DWORD PTR _end$[ebp]
	cmp	edx, DWORD PTR _scriptend$[ebp]
	jne	SHORT $L70849
$L70850:

; 708  : 				i = sm.nbqry - 1;

	mov	eax, DWORD PTR _sm$[ebp+52]
	sub	eax, 1
	mov	DWORD PTR _i$[ebp], eax

; 709  : 				if(end > sm.qry[i].txt) sm.qry[i].len = end - sm.qry[i].txt;

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _sm$[ebp+48]
	mov	eax, DWORD PTR _end$[ebp]
	cmp	eax, DWORD PTR [edx+ecx+8]
	jbe	SHORT $L70851
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _sm$[ebp+48]
	mov	eax, DWORD PTR _end$[ebp]
	sub	eax, DWORD PTR [edx+ecx+8]
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _sm$[ebp+48]
	mov	DWORD PTR [edx+ecx+12], eax
$L70851:

; 710  : 				sm.qry[i].end = sm.nbmarks;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _sm$[ebp+48]
	mov	edx, DWORD PTR _sm$[ebp+20]
	mov	DWORD PTR [ecx+eax+4], edx

; 711  : 				sm.qry[i].Ln = cnt;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _sm$[ebp+48]
	mov	edx, DWORD PTR _cnt$[ebp]
	mov	DWORD PTR [ecx+eax+20], edx

; 712  : 				curqry = ~0UL;

	mov	DWORD PTR _curqry$[ebp], -1
$L70849:

; 715  : 
; 716  : 		next = end + 1;

	mov	eax, DWORD PTR _end$[ebp]
	add	eax, 1
	mov	DWORD PTR _next$[ebp], eax

; 717  : 	}

	jmp	$L70807
$L70808:

; 718  : 
; 719  : 	/* Buffer to scan embeded structures */
; 720  : 	M_ALLOC(typstruc, sm.nbmarks * sizeof(unsigned long))

	mov	ecx, DWORD PTR _sm$[ebp+20]
	shl	ecx, 2
	mov	DWORD PTR _size1$70852[ebp], ecx
	mov	edx, DWORD PTR _size1$70852[ebp]
	push	edx
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _typstruc$[ebp], eax
	cmp	DWORD PTR _size1$70852[ebp], 0
	je	SHORT $L70854
	cmp	DWORD PTR _typstruc$[ebp], 0
	jne	SHORT $L70854
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70856
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 720		; 000002d0H
	jmp	$eva_err$70785
$L70854:

; 721  : 
; 722  : 	for(i = 0; i < sm.nbmarks; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70858
$L70859:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70858:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _sm$[ebp+20]
	jae	$L70860

; 724  : 		/* Search for first qry following current mark */
; 725  : 		j = (i == 0 || sm.nbqry == 0) ? 0 : (sm.mark[i - 1].qry != ~0UL) ? sm.mark[i - 1].qry : 0;

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L71017
	cmp	DWORD PTR _sm$[ebp+52], 0
	je	SHORT $L71017
	mov	ecx, DWORD PTR _i$[ebp]
	sub	ecx, 1
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [edx+ecx+20], -1
	je	SHORT $L71018
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	mov	edx, DWORD PTR [ecx+eax+20]
	mov	DWORD PTR -200+[ebp], edx
	jmp	SHORT $L71019
$L71018:
	mov	DWORD PTR -200+[ebp], 0
$L71019:
	mov	eax, DWORD PTR -200+[ebp]
	mov	DWORD PTR -204+[ebp], eax
	jmp	SHORT $L71020
$L71017:
	mov	DWORD PTR -204+[ebp], 0
$L71020:
	mov	ecx, DWORD PTR -204+[ebp]
	mov	DWORD PTR _j$[ebp], ecx

; 726  : 		if(sm.nbqry != 0)

	cmp	DWORD PTR _sm$[ebp+52], 0
	je	SHORT $L70866
$L70863:

; 728  : 			while(j < sm.nbqry && sm.qry[j].L0 < sm.mark[i].L) j++;

	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _sm$[ebp+52]
	jae	SHORT $L70864
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp+48]
	mov	esi, DWORD PTR _sm$[ebp+16]
	mov	eax, DWORD PTR [edx+eax+16]
	cmp	eax, DWORD PTR [esi+ecx+24]
	jae	SHORT $L70864
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
	jmp	SHORT $L70863
$L70864:

; 729  : 
; 730  : 			if (sm.qry[j].L0 > sm.mark[i].L) sm.mark[i].qry = j;

	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+48]
	mov	esi, DWORD PTR _sm$[ebp+16]
	mov	edx, DWORD PTR [ecx+edx+16]
	cmp	edx, DWORD PTR [esi+eax+24]
	jbe	SHORT $L70865
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	mov	edx, DWORD PTR _j$[ebp]
	mov	DWORD PTR [ecx+eax+20], edx

; 731  : 			else sm.mark[i].qry = ~0UL;

	jmp	SHORT $L70866
$L70865:
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	mov	DWORD PTR [ecx+eax+20], -1
$L70866:

; 733  : 
; 734  : 		/* If The qry overlaps the mark */
; 735  : 		if(j != 0 && sm.qry[j - 1].Ln > sm.mark[i].L)

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70867
	mov	edx, DWORD PTR _j$[ebp]
	sub	edx, 1
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+48]
	mov	esi, DWORD PTR _sm$[ebp+16]
	mov	edx, DWORD PTR [ecx+edx+20]
	cmp	edx, DWORD PTR [esi+eax+24]
	jbe	SHORT $L70867

; 737  : 			if(COM_STRUCT(i))

	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [ecx+eax+12], 0
	je	SHORT $L70869
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [eax+edx+12], 1
	jne	SHORT $L70868
$L70869:

; 738  : 				sm.mark[i].qry = ~0UL;

	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp+16]
	mov	DWORD PTR [edx+ecx+20], -1

; 739  : 			else RETURN_ERROR("Query error : query ride a mark structure", NOP)

	jmp	SHORT $L70870
$L70868:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70872
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 739		; 000002e3H
	jmp	$eva_err$70785
$L70870:

; 741  : 
; 742  : 		/* If beginning of structure, seeks the mark.end */
; 743  : 		else if(BEG_STRUCT(i))

	jmp	$L70901
$L70867:
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [eax+edx+12], 2
	je	SHORT $L70875
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [edx+ecx+12], 3
	je	SHORT $L70875
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [ecx+eax+12], 4
	je	SHORT $L70875
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [eax+edx+12], 5
	je	SHORT $L70875
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [edx+ecx+12], 6
	jne	$L70901
$L70875:

; 745  : 			cntstruc = 1;

	mov	DWORD PTR _cntstruc$[ebp], 1

; 746  : 			typstruc[cntstruc] = sm.mark[i].type;

	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _cntstruc$[ebp]
	mov	edx, DWORD PTR _typstruc$[ebp]
	mov	esi, DWORD PTR _sm$[ebp+16]
	mov	eax, DWORD PTR [esi+eax+12]
	mov	DWORD PTR [edx+ecx*4], eax

; 747  : 			for(k = i + 1; k < sm.nbmarks; k++)

	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
	jmp	SHORT $L70876
$L70877:
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$L70876:
	mov	eax, DWORD PTR _k$[ebp]
	cmp	eax, DWORD PTR _sm$[ebp+20]
	jae	$L70878

; 749  : 				if (sm.mark[k].type == MrkUnknown || sm.mark[k].type == MrkComment) continue;

	mov	ecx, DWORD PTR _k$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [edx+ecx+12], 0
	je	SHORT $L70880
	mov	eax, DWORD PTR _k$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [ecx+eax+12], 1
	jne	SHORT $L70879
$L70880:
	jmp	SHORT $L70877
$L70879:

; 750  : 
; 751  : 				/* End/next match with IF/FOR : erase beginning mark from typstruc */
; 752  : 				if(PARENT_PARSED_SUCCESS || CHILD_PARSED_SUCCESS)

	cmp	DWORD PTR _cntstruc$[ebp], 1
	jne	$L70886
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [eax+edx+12], 4
	jne	SHORT $L70884
	mov	ecx, DWORD PTR _k$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [edx+ecx+12], 7
	je	$L70887
	mov	eax, DWORD PTR _k$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [ecx+eax+12], 5
	je	$L70887
	mov	edx, DWORD PTR _k$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [eax+edx+12], 6
	je	$L70887
$L70884:
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [edx+ecx+12], 5
	jne	SHORT $L70885
	mov	eax, DWORD PTR _k$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [ecx+eax+12], 7
	je	$L70887
$L70885:
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [eax+edx+12], 6
	jne	SHORT $L70886
	mov	ecx, DWORD PTR _k$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [edx+ecx+12], 5
	je	SHORT $L70887
	mov	eax, DWORD PTR _k$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [ecx+eax+12], 6
	je	SHORT $L70887
$L70886:
	mov	edx, DWORD PTR _cntstruc$[ebp]
	mov	eax, DWORD PTR _typstruc$[ebp]
	cmp	DWORD PTR [eax+edx*4], 2
	je	SHORT $L70889
	mov	ecx, DWORD PTR _cntstruc$[ebp]
	mov	edx, DWORD PTR _typstruc$[ebp]
	cmp	DWORD PTR [edx+ecx*4], 3
	jne	SHORT $L70888
$L70889:
	mov	eax, DWORD PTR _k$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [ecx+eax+12], 8
	je	SHORT $L70887
$L70888:
	mov	edx, DWORD PTR _cntstruc$[ebp]
	mov	eax, DWORD PTR _typstruc$[ebp]
	cmp	DWORD PTR [eax+edx*4], 4
	je	SHORT $L70890
	mov	ecx, DWORD PTR _cntstruc$[ebp]
	mov	edx, DWORD PTR _typstruc$[ebp]
	cmp	DWORD PTR [edx+ecx*4], 5
	je	SHORT $L70890
	mov	eax, DWORD PTR _cntstruc$[ebp]
	mov	ecx, DWORD PTR _typstruc$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 6
	jne	SHORT $L70881
$L70890:
	mov	edx, DWORD PTR _k$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [eax+edx+12], 7
	jne	SHORT $L70881
$L70887:

; 753  : 						cntstruc--;

	mov	ecx, DWORD PTR _cntstruc$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _cntstruc$[ebp], ecx

; 754  : 				else if(NEXT_IF_CHILD_STEP)

	jmp	$L70896
$L70881:
	mov	edx, DWORD PTR _cntstruc$[ebp]
	mov	eax, DWORD PTR _typstruc$[ebp]
	cmp	DWORD PTR [eax+edx*4], 4
	je	SHORT $L70895
	mov	ecx, DWORD PTR _cntstruc$[ebp]
	mov	edx, DWORD PTR _typstruc$[ebp]
	cmp	DWORD PTR [edx+ecx*4], 6
	jne	SHORT $L70894
$L70895:
	mov	eax, DWORD PTR _k$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [ecx+eax+12], 5
	je	SHORT $L70893
	mov	edx, DWORD PTR _k$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [eax+edx+12], 6
	je	SHORT $L70893
$L70894:
	mov	ecx, DWORD PTR _cntstruc$[ebp]
	mov	edx, DWORD PTR _typstruc$[ebp]
	cmp	DWORD PTR [edx+ecx*4], 5
	jne	SHORT $L70892
	mov	eax, DWORD PTR _k$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [ecx+eax+12], 6
	jne	SHORT $L70892
$L70893:

; 756  : 					/* ELSE/ELSEIF folowwing IF/ELSE/ELSEIF : replace beginning mark in typstruc */
; 757  : 					typstruc[cntstruc] = sm.mark[k].type;

	mov	edx, DWORD PTR _k$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _cntstruc$[ebp]
	mov	ecx, DWORD PTR _typstruc$[ebp]
	mov	esi, DWORD PTR _sm$[ebp+16]
	mov	edx, DWORD PTR [esi+edx+12]
	mov	DWORD PTR [ecx+eax*4], edx

; 759  : 				else

	jmp	SHORT $L70896
$L70892:

; 761  : 					/* New child structure registered in typstruc */
; 762  : 					cntstruc++;

	mov	eax, DWORD PTR _cntstruc$[ebp]
	add	eax, 1
	mov	DWORD PTR _cntstruc$[ebp], eax

; 763  : 					typstruc[cntstruc] = sm.mark[k].type;

	mov	ecx, DWORD PTR _k$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _cntstruc$[ebp]
	mov	eax, DWORD PTR _typstruc$[ebp]
	mov	esi, DWORD PTR _sm$[ebp+16]
	mov	ecx, DWORD PTR [esi+ecx+12]
	mov	DWORD PTR [eax+edx*4], ecx
$L70896:

; 765  : 
; 766  : 				/* Children structures successfully parsed */
; 767  : 				if(cntstruc == 0)

	cmp	DWORD PTR _cntstruc$[ebp], 0
	jne	SHORT $L70897

; 769  : 					sm.mark[i].end = k;

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	mov	ecx, DWORD PTR _k$[ebp]
	mov	DWORD PTR [eax+edx+16], ecx

; 770  : 					break;

	jmp	SHORT $L70878
$L70897:

; 772  : 			}

	jmp	$L70877
$L70878:

; 773  : 			if(sm.mark[i].end == ~0UL && IF_STRUCT(i)) BREAK_EXE("IF without END")

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [eax+edx+16], -1
	jne	SHORT $L70898
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [edx+ecx+12], 4
	je	SHORT $L70899
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [ecx+eax+12], 5
	je	SHORT $L70899
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [eax+edx+12], 6
	jne	SHORT $L70898
$L70899:
	mov	DWORD PTR _sm$[ebp+12], OFFSET FLAT:$SG70900
	jmp	$L70860
$L70898:

; 774  : 			if(sm.mark[i].end == ~0UL && FOR_STRUCT(i)) BREAK_EXE("FOR without NEXT")

	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [edx+ecx+16], -1
	jne	SHORT $L70901
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [ecx+eax+12], 2
	je	SHORT $L70902
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [eax+edx+12], 3
	jne	SHORT $L70901
$L70902:
	mov	DWORD PTR _sm$[ebp+12], OFFSET FLAT:$SG70903
	jmp	$L70860
$L70901:

; 776  : 
; 777  : 		/* END/NEXT mark : Search for beginning mark */
; 778  : 		if (END_STRUCT(i))

	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [edx+ecx+12], 7
	je	SHORT $L70905
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [ecx+eax+12], 8
	je	SHORT $L70905
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [eax+edx+12], 5
	je	SHORT $L70905
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [edx+ecx+12], 6
	jne	$L70911
$L70905:

; 780  : 			k = i;

	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _k$[ebp], eax
$L70907:

; 781  : 			while(k > 0 && sm.mark[k - 1].end != i) k--;

	cmp	DWORD PTR _k$[ebp], 0
	jbe	SHORT $L70908
	mov	ecx, DWORD PTR _k$[ebp]
	sub	ecx, 1
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp+16]
	mov	eax, DWORD PTR [edx+ecx+16]
	cmp	eax, DWORD PTR _i$[ebp]
	je	SHORT $L70908
	mov	ecx, DWORD PTR _k$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
	jmp	SHORT $L70907
$L70908:

; 782  : 			if(sm.mark[k - 1].end != i && NEXT_STRUCT(i)) BREAK_EXE("NEXT without FOR")

	mov	edx, DWORD PTR _k$[ebp]
	sub	edx, 1
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	mov	ecx, DWORD PTR [eax+edx+16]
	cmp	ecx, DWORD PTR _i$[ebp]
	je	SHORT $L70909
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [eax+edx+12], 8
	jne	SHORT $L70909
	mov	DWORD PTR _sm$[ebp+12], OFFSET FLAT:$SG70910
	jmp	SHORT $L70860
$L70909:

; 783  : 			if(sm.mark[k - 1].end != i && ENDIF_STRUCT(i)) BREAK_EXE("ELSE/ELSEIF/END without IF")

	mov	ecx, DWORD PTR _k$[ebp]
	sub	ecx, 1
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp+16]
	mov	eax, DWORD PTR [edx+ecx+16]
	cmp	eax, DWORD PTR _i$[ebp]
	je	SHORT $L70911
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [edx+ecx+12], 7
	je	SHORT $L70912
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [ecx+eax+12], 5
	je	SHORT $L70912
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR _sm$[ebp+16]
	cmp	DWORD PTR [eax+edx+12], 6
	jne	SHORT $L70911
$L70912:
	mov	DWORD PTR _sm$[ebp+12], OFFSET FLAT:$SG70913
	jmp	SHORT $L70860
$L70911:

; 785  : 	}

	jmp	$L70859
$L70860:

; 786  : 
; 787  : 	if(sm.err)

	cmp	DWORD PTR _sm$[ebp+12], 0
	je	SHORT $L70915

; 789  : 		DYNBUF_ADD3(form->html, "<br><font face=Courier>", sm.err, 0, TO_HTML, "</font><br>");

	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70916
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _sm$[ebp+12]
	push	ecx
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70917
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70915
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70919
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 789		; 00000315H
	jmp	$eva_err$70785
$L70915:

; 791  : 
; 792  : 	/* Exec qry preceding first mark */
; 793  : 	cntxt->sql_trace = 0;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29852], 0

; 794  : 	if(sm.nbqry != 0 && !sm.err)

	cmp	DWORD PTR _sm$[ebp+52], 0
	je	$L70928
	cmp	DWORD PTR _sm$[ebp+12], 0
	jne	$L70928

; 796  : 		i = 0;

	mov	DWORD PTR _i$[ebp], 0

; 797  : 		endstruct = (sm.nbmarks != 0) ? sm.mark[0].L : sm.qry[sm.nbqry].L0 + 1;

	cmp	DWORD PTR _sm$[ebp+20], 0
	je	SHORT $L71021
	mov	ecx, DWORD PTR _sm$[ebp+16]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR -208+[ebp], edx
	jmp	SHORT $L71022
$L71021:
	mov	eax, DWORD PTR _sm$[ebp+52]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _sm$[ebp+48]
	mov	edx, DWORD PTR [ecx+eax+16]
	add	edx, 1
	mov	DWORD PTR -208+[ebp], edx
$L71022:
	mov	eax, DWORD PTR -208+[ebp]
	mov	DWORD PTR _endstruct$[ebp], eax
$L70922:

; 798  : 		while(i < sm.nbqry && sm.qry[i].L0 < endstruct && !sm.err)

	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _sm$[ebp+52]
	jae	SHORT $L70923
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _sm$[ebp+48]
	mov	ecx, DWORD PTR [eax+edx+16]
	cmp	ecx, DWORD PTR _endstruct$[ebp]
	jae	SHORT $L70923
	cmp	DWORD PTR _sm$[ebp+12], 0
	jne	SHORT $L70923

; 800  : 			if(exec_sql_qry(cntxt, &sm, i)) STACK_ERROR;

	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _sm$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_exec_sql_qry
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70924
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 800		; 00000320H
	jmp	$eva_err$70785
$L70924:

; 801  : 			i++;

	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax

; 802  : 		}

	jmp	SHORT $L70922
$L70923:

; 803  : 
; 804  : 		/* Exec parents marks including MrkUnknown et MrkComment */
; 805  : 		if(sm.nbmarks != 0 && !sm.err)

	cmp	DWORD PTR _sm$[ebp+20], 0
	je	SHORT $L70928
	cmp	DWORD PTR _sm$[ebp+12], 0
	jne	SHORT $L70928

; 807  : 			sm.nextmark = 0;

	mov	DWORD PTR _sm$[ebp+44], 0
$L70927:

; 808  : 
; 809  : 			while(sm.nextmark != sm.nbmarks && !sm.err)

	mov	ecx, DWORD PTR _sm$[ebp+44]
	cmp	ecx, DWORD PTR _sm$[ebp+20]
	je	SHORT $L70928
	cmp	DWORD PTR _sm$[ebp+12], 0
	jne	SHORT $L70928

; 810  : 				if(exec_script_struct(cntxt, &sm, sm.nextmark)) STACK_ERROR;

	mov	edx, DWORD PTR _sm$[ebp+44]
	push	edx
	lea	eax, DWORD PTR _sm$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_exec_script_struct
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70929
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 810		; 0000032aH
	jmp	$eva_err$70785
$L70929:
	jmp	SHORT $L70927
$L70928:

; 813  : 
; 814  : 	/* Output footer */
; 815  : 	if(sm.options)

	cmp	DWORD PTR _sm$[ebp+60], 0
	je	$L70951

; 817  : 		DYNBUF_ADD_STR(form->html, "<hr><center>");

	push	0
	push	0
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70933
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70932
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70935
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 817		; 00000331H
	jmp	$eva_err$70785
$L70932:

; 818  : 		if(put_html_button(cntxt, "NOP", "Revenir", "_eva_btn_gobackobj_fr.gif", "_eva_btn_gobackobj_fr_s.gif",
; 819  : 								"Retourne à la page précédente", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70938
	push	OFFSET FLAT:$SG70939
	push	OFFSET FLAT:$SG70940
	push	OFFSET FLAT:$SG70941
	push	OFFSET FLAT:$SG70942
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70937
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 819		; 00000333H
	jmp	$eva_err$70785
$L70937:

; 820  : 		DYNBUF_ADD_STR(form->html, "</center><hr>");

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70945
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70944
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70947
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 820		; 00000334H
	jmp	$eva_err$70785
$L70944:

; 821  : 		form->html = NULL;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+232], 0

; 822  : 		flush_sm(&sm);

	lea	edx, DWORD PTR _sm$[ebp]
	push	edx
	call	_flush_sm
	add	esp, 4

; 823  : 		if(sm.err) DYNBUF_ADD_STR(&form->html_tab, " ");

	cmp	DWORD PTR _sm$[ebp+12], 0
	je	SHORT $L70951
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70952
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 224				; 000000e0H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70951
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70954
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 823		; 00000337H
	jmp	SHORT $eva_err$70785
$L70951:

; 825  : 	form->b_reload = 1;

	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+140], 1
$eva_noerr$70787:

; 826  : 
; 827  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70955
	push	OFFSET FLAT:$SG70956
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70785:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70957
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70958
	push	OFFSET FLAT:$SG70959
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70957:
	mov	eax, DWORD PTR _sm$[ebp+16]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sm$[ebp+16], 0
	mov	ecx, DWORD PTR _sm$[ebp+48]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sm$[ebp+48], 0
	mov	edx, DWORD PTR _sm$[ebp+4]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sm$[ebp+4], 0
	mov	eax, DWORD PTR _script$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _script$[ebp], 0
	mov	ecx, DWORD PTR _typstruc$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _typstruc$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [edx+29852], eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 828  : }

	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_action_sql_script ENDP
_TEXT	ENDS
END
