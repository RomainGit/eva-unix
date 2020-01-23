	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_planning.c
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
PUBLIC	_output_planning_cell_color
_DATA	SEGMENT
$SG70239 DB	'FF8888', 00H
	ORG $+1
$SG70242 DB	'DDDDDD', 00H
_DATA	ENDS
_TEXT	SEGMENT
_pl$ = 8
_col$ = 12
_output_planning_cell_color PROC NEAR

; 63   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 64   : 	/* Handle today */
; 65   : 	if(col == pl->curday) return pl->today_bgcolor ? pl->today_bgcolor->txt : "FF8888";

	mov	eax, DWORD PTR _pl$[ebp]
	mov	ecx, DWORD PTR _col$[ebp]
	cmp	ecx, DWORD PTR [eax+240]
	jne	SHORT $L70238
	mov	edx, DWORD PTR _pl$[ebp]
	cmp	DWORD PTR [edx+232], 0
	je	SHORT $L70887
	mov	eax, DWORD PTR _pl$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -4+[ebp], edx
	jmp	SHORT $L70888
$L70887:
	mov	DWORD PTR -4+[ebp], OFFSET FLAT:$SG70239
$L70888:
	mov	eax, DWORD PTR -4+[ebp]
	jmp	SHORT $L70237
$L70238:

; 66   : 
; 67   : 	/* Handle week end */
; 68   : 	if((pl->wday + col)%7 == 0 || (pl->wday + col)%7 == 6) return pl->we_bgcolor ? pl->we_bgcolor->txt : "DDDDDD";

	mov	eax, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR [eax+236]
	add	eax, DWORD PTR _col$[ebp]
	cdq
	mov	ecx, 7
	idiv	ecx
	test	edx, edx
	je	SHORT $L70241
	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR [edx+236]
	add	eax, DWORD PTR _col$[ebp]
	cdq
	mov	ecx, 7
	idiv	ecx
	cmp	edx, 6
	jne	SHORT $L70240
$L70241:
	mov	edx, DWORD PTR _pl$[ebp]
	cmp	DWORD PTR [edx+228], 0
	je	SHORT $L70889
	mov	eax, DWORD PTR _pl$[ebp]
	mov	ecx, DWORD PTR [eax+228]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -8+[ebp], edx
	jmp	SHORT $L70890
$L70889:
	mov	DWORD PTR -8+[ebp], OFFSET FLAT:$SG70242
$L70890:
	mov	eax, DWORD PTR -8+[ebp]
	jmp	SHORT $L70237
$L70240:

; 69   : 
; 70   : 	return NULL;

	xor	eax, eax
$L70237:

; 71   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_output_planning_cell_color ENDP
_TEXT	ENDS
PUBLIC	_output_planning_emptycells
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_BSS	SEGMENT
$SG70268 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70261 DB	'<td class=PlanningCell', 00H
	ORG $+1
$SG70263 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70269 DB	' bgcolor=#', 00H
	ORG $+1
$SG70271 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70274 DB	'></td>', 00H
	ORG $+1
$SG70276 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70278 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_plan'
	DB	'ning.c', 00H
	ORG $+1
$SG70279 DB	'output_planning_emptycells', 00H
	ORG $+1
$SG70281 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_plan'
	DB	'ning.c', 00H
	ORG $+1
$SG70282 DB	'output_planning_emptycells', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pl$ = 12
_cols$ = 16
_form$ = -4
_bgcol$70258 = -8
_output_planning_emptycells PROC NEAR

; 83   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 84   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx
$L70256:

; 85   : 
; 86   : 	while(pl->curcol < cols)

	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR [edx+276]
	cmp	eax, DWORD PTR _cols$[ebp]
	jge	$eva_noerr$70277

; 88   : 		char *bgcol = output_planning_cell_color(pl, pl->curcol);

	mov	ecx, DWORD PTR _pl$[ebp]
	mov	edx, DWORD PTR [ecx+276]
	push	edx
	mov	eax, DWORD PTR _pl$[ebp]
	push	eax
	call	_output_planning_cell_color
	add	esp, 8
	mov	DWORD PTR _bgcol$70258[ebp], eax

; 89   : 		DYNBUF_ADD_STR(form->html, "<td class=PlanningCell");

	push	0
	push	0
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70261
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70260
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70263
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 89		; 00000059H
	jmp	$eva_err$70264
$L70260:

; 90   : 		if(bgcol) DYNBUF_ADD3(form->html, " bgcolor=#", bgcol, 0, NO_CONV, "");

	cmp	DWORD PTR _bgcol$70258[ebp], 0
	je	SHORT $L70267
	push	0
	push	OFFSET FLAT:$SG70268
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _bgcol$70258[ebp]
	push	edx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70269
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70267
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70271
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 90		; 0000005aH
	jmp	SHORT $eva_err$70264
$L70267:

; 91   : 		DYNBUF_ADD_STR(form->html, "></td>");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70274
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70273
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70276
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 91		; 0000005bH
	jmp	SHORT $eva_err$70264
$L70273:

; 92   : 		pl->curcol++;

	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR [edx+276]
	add	eax, 1
	mov	ecx, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [ecx+276], eax

; 93   : 	}

	jmp	$L70256
$eva_noerr$70277:

; 94   : 
; 95   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70278
	push	OFFSET FLAT:$SG70279
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70264:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70280
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70281
	push	OFFSET FLAT:$SG70282
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70280:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 96   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_output_planning_emptycells ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_planning_event
EXTRN	_datetxt_to_age:NEAR
EXTRN	_datetxt_to_format:NEAR
EXTRN	_mem_realloc:NEAR
EXTRN	_html_tooltip:BYTE
EXTRN	_strtoul:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strlen:NEAR
EXTRN	_put_showhelp:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_build_open_btn_name:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70302 DB	'888888', 00H
	ORG $+1
$SG70303 DB	'888888', 00H
	ORG $+1
$SG70310 DB	'D', 00H
	ORG $+2
$SG70317 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70323 DB	' onClick=cb(''B', 00H
	ORG $+1
$SG70324 DB	'<td class=PlanningEvent colspan=', 00H
	ORG $+3
$SG70326 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70331 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70334 DB	''')', 00H
	ORG $+1
$SG70336 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70343 DB	'''', 00H
	ORG $+2
$SG70344 DB	' helpmsg=''', 00H
	ORG $+1
$SG70346 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70349 DB	' : ', 00H
$SG70350 DB	' helpmsg=''', 00H
	ORG $+1
$SG70352 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70353 DB	'_EVA_FullDay', 00H
	ORG $+3
$SG70357 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70359 DB	'_EVA_FullDay', 00H
	ORG $+3
$SG70362 DB	' - ', 00H
$SG70364 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70368 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70371 DB	'''', 00H
	ORG $+2
$SG70373 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70380 DB	' bgcolor=#', 00H
	ORG $+1
$SG70382 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70387 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70390 DB	'>', 00H
	ORG $+2
$SG70392 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70397 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70401 DB	'&nbsp;', 00H
	ORG $+1
$SG70403 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70406 DB	'</td>', 00H
	ORG $+2
$SG70408 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70409 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_plan'
	DB	'ning.c', 00H
	ORG $+1
$SG70410 DB	'ctrl_output_planning_event', 00H
	ORG $+1
$SG70412 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_plan'
	DB	'ning.c', 00H
	ORG $+1
$SG70413 DB	'ctrl_output_planning_event', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pl$ = 12
_j$ = 16
_form$ = -72
_dbeg$ = -220
_dend$ = -228
_fmt$ = -4
_color$ = -204
_text$ = -212
_tooltip$ = -216
_defcolor$ = -68
_opnbtn$ = -200
_res$ = -208
_res1$ = -224
_newdest$70312 = -232
__c$70340 = -236
__c$70383 = -240
_ctrl_output_planning_event PROC NEAR

; 110  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 252				; 000000fcH
	push	edi

; 111  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 112  : 	char *dbeg, *dend, fmt = 'D';

	mov	BYTE PTR _fmt$[ebp], 68			; 00000044H

; 113  : 	DynTableCell *color, *text, *tooltip, defcolor = { add_sz_str("888888") };

	mov	DWORD PTR _defcolor$[ebp], OFFSET FLAT:$SG70303
	mov	DWORD PTR _defcolor$[ebp+4], 6
	mov	ecx, 14					; 0000000eH
	xor	eax, eax
	lea	edi, DWORD PTR _defcolor$[ebp+8]
	rep stosd

; 114  : 	char opnbtn[128];
; 115  : 	int res, res1;
; 116  : 
; 117  : 	/* Check if event is in frame */
; 118  : 	dend = dyntab_val(&pl->objdates, j, 3);

	push	3
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 156				; 0000009cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _dend$[ebp], eax

; 119  : 	if(strncmp(pl->framebeg, dend, 8) > 0) RETURN_OK;

	push	8
	mov	ecx, DWORD PTR _dend$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 244				; 000000f4H
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jle	SHORT $L70307
	jmp	$eva_noerr$70308
$L70307:

; 120  : 	dbeg = dyntab_val(&pl->objdates, j, 2);

	push	2
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 156				; 0000009cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _dbeg$[ebp], eax

; 121  : 	if(strncmp(pl->frameend, dbeg, 8) <= 0) RETURN_OK;

	push	8
	mov	edx, DWORD PTR _dbeg$[ebp]
	push	edx
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 260				; 00000104H
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jg	SHORT $L70309
	jmp	$eva_noerr$70308
$L70309:

; 122  : 
; 123  : 	/* Handle overlapping events */
; 124  : 	res = datetxt_to_age(pl->framebeg, dbeg, "D");

	push	OFFSET FLAT:$SG70310
	mov	ecx, DWORD PTR _dbeg$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 244				; 000000f4H
	push	edx
	call	_datetxt_to_age
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _res$[ebp], eax

; 125  : 	if(pl->curcol && res < pl->curcol)

	mov	eax, DWORD PTR _pl$[ebp]
	cmp	DWORD PTR [eax+276], 0
	je	$L70311
	mov	ecx, DWORD PTR _pl$[ebp]
	mov	edx, DWORD PTR _res$[ebp]
	cmp	edx, DWORD PTR [ecx+276]
	jge	$L70311

; 127  : 		M_REALLOC(unsigned long, pl->nextline, pl->nbnext);

	push	8
	mov	eax, DWORD PTR _pl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	shl	ecx, 2
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR [edx+280]
	push	eax
	call	_mem_realloc
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newdest$70312[ebp], eax
	cmp	DWORD PTR _newdest$70312[ebp], 0
	jne	SHORT $L70315
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70317
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 127		; 0000007fH
	jmp	$eva_err$70318
$L70315:
	mov	eax, DWORD PTR _pl$[ebp]
	mov	ecx, DWORD PTR _newdest$70312[ebp]
	mov	DWORD PTR [eax+280], ecx
	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	add	eax, 1
	mov	ecx, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [ecx+284], eax

; 128  : 		pl->nextline[pl->nbnext - 1] = j;

	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	mov	ecx, DWORD PTR _pl$[ebp]
	mov	edx, DWORD PTR [ecx+280]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	DWORD PTR [edx+eax*4-4], ecx

; 129  : 		RETURN_OK;

	jmp	$eva_noerr$70308
$L70311:

; 131  : 
; 132  : 	/* Output empty cells */
; 133  : 	if(output_planning_emptycells(cntxt, pl, res)) STACK_ERROR;

	mov	edx, DWORD PTR _res$[ebp]
	push	edx
	mov	eax, DWORD PTR _pl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_output_planning_emptycells
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70320
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 133		; 00000085H
	jmp	$eva_err$70318
$L70320:

; 134  : 
; 135  : 	/* Read event cell text & color */
; 136  : 	fmt = 'D';

	mov	BYTE PTR _fmt$[ebp], 68			; 00000044H

; 137  : 	res = datetxt_to_age(strcmp(dbeg, pl->framebeg) > 0 ? dbeg : pl->framebeg, dend, &fmt);

	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 244				; 000000f4H
	push	eax
	mov	ecx, DWORD PTR _dbeg$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jle	SHORT $L70893
	mov	edx, DWORD PTR _dbeg$[ebp]
	mov	DWORD PTR -244+[ebp], edx
	jmp	SHORT $L70894
$L70893:
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 244				; 000000f4H
	mov	DWORD PTR -244+[ebp], eax
$L70894:
	lea	ecx, DWORD PTR _fmt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _dend$[ebp]
	push	edx
	mov	eax, DWORD PTR -244+[ebp]
	push	eax
	call	_datetxt_to_age
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _res$[ebp], eax

; 138  : 	if(res < 0) res = 0;

	cmp	DWORD PTR _res$[ebp], 0
	jge	SHORT $L70321
	mov	DWORD PTR _res$[ebp], 0
$L70321:

; 139  : 	pl->curcol += res + 1;

	mov	ecx, DWORD PTR _pl$[ebp]
	mov	edx, DWORD PTR [ecx+276]
	mov	eax, DWORD PTR _res$[ebp]
	lea	ecx, DWORD PTR [edx+eax+1]
	mov	edx, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [edx+276], ecx

; 140  : 	color = dyntab_cell(&pl->objdates, j, 5);

	push	5
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 156				; 0000009cH
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _color$[ebp], eax

; 141  : 	text = dyntab_cell(&pl->objdates, j, 4);

	push	4
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 156				; 0000009cH
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _text$[ebp], eax

; 142  : 	tooltip = dyntab_cell(&pl->objdates, j, 6);

	push	6
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 156				; 0000009cH
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _tooltip$[ebp], eax

; 143  : 
; 144  : 	/* Output cell header */
; 145  : 	DYNBUF_ADD3_INT(form->html, "<td class=PlanningEvent colspan=", res + 1, " onClick=cb('B");

	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70323
	mov	eax, DWORD PTR _res$[ebp]
	add	eax, 1
	push	eax
	push	32					; 00000020H
	push	OFFSET FLAT:$SG70324
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70322
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70326
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 145		; 00000091H
	jmp	$eva_err$70318
$L70322:

; 146  : 	DYNBUF_ADD(form->html, opnbtn, build_open_btn_name(cntxt, opnbtn, 0, DYNTAB_TOULRC(&pl->objdates, j, 0), 0, 0), NO_CONV);

	push	0
	push	0
	push	0
	push	0
	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 156				; 0000009cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _opnbtn$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_build_open_btn_name
	add	esp, 24					; 00000018H
	push	eax
	lea	eax, DWORD PTR _opnbtn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70329
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70331
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 146		; 00000092H
	jmp	$eva_err$70318
$L70329:

; 147  : 	DYNBUF_ADD_STR(form->html, "')");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70334
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70333
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70336
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 147		; 00000093H
	jmp	$eva_err$70318
$L70333:

; 148  : 	if(put_showhelp(cntxt, form->html)) STACK_ERROR;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_showhelp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70337
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 148		; 00000094H
	jmp	$eva_err$70318
$L70337:

; 149  : 
; 150  : 	/* Output cell tooltip : check if given */
; 151  : 	if(pl->detailfield.nbrows)

	mov	ecx, DWORD PTR _pl$[ebp]
	cmp	DWORD PTR [ecx+88], 0
	je	$L70338

; 153  : 		if(tooltip->txt && tooltip->len)

	mov	edx, DWORD PTR _tooltip$[ebp]
	cmp	DWORD PTR [edx], 0
	je	$L70342
	mov	eax, DWORD PTR _tooltip$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L70342

; 154  : 			DYNBUF_ADD3_CELLP(form->html, " helpmsg='", tooltip, HTML_TOOLTIP, "'");

	mov	ecx, DWORD PTR _tooltip$[ebp]
	mov	DWORD PTR __c$70340[ebp], ecx
	cmp	DWORD PTR __c$70340[ebp], 0
	je	SHORT $L70895
	mov	edx, DWORD PTR __c$70340[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -248+[ebp], eax
	jmp	SHORT $L70896
$L70895:
	mov	DWORD PTR -248+[ebp], 0
$L70896:
	cmp	DWORD PTR __c$70340[ebp], 0
	je	SHORT $L70897
	mov	ecx, DWORD PTR __c$70340[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -252+[ebp], edx
	jmp	SHORT $L70898
$L70897:
	mov	DWORD PTR -252+[ebp], 0
$L70898:
	push	1
	push	OFFSET FLAT:$SG70343
	push	1
	push	OFFSET FLAT:_html_tooltip
	mov	eax, DWORD PTR -248+[ebp]
	push	eax
	mov	ecx, DWORD PTR -252+[ebp]
	push	ecx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70344
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70342
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70346
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 154		; 0000009aH
	jmp	$eva_err$70318
$L70342:

; 156  : 	else

	jmp	$L70370
$L70338:

; 158  : 		/* Default tooltip : row title + date */
; 159  : 		DYNBUF_ADD3_CELL(form->html, " helpmsg='", &pl->rows, pl->currow, 1, HTML_TOOLTIP, " : ");

	push	3
	push	OFFSET FLAT:$SG70349
	push	1
	push	OFFSET FLAT:_html_tooltip
	push	1
	mov	eax, DWORD PTR _pl$[ebp]
	mov	ecx, DWORD PTR [eax+196]
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 176				; 000000b0H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	eax, DWORD PTR _pl$[ebp]
	mov	ecx, DWORD PTR [eax+196]
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 176				; 000000b0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70350
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70348
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70352
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 159		; 0000009fH
	jmp	$eva_err$70318
$L70348:

; 160  : 		datetxt_to_format(cntxt, opnbtn, dbeg,"_EVA_FullDay");

	push	OFFSET FLAT:$SG70353
	mov	ecx, DWORD PTR _dbeg$[ebp]
	push	ecx
	lea	edx, DWORD PTR _opnbtn$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 161  : 		DYNBUF_ADD(form->html, opnbtn, strlen(opnbtn), NO_CONV);

	push	0
	push	0
	lea	ecx, DWORD PTR _opnbtn$[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	push	eax
	lea	edx, DWORD PTR _opnbtn$[ebp]
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70355
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70357
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 161		; 000000a1H
	jmp	$eva_err$70318
$L70355:

; 162  : 		if(strcmp(dbeg, dend))

	mov	ecx, DWORD PTR _dend$[ebp]
	push	ecx
	mov	edx, DWORD PTR _dbeg$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70366

; 164  : 			datetxt_to_format(cntxt, opnbtn, dend,"_EVA_FullDay");

	push	OFFSET FLAT:$SG70359
	mov	eax, DWORD PTR _dend$[ebp]
	push	eax
	lea	ecx, DWORD PTR _opnbtn$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 165  : 			DYNBUF_ADD_STR(form->html, " - ");

	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70362
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70361
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70364
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 165		; 000000a5H
	jmp	$eva_err$70318
$L70361:

; 166  : 			DYNBUF_ADD(form->html, opnbtn, strlen(opnbtn), NO_CONV);

	push	0
	push	0
	lea	ecx, DWORD PTR _opnbtn$[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	push	eax
	lea	edx, DWORD PTR _opnbtn$[ebp]
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70366
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70368
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 166		; 000000a6H
	jmp	$eva_err$70318
$L70366:

; 168  : 		DYNBUF_ADD_STR(form->html, "'");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70371
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70370
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70373
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 168		; 000000a8H
	jmp	$eva_err$70318
$L70370:

; 170  : 
; 171  : 	/* Handle cell color */
; 172  : 	if(!(color && color->len) && !(text && text->len)) color = &defcolor;

	cmp	DWORD PTR _color$[ebp], 0
	je	SHORT $L70375
	mov	edx, DWORD PTR _color$[ebp]
	cmp	DWORD PTR [edx+4], 0
	jne	SHORT $L70374
$L70375:
	cmp	DWORD PTR _text$[ebp], 0
	je	SHORT $L70376
	mov	eax, DWORD PTR _text$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L70374
$L70376:
	lea	ecx, DWORD PTR _defcolor$[ebp]
	mov	DWORD PTR _color$[ebp], ecx
$L70374:

; 173  : 	if(color && color->len)

	cmp	DWORD PTR _color$[ebp], 0
	je	$L70385
	mov	edx, DWORD PTR _color$[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	$L70385

; 175  : 		DYNBUF_ADD_STR(form->html, " bgcolor=#");

	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70380
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70379
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70382
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 175		; 000000afH
	jmp	$eva_err$70318
$L70379:

; 176  : 		DYNBUF_ADD_CELLP(form->html, color, NO_CONV);

	mov	ecx, DWORD PTR _color$[ebp]
	mov	DWORD PTR __c$70383[ebp], ecx
	cmp	DWORD PTR __c$70383[ebp], 0
	je	SHORT $L70385
	push	0
	push	0
	mov	edx, DWORD PTR __c$70383[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR __c$70383[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70385
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70387
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 176		; 000000b0H
	jmp	$eva_err$70318
$L70385:

; 178  : 
; 179  : 	/* Output cell content */
; 180  : 	DYNBUF_ADD_STR(form->html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70390
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70389
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70392
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 180		; 000000b4H
	jmp	$eva_err$70318
$L70389:

; 181  : 	fmt = 'D';

	mov	BYTE PTR _fmt$[ebp], 68			; 00000044H

; 182  : 	res1 = datetxt_to_age(dbeg, dend, &fmt);

	lea	edx, DWORD PTR _fmt$[ebp]
	push	edx
	mov	eax, DWORD PTR _dend$[ebp]
	push	eax
	mov	ecx, DWORD PTR _dbeg$[ebp]
	push	ecx
	call	_datetxt_to_age
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _res1$[ebp], eax

; 183  : 	if((res >= res1 / 2 || res >= 4))

	mov	eax, DWORD PTR _res1$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	cmp	DWORD PTR _res$[ebp], eax
	jge	SHORT $L70394
	cmp	DWORD PTR _res$[ebp], 4
	jl	SHORT $L70393
$L70394:

; 185  : 		if(dynbuf_add(form->html, DYNTAB_VAL_SZ(&pl->objdates, j, 4), pl->titleconv, 1)) RETURN_ERR_MEMORY;

	push	1
	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR [edx+108]
	push	eax
	push	4
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 156				; 0000009cH
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	4
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 156				; 0000009cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70395
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70397
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 185		; 000000b9H
	jmp	$eva_err$70318
$L70395:

; 187  : 	else

	jmp	SHORT $L70400
$L70393:

; 188  : 		DYNBUF_ADD_STR(form->html, "&nbsp;");

	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70401
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70400
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70403
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 188		; 000000bcH
	jmp	SHORT $eva_err$70318
$L70400:

; 189  : 	DYNBUF_ADD_STR(form->html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70406
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70405
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70408
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 189		; 000000bdH
	jmp	SHORT $eva_err$70318
$L70405:
$eva_noerr$70308:

; 190  : 
; 191  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70409
	push	OFFSET FLAT:$SG70410
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70318:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70411
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70412
	push	OFFSET FLAT:$SG70413
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70411:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 192  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_planning_event ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_planning_frame
EXTRN	_datetxt_to_time:NEAR
EXTRN	_delay_to_datetxt:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_localtime:NEAR
EXTRN	_mktime:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_dynbuf_add_int:NEAR
EXTRN	_toupper:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_cmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70487 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70440 DB	'<tr>', 00H
	ORG $+3
$SG70442 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70450 DB	'>', 00H
	ORG $+2
$SG70451 DB	'<td class=PlanningMonthCell colspan=', 00H
	ORG $+3
$SG70453 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70455 DB	'%s %d', 00H
	ORG $+2
$SG70457 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70460 DB	'</td>', 00H
	ORG $+2
$SG70462 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70465 DB	'</tr>', 00H
	ORG $+2
$SG70467 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70469 DB	'</td>', 00H
	ORG $+2
$SG70470 DB	'<tr><td class=PlanningDayCell>', 00H
	ORG $+1
$SG70472 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70481 DB	'<td class=PlanningDayCell width=20', 00H
	ORG $+1
$SG70483 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70488 DB	' bgcolor=#', 00H
	ORG $+1
$SG70490 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70493 DB	'<br>', 00H
	ORG $+3
$SG70494 DB	'>', 00H
	ORG $+2
$SG70496 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70499 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70502 DB	'</td>', 00H
	ORG $+2
$SG70504 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70507 DB	'<td colspan=32></td></tr>', 00H
	ORG $+2
$SG70509 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70522 DB	' style=''border-bottom:solid black 1px''></td></tr>', 00H
	ORG $+2
$SG70523 DB	'<tr><td colspan=', 00H
	ORG $+3
$SG70525 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70528 DB	''')>', 00H
$SG70529 DB	'<tr><td class=PlanningRowTitleCell onClick=cb(''', 00H
$SG70531 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70534 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70537 DB	'</td>', 00H
	ORG $+2
$SG70539 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70551 DB	'</tr><tr><td class=PlanningRowTitleCell></td>', 00H
	ORG $+2
$SG70553 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70561 DB	'</tr>', 00H
	ORG $+2
$SG70563 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70565 DB	' style=''border-bottom:solid black 1px''></td></tr>', 00H
	ORG $+2
$SG70566 DB	'<tr><td colspan=', 00H
	ORG $+3
$SG70568 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70570 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_plan'
	DB	'ning.c', 00H
	ORG $+1
$SG70571 DB	'ctrl_output_planning_frame', 00H
	ORG $+1
$SG70573 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_plan'
	DB	'ning.c', 00H
	ORG $+1
$SG70574 DB	'ctrl_output_planning_frame', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pl$ = 12
_form$ = -76
_data$ = -104
_nextline$ = -84
_nbnext$ = -240
_t$ = -236
_dt$ = -284
_dt1$ = -244
_j$ = -248
_col$ = -8
_cols$ = -288
_mdays$ = -80
_fmt$ = -4
_month$ = -72
_opnbtn$ = -232
_t0$70447 = -292
_txt$70476 = -300
_bgcol$70477 = -296
_idobj$70513 = -304
_ctrl_output_planning_frame PROC NEAR

; 206  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 304				; 00000130H

; 207  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 208  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 209  : 	unsigned long *nextline = NULL, nbnext = 0;

	mov	DWORD PTR _nextline$[ebp], 0
	mov	DWORD PTR _nbnext$[ebp], 0

; 210  : 	time_t t = 0;

	mov	DWORD PTR _t$[ebp], 0

; 211  : 	struct tm dt, *dt1;
; 212  : 	unsigned long j;
; 213  : 	int col, cols, mdays;
; 214  : 	char fmt = 'D';

	mov	BYTE PTR _fmt$[ebp], 68			; 00000044H

; 215  : 	char month[64];
; 216  : 	char opnbtn[128];
; 217  : 
; 218  : 	/* Calc end date for frame & # of days */
; 219  : 	delay_to_datetxt(pl->frameend, pl->framebeg, pl->nb, pl->unit);

	mov	eax, DWORD PTR _pl$[ebp]
	mov	cl, BYTE PTR [eax+220]
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR [edx+216]
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 244				; 000000f4H
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 260				; 00000104H
	push	edx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 220  : 	cols = datetxt_to_age(pl->framebeg, pl->frameend, &fmt);

	lea	eax, DWORD PTR _fmt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 260				; 00000104H
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 244				; 000000f4H
	push	edx
	call	_datetxt_to_age
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cols$[ebp], eax

; 221  : 	datetxt_to_time(pl->framebeg, &t, &dt);

	lea	eax, DWORD PTR _dt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _t$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 244				; 000000f4H
	push	edx
	call	_datetxt_to_time
	add	esp, 12					; 0000000cH

; 222  : 	pl->wday = dt.tm_wday;

	mov	eax, DWORD PTR _pl$[ebp]
	mov	ecx, DWORD PTR _dt$[ebp+24]
	mov	DWORD PTR [eax+236], ecx

; 223  : 	pl->curday = datetxt_to_age(pl->framebeg, cntxt->timestamp, &fmt);

	lea	edx, DWORD PTR _fmt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29704				; 00007408H
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 244				; 000000f4H
	push	ecx
	call	_datetxt_to_age
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [edx+240], eax

; 224  : 
; 225  : 	/* Output month title line */
; 226  : 	DYNBUF_ADD_STR(form->html, "<tr>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70440
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70439
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70442
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 226		; 000000e2H
	jmp	$eva_err$70443
$L70439:

; 227  : 	for(col = 0; col < cols; col += mdays)

	mov	DWORD PTR _col$[ebp], 0
	jmp	SHORT $L70444
$L70445:
	mov	ecx, DWORD PTR _col$[ebp]
	add	ecx, DWORD PTR _mdays$[ebp]
	mov	DWORD PTR _col$[ebp], ecx
$L70444:
	mov	edx, DWORD PTR _col$[ebp]
	cmp	edx, DWORD PTR _cols$[ebp]
	jge	$L70446

; 229  : 		time_t t0 = t;

	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR _t0$70447[ebp], eax

; 230  : 		dt.tm_mon++;

	mov	ecx, DWORD PTR _dt$[ebp+16]
	add	ecx, 1
	mov	DWORD PTR _dt$[ebp+16], ecx

; 231  : 		dt.tm_mday = 1;

	mov	DWORD PTR _dt$[ebp+12], 1

; 232  : 		dt.tm_hour = 12;

	mov	DWORD PTR _dt$[ebp+8], 12		; 0000000cH

; 233  : 		t = mktime(&dt);

	lea	edx, DWORD PTR _dt$[ebp]
	push	edx
	call	_mktime
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax

; 234  : 		dt1 = localtime(&t);

	lea	eax, DWORD PTR _t$[ebp]
	push	eax
	call	_localtime
	add	esp, 4
	mov	DWORD PTR _dt1$[ebp], eax

; 235  : 		if(!dt1) break;

	cmp	DWORD PTR _dt1$[ebp], 0
	jne	SHORT $L70448
	jmp	$L70446
$L70448:

; 236  : 		mdays = (t - t0 + 4000) / 86400;

	mov	eax, DWORD PTR _t$[ebp]
	sub	eax, DWORD PTR _t0$70447[ebp]
	add	eax, 4000				; 00000fa0H
	cdq
	mov	ecx, 86400				; 00015180H
	idiv	ecx
	mov	DWORD PTR _mdays$[ebp], eax

; 237  : 		DYNBUF_ADD3_INT(form->html, "<td class=PlanningMonthCell colspan=", mdays + (col ? 0 : 1), ">");

	push	1
	push	OFFSET FLAT:$SG70450
	xor	edx, edx
	cmp	DWORD PTR _col$[ebp], 0
	sete	dl
	mov	eax, DWORD PTR _mdays$[ebp]
	add	eax, edx
	push	eax
	push	36					; 00000024H
	push	OFFSET FLAT:$SG70451
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70449
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70453
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 237		; 000000edH
	jmp	$eva_err$70443
$L70449:

; 239  : 			dyntab_val(&cntxt->monthlong, (dt1->tm_mon + 11) % 12, 0), dt1->tm_year + 1900 - (dt1->tm_mon ? 0 : 1)), TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	edx, DWORD PTR _dt1$[ebp]
	mov	eax, DWORD PTR [edx+20]
	add	eax, 1900				; 0000076cH
	mov	ecx, DWORD PTR _dt1$[ebp]
	xor	edx, edx
	cmp	DWORD PTR [ecx+16], 0
	sete	dl
	sub	eax, edx
	push	eax
	push	0
	mov	eax, DWORD PTR _dt1$[ebp]
	mov	eax, DWORD PTR [eax+16]
	add	eax, 11					; 0000000bH
	cdq
	mov	ecx, 12					; 0000000cH
	idiv	ecx
	push	edx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269708				; 00041d8cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG70455
	push	63					; 0000003fH
	lea	eax, DWORD PTR _month$[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	ecx, DWORD PTR _month$[ebp]
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70454
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70457
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 239		; 000000efH
	jmp	$eva_err$70443
$L70454:

; 240  : 		DYNBUF_ADD_STR(form->html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70460
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70459
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70462
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 240		; 000000f0H
	jmp	$eva_err$70443
$L70459:

; 241  : 	}

	jmp	$L70445
$L70446:

; 242  : 	DYNBUF_ADD_STR(form->html, "</tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70465
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70464
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70467
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 242		; 000000f2H
	jmp	$eva_err$70443
$L70464:

; 243  : 
; 244  : 	/* Output days title line */
; 245  : 	DYNBUF_ADD3_CELL(form->html, "<tr><td class=PlanningDayCell>", &pl->rowlabel, 0, 0, TO_HTML, "</td>");

	push	5
	push	OFFSET FLAT:$SG70469
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	push	0
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 112				; 00000070H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 112				; 00000070H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	30					; 0000001eH
	push	OFFSET FLAT:$SG70470
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70468
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70472
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 245		; 000000f5H
	jmp	$eva_err$70443
$L70468:

; 246  : 	datetxt_to_time(pl->framebeg, &t, &dt);

	lea	edx, DWORD PTR _dt$[ebp]
	push	edx
	lea	eax, DWORD PTR _t$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 244				; 000000f4H
	push	ecx
	call	_datetxt_to_time
	add	esp, 12					; 0000000cH

; 247  : 	for(dt1 = &dt, col = 0; col < cols; col++)

	lea	edx, DWORD PTR _dt$[ebp]
	mov	DWORD PTR _dt1$[ebp], edx
	mov	DWORD PTR _col$[ebp], 0
	jmp	SHORT $L70473
$L70474:
	mov	eax, DWORD PTR _col$[ebp]
	add	eax, 1
	mov	DWORD PTR _col$[ebp], eax
$L70473:
	mov	ecx, DWORD PTR _col$[ebp]
	cmp	ecx, DWORD PTR _cols$[ebp]
	jge	$L70475

; 249  : 		char txt[2] = {0};

	mov	BYTE PTR _txt$70476[ebp], 0
	xor	edx, edx
	mov	BYTE PTR _txt$70476[ebp+1], dl

; 250  : 		char *bgcol = output_planning_cell_color(pl, col);

	mov	eax, DWORD PTR _col$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	push	ecx
	call	_output_planning_cell_color
	add	esp, 8
	mov	DWORD PTR _bgcol$70477[ebp], eax

; 251  : 		*txt = (char)toupper(dyntab_val(&cntxt->dayshort, dt1->tm_wday, 0)[0]);

	push	0
	mov	edx, DWORD PTR _dt1$[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 269688				; 00041d78H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	movsx	edx, BYTE PTR [eax]
	push	edx
	call	_toupper
	add	esp, 4
	mov	BYTE PTR _txt$70476[ebp], al

; 252  : 		DYNBUF_ADD_STR(form->html, "<td class=PlanningDayCell width=20");

	push	0
	push	0
	push	34					; 00000022H
	push	OFFSET FLAT:$SG70481
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70480
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70483
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 252		; 000000fcH
	jmp	$eva_err$70443
$L70480:

; 253  : 		if(bgcol) DYNBUF_ADD3(form->html, " bgcolor=#", bgcol, 0, NO_CONV, "");

	cmp	DWORD PTR _bgcol$70477[ebp], 0
	je	SHORT $L70486
	push	0
	push	OFFSET FLAT:$SG70487
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _bgcol$70477[ebp]
	push	ecx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70488
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70486
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70490
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 253		; 000000fdH
	jmp	$eva_err$70443
$L70486:

; 254  : 		DYNBUF_ADD3(form->html, ">", txt, 1, NO_CONV, "<br>");

	push	4
	push	OFFSET FLAT:$SG70493
	push	0
	push	0
	push	1
	lea	eax, DWORD PTR _txt$70476[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70494
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70492
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70496
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 254		; 000000feH
	jmp	$eva_err$70443
$L70492:

; 255  : 		DYNBUF_ADD_INT(form->html, dt1->tm_mday);

	mov	edx, DWORD PTR _dt1$[ebp]
	mov	eax, DWORD PTR [edx+12]
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70497
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70499
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 255		; 000000ffH
	jmp	$eva_err$70443
$L70497:

; 256  : 		DYNBUF_ADD_STR(form->html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70502
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70501
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70504
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 256		; 00000100H
	jmp	$eva_err$70443
$L70501:

; 257  : 		dt.tm_mday++;

	mov	eax, DWORD PTR _dt$[ebp+12]
	add	eax, 1
	mov	DWORD PTR _dt$[ebp+12], eax

; 258  : 		dt.tm_hour = 12;

	mov	DWORD PTR _dt$[ebp+8], 12		; 0000000cH

; 259  : 		t = mktime(&dt);

	lea	ecx, DWORD PTR _dt$[ebp]
	push	ecx
	call	_mktime
	add	esp, 4
	mov	DWORD PTR _t$[ebp], eax

; 260  : 		dt1 = localtime(&t);

	lea	edx, DWORD PTR _t$[ebp]
	push	edx
	call	_localtime
	add	esp, 4
	mov	DWORD PTR _dt1$[ebp], eax

; 261  : 	}

	jmp	$L70474
$L70475:

; 262  : 	DYNBUF_ADD_STR(form->html, "<td colspan=32></td></tr>");

	push	0
	push	0
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70507
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70506
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70509
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 262		; 00000106H
	jmp	$eva_err$70443
$L70506:

; 263  : 
; 264  : 	/* Output rows */
; 265  : 	for(pl->currow = 0; pl->currow < pl->rows.nbrows; pl->currow++)

	mov	ecx, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [ecx+196], 0
	jmp	SHORT $L70510
$L70511:
	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR [edx+196]
	add	eax, 1
	mov	ecx, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [ecx+196], eax
$L70510:
	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR _pl$[ebp]
	mov	ecx, DWORD PTR [edx+196]
	cmp	ecx, DWORD PTR [eax+176]
	jae	$L70512

; 267  : 		unsigned long idobj = DYNTAB_TOULRC(&pl->rows, pl->currow, 0);

	push	10					; 0000000aH
	push	0
	push	0
	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR [edx+196]
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 176				; 000000b0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$70513[ebp], eax

; 268  : 
; 269  : 		/* Locate first event in frame - skip row if none */
; 270  : 		pl->curcol = 0;

	mov	edx, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [edx+276], 0

; 271  : 		for(j = 0; j < pl->objdates.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70515
$L70516:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70515:
	mov	ecx, DWORD PTR _pl$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+156]
	jae	$L70517

; 273  : 			if(dyntab_cmp(&pl->objdates, j, 1, &pl->rows, pl->currow, 0)) continue;

	push	0
	mov	eax, DWORD PTR _pl$[ebp]
	mov	ecx, DWORD PTR [eax+196]
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 176				; 000000b0H
	push	edx
	push	1
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 156				; 0000009cH
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70518
	jmp	SHORT $L70516
$L70518:

; 274  : 			if(strncmp(pl->frameend, dyntab_val(&pl->objdates, j, 2), 8) > 0 &&
; 275  : 				strncmp(pl->framebeg, dyntab_val(&pl->objdates, j, 3), 8) <= 0) break;

	push	8
	push	2
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 156				; 0000009cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 260				; 00000104H
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jle	SHORT $L70519
	push	8
	push	3
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 156				; 0000009cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 244				; 000000f4H
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jg	SHORT $L70519
	jmp	SHORT $L70517
$L70519:

; 276  : 		}

	jmp	$L70516
$L70517:

; 277  : 		if(j == pl->objdates.nbrows) continue;

	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+156]
	jne	SHORT $L70520
	jmp	$L70511
$L70520:

; 278  : 
; 279  : 		/* Output row title */
; 280  : 		DYNBUF_ADD3_INT(form->html, "<tr><td colspan=", cols + 1, " style='border-bottom:solid black 1px'></td></tr>");

	push	49					; 00000031H
	push	OFFSET FLAT:$SG70522
	mov	ecx, DWORD PTR _cols$[ebp]
	add	ecx, 1
	push	ecx
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70523
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70521
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70525
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 280		; 00000118H
	jmp	$eva_err$70443
$L70521:

; 281  : 		DYNBUF_ADD3(form->html, "<tr><td class=PlanningRowTitleCell onClick=cb('", opnbtn, build_open_btn_name(cntxt, opnbtn, pl->titleform, idobj, 0, 0), NO_CONV, "')>");

	push	3
	push	OFFSET FLAT:$SG70528
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _idobj$70513[ebp]
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	push	edx
	lea	eax, DWORD PTR _opnbtn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_build_open_btn_name
	add	esp, 24					; 00000018H
	push	eax
	lea	edx, DWORD PTR _opnbtn$[ebp]
	push	edx
	push	47					; 0000002fH
	push	OFFSET FLAT:$SG70529
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70527
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70531
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 281		; 00000119H
	jmp	$eva_err$70443
$L70527:

; 282  : 		if(dynbuf_add(form->html, DYNTAB_VAL_SZ(&pl->rows, pl->currow, 1), pl->rowtitleconv, 1)) RETURN_ERR_MEMORY;

	push	1
	mov	ecx, DWORD PTR _pl$[ebp]
	mov	edx, DWORD PTR [ecx+132]
	push	edx
	push	1
	mov	eax, DWORD PTR _pl$[ebp]
	mov	ecx, DWORD PTR [eax+196]
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 176				; 000000b0H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	eax, DWORD PTR _pl$[ebp]
	mov	ecx, DWORD PTR [eax+196]
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 176				; 000000b0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70532
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70534
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 282		; 0000011aH
	jmp	$eva_err$70443
$L70532:

; 283  : 		DYNBUF_ADD_STR(form->html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70537
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70536
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70539
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 283		; 0000011bH
	jmp	$eva_err$70443
$L70536:

; 284  : 
; 285  : 		/* Output events in objdates */
; 286  : 		for(;j < pl->objdates.nbrows && !dyntab_cmp(&pl->objdates, j, 1, &pl->rows, pl->currow, 0); j++)

	jmp	SHORT $L70540
$L70541:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70540:
	mov	eax, DWORD PTR _pl$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+156]
	jae	SHORT $L70542
	push	0
	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR [edx+196]
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 176				; 000000b0H
	push	ecx
	push	1
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 156				; 0000009cH
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70542

; 287  : 			if(ctrl_output_planning_event(cntxt, pl, j)) STACK_ERROR;

	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_output_planning_event
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70543
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 287		; 0000011fH
	jmp	$eva_err$70443
$L70543:
	jmp	$L70541
$L70542:

; 288  : 
; 289  : 		/* Output empty cells */
; 290  : 		if(output_planning_emptycells(cntxt, pl, cols)) STACK_ERROR;

	mov	edx, DWORD PTR _cols$[ebp]
	push	edx
	mov	eax, DWORD PTR _pl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_output_planning_emptycells
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70544
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 290		; 00000122H
	jmp	$eva_err$70443
$L70544:

; 291  : 
; 292  : 		/* Output extra lines for overlapping events */
; 293  : 		while(pl->nbnext)

	mov	eax, DWORD PTR _pl$[ebp]
	cmp	DWORD PTR [eax+284], 0
	je	$L70547

; 295  : 			/* Store overlapping events list */
; 296  : 			M_FREE(nextline);

	mov	ecx, DWORD PTR _nextline$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _nextline$[ebp], 0

; 297  : 			nextline = pl->nextline;

	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR [edx+280]
	mov	DWORD PTR _nextline$[ebp], eax

; 298  : 			nbnext = pl->nbnext;

	mov	ecx, DWORD PTR _pl$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	mov	DWORD PTR _nbnext$[ebp], edx

; 299  : 			pl->nextline = NULL;

	mov	eax, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [eax+280], 0

; 300  : 			pl->nbnext = 0;

	mov	ecx, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [ecx+284], 0

; 301  : 
; 302  : 			/* Output empty cell under row title */
; 303  : 			DYNBUF_ADD_STR(form->html, "</tr><tr><td class=PlanningRowTitleCell></td>");

	push	0
	push	0
	push	45					; 0000002dH
	push	OFFSET FLAT:$SG70551
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70550
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70553
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 303		; 0000012fH
	jmp	$eva_err$70443
$L70550:

; 304  : 
; 305  : 			/* Output overlapping events */
; 306  : 			pl->curcol = 0;

	mov	eax, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [eax+276], 0

; 307  : 			pl->b_nextline = 1;

	mov	ecx, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [ecx+288], 1

; 308  : 			for(j = 0; j < nbnext; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70554
$L70555:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L70554:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _nbnext$[ebp]
	jae	SHORT $L70556

; 309  : 				if(ctrl_output_planning_event(cntxt, pl, nextline[j])) STACK_ERROR;

	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _nextline$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_output_planning_event
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70557
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 309		; 00000135H
	jmp	$eva_err$70443
$L70557:
	jmp	SHORT $L70555
$L70556:

; 310  : 
; 311  : 			/* Output empty cells */
; 312  : 			if(output_planning_emptycells(cntxt, pl, cols)) STACK_ERROR;

	mov	ecx, DWORD PTR _cols$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_output_planning_emptycells
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70558
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 312		; 00000138H
	jmp	$eva_err$70443
$L70558:

; 313  : 		}

	jmp	$L70544
$L70547:

; 314  : 		DYNBUF_ADD_STR(form->html, "</tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70561
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70560
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70563
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 314		; 0000013aH
	jmp	SHORT $eva_err$70443
$L70560:

; 315  : 		pl->b_nextline = 0;

	mov	eax, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [eax+288], 0

; 316  : 	}

	jmp	$L70511
$L70512:

; 317  : 	DYNBUF_ADD3_INT(form->html, "<tr><td colspan=", cols + 1, " style='border-bottom:solid black 1px'></td></tr>");

	push	49					; 00000031H
	push	OFFSET FLAT:$SG70565
	mov	ecx, DWORD PTR _cols$[ebp]
	add	ecx, 1
	push	ecx
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70566
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70564
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70568
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 317		; 0000013dH
	jmp	SHORT $eva_err$70443
$L70564:
$eva_noerr$70569:

; 318  : 
; 319  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70570
	push	OFFSET FLAT:$SG70571
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70443:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70572
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70573
	push	OFFSET FLAT:$SG70574
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70572:
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _nextline$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _nextline$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 320  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_planning_frame ENDP
_TEXT	ENDS
PUBLIC	_qsort_objdates
EXTRN	_atoi:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70593 DB	01H DUP (?)
	ALIGN	4

$SG70594 DB	01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_el1$ = 8
_el2$ = 12
_t10$ = -4
_t20$ = -12
_t11$ = -8
_t21$ = -16
_i1$ = -20
_i2$ = -24
_qsort_objdates PROC NEAR

; 329  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H

; 330  : 	char *t10 = ((DynTableCell *)el1+1)->txt;

	mov	eax, DWORD PTR _el1$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR _t10$[ebp], ecx

; 331  : 	char *t20 = ((DynTableCell *)el2+1)->txt;

	mov	edx, DWORD PTR _el2$[ebp]
	mov	eax, DWORD PTR [edx+64]
	mov	DWORD PTR _t20$[ebp], eax

; 332  : 	char *t11 = ((DynTableCell *)el1+2)->txt;

	mov	ecx, DWORD PTR _el1$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	mov	DWORD PTR _t11$[ebp], edx

; 333  : 	char *t21 = ((DynTableCell *)el2+2)->txt;

	mov	eax, DWORD PTR _el2$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	mov	DWORD PTR _t21$[ebp], ecx

; 334  : 	int i1, i2;
; 335  : 
; 336  : 	i1 = t10 ? atoi(t10) : 0;

	cmp	DWORD PTR _t10$[ebp], 0
	je	SHORT $L70901
	mov	edx, DWORD PTR _t10$[ebp]
	push	edx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L70902
$L70901:
	mov	DWORD PTR -28+[ebp], 0
$L70902:
	mov	eax, DWORD PTR -28+[ebp]
	mov	DWORD PTR _i1$[ebp], eax

; 337  : 	i2 = t20 ? atoi(t20) : 0;

	cmp	DWORD PTR _t20$[ebp], 0
	je	SHORT $L70903
	mov	ecx, DWORD PTR _t20$[ebp]
	push	ecx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -32+[ebp], eax
	jmp	SHORT $L70904
$L70903:
	mov	DWORD PTR -32+[ebp], 0
$L70904:
	mov	edx, DWORD PTR -32+[ebp]
	mov	DWORD PTR _i2$[ebp], edx

; 338  : 	if(i1 != i2) return i1 > i2 ? 1 : -1;

	mov	eax, DWORD PTR _i1$[ebp]
	cmp	eax, DWORD PTR _i2$[ebp]
	je	SHORT $L70592
	mov	ecx, DWORD PTR _i1$[ebp]
	xor	eax, eax
	cmp	ecx, DWORD PTR _i2$[ebp]
	setle	al
	dec	eax
	and	eax, 2
	add	eax, -1
	jmp	SHORT $L70581
$L70592:

; 339  : 
; 340  : 	return strcmp(t11 ? t11 : "", t21 ? t21 : "");

	cmp	DWORD PTR _t21$[ebp], 0
	je	SHORT $L70905
	mov	edx, DWORD PTR _t21$[ebp]
	mov	DWORD PTR -36+[ebp], edx
	jmp	SHORT $L70906
$L70905:
	mov	DWORD PTR -36+[ebp], OFFSET FLAT:$SG70593
$L70906:
	cmp	DWORD PTR _t11$[ebp], 0
	je	SHORT $L70907
	mov	eax, DWORD PTR _t11$[ebp]
	mov	DWORD PTR -40+[ebp], eax
	jmp	SHORT $L70908
$L70907:
	mov	DWORD PTR -40+[ebp], OFFSET FLAT:$SG70594
$L70908:
	mov	ecx, DWORD PTR -36+[ebp]
	push	ecx
	mov	edx, DWORD PTR -40+[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
$L70581:

; 341  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qsort_objdates ENDP
_TEXT	ENDS
PUBLIC	_ctrl_read_planning_data
EXTRN	_qsort_col0i:NEAR
EXTRN	_form_eval_fieldexpr:NEAR
EXTRN	_datetxt_now:NEAR
EXTRN	__chkstk:NEAR
EXTRN	_qry_exec_filter:NEAR
EXTRN	_qry_add_table_col:NEAR
EXTRN	_qry_obj_idfield:NEAR
EXTRN	_qry_obj_field:NEAR
EXTRN	_sql_get_table:NEAR
EXTRN	_qry_build_flt_select:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_qry_eval_sqlexpr_var:NEAR
EXTRN	_dyntab_from_tab:NEAR
EXTRN	_qry_build_free:NEAR
EXTRN	_qry_add_filter_forms:NEAR
EXTRN	_qry_build_clauses:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
EXTRN	_dyntab_order_lines:NEAR
EXTRN	_dyntab_group:NEAR
EXTRN	_dyntab_sort:NEAR
EXTRN	_qsort_col1:NEAR
EXTRN	_form_get_field_values:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70671 DB	01H DUP (?)
	ALIGN	4

$SG70682 DB	01H DUP (?)
	ALIGN	4

$SG70698 DB	01H DUP (?)
	ALIGN	4

$SG70729 DB	01H DUP (?)
	ALIGN	4

$SG70735 DB	01H DUP (?)
	ALIGN	4

$SG70741 DB	01H DUP (?)
	ALIGN	4

$SG70748 DB	01H DUP (?)
	ALIGN	4

$SG70756 DB	01H DUP (?)
	ALIGN	4

$SG70619 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70618 DB	'_EVA_DATE_END_MODE', 00H
	ORG $+1
$SG70622 DB	'_EVA_BASE_FORMS', 00H
$SG70624 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70628 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70631 DB	'_EVA_BASE_FILTERS', 00H
	ORG $+2
$SG70633 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70636 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70640 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70642 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70645 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70648 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70652 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70658 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70663 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70669 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70670 DB	'_EVA_CTRL_DATE_BEG', 00H
	ORG $+1
$SG70673 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70677 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70680 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70681 DB	'_EVA_CTRL_DATE_END', 00H
	ORG $+1
$SG70686 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70691 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70695 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70697 DB	'_EVA_CTRL_ROWS', 00H
	ORG $+1
$SG70700 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70702 DB	'_EVA_BASE_FORMS', 00H
$SG70706 DB	'.IdRelObj AS RowObj,', 00H
	ORG $+3
$SG70707 DB	'TLink', 00H
	ORG $+2
$SG70709 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70711 DB	'.TxtValue AS DateBeg,', 00H
	ORG $+2
$SG70712 DB	'TVal', 00H
	ORG $+3
$SG70714 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70716 DB	'.TxtValue AS DateEnd', 00H
	ORG $+3
$SG70717 DB	'TVal', 00H
	ORG $+3
$SG70719 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70727 DB	'_EVA_FIELD,_EVA_SRCFIELD', 00H
	ORG $+3
$SG70728 DB	'_EVA_CTRL_DISPLAY', 00H
	ORG $+2
$SG70733 DB	'_EVA_FIELD,_EVA_SRCFIELD', 00H
	ORG $+3
$SG70734 DB	'_EVA_CTRL_COLOR', 00H
$SG70739 DB	'_EVA_DISPLAYFORMAT', 00H
	ORG $+1
$SG70740 DB	'_EVA_CTRL_DISPLAY', 00H
	ORG $+2
$SG70743 DB	'_EVA_HTML', 00H
	ORG $+2
$SG70746 DB	'_EVA_FIELD,_EVA_SRCFIELD', 00H
	ORG $+3
$SG70747 DB	'_EVA_CTRL_TOOLTIP', 00H
	ORG $+2
$SG70752 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70753 DB	'DISTINCT', 00H
	ORG $+3
$SG70755 DB	'_EVA_CTRL_ROW_TITLE', 00H
$SG70758 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG70762 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70764 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70768 DB	'_EVA_SRCFIELD', 00H
	ORG $+2
$SG70770 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70775 DB	'_EVA_DISPLAYFORMAT', 00H
	ORG $+1
$SG70777 DB	'_EVA_HTML', 00H
	ORG $+2
$SG70784 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_plan'
	DB	'ning.c', 00H
	ORG $+1
$SG70785 DB	'ctrl_read_planning_data', 00H
$SG70788 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70790 DB	'_EVA_WEEKEND_BGCOLOR', 00H
	ORG $+3
$SG70792 DB	'_EVA_TODAY_BGCOLOR', 00H
	ORG $+1
$SG70793 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_plan'
	DB	'ning.c', 00H
	ORG $+1
$SG70794 DB	'ctrl_read_planning_data', 00H
$SG70796 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_plan'
	DB	'ning.c', 00H
	ORG $+1
$SG70797 DB	'ctrl_read_planning_data', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_pl$ = 12
_form$ = -8
_ctrl$ = -4564
_empty$ = -96
_data$ = -32
_cgival$ = -60
_sql$ = -4
_flt$ = -4556
_ndbeg$ = -4560
_ndend$ = -4568
_nrow$ = -36
_i$ = -40
_idctrl$ = -12
_dateend$ = -76
_dateend_mode$ = -100
_ctrl_read_planning_data PROC NEAR

; 356  : ){

	push	ebp
	mov	ebp, esp
	mov	eax, 4616				; 00001208H
	call	__chkstk
	push	edi

; 357  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 358  : 	EVA_ctrl *ctrl = form->ctrl + pl->i_ctrl;

	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR [edx]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 359  : 	DynTable empty = {0};

	mov	DWORD PTR _empty$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _empty$[ebp+4], eax
	mov	DWORD PTR _empty$[ebp+8], eax
	mov	DWORD PTR _empty$[ebp+12], eax
	mov	DWORD PTR _empty$[ebp+16], eax

; 360  : 	DynTable data = {0};

	mov	DWORD PTR _data$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _data$[ebp+4], ecx
	mov	DWORD PTR _data$[ebp+8], ecx
	mov	DWORD PTR _data$[ebp+12], ecx
	mov	DWORD PTR _data$[ebp+16], ecx

; 361  : 	DynTable cgival = {0};

	mov	DWORD PTR _cgival$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cgival$[ebp+4], edx
	mov	DWORD PTR _cgival$[ebp+8], edx
	mov	DWORD PTR _cgival$[ebp+12], edx
	mov	DWORD PTR _cgival$[ebp+16], edx

; 362  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 363  : 	QryBuild flt = {{0}};

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

; 364  : 	QryBuilNode *ndbeg, *ndend, *nrow;
; 365  : 	unsigned long i, idctrl;
; 366  : 	char dateend[16];
; 367  : 	char *dateend_mode = CTRL_ATTR_VAL(DATE_END_MODE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70910
	push	0
	push	-1
	push	OFFSET FLAT:$SG70618
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4572+[ebp], eax
	jmp	SHORT $L70911
$L70910:
	mov	DWORD PTR -4572+[ebp], OFFSET FLAT:$SG70619
$L70911:
	mov	edx, DWORD PTR -4572+[ebp]
	mov	DWORD PTR _dateend_mode$[ebp], edx

; 368  : 
; 369  : 	/* Parse base filter & forms */
; 370  : 	CTRL_ATTR_TAB(pl->forms, BASE_FORMS);

	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 4
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70622
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 4
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70621
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70624
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 370		; 00000172H
	jmp	$eva_err$70625
$L70621:
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 4
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70626
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70628
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 370		; 00000172H
	jmp	$eva_err$70625
$L70626:

; 371  : 	CTRL_ATTR_TAB(pl->filters, BASE_FILTERS);

	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 24					; 00000018H
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70631
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70630
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70633
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 371		; 00000173H
	jmp	$eva_err$70625
$L70630:
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70634
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70636
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 371		; 00000173H
	jmp	$eva_err$70625
$L70634:

; 372  : 	if(qry_add_filter_forms(cntxt, &flt, &pl->forms, &pl->filters)) STACK_ERROR;

	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 4
	push	edx
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_filter_forms
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70637
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 372		; 00000174H
	jmp	$eva_err$70625
$L70637:

; 373  : 
; 374  : 	/* Read start date - 1st in period controls */
; 375  : 	CTRL_ATTR_TAB(pl->periodctl, CTRLTREE);

	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 136				; 00000088H
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70640
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 136				; 00000088H
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70639
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70642
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 375		; 00000177H
	jmp	$eva_err$70625
$L70639:
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 136				; 00000088H
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70643
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70645
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 375		; 00000177H
	jmp	$eva_err$70625
$L70643:

; 376  : 	if(qry_obj_field(cntxt, &data, DYNTAB_TOULRC(&pl->periodctl, 0, 0), "_EVA_FIELD")) STACK_ERROR;

	push	OFFSET FLAT:$SG70648
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 136				; 00000088H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70647
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 376		; 00000178H
	jmp	$eva_err$70625
$L70647:

; 377  : 	if(data.cell && data.cell->txt && form_get_field_values(cntxt, &cgival, data.cell->txt, 0, 0)) STACK_ERROR;

	cmp	DWORD PTR _data$[ebp+16], 0
	je	SHORT $L70649
	mov	eax, DWORD PTR _data$[ebp+16]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70649
	push	0
	push	0
	mov	ecx, DWORD PTR _data$[ebp+16]
	mov	edx, DWORD PTR [ecx]
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_get_field_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70649
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 377		; 00000179H
	jmp	$eva_err$70625
$L70649:

; 378  : 	strcpy(pl->datebeg, (cgival.cell && cgival.cell->txt) ? cgival.cell->txt : datetxt_now());

	cmp	DWORD PTR _cgival$[ebp+16], 0
	je	SHORT $L70912
	mov	eax, DWORD PTR _cgival$[ebp+16]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70912
	mov	ecx, DWORD PTR _cgival$[ebp+16]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -4576+[ebp], edx
	jmp	SHORT $L70913
$L70912:
	call	_datetxt_now
	mov	DWORD PTR -4576+[ebp], eax
$L70913:
	mov	eax, DWORD PTR -4576+[ebp]
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 200				; 000000c8H
	push	ecx
	call	_strcpy
	add	esp, 8

; 379  : 
; 380  : 	/* Read # of units - 2nd in period controls */
; 381  : 	DYNTAB_FREE(cgival);

	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 382  : 	if(qry_obj_field(cntxt, &data, DYNTAB_TOULRC(&pl->periodctl, 1, 0), "_EVA_FIELD")) STACK_ERROR;

	push	OFFSET FLAT:$SG70652
	push	10					; 0000000aH
	push	0
	push	0
	push	1
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 136				; 00000088H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70651
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 382		; 0000017eH
	jmp	$eva_err$70625
$L70651:

; 383  : 	if(data.cell && data.cell->txt && form_get_field_values(cntxt, &cgival, data.cell->txt, 0, 0)) STACK_ERROR;

	cmp	DWORD PTR _data$[ebp+16], 0
	je	SHORT $L70653
	mov	ecx, DWORD PTR _data$[ebp+16]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70653
	push	0
	push	0
	mov	edx, DWORD PTR _data$[ebp+16]
	mov	eax, DWORD PTR [edx]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_get_field_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70653
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 383		; 0000017fH
	jmp	$eva_err$70625
$L70653:

; 384  : 	pl->nb = DYNTAB_TOUL(&cgival);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [edx+216], eax

; 385  : 	if(pl->nb <= 0) pl->nb = 1;

	mov	eax, DWORD PTR _pl$[ebp]
	cmp	DWORD PTR [eax+216], 0
	ja	SHORT $L70655
	mov	ecx, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [ecx+216], 1
$L70655:

; 386  : 
; 387  : 	/* Read period unit - 3rd in period controls */
; 388  : 	DYNTAB_FREE(cgival);

	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 389  : 	if(qry_obj_field(cntxt, &data, DYNTAB_TOULRC(&pl->periodctl, 2, 0), "_EVA_FIELD")) STACK_ERROR;

	push	OFFSET FLAT:$SG70658
	push	10					; 0000000aH
	push	0
	push	0
	push	2
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 136				; 00000088H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70657
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 389		; 00000185H
	jmp	$eva_err$70625
$L70657:

; 390  : 	if(data.cell && data.cell->txt && form_get_field_values(cntxt, &cgival, data.cell->txt, 0, 0)) STACK_ERROR;

	cmp	DWORD PTR _data$[ebp+16], 0
	je	SHORT $L70659
	mov	ecx, DWORD PTR _data$[ebp+16]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70659
	push	0
	push	0
	mov	edx, DWORD PTR _data$[ebp+16]
	mov	eax, DWORD PTR [edx]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_get_field_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70659
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 390		; 00000186H
	jmp	$eva_err$70625
$L70659:

; 391  : 	pl->unit = *dyntab_val(&cgival, 0, 0);

	push	0
	push	0
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _pl$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR [edx+220], al

; 392  : 	if(!pl->unit) pl->unit = 'D';

	mov	ecx, DWORD PTR _pl$[ebp]
	movsx	edx, BYTE PTR [ecx+220]
	test	edx, edx
	jne	SHORT $L70660
	mov	eax, DWORD PTR _pl$[ebp]
	mov	BYTE PTR [eax+220], 68			; 00000044H
$L70660:

; 393  : 
; 394  : 	/* Read # of frames - 4th in period controls */
; 395  : 	DYNTAB_FREE(cgival);

	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 396  : 	if(qry_obj_field(cntxt, &data, DYNTAB_TOULRC(&pl->periodctl, 3, 0), "_EVA_FIELD")) STACK_ERROR;

	push	OFFSET FLAT:$SG70663
	push	10					; 0000000aH
	push	0
	push	0
	push	3
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 136				; 00000088H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70662
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 396		; 0000018cH
	jmp	$eva_err$70625
$L70662:

; 397  : 	if(data.cell && data.cell->txt && form_get_field_values(cntxt, &cgival, data.cell->txt, 0, 0)) STACK_ERROR;

	cmp	DWORD PTR _data$[ebp+16], 0
	je	SHORT $L70664
	mov	eax, DWORD PTR _data$[ebp+16]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70664
	push	0
	push	0
	mov	ecx, DWORD PTR _data$[ebp+16]
	mov	edx, DWORD PTR [ecx]
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_get_field_values
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70664
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 397		; 0000018dH
	jmp	$eva_err$70625
$L70664:

; 398  : 	pl->frames = DYNTAB_TOUL(&cgival);

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
	mov	ecx, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [ecx+224], eax

; 399  : 	if(pl->frames <= 0) pl->frames = 1;

	mov	edx, DWORD PTR _pl$[ebp]
	cmp	DWORD PTR [edx+224], 0
	ja	SHORT $L70666
	mov	eax, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [eax+224], 1
$L70666:

; 400  : 
; 401  : 	/* Add date condition */
; 402  : 	delay_to_datetxt(dateend, pl->datebeg, pl->nb * pl->frames, pl->unit);

	mov	ecx, DWORD PTR _pl$[ebp]
	mov	dl, BYTE PTR [ecx+220]
	push	edx
	mov	eax, DWORD PTR _pl$[ebp]
	mov	ecx, DWORD PTR _pl$[ebp]
	mov	edx, DWORD PTR [eax+216]
	imul	edx, DWORD PTR [ecx+224]
	push	edx
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 200				; 000000c8H
	push	eax
	lea	ecx, DWORD PTR _dateend$[ebp]
	push	ecx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 403  : 	ndbeg = flt.node + flt.nbnode++;

	mov	edx, DWORD PTR _flt$[ebp+4424]
	imul	edx, 136				; 00000088H
	lea	eax, DWORD PTR _flt$[ebp+edx+72]
	mov	DWORD PTR _ndbeg$[ebp], eax
	mov	ecx, DWORD PTR _flt$[ebp+4424]
	add	ecx, 1
	mov	DWORD PTR _flt$[ebp+4424], ecx

; 404  : 	if(qry_obj_field(cntxt, &ndbeg->field, strtoul(CTRL_ATTR_VAL(CTRL_DATE_BEG), NULL, 10), "_EVA_FIELD")) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70914
	push	0
	push	-1
	push	OFFSET FLAT:$SG70670
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4580+[ebp], eax
	jmp	SHORT $L70915
$L70914:
	mov	DWORD PTR -4580+[ebp], OFFSET FLAT:$SG70671
$L70915:
	push	OFFSET FLAT:$SG70669
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR -4580+[ebp]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _ndbeg$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70668
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 404		; 00000194H
	jmp	$eva_err$70625
$L70668:

; 405  : 
; 406  : 	/* Handle end date mode */
; 407  : 	if(!strcmp(dateend_mode, "_EVA_DATE"))

	push	OFFSET FLAT:$SG70673
	mov	ecx, DWORD PTR _dateend_mode$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70672

; 409  : 		/* Date field for end date select events on both dates */
; 410  : 		DYNTAB_ADD(&ndbeg->value, 0, 0, dateend, 8, NO_CONV);

	push	0
	push	0
	push	8
	lea	edx, DWORD PTR _dateend$[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _ndbeg$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70675
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70677
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 410		; 0000019aH
	jmp	$eva_err$70625
$L70675:

; 411  : 		ndbeg->match = SmallerEqual;

	mov	eax, DWORD PTR _ndbeg$[ebp]
	mov	DWORD PTR [eax+24], 18			; 00000012H

; 412  : 
; 413  : 		/* Use 2nd node for end date */
; 414  : 		ndend = flt.node + flt.nbnode++;

	mov	ecx, DWORD PTR _flt$[ebp+4424]
	imul	ecx, 136				; 00000088H
	lea	edx, DWORD PTR _flt$[ebp+ecx+72]
	mov	DWORD PTR _ndend$[ebp], edx
	mov	eax, DWORD PTR _flt$[ebp+4424]
	add	eax, 1
	mov	DWORD PTR _flt$[ebp+4424], eax

; 415  : 		if(qry_obj_field(cntxt, &ndend->field, strtoul(CTRL_ATTR_VAL(CTRL_DATE_END), NULL, 10), "_EVA_FIELD")) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70916
	push	0
	push	-1
	push	OFFSET FLAT:$SG70681
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4584+[ebp], eax
	jmp	SHORT $L70917
$L70916:
	mov	DWORD PTR -4584+[ebp], OFFSET FLAT:$SG70682
$L70917:
	push	OFFSET FLAT:$SG70680
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR -4584+[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _ndend$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70679
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 415		; 0000019fH
	jmp	$eva_err$70625
$L70679:

; 416  : 		DYNTAB_ADD(&ndend->value, 0, 0, pl->datebeg, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 200				; 000000c8H
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _ndend$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70684
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70686
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 416		; 000001a0H
	jmp	$eva_err$70625
$L70684:

; 417  : 		ndend->match = LargerEqual;

	mov	ecx, DWORD PTR _ndend$[ebp]
	mov	DWORD PTR [ecx+24], 16			; 00000010H

; 419  : 	else

	jmp	$L70687
$L70672:

; 421  : 		/* Events on one day (no duration) : use InBound operator on date node */
; 422  : 		DYNTAB_ADD(&ndbeg->value, 0, 0, pl->datebeg, 8, NO_CONV);

	push	0
	push	0
	push	8
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 200				; 000000c8H
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _ndbeg$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70689
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70691
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 422		; 000001a6H
	jmp	$eva_err$70625
$L70689:

; 423  : 		DYNTAB_ADD(&ndbeg->value, 1, 0, dateend, 8, NO_CONV);

	push	0
	push	0
	push	8
	lea	eax, DWORD PTR _dateend$[ebp]
	push	eax
	push	0
	push	1
	mov	ecx, DWORD PTR _ndbeg$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70693
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70695
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 423		; 000001a7H
	jmp	$eva_err$70625
$L70693:

; 424  : 		ndbeg->match = InBound;

	mov	ecx, DWORD PTR _ndbeg$[ebp]
	mov	DWORD PTR [ecx+24], 19			; 00000013H

; 425  : 		ndend = ndbeg;

	mov	edx, DWORD PTR _ndbeg$[ebp]
	mov	DWORD PTR _ndend$[ebp], edx
$L70687:

; 427  : 
; 428  : 	/* Add row node */
; 429  : 	nrow = flt.node + flt.nbnode++;

	mov	eax, DWORD PTR _flt$[ebp+4424]
	imul	eax, 136				; 00000088H
	lea	ecx, DWORD PTR _flt$[ebp+eax+72]
	mov	DWORD PTR _nrow$[ebp], ecx
	mov	edx, DWORD PTR _flt$[ebp+4424]
	add	edx, 1
	mov	DWORD PTR _flt$[ebp+4424], edx

; 430  : 	idctrl = strtoul(CTRL_ATTR_VAL(CTRL_ROWS), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70918
	push	0
	push	-1
	push	OFFSET FLAT:$SG70697
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4588+[ebp], eax
	jmp	SHORT $L70919
$L70918:
	mov	DWORD PTR -4588+[ebp], OFFSET FLAT:$SG70698
$L70919:
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR -4588+[ebp]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idctrl$[ebp], eax

; 431  : 	if(qry_obj_field(cntxt, &nrow->field, idctrl, "_EVA_FIELD")) STACK_ERROR;

	push	OFFSET FLAT:$SG70700
	mov	edx, DWORD PTR _idctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _nrow$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70699
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 431		; 000001afH
	jmp	$eva_err$70625
$L70699:

; 432  : 	if(qry_obj_field(cntxt, &data, idctrl, "_EVA_BASE_FORMS")) STACK_ERROR;

	push	OFFSET FLAT:$SG70702
	mov	eax, DWORD PTR _idctrl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70701
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 432		; 000001b0H
	jmp	$eva_err$70625
$L70701:

; 433  : 	pl->titleform = DYNTAB_TOUL(&data);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [edx+64], eax

; 434  : 
; 435  : 	/* Build query from filter - add date & .Line fields */
; 436  : 	if(qry_build_clauses(cntxt, &flt, 1)) STACK_ERROR;

	push	1
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_clauses
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70704
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 436		; 000001b4H
	jmp	$eva_err$70625
$L70704:

; 437  : 	DYNBUF_ADD3_INT(&flt.optselect, "TLink", nrow->curjoin, ".IdRelObj AS RowObj,");

	push	20					; 00000014H
	push	OFFSET FLAT:$SG70706
	mov	eax, DWORD PTR _nrow$[ebp]
	mov	ecx, DWORD PTR [eax+60]
	push	ecx
	push	5
	push	OFFSET FLAT:$SG70707
	lea	edx, DWORD PTR _flt$[ebp+32]
	push	edx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70705
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70709
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 437		; 000001b5H
	jmp	$eva_err$70625
$L70705:

; 438  : 	DYNBUF_ADD3_INT(&flt.optselect, "TVal", ndbeg->curjoin, ".TxtValue AS DateBeg,");

	push	21					; 00000015H
	push	OFFSET FLAT:$SG70711
	mov	edx, DWORD PTR _ndbeg$[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	push	4
	push	OFFSET FLAT:$SG70712
	lea	ecx, DWORD PTR _flt$[ebp+32]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70710
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70714
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 438		; 000001b6H
	jmp	$eva_err$70625
$L70710:

; 439  : 	DYNBUF_ADD3_INT(&flt.optselect, "TVal", ndend->curjoin, ".TxtValue AS DateEnd");

	push	20					; 00000014H
	push	OFFSET FLAT:$SG70716
	mov	ecx, DWORD PTR _ndend$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	push	4
	push	OFFSET FLAT:$SG70717
	lea	eax, DWORD PTR _flt$[ebp+32]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70715
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70719
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 439		; 000001b7H
	jmp	$eva_err$70625
$L70715:

; 440  : 	if(qry_build_flt_select(cntxt, &sql, &empty, &flt, 0, 0)) STACK_ERROR;

	push	0
	push	0
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _empty$[ebp]
	push	ecx
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_flt_select
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70720
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 440		; 000001b8H
	jmp	$eva_err$70625
$L70720:

; 441  : 
; 442  : 	/* Execute query - place result in pl->objlist & sort by row & date */
; 443  : 	if(qry_exec_filter(cntxt, &flt, sql->data) || sql_get_table(cntxt, &pl->objdates, 0)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_exec_filter
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70722
	push	0
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 156				; 0000009cH
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70721
$L70722:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 443		; 000001bbH
	jmp	$eva_err$70625
$L70721:

; 444  : 	if(!pl->objdates.nbrows) RETURN_OK;

	mov	edx, DWORD PTR _pl$[ebp]
	cmp	DWORD PTR [edx+156], 0
	jne	SHORT $L70723
	jmp	$eva_noerr$70724
$L70723:

; 445  : 	dyntab_sort(&pl->objdates, qsort_objdates);

	push	OFFSET FLAT:_qsort_objdates
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 156				; 0000009cH
	push	eax
	call	_dyntab_sort
	add	esp, 8

; 446  : 
; 447  : 	/* Build events title & color */
; 448  : 	if(qry_obj_field(cntxt, &pl->titlefield, strtoul(CTRL_ATTR_VAL(CTRL_DISPLAY), NULL, 10), "_EVA_FIELD,_EVA_SRCFIELD")) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70920
	push	0
	push	-1
	push	OFFSET FLAT:$SG70728
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4592+[ebp], eax
	jmp	SHORT $L70921
$L70920:
	mov	DWORD PTR -4592+[ebp], OFFSET FLAT:$SG70729
$L70921:
	push	OFFSET FLAT:$SG70727
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR -4592+[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70726
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 448		; 000001c0H
	jmp	$eva_err$70625
$L70726:

; 449  : 	if(qry_add_table_col(cntxt, &pl->objdates, DYNTAB_VAL_SZ(&pl->titlefield, 0, 0))) STACK_ERROR;

	push	0
	push	0
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 156				; 0000009cH
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70730
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 449		; 000001c1H
	jmp	$eva_err$70625
$L70730:

; 450  : 	if(qry_obj_field(cntxt, &pl->colorfield, strtoul(CTRL_ATTR_VAL(CTRL_COLOR), NULL, 10), "_EVA_FIELD,_EVA_SRCFIELD")) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70922
	push	0
	push	-1
	push	OFFSET FLAT:$SG70734
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4596+[ebp], eax
	jmp	SHORT $L70923
$L70922:
	mov	DWORD PTR -4596+[ebp], OFFSET FLAT:$SG70735
$L70923:
	push	OFFSET FLAT:$SG70733
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR -4596+[ebp]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 68					; 00000044H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70732
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 450		; 000001c2H
	jmp	$eva_err$70625
$L70732:

; 451  : 	if(qry_add_table_col(cntxt, &pl->objdates, DYNTAB_VAL_SZ(&pl->colorfield, 0, 0))) STACK_ERROR;

	push	0
	push	0
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 68					; 00000044H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 68					; 00000044H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 156				; 0000009cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70736
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 451		; 000001c3H
	jmp	$eva_err$70625
$L70736:

; 452  : 
; 453  : 	/* Handle HTML format for events title */
; 454  : 	if(qry_obj_field(cntxt, &data, strtoul(CTRL_ATTR_VAL(CTRL_DISPLAY), NULL, 10), "_EVA_DISPLAYFORMAT")) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70924
	push	0
	push	-1
	push	OFFSET FLAT:$SG70740
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4600+[ebp], eax
	jmp	SHORT $L70925
$L70924:
	mov	DWORD PTR -4600+[ebp], OFFSET FLAT:$SG70741
$L70925:
	push	OFFSET FLAT:$SG70739
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR -4600+[ebp]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70738
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 454		; 000001c6H
	jmp	$eva_err$70625
$L70738:

; 455  : 	if(strcmp(dyntab_val(&data, 0, 0), "_EVA_HTML")) pl->titleconv = plain_to_html;

	push	OFFSET FLAT:$SG70743
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70742
	mov	eax, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [eax+108], OFFSET FLAT:_plain_to_html
$L70742:

; 456  : 
; 457  : 	/* Build events tooltip */
; 458  : 	if(qry_obj_field(cntxt, &pl->detailfield, strtoul(CTRL_ATTR_VAL(CTRL_TOOLTIP), NULL, 10), "_EVA_FIELD,_EVA_SRCFIELD")) STACK_ERROR;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70926
	push	0
	push	-1
	push	OFFSET FLAT:$SG70747
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4604+[ebp], eax
	jmp	SHORT $L70927
$L70926:
	mov	DWORD PTR -4604+[ebp], OFFSET FLAT:$SG70748
$L70927:
	push	OFFSET FLAT:$SG70746
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR -4604+[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 88					; 00000058H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70745
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 458		; 000001caH
	jmp	$eva_err$70625
$L70745:

; 459  : 	if(qry_add_table_col(cntxt, &pl->objdates, DYNTAB_VAL_SZ(&pl->detailfield, 0, 0))) STACK_ERROR;

	push	0
	push	0
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 88					; 00000058H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 88					; 00000058H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 156				; 0000009cH
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_add_table_col
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70749
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 459		; 000001cbH
	jmp	$eva_err$70625
$L70749:

; 460  : 
; 461  : 	/* Gather rows in a separate table with sorted distinct values */
; 462  : 	if(dyntab_from_tab(&pl->rows, 0, 0, &pl->objdates, 0, 1, pl->objdates.nbrows, 2, 1)) RETURN_ERR_MEMORY;

	push	1
	push	2
	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR [edx+156]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 156				; 0000009cH
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 176				; 000000b0H
	push	edx
	call	_dyntab_from_tab
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70750
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70752
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 462		; 000001ceH
	jmp	$eva_err$70625
$L70750:

; 463  : 	dyntab_sort(&pl->rows, qsort_col0i);

	push	OFFSET FLAT:_qsort_col0i
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 176				; 000000b0H
	push	edx
	call	_dyntab_sort
	add	esp, 8

; 464  : 	dyntab_group(&pl->rows, "DISTINCT");

	push	OFFSET FLAT:$SG70753
	mov	eax, DWORD PTR _pl$[ebp]
	add	eax, 176				; 000000b0H
	push	eax
	call	_dyntab_group
	add	esp, 8

; 465  : 
; 466  : 	/* Handle rows title & format */
; 467  : 	idctrl = strtoul(CTRL_ATTR_VAL(CTRL_ROW_TITLE), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70928
	push	0
	push	-1
	push	OFFSET FLAT:$SG70755
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4608+[ebp], eax
	jmp	SHORT $L70929
$L70928:
	mov	DWORD PTR -4608+[ebp], OFFSET FLAT:$SG70756
$L70929:
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR -4608+[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idctrl$[ebp], eax

; 468  : 	if(qry_obj_field(cntxt, &pl->rowlabel, idctrl, "_EVA_LABEL")) STACK_ERROR;

	push	OFFSET FLAT:$SG70758
	mov	eax, DWORD PTR _idctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 112				; 00000070H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70757
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 468		; 000001d4H
	jmp	$eva_err$70625
$L70757:

; 469  : 	if(qry_obj_idfield(cntxt, &data, idctrl, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _idctrl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70759
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 469		; 000001d5H
	jmp	$eva_err$70625
$L70759:

; 470  : 	DYNTAB_FIELD(&cgival, &data, FIELD)

	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70762
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70761
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70764
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 470		; 000001d6H
	jmp	$eva_err$70625
$L70761:

; 471  : 	if(!cgival.nbrows) DYNTAB_FIELD(&cgival, &data, SRCFIELD)

	cmp	DWORD PTR _cgival$[ebp], 0
	jne	SHORT $L70767
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70768
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	push	0
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70767
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70770
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 471		; 000001d7H
	jmp	$eva_err$70625
$L70767:

; 472  : 	if(cgival.nbrows)

	cmp	DWORD PTR _cgival$[ebp], 0
	je	$L70771

; 474  : 		M_FREE(sql);

	mov	eax, DWORD PTR _sql$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0

; 475  : 		if(qry_eval_sqlexpr_var(cntxt, &sql, cgival.cell->txt, &data, NULL)) STACK_ERROR;

	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgival$[ebp+16]
	mov	eax, DWORD PTR [edx]
	push	eax
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70773
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 475		; 000001dbH
	jmp	$eva_err$70625
$L70773:

; 476  : 		if(qry_obj_field(cntxt, &data, idctrl, "_EVA_DISPLAYFORMAT")) STACK_ERROR;

	push	OFFSET FLAT:$SG70775
	mov	ecx, DWORD PTR _idctrl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70774
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 476		; 000001dcH
	jmp	$eva_err$70625
$L70774:

; 477  : 		if(strcmp(dyntab_val(&data, 0, 0), "_EVA_HTML")) pl->rowtitleconv = plain_to_html;

	push	OFFSET FLAT:$SG70777
	push	0
	push	0
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70776
	mov	eax, DWORD PTR _pl$[ebp]
	mov	DWORD PTR [eax+132], OFFSET FLAT:_plain_to_html
$L70776:

; 478  : 
; 479  : 		/* Build rows title & sort on labels */
; 480  : 		for(i = 0; i < pl->rows.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70778
$L70779:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70778:
	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+176]
	jae	$L70780

; 482  : 			if(form_eval_fieldexpr(cntxt, &data, 0, DYNTAB_TOULRC(&pl->rows, i, 0), sql->data, sql->sz, NULL, 0)) CLEAR_ERROR;

	push	0
	push	0
	mov	ecx, DWORD PTR _sql$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _sql$[ebp]
	add	eax, 8
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 176				; 000000b0H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70783
	push	482					; 000001e2H
	push	OFFSET FLAT:$SG70784
	push	OFFSET FLAT:$SG70785
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70783:

; 483  : 			DYNTAB_ADD_CELL(&pl->rows, i, 1, &data, 0, 0);

	push	1
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 176				; 000000b0H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70786
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70788
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 483		; 000001e3H
	jmp	$eva_err$70625
$L70786:

; 484  : 		}

	jmp	$L70779
$L70780:

; 485  : 		dyntab_sort(&pl->rows, qsort_col1);

	push	OFFSET FLAT:_qsort_col1
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 176				; 000000b0H
	push	edx
	call	_dyntab_sort
	add	esp, 8
$L70771:

; 487  : 
; 488  : 	/* Read other display parameters */
; 489  : 	pl->we_bgcolor = CTRL_ATTR_CELL(WEEKEND_BGCOLOR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70930
	push	0
	push	-1
	push	OFFSET FLAT:$SG70790
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4612+[ebp], eax
	jmp	SHORT $L70931
$L70930:
	mov	DWORD PTR -4612+[ebp], 0
$L70931:
	mov	ecx, DWORD PTR _pl$[ebp]
	mov	edx, DWORD PTR -4612+[ebp]
	mov	DWORD PTR [ecx+228], edx

; 490  : 	pl->today_bgcolor = CTRL_ATTR_CELL(TODAY_BGCOLOR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70932
	push	0
	push	-1
	push	OFFSET FLAT:$SG70792
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -4616+[ebp], eax
	jmp	SHORT $L70933
$L70932:
	mov	DWORD PTR -4616+[ebp], 0
$L70933:
	mov	ecx, DWORD PTR _pl$[ebp]
	mov	edx, DWORD PTR -4616+[ebp]
	mov	DWORD PTR [ecx+232], edx
$eva_noerr$70724:

; 491  : 
; 492  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70793
	push	OFFSET FLAT:$SG70794
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70625:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70795
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70796
	push	OFFSET FLAT:$SG70797
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70795:
	lea	edx, DWORD PTR _empty$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	lea	eax, DWORD PTR _flt$[ebp]
	push	eax
	call	_qry_build_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 493  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_read_planning_data ENDP
_TEXT	ENDS
PUBLIC	_ctrl_output_planning
_DATA	SEGMENT
$SG70815 DB	'_EVA_DEBUG_SQL_EXPR', 00H
$SG70820 DB	'<table cellpadding=0 cellspacing=0 style=''border-collap'
	DB	'se:collapse''>', 00H
	ORG $+3
$SG70822 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70828 DB	'></td></tr>', 00H
$SG70829 DB	'<tr><td height=10 colspan=', 00H
	ORG $+1
$SG70831 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70835 DB	'</table>', 00H
	ORG $+3
$SG70837 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70839 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_plan'
	DB	'ning.c', 00H
	ORG $+1
$SG70840 DB	'ctrl_output_planning', 00H
	ORG $+3
$SG70842 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_plan'
	DB	'ning.c', 00H
	ORG $+1
$SG70843 DB	'ctrl_output_planning', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -20
__pl$ = -312
_pl$ = -12
_i$ = -16
_sql_trace$ = -8
_ctrl_output_planning PROC NEAR

; 506  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 316				; 0000013cH
	push	edi

; 507  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 508  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 509  : 	EVA_planning _pl = {0}, *pl = &_pl;

	mov	DWORD PTR __pl$[ebp], 0
	mov	ecx, 72					; 00000048H
	xor	eax, eax
	lea	edi, DWORD PTR __pl$[ebp+4]
	rep stosd
	lea	edx, DWORD PTR __pl$[ebp]
	mov	DWORD PTR _pl$[ebp], edx

; 510  : 	unsigned long i;
; 511  : 	int sql_trace = cntxt->sql_trace;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29852]
	mov	DWORD PTR _sql_trace$[ebp], ecx

; 512  : 
; 513  : 	/* Read planning data */
; 514  : 	pl->i_ctrl = i_ctrl;

	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	mov	DWORD PTR [edx], eax

; 515  : 	if(CTRL_ATTR_CELL(DEBUG_SQL_EXPR)) cntxt->sql_trace = 2;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70936
	push	0
	push	-1
	push	OFFSET FLAT:$SG70815
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -316+[ebp], eax
	jmp	SHORT $L70937
$L70936:
	mov	DWORD PTR -316+[ebp], 0
$L70937:
	cmp	DWORD PTR -316+[ebp], 0
	je	SHORT $L70814
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29852], 2
$L70814:

; 516  : 	if(ctrl_read_planning_data(cntxt, pl)) STACK_ERROR;

	mov	eax, DWORD PTR _pl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_read_planning_data
	add	esp, 8
	test	eax, eax
	je	SHORT $L70816
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 516		; 00000204H
	jmp	$eva_err$70817
$L70816:

; 517  : 
; 518  : 	/* Output table header */
; 519  : 	DYNBUF_ADD_STR(form->html, "<table cellpadding=0 cellspacing=0 style='border-collapse:collapse'>");

	push	0
	push	0
	push	68					; 00000044H
	push	OFFSET FLAT:$SG70820
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70819
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70822
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 519		; 00000207H
	jmp	$eva_err$70817
$L70819:

; 520  : 
; 521  : 	/* Output each frame */
; 522  : 	for(i = 0; i < pl->frames; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70823
$L70824:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70823:
	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+224]
	jae	$L70825

; 524  : 		if(i) DYNBUF_ADD3_INT(form->html, "<tr><td height=10 colspan=", pl->nb * (pl->unit == 'M' ? 31 : 1) + 10,"></td></tr>");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70827
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70828
	mov	ecx, DWORD PTR _pl$[ebp]
	movsx	edx, BYTE PTR [ecx+220]
	sub	edx, 77					; 0000004dH
	neg	edx
	sbb	edx, edx
	and	edx, -30				; ffffffe2H
	add	edx, 31					; 0000001fH
	mov	eax, DWORD PTR _pl$[ebp]
	mov	ecx, DWORD PTR [eax+216]
	imul	ecx, edx
	add	ecx, 10					; 0000000aH
	push	ecx
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG70829
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70827
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70831
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 524		; 0000020cH
	jmp	$eva_err$70817
$L70827:

; 525  : 		delay_to_datetxt(pl->framebeg, pl->datebeg, i * pl->nb, pl->unit);

	mov	eax, DWORD PTR _pl$[ebp]
	mov	cl, BYTE PTR [eax+220]
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, DWORD PTR [edx+216]
	push	eax
	mov	ecx, DWORD PTR _pl$[ebp]
	add	ecx, 200				; 000000c8H
	push	ecx
	mov	edx, DWORD PTR _pl$[ebp]
	add	edx, 244				; 000000f4H
	push	edx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H

; 526  : 		if(ctrl_output_planning_frame(cntxt, pl)) STACK_ERROR;

	mov	eax, DWORD PTR _pl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_output_planning_frame
	add	esp, 8
	test	eax, eax
	je	SHORT $L70832
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 526		; 0000020eH
	jmp	SHORT $eva_err$70817
$L70832:

; 527  : 	}

	jmp	$L70824
$L70825:

; 528  : 	DYNBUF_ADD_STR(form->html, "</table>");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70835
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70834
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70837
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 528		; 00000210H
	jmp	SHORT $eva_err$70817
$L70834:
$eva_noerr$70838:

; 529  : 
; 530  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70839
	push	OFFSET FLAT:$SG70840
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70817:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70841
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70842
	push	OFFSET FLAT:$SG70843
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70841:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [eax+29852], ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 531  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_output_planning ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_output_planning
EXTRN	_ctrl_add_child:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_ctrl_put_table_header:NEAR
EXTRN	_ctrl_put_table_footer:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70857 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70859 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70873 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_plan'
	DB	'ning.c', 00H
	ORG $+1
$SG70874 DB	'ctrl_add_output_planning', 00H
	ORG $+3
$SG70878 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_plan'
	DB	'ning.c', 00H
	ORG $+1
$SG70879 DB	'ctrl_add_output_planning', 00H
	ORG $+3
$SG70881 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_output_plan'
	DB	'ning.c', 00H
	ORG $+1
$SG70882 DB	'ctrl_add_output_planning', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -24
_ctrl$ = -28
_ctrltree$ = -20
_ctrl_add_output_planning PROC NEAR

; 544  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

; 545  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 546  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 547  : 	DynTable ctrltree = { 0 };

	mov	DWORD PTR _ctrltree$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _ctrltree$[ebp+4], edx
	mov	DWORD PTR _ctrltree$[ebp+8], edx
	mov	DWORD PTR _ctrltree$[ebp+12], edx
	mov	DWORD PTR _ctrltree$[ebp+16], edx

; 548  : 
; 549  : 	/* Read period controls */
; 550  : 	CTRL_ATTR(ctrltree, CTRLTREE);

	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70857
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70856
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70859
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 550		; 00000226H
	jmp	$eva_err$70860
$L70856:

; 551  : 
; 552  : 	switch(form->step)
; 553  : 	{

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR -32+[ebp], eax
	cmp	DWORD PTR -32+[ebp], 4
	je	SHORT $L70865
	cmp	DWORD PTR -32+[ebp], 5
	jle	$L70876
	cmp	DWORD PTR -32+[ebp], 7
	jle	SHORT $L70865
	jmp	$L70876
$L70865:

; 554  : 	case HtmlEdit:
; 555  : 	case HtmlPrint:
; 556  : 	case HtmlView:
; 557  : 		if(!form->html) RETURN_OK;

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+232], 0
	jne	SHORT $L70866
	jmp	$eva_noerr$70867
$L70866:

; 558  : 
; 559  : 		/* Add period controls */
; 560  : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70868
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 560		; 00000230H
	jmp	$eva_err$70860
$L70868:

; 561  : 		if(ctrl_put_table_header(cntxt, ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_put_table_header
	add	esp, 8
	test	eax, eax
	je	SHORT $L70869
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 561		; 00000231H
	jmp	$eva_err$70860
$L70869:

; 562  : 		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70870
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 562		; 00000232H
	jmp	$eva_err$70860
$L70870:
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 563  : 		if(ctrl_put_table_footer(cntxt, ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_put_table_footer
	add	esp, 8
	test	eax, eax
	je	SHORT $L70871
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 563		; 00000233H
	jmp	$eva_err$70860
$L70871:

; 564  : 
; 565  : 		/* Output planning */
; 566  : 		if(ctrl_output_planning(cntxt, i_ctrl)) CLEAR_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_output_planning
	add	esp, 8
	test	eax, eax
	je	SHORT $L70872
	push	566					; 00000236H
	push	OFFSET FLAT:$SG70873
	push	OFFSET FLAT:$SG70874
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L70872:

; 567  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70875
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 567		; 00000237H
	jmp	SHORT $eva_err$70860
$L70875:

; 568  : 		break;

	jmp	SHORT $eva_noerr$70867
$L70876:

; 569  : 
; 570  : 	default:
; 571  : 		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70877
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 571		; 0000023bH
	jmp	SHORT $eva_err$70860
$L70877:
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	mov	DWORD PTR _ctrl$[ebp], eax
$eva_noerr$70867:

; 573  : 
; 574  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70878
	push	OFFSET FLAT:$SG70879
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70860:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70880
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70881
	push	OFFSET FLAT:$SG70882
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70880:
	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 575  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_output_planning ENDP
_TEXT	ENDS
END
