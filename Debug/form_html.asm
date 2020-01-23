	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_html.c
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
PUBLIC	_form_put_html
PUBLIC	_form_status_data
PUBLIC	_form_tab_selection
EXTRN	_put_html_table_header:NEAR
EXTRN	_put_html_button_sz:NEAR
EXTRN	_cgi_build_basename:NEAR
EXTRN	_cgi_value_setkeep:NEAR
EXTRN	_get_image_file:NEAR
EXTRN	_ctrl_add_tab_header:NEAR
EXTRN	_atoi:NEAR
EXTRN	_form_mode_values:NEAR
EXTRN	_form_mode_search:NEAR
EXTRN	_form_mode_list:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_ctrl_put_label:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_ctrl_put_table_header:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_dyntab_cmp:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
$SG70235 DB	01H DUP (?)
	ALIGN	4

$SG70282 DB	01H DUP (?)
	ALIGN	4

$SG70381 DB	01H DUP (?)
	ALIGN	4

$SG70382 DB	01H DUP (?)
	ALIGN	4

$SG70391 DB	01H DUP (?)
	ALIGN	4

$SG70393 DB	01H DUP (?)
	ALIGN	4

$SG70398 DB	01H DUP (?)
	ALIGN	4

$SG70406 DB	01H DUP (?)
	ALIGN	4

$SG70410 DB	01H DUP (?)
	ALIGN	4

$SG70414 DB	01H DUP (?)
	ALIGN	4

$SG70417 DB	01H DUP (?)
	ALIGN	4

$SG70418 DB	01H DUP (?)
	ALIGN	4

$SG70421 DB	01H DUP (?)
	ALIGN	4

$SG70424 DB	01H DUP (?)
	ALIGN	4

$SG70450 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70219 DB	'_EVA_MENUPOS', 00H
	ORG $+3
$SG70222 DB	'_EVA_AUTO_TITLEBAR', 00H
	ORG $+1
$SG70223 DB	'+0', 00H
	ORG $+1
$SG70224 DB	'1', 00H
	ORG $+2
$SG70227 DB	'<table border=0 rules=none cellspacing=0 cellpadding=0 w'
	DB	'idth=100%', 00H
	ORG $+2
$SG70229 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70231 DB	'_EVA_TITLE_BGCOLOR', 00H
	ORG $+1
$SG70236 DB	' bgcolor=#', 00H
	ORG $+1
$SG70238 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70239 DB	'_EVA_TITLE_BACKGROUND', 00H
	ORG $+2
$SG70243 DB	'''', 00H
	ORG $+2
$SG70244 DB	' background=''', 00H
	ORG $+2
$SG70246 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70249 DB	'><tr>', 00H
	ORG $+2
$SG70251 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70253 DB	'_EVA_NewColumn', 00H
	ORG $+1
$SG70256 DB	'<td align=right>', 00H
	ORG $+3
$SG70258 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70264 DB	'CLOSE', 00H
	ORG $+2
$SG70265 DB	'Ferme le formulaire', 00H
$SG70266 DB	'_eva_close_s.gif', 00H
	ORG $+3
$SG70267 DB	'_eva_close.gif', 00H
	ORG $+1
$SG70270 DB	'</td></tr></table></font>', 00H
	ORG $+2
$SG70272 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70278 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70279 DB	'_EVA_NewColumn', 00H
	ORG $+1
$SG70280 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70281 DB	'_EVA_TABLEALIGN', 00H
$SG70284 DB	'_EVA_FORM_BGCOLOR', 00H
	ORG $+2
$SG70286 DB	'_EVA_FORM_BACKGROUND', 00H
	ORG $+3
$SG70291 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70299 DB	' -->', 0aH, 00H
	ORG $+2
$SG70300 DB	0aH, '<!--- Start Form ', 00H
	ORG $+1
$SG70302 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70306 DB	''' value=''', 00H
	ORG $+2
$SG70307 DB	'<input type=hidden name=''', 00H
	ORG $+2
$SG70309 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70313 DB	'''>', 00H
	ORG $+1
$SG70315 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70319 DB	0aH, 00H
	ORG $+2
$SG70321 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70326 DB	'''>', 00H
	ORG $+1
$SG70327 DB	'<font face=''', 00H
	ORG $+3
$SG70329 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70338 DB	'</td></tr><tr>', 00H
	ORG $+1
$SG70339 DB	'<td colspan=2>', 00H
	ORG $+1
$SG70341 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70356 DB	'</font></td>', 00H
	ORG $+3
$SG70357 DB	'<td><font face=Arial><b>', 00H
	ORG $+3
$SG70359 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70366 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70369 DB	'<td valign=top>', 00H
$SG70371 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70380 DB	'_EVA_INNERBORDER', 00H
	ORG $+3
$SG70383 DB	'top', 00H
$SG70390 DB	'_EVA_CELLPADDING', 00H
	ORG $+3
$SG70392 DB	'_EVA_CELLSPACING', 00H
	ORG $+3
$SG70397 DB	'</tr></table>', 00H
	ORG $+2
$SG70400 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70404 DB	'_EVA_LEFT', 00H
	ORG $+2
$SG70405 DB	'_EVA_TABS_POS', 00H
	ORG $+2
$SG70409 DB	'_EVA_TABHEIGHT', 00H
	ORG $+1
$SG70413 DB	'_EVA_TABBGCOLOR', 00H
$SG70416 DB	'_EVA_TABBGCOLOR', 00H
$SG70420 DB	'_EVA_TABBACKGROUND', 00H
	ORG $+1
$SG70423 DB	'_EVA_TABBACKGROUND', 00H
	ORG $+1
$SG70425 DB	'_EVA_NewColumn', 00H
	ORG $+1
$SG70426 DB	'_EVA_NewLine', 00H
	ORG $+3
$SG70427 DB	'top', 00H
$SG70428 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70432 DB	'</tr><tr>', 00H
	ORG $+2
$SG70434 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70439 DB	'<td colspan=2 bgcolor=black height=1></td></tr><tr><td c'
	DB	'olspan=2><table cellpadding=0 cellspacing=0 border=0 width=10'
	DB	'0%><tr>', 00H
	ORG $+3
$SG70441 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70449 DB	'</tr></table>', 00H
	ORG $+2
$SG70452 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70457 DB	'</tr></table></td>', 00H
	ORG $+1
$SG70459 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70463 DB	'</tr></table></td>', 00H
	ORG $+1
$SG70465 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70470 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70476 DB	'<tr>', 00H
	ORG $+3
$SG70480 DB	'</tr>', 00H
	ORG $+2
$SG70482 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70485 DB	'</table>', 00H
	ORG $+3
$SG70487 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70491 DB	'</font>', 00H
$SG70493 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70497 DB	' -->', 0aH, 00H
	ORG $+2
$SG70498 DB	0aH, '<!--- EndOf Form ', 00H
	ORG $+1
$SG70500 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70502 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_html.c', 00H
$SG70503 DB	'form_put_html', 00H
	ORG $+2
$SG70505 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_html.c', 00H
$SG70506 DB	'form_put_html', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_form$ = -8
_ctrl$ = -36
_align$ = -20
_bgcolor$ = -24
_background$ = -12
_img$ = -16
_cellwidth$ = -28
_name$ = -32
_rightmenu$ = -4
__i$70292 = -40
_b_left$70403 = -48
_tab$70407 = -44
_b$70471 = -52
_txt$70472 = -56
_len$70474 = -60
_form_put_html PROC NEAR

; 25   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 156				; 0000009cH

; 26   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 27   : 	EVA_ctrl *ctrl = form ? form->ctrl : NULL;

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L70723
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L70724
$L70723:
	mov	DWORD PTR -64+[ebp], 0
$L70724:
	mov	ecx, DWORD PTR -64+[ebp]
	mov	DWORD PTR _ctrl$[ebp], ecx

; 28   : 	char *align;
; 29   : 	char *bgcolor;
; 30   : 	char *background;
; 31   : 	char *img = NULL;

	mov	DWORD PTR _img$[ebp], 0

; 32   : 	char *cellwidth;
; 33   : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 34   : 	int rightmenu = *DYNTAB_FIELD_VAL(&cntxt->user_data, MENUPOS) == '1';

	push	0
	push	-1
	push	OFFSET FLAT:$SG70219
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29428				; 000072f4H
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	movsx	eax, BYTE PTR [eax]
	xor	ecx, ecx
	cmp	eax, 49					; 00000031H
	sete	cl
	mov	DWORD PTR _rightmenu$[ebp], ecx

; 35   : 
; 36   : 	/* Build default title if applicable */
; 37   : 	if(!form->html_title && CTRL_ATTR_CELL(AUTO_TITLEBAR))

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+212], 0
	jne	$L70221
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70725
	push	0
	push	-1
	push	OFFSET FLAT:$SG70222
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -68+[ebp], eax
	jmp	SHORT $L70726
$L70725:
	mov	DWORD PTR -68+[ebp], 0
$L70726:
	cmp	DWORD PTR -68+[ebp], 0
	je	$L70221

; 39   : 		ctrl->LABELFONTSIZE = "+0";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+412], OFFSET FLAT:$SG70223

; 40   : 		ctrl->LABELBOLD = "1";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+420], OFFSET FLAT:$SG70224

; 41   : 		form->html = &form->html_title;

	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 212				; 000000d4H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+232], eax

; 43   : 			"<table border=0 rules=none cellspacing=0 cellpadding=0 width=100%");

	push	0
	push	0
	push	65					; 00000041H
	push	OFFSET FLAT:$SG70227
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70226
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70229
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 43		; 0000002bH
	jmp	$eva_err$70230
$L70226:

; 44   : 		bgcolor = DYNTAB_FIELD_VAL(&cntxt->cnf_data, TITLE_BGCOLOR);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70231
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29360				; 000072b0H
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _bgcolor$[ebp], eax

; 45   : 		if(*bgcolor) DYNBUF_ADD3(form->html," bgcolor=#", bgcolor, 0, NO_CONV, "");

	mov	ecx, DWORD PTR _bgcolor$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70234
	push	0
	push	OFFSET FLAT:$SG70235
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _bgcolor$[ebp]
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70236
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70234
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70238
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 45		; 0000002dH
	jmp	$eva_err$70230
$L70234:

; 46   : 		img = get_image_file(cntxt, DYNTAB_FIELD_VAL(&cntxt->cnf_data, TITLE_BACKGROUND), 0, 0);

	push	0
	push	0
	push	0
	push	-1
	push	OFFSET FLAT:$SG70239
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_get_image_file
	add	esp, 16					; 00000010H
	mov	DWORD PTR _img$[ebp], eax

; 47   : 		if(img) DYNBUF_ADD3(form->html," background='", img, 0, NO_CONV, "'");

	cmp	DWORD PTR _img$[ebp], 0
	je	SHORT $L70242
	push	1
	push	OFFSET FLAT:$SG70243
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70244
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70242
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70246
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 47		; 0000002fH
	jmp	$eva_err$70230
$L70242:

; 48   : 		M_FREE(img);

	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _img$[ebp], 0

; 49   : 		DYNBUF_ADD_STR(form->html, "><tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70249
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70248
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70251
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 49		; 00000031H
	jmp	$eva_err$70230
$L70248:

; 50   : 		if(ctrl_put_label(cntxt, ctrl, "_EVA_NewColumn")) STACK_ERROR;

	push	OFFSET FLAT:$SG70253
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_put_label
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70252
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 50		; 00000032H
	jmp	$eva_err$70230
$L70252:

; 52   : 			"<td align=right>");

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70256
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70255
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70258
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 52		; 00000034H
	jmp	$eva_err$70230
$L70255:

; 53   : 		if(ctrl_cgi_name(cntxt, ctrl, NULL, 0, &name, 'B', add_sz_str("CLOSE")) ||
; 54   : 			put_html_button(cntxt, name->data, NULL, "_eva_close.gif", "_eva_close_s.gif", "Ferme le formulaire", 0, 0)) STACK_ERROR;

	push	5
	push	OFFSET FLAT:$SG70264
	push	66					; 00000042H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	jne	SHORT $L70263
	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70265
	push	OFFSET FLAT:$SG70266
	push	OFFSET FLAT:$SG70267
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70262
$L70263:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 54		; 00000036H
	jmp	$eva_err$70230
$L70262:

; 56   : 			"</td></tr></table></font>");

	push	0
	push	0
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70270
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70269
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70272
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 56		; 00000038H
	jmp	$eva_err$70230
$L70269:

; 57   : 		form->html = NULL;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+232], 0
$L70221:

; 59   : 	if(!form->title) DYNBUF_ADD(&form->title, ctrl->LABEL, 0, NO_CONV);

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+84], 0
	jne	SHORT $L70276
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 84					; 00000054H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70276
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70278
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 59		; 0000003bH
	jmp	$eva_err$70230
$L70276:

; 60   : 
; 61   : 	/* Set form default attributes values */
; 62   : 	ctrl->POSITION = "_EVA_NewColumn";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+296], OFFSET FLAT:$SG70279

; 63   : 	ctrl->LABELPOS = "_EVA_NONE";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+292], OFFSET FLAT:$SG70280

; 64   : 	ctrl->OPTIONBUTTON = ctrl->LABELPOS;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+292]
	mov	DWORD PTR [ecx+336], eax

; 65   : 
; 66   : 	/* Read form attributes */
; 67   : 	align = CTRL_ATTR_VAL(TABLEALIGN);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70727
	push	0
	push	-1
	push	OFFSET FLAT:$SG70281
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L70728
$L70727:
	mov	DWORD PTR -72+[ebp], OFFSET FLAT:$SG70282
$L70728:
	mov	edx, DWORD PTR -72+[ebp]
	mov	DWORD PTR _align$[ebp], edx

; 68   : 	bgcolor = ctrl->TABLEBGCOLOR;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+452]
	mov	DWORD PTR _bgcolor$[ebp], ecx

; 69   : 	background = ctrl->TABLEBACKGROUND;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+456]
	mov	DWORD PTR _background$[ebp], eax

; 70   : 	if(!*bgcolor) bgcolor = DYNTAB_FIELD_VAL(&cntxt->cnf_data, FORM_BGCOLOR);

	mov	ecx, DWORD PTR _bgcolor$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70283
	push	0
	push	-1
	push	OFFSET FLAT:$SG70284
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29360				; 000072b0H
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _bgcolor$[ebp], eax
$L70283:

; 71   : 	if(!*background) background = DYNTAB_FIELD_VAL(&cntxt->cnf_data, FORM_BACKGROUND);

	mov	ecx, DWORD PTR _background$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70285
	push	0
	push	-1
	push	OFFSET FLAT:$SG70286
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29360				; 000072b0H
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _background$[ebp], eax
$L70285:

; 72   : 	cellwidth = ctrl->WIDTH;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+308]
	mov	DWORD PTR _cellwidth$[ebp], edx

; 73   : 
; 74   : 	/* Handle page title */
; 75   : 	if(!cntxt->title && !dyntab_cmp(&form->id_form, 0, 0, &cntxt->id_form, 0, 0))

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29780], 0
	jne	SHORT $L70289
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70289

; 76   : 		DYNBUF_ADD_BUF(&cntxt->title, form->title, NO_CONV);

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+84], 0
	je	SHORT $L70289
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+84]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+84]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29780				; 00007454H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70289
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70291
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 76		; 0000004cH
	jmp	$eva_err$70230
$L70289:

; 77   : 
; 78   : 	/* Mark form context CGI data not to be reoutput */
; 79   : 	CGI_VALUES_DONTKEEP(&ctrl->cgival);

	mov	DWORD PTR __i$70292[ebp], 0
	jmp	SHORT $L70293
$L70294:
	mov	eax, DWORD PTR __i$70292[ebp]
	add	eax, 1
	mov	DWORD PTR __i$70292[ebp], eax
$L70293:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR __i$70292[ebp]
	cmp	edx, DWORD PTR [ecx+104]
	jae	SHORT $L70295
	push	1
	mov	eax, DWORD PTR __i$70292[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_value_setkeep
	add	esp, 16					; 00000010H
	jmp	SHORT $L70294
$L70295:

; 80   : 
; 81   : 	/* Output HTML debug info if applicable */
; 82   : 	form->html = &cntxt->html;

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29784				; 00007458H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+232], eax

; 83   : 	if(cntxt->debug & DEBUG_HTML)

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29860]
	and	eax, 128				; 00000080H
	test	eax, eax
	je	SHORT $L70298

; 84   : 		DYNBUF_ADD3(cntxt->form->html, "\n<!--- Start Form ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	push	5
	push	OFFSET FLAT:$SG70299
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	push	edx
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70300
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70298
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70302
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 84		; 00000054H
	jmp	$eva_err$70230
$L70298:

; 85   : 
; 86   : 	/* Put hidden input for form status */
; 87   : 	if(cgi_build_basename(cntxt, &ctrl->cginame, 0, 'F')) STACK_ERROR;

	push	70					; 00000046H
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_build_basename
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70303
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 87		; 00000057H
	jmp	$eva_err$70230
$L70303:

; 89   : 		"<input type=hidden name='", ctrl->cginame->data, ctrl->cginame->cnt, NO_CONV, "' value='");

	push	9
	push	OFFSET FLAT:$SG70306
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
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70307
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29796				; 00007464H
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70305
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70309
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 89		; 00000059H
	jmp	$eva_err$70230
$L70305:

; 90   : 	if(form_status_data(cntxt, &cntxt->htmlhidden)) STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29796				; 00007464H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_status_data
	add	esp, 8
	test	eax, eax
	je	SHORT $L70310
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 90		; 0000005aH
	jmp	$eva_err$70230
$L70310:

; 91   : 	DYNBUF_ADD_STR(&cntxt->htmlhidden, "'>");

	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70313
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29796				; 00007464H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70312
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70315
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 91		; 0000005bH
	jmp	$eva_err$70230
$L70312:

; 92   : 	if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD_STR(&cntxt->htmlhidden, "\n");

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29860]
	and	edx, 128				; 00000080H
	test	edx, edx
	je	SHORT $L70318
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70319
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29796				; 00007464H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70318
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70321
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 92		; 0000005cH
	jmp	$eva_err$70230
$L70318:

; 93   : 
; 94   : 	/* Output hidden input for selected tab */
; 95   : 	if(form->tabs && form_tab_selection(cntxt, 0)) STACK_ERROR;

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+108], 0
	je	SHORT $L70322
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_tab_selection
	add	esp, 8
	test	eax, eax
	je	SHORT $L70322
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 95		; 0000005fH
	jmp	$eva_err$70230
$L70322:

; 96   : 
; 97   : 	/* Output form main table header */
; 98   : 	if(ctrl->FONTFACE[0]) DYNBUF_ADD3(form->html, "<font face='", ctrl->FONTFACE, 0, NO_CONV, "'>");

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+352]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70325
	push	2
	push	OFFSET FLAT:$SG70326
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+352]
	push	ecx
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70327
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70325
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70329
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 98		; 00000062H
	jmp	$eva_err$70230
$L70325:

; 99   : 	if(put_html_table_header(cntxt, align, ctrl->TABLEWIDTH, ctrl->TABLEHEIGHT, bgcolor, background,
; 100  : 								0, 0, 0, NULL, NULL, NULL))

	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _background$[ebp]
	push	eax
	mov	ecx, DWORD PTR _bgcolor$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+444]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+440]
	push	edx
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_table_header
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L70333

; 101  : 		STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 101		; 00000065H
	jmp	$eva_err$70230
$L70333:

; 102  : 
; 103  : 	/* Output form title */
; 104  : 	if(form->html_title) DYNBUF_ADD3_BUF(form->html, "<td colspan=2>",form->html_title, NO_CONV, "</td></tr><tr>")

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+212], 0
	je	$L70337
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+212], 0
	je	SHORT $L70729
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+212]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -76+[ebp], ecx
	jmp	SHORT $L70730
$L70729:
	mov	DWORD PTR -76+[ebp], 0
$L70730:
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+212], 0
	je	SHORT $L70731
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	add	ecx, 8
	mov	DWORD PTR -80+[ebp], ecx
	jmp	SHORT $L70732
$L70731:
	mov	DWORD PTR -80+[ebp], 0
$L70732:
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70338
	push	0
	push	0
	mov	edx, DWORD PTR -76+[ebp]
	push	edx
	mov	eax, DWORD PTR -80+[ebp]
	push	eax
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70339
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70337
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70341
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 104		; 00000068H
	jmp	$eva_err$70230
$L70337:

; 105  : 	M_FREE(form->html_title);

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+212]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+212], 0

; 106  : 
; 107  : 	switch(form->step)
; 108  : 	{

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR -84+[ebp], eax
	mov	ecx, DWORD PTR -84+[ebp]
	sub	ecx, 3
	mov	DWORD PTR -84+[ebp], ecx
	cmp	DWORD PTR -84+[ebp], 8
	ja	$L70360
	mov	edx, DWORD PTR -84+[ebp]
	jmp	DWORD PTR $L70769[edx*4]
$L70346:

; 109  : 	case FormValues:
; 110  : 		if(form_mode_values(cntxt)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_mode_values
	add	esp, 4
	test	eax, eax
	je	SHORT $L70347
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 110		; 0000006eH
	jmp	$eva_err$70230
$L70347:

; 111  : 		break;

	jmp	$L70343
$L70348:

; 112  : 
; 113  : 	case FormSearch:
; 114  : 		if(form_mode_search(cntxt)) STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_mode_search
	add	esp, 4
	test	eax, eax
	je	SHORT $L70349
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 114		; 00000072H
	jmp	$eva_err$70230
$L70349:

; 115  : 		break;

	jmp	$L70343
$L70350:

; 116  : 
; 117  : 	case FormList:
; 118  : 		if(form_mode_list(cntxt)) STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_mode_list
	add	esp, 4
	test	eax, eax
	je	SHORT $L70351
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 118		; 00000076H
	jmp	$eva_err$70230
$L70351:

; 119  : 		break;

	jmp	$L70343
$L70352:

; 120  : 
; 121  : 	case HtmlSaveDlg:
; 122  : 		/* Output dialog */
; 123  : 		DYNBUF_ADD3_BUF(form->html, "<td><font face=Arial><b>", form->html_top, NO_CONV, "</font></td>");

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+216], 0
	je	SHORT $L70733
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+216]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -88+[ebp], eax
	jmp	SHORT $L70734
$L70733:
	mov	DWORD PTR -88+[ebp], 0
$L70734:
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+216], 0
	je	SHORT $L70735
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+216]
	add	eax, 8
	mov	DWORD PTR -92+[ebp], eax
	jmp	SHORT $L70736
$L70735:
	mov	DWORD PTR -92+[ebp], 0
$L70736:
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70356
	push	0
	push	0
	mov	ecx, DWORD PTR -88+[ebp]
	push	ecx
	mov	edx, DWORD PTR -92+[ebp]
	push	edx
	push	24					; 00000018H
	push	OFFSET FLAT:$SG70357
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70355
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70359
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 123		; 0000007bH
	jmp	$eva_err$70230
$L70355:

; 124  : 		break;

	jmp	$L70343
$L70360:

; 125  : 
; 126  : 	default:
; 127  : 		/* Output form menu */
; 128  : 		if(form->html_menu)

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+228], 0
	je	$L70378

; 130  : 			if(!rightmenu) DYNBUF_ADD_BUF(form->html, form->html_menu, NO_CONV);

	cmp	DWORD PTR _rightmenu$[ebp], 0
	jne	SHORT $L70364
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+228], 0
	je	SHORT $L70364
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+228]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+228]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70364
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70366
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 130		; 00000082H
	jmp	$eva_err$70230
$L70364:

; 131  : 			DYNBUF_ADD_STR(form->html, "<td valign=top>")

	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70369
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70368
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70371
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 131		; 00000083H
	jmp	$eva_err$70230
$L70368:

; 132  : 			if(put_html_table_header(cntxt, NULL, ctrl->TABLEWIDTH, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+440]
	push	edx
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_table_header
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L70378
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 132		; 00000084H
	jmp	$eva_err$70230
$L70378:

; 134  : 
; 135  : 		/* Output form top controls */
; 136  : 		if(form->html_top)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+216], 0
	je	$L70401

; 138  : 			ctrl->BORDER = atoi(CTRL_ATTR_VAL(INNERBORDER));

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70737
	push	0
	push	-1
	push	OFFSET FLAT:$SG70380
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -96+[ebp], eax
	jmp	SHORT $L70738
$L70737:
	mov	DWORD PTR -96+[ebp], OFFSET FLAT:$SG70381
$L70738:
	mov	ecx, DWORD PTR -96+[ebp]
	push	ecx
	call	_atoi
	add	esp, 4
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+460], eax

; 139  : 			ctrl->WIDTH = "";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+308], OFFSET FLAT:$SG70382

; 140  : 			ctrl->VALIGN = "top";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+304], OFFSET FLAT:$SG70383

; 141  : 			if(ctrl_format_pos(cntxt, ctrl, 1) ||
; 142  : 				put_html_table_header(cntxt, NULL, cellwidth, ctrl->HEIGHT, NULL, NULL,
; 143  : 								atoi(CTRL_ATTR_VAL(CELLSPACING)),
; 144  : 								atoi(CTRL_ATTR_VAL(CELLPADDING)), ctrl->BORDER, ctrl->TABLERULES, ctrl->TABLE_STYLE, NULL))

	push	1
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70389
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70739
	push	0
	push	-1
	push	OFFSET FLAT:$SG70390
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -100+[ebp], eax
	jmp	SHORT $L70740
$L70739:
	mov	DWORD PTR -100+[ebp], OFFSET FLAT:$SG70391
$L70740:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70741
	push	0
	push	-1
	push	OFFSET FLAT:$SG70392
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -104+[ebp], eax
	jmp	SHORT $L70742
$L70741:
	mov	DWORD PTR -104+[ebp], OFFSET FLAT:$SG70393
$L70742:
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+476]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+448]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+460]
	push	edx
	mov	eax, DWORD PTR -100+[ebp]
	push	eax
	call	_atoi
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR -104+[ebp]
	push	ecx
	call	_atoi
	add	esp, 4
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+312]
	push	eax
	mov	ecx, DWORD PTR _cellwidth$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_table_header
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L70388
$L70389:

; 145  : 				STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 145		; 00000091H
	jmp	$eva_err$70230
$L70388:

; 146  : 			DYNBUF_ADD3_BUF(form->html, "", form->html_top, NO_CONV, "</tr></table>")

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+216], 0
	je	SHORT $L70743
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+216]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -108+[ebp], ecx
	jmp	SHORT $L70744
$L70743:
	mov	DWORD PTR -108+[ebp], 0
$L70744:
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+216], 0
	je	SHORT $L70745
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+216]
	add	ecx, 8
	mov	DWORD PTR -112+[ebp], ecx
	jmp	SHORT $L70746
$L70745:
	mov	DWORD PTR -112+[ebp], 0
$L70746:
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70397
	push	0
	push	0
	mov	edx, DWORD PTR -108+[ebp]
	push	edx
	mov	eax, DWORD PTR -112+[ebp]
	push	eax
	push	0
	push	OFFSET FLAT:$SG70398
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70396
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70400
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 146		; 00000092H
	jmp	$eva_err$70230
$L70396:

; 147  : 			if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70401
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 147		; 00000093H
	jmp	$eva_err$70230
$L70401:

; 149  : 
; 150  : 		/* Output tabs buttons bar & contents if applicable */
; 151  : 		if(form->tabs)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+108], 0
	je	$L70456

; 153  : 			/* Set control with form tab attributes */
; 154  : 			int b_left = !strcmp(CTRL_ATTR_VAL(TABS_POS), "_EVA_LEFT");

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70747
	push	0
	push	-1
	push	OFFSET FLAT:$SG70405
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -116+[ebp], eax
	jmp	SHORT $L70748
$L70747:
	mov	DWORD PTR -116+[ebp], OFFSET FLAT:$SG70406
$L70748:
	push	OFFSET FLAT:$SG70404
	mov	ecx, DWORD PTR -116+[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_left$70403[ebp], eax

; 155  : 			EVA_ctrl *tab = form->ctrl + form->seltab;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+116]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _tab$70407[ebp], edx

; 156  : 			if(!tab->HEIGHT[0]) tab->HEIGHT = CTRL_ATTR_VAL(TABHEIGHT);

	mov	eax, DWORD PTR _tab$70407[ebp]
	mov	ecx, DWORD PTR [eax+312]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70408
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70749
	push	0
	push	-1
	push	OFFSET FLAT:$SG70409
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -120+[ebp], eax
	jmp	SHORT $L70750
$L70749:
	mov	DWORD PTR -120+[ebp], OFFSET FLAT:$SG70410
$L70750:
	mov	ecx, DWORD PTR _tab$70407[ebp]
	mov	edx, DWORD PTR -120+[ebp]
	mov	DWORD PTR [ecx+312], edx
$L70408:

; 157  : 			if(!tab->BGCOLOR[0]) tab->BGCOLOR = tab->TABLEBGCOLOR;

	mov	eax, DWORD PTR _tab$70407[ebp]
	mov	ecx, DWORD PTR [eax+320]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70411
	mov	eax, DWORD PTR _tab$70407[ebp]
	mov	ecx, DWORD PTR _tab$70407[ebp]
	mov	edx, DWORD PTR [ecx+452]
	mov	DWORD PTR [eax+320], edx
$L70411:

; 158  : 			if(!tab->BGCOLOR[0]) tab->BGCOLOR = CTRL_ATTR_VAL(TABBGCOLOR);

	mov	eax, DWORD PTR _tab$70407[ebp]
	mov	ecx, DWORD PTR [eax+320]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70412
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70751
	push	0
	push	-1
	push	OFFSET FLAT:$SG70413
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -124+[ebp], eax
	jmp	SHORT $L70752
$L70751:
	mov	DWORD PTR -124+[ebp], OFFSET FLAT:$SG70414
$L70752:
	mov	ecx, DWORD PTR _tab$70407[ebp]
	mov	edx, DWORD PTR -124+[ebp]
	mov	DWORD PTR [ecx+320], edx
$L70412:

; 159  : 			if(!tab->BGCOLOR[0]) tab->BGCOLOR = ATTR_VAL(&cntxt->srvfmt, TABBGCOLOR);

	mov	eax, DWORD PTR _tab$70407[ebp]
	mov	ecx, DWORD PTR [eax+320]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70415
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 269748				; 00041db4H
	test	eax, eax
	je	SHORT $L70753
	push	0
	push	-1
	push	OFFSET FLAT:$SG70416
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 269792				; 00041de0H
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -128+[ebp], eax
	jmp	SHORT $L70754
$L70753:
	mov	DWORD PTR -128+[ebp], OFFSET FLAT:$SG70417
$L70754:
	mov	edx, DWORD PTR _tab$70407[ebp]
	mov	eax, DWORD PTR -128+[ebp]
	mov	DWORD PTR [edx+320], eax
$L70415:

; 160  : 			tab->TABLEBGCOLOR = "";

	mov	ecx, DWORD PTR _tab$70407[ebp]
	mov	DWORD PTR [ecx+452], OFFSET FLAT:$SG70418

; 161  : 			if(!tab->BACKGROUND[0]) tab->BACKGROUND = CTRL_ATTR_VAL(TABBACKGROUND);

	mov	edx, DWORD PTR _tab$70407[ebp]
	mov	eax, DWORD PTR [edx+324]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70419
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70755
	push	0
	push	-1
	push	OFFSET FLAT:$SG70420
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -132+[ebp], eax
	jmp	SHORT $L70756
$L70755:
	mov	DWORD PTR -132+[ebp], OFFSET FLAT:$SG70421
$L70756:
	mov	eax, DWORD PTR _tab$70407[ebp]
	mov	ecx, DWORD PTR -132+[ebp]
	mov	DWORD PTR [eax+324], ecx
$L70419:

; 162  : 			if(!tab->BACKGROUND[0]) tab->BACKGROUND = ATTR_VAL(&cntxt->srvfmt, TABBACKGROUND);

	mov	edx, DWORD PTR _tab$70407[ebp]
	mov	eax, DWORD PTR [edx+324]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70422
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269748				; 00041db4H
	test	edx, edx
	je	SHORT $L70757
	push	0
	push	-1
	push	OFFSET FLAT:$SG70423
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 269792				; 00041de0H
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -136+[ebp], eax
	jmp	SHORT $L70758
$L70757:
	mov	DWORD PTR -136+[ebp], OFFSET FLAT:$SG70424
$L70758:
	mov	ecx, DWORD PTR _tab$70407[ebp]
	mov	edx, DWORD PTR -136+[ebp]
	mov	DWORD PTR [ecx+324], edx
$L70422:

; 163  : 			tab->POSITION = b_left ? "_EVA_NewColumn" : "_EVA_NewLine";

	cmp	DWORD PTR _b_left$70403[ebp], 0
	je	SHORT $L70759
	mov	DWORD PTR -140+[ebp], OFFSET FLAT:$SG70425
	jmp	SHORT $L70760
$L70759:
	mov	DWORD PTR -140+[ebp], OFFSET FLAT:$SG70426
$L70760:
	mov	eax, DWORD PTR _tab$70407[ebp]
	mov	ecx, DWORD PTR -140+[ebp]
	mov	DWORD PTR [eax+296], ecx

; 164  : 			tab->VALIGN = "top";

	mov	edx, DWORD PTR _tab$70407[ebp]
	mov	DWORD PTR [edx+304], OFFSET FLAT:$SG70427

; 165  : 			tab->LABELPOS = "_EVA_NONE";

	mov	eax, DWORD PTR _tab$70407[ebp]
	mov	DWORD PTR [eax+292], OFFSET FLAT:$SG70428

; 166  : 
; 167  : 			/* Output tabs header if not print mode */
; 168  : 			if(form->html_top) DYNBUF_ADD_STR(form->html, "</tr><tr>")

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+216], 0
	je	SHORT $L70431
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70432
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70431
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70434
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 168		; 000000a8H
	jmp	$eva_err$70230
$L70431:

; 169  : 			if(form->step != HtmlPrint)

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 7
	je	SHORT $L70442

; 171  : 				if(b_left) DYNBUF_ADD_STR(form->html, "<td colspan=2 bgcolor=black height=1></td>"

	cmp	DWORD PTR _b_left$70403[ebp], 0
	je	SHORT $L70438

; 172  : 													"</tr><tr><td colspan=2><table cellpadding=0 cellspacing=0 border=0 width=100%><tr>");

	push	0
	push	0
	push	124					; 0000007cH
	push	OFFSET FLAT:$SG70439
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70438
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70441
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 172		; 000000acH
	jmp	$eva_err$70230
$L70438:

; 173  : 				if(ctrl_add_tab_header(cntxt)) STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_tab_header
	add	esp, 4
	test	eax, eax
	je	SHORT $L70442
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 173		; 000000adH
	jmp	$eva_err$70230
$L70442:

; 175  : 
; 176  : 			/* Put tab contents & footer */
; 177  : 			if(form->html_tab)

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+224], 0
	je	$L70448

; 179  : 				if(ctrl_format_pos(cntxt, tab, 1) || ctrl_put_table_header(cntxt, tab)) STACK_ERROR;

	push	1
	mov	edx, DWORD PTR _tab$70407[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70445
	mov	ecx, DWORD PTR _tab$70407[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_table_header
	add	esp, 8
	test	eax, eax
	je	SHORT $L70444
$L70445:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 179		; 000000b3H
	jmp	$eva_err$70230
$L70444:

; 180  : 				DYNBUF_ADD3_BUF(form->html, "", form->html_tab, NO_CONV, "</tr></table>");

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+224], 0
	je	SHORT $L70761
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+224]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -144+[ebp], ecx
	jmp	SHORT $L70762
$L70761:
	mov	DWORD PTR -144+[ebp], 0
$L70762:
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+224], 0
	je	SHORT $L70763
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+224]
	add	ecx, 8
	mov	DWORD PTR -148+[ebp], ecx
	jmp	SHORT $L70764
$L70763:
	mov	DWORD PTR -148+[ebp], 0
$L70764:
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70449
	push	0
	push	0
	mov	edx, DWORD PTR -144+[ebp]
	push	edx
	mov	eax, DWORD PTR -148+[ebp]
	push	eax
	push	0
	push	OFFSET FLAT:$SG70450
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70448
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70452
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 180		; 000000b4H
	jmp	$eva_err$70230
$L70448:

; 182  : 			if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70453
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 182		; 000000b6H
	jmp	$eva_err$70230
$L70453:

; 183  : 			if(form->step != HtmlPrint && b_left) DYNBUF_ADD_STR(form->html, "</tr></table></td>");

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 7
	je	SHORT $L70456
	cmp	DWORD PTR _b_left$70403[ebp], 0
	je	SHORT $L70456
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70457
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70456
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70459
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 183		; 000000b7H
	jmp	$eva_err$70230
$L70456:

; 185  : 		if(form->html_menu)

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+228], 0
	je	$L70468

; 187  : 			DYNBUF_ADD_STR(form->html, "</tr></table></td>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70463
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70462
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70465
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 187		; 000000bbH
	jmp	$eva_err$70230
$L70462:

; 188  : 			if(rightmenu) DYNBUF_ADD_BUF(form->html, form->html_menu, NO_CONV);

	cmp	DWORD PTR _rightmenu$[ebp], 0
	je	SHORT $L70468
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+228], 0
	je	SHORT $L70468
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+228]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+228]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70468
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70470
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 188		; 000000bcH
	jmp	$eva_err$70230
$L70468:
$L70343:

; 194  : 		DynBuffer *b = *form->html;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _b$70471[ebp], eax

; 195  : 		char *txt = b ? b->data : NULL;

	cmp	DWORD PTR _b$70471[ebp], 0
	je	SHORT $L70765
	mov	ecx, DWORD PTR _b$70471[ebp]
	add	ecx, 8
	mov	DWORD PTR -152+[ebp], ecx
	jmp	SHORT $L70766
$L70765:
	mov	DWORD PTR -152+[ebp], 0
$L70766:
	mov	edx, DWORD PTR -152+[ebp]
	mov	DWORD PTR _txt$70472[ebp], edx

; 196  : 		size_t len = b ? b->cnt : 0;

	cmp	DWORD PTR _b$70471[ebp], 0
	je	SHORT $L70767
	mov	eax, DWORD PTR _b$70471[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -156+[ebp], ecx
	jmp	SHORT $L70768
$L70767:
	mov	DWORD PTR -156+[ebp], 0
$L70768:
	mov	edx, DWORD PTR -156+[ebp]
	mov	DWORD PTR _len$70474[ebp], edx

; 197  : 		if(txt && len > 3 && !strncmp(txt + len - 4, "<tr>", 4))

	cmp	DWORD PTR _txt$70472[ebp], 0
	je	SHORT $L70475
	cmp	DWORD PTR _len$70474[ebp], 3
	jbe	SHORT $L70475
	push	4
	push	OFFSET FLAT:$SG70476
	mov	eax, DWORD PTR _len$70474[ebp]
	mov	ecx, DWORD PTR _txt$70472[ebp]
	lea	edx, DWORD PTR [ecx+eax-4]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70475

; 198  : 			b->cnt -= 4;

	mov	eax, DWORD PTR _b$70471[ebp]
	mov	ecx, DWORD PTR [eax+4]
	sub	ecx, 4
	mov	edx, DWORD PTR _b$70471[ebp]
	mov	DWORD PTR [edx+4], ecx

; 199  : 		else

	jmp	SHORT $L70479
$L70475:

; 200  : 			DYNBUF_ADD_STR(form->html, "</tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70480
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70479
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70482
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 200		; 000000c8H
	jmp	$eva_err$70230
$L70479:

; 202  : 	DYNBUF_ADD_STR(form->html, "</table>");

	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70485
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70484
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70487
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 202		; 000000caH
	jmp	$eva_err$70230
$L70484:

; 203  : 	if(ctrl->FONTFACE[0]) DYNBUF_ADD_STR(form->html, "</font>");

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+352]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70490
	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70491
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70490
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70493
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 203		; 000000cbH
	jmp	SHORT $eva_err$70230
$L70490:

; 204  : 
; 205  : 	/* Output HTML debug info if applicable */
; 206  : 	if(cntxt->debug & DEBUG_HTML)

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 128				; 00000080H
	test	ecx, ecx
	je	SHORT $L70496

; 207  : 		DYNBUF_ADD3(cntxt->form->html, "\n<!--- EndOf Form ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	push	5
	push	OFFSET FLAT:$SG70497
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70498
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70496
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70500
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 207		; 000000cfH
	jmp	SHORT $eva_err$70230
$L70496:
$eva_noerr$70501:

; 208  : 
; 209  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70502
	push	OFFSET FLAT:$SG70503
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70230:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70504
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70505
	push	OFFSET FLAT:$SG70506
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70504:
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _img$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 210  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70769:
	DD	$L70352
	DD	$L70360
	DD	$L70360
	DD	$L70360
	DD	$L70360
	DD	$L70350
	DD	$L70348
	DD	$L70360
	DD	$L70346
_form_put_html ENDP
_TEXT	ENDS
EXTRN	_no_quote:BYTE
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70523 DB	01H DUP (?)
	ALIGN	4

$SG70528 DB	01H DUP (?)
	ALIGN	4

$SG70534 DB	01H DUP (?)
	ALIGN	4

$SG70539 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70519 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70524 DB	0a7H, 00H
	ORG $+2
$SG70526 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70529 DB	0a7H, 00H
	ORG $+2
$SG70531 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70535 DB	0a7H, 00H
	ORG $+2
$SG70537 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70540 DB	0a7H, 00H
	ORG $+2
$SG70542 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70544 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_html.c', 00H
$SG70545 DB	'form_status_data', 00H
	ORG $+3
$SG70547 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_html.c', 00H
$SG70548 DB	'form_status_data', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_html$ = 12
_form$ = -4
_form_status_data PROC NEAR

; 223  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H

; 224  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 225  : 
; 226  : 	DYNBUF_ADD_CELL(html, &form->call_data, 0, 0, NO_CONV);

	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 88					; 00000058H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 88					; 00000058H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70517
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70519
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 226		; 000000e2H
	jmp	$eva_err$70520
$L70517:

; 227  : 	DYNBUF_ADD3_BUF(html, "§", form->title, HTML_NO_QUOTE, "");

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+84], 0
	je	SHORT $L70771
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+84]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -8+[ebp], ecx
	jmp	SHORT $L70772
$L70771:
	mov	DWORD PTR -8+[ebp], 0
$L70772:
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+84], 0
	je	SHORT $L70773
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	add	ecx, 8
	mov	DWORD PTR -12+[ebp], ecx
	jmp	SHORT $L70774
$L70773:
	mov	DWORD PTR -12+[ebp], 0
$L70774:
	push	0
	push	OFFSET FLAT:$SG70523
	push	1
	push	OFFSET FLAT:_no_quote
	mov	edx, DWORD PTR -8+[ebp]
	push	edx
	mov	eax, DWORD PTR -12+[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70524
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70522
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70526
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 227		; 000000e3H
	jmp	$eva_err$70520
$L70522:

; 228  : 	DYNBUF_ADD3_INT(html, "§", form->step, "");

	push	0
	push	OFFSET FLAT:$SG70528
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+176]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70529
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70527
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70531
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 228		; 000000e4H
	jmp	$eva_err$70520
$L70527:

; 229  : 	DYNBUF_ADD3_CELL(html, "§", &form->dlg_ctrl, 0, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70534
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 180				; 000000b4H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 180				; 000000b4H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG70535
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70533
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70537
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 229		; 000000e5H
	jmp	$eva_err$70520
$L70533:

; 230  : 	DYNBUF_ADD3_INT(html, "§", (form->step <= HtmlStepEdit && form->step >= HtmlSaveDlg) ? form->b_modified : 0, "");

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 5
	jg	SHORT $L70775
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 3
	jl	SHORT $L70775
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	mov	DWORD PTR -16+[ebp], edx
	jmp	SHORT $L70776
$L70775:
	mov	DWORD PTR -16+[ebp], 0
$L70776:
	push	0
	push	OFFSET FLAT:$SG70539
	mov	eax, DWORD PTR -16+[ebp]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70540
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70538
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70542
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 230		; 000000e6H
	jmp	SHORT $eva_err$70520
$L70538:
$eva_noerr$70543:

; 231  : 
; 232  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70544
	push	OFFSET FLAT:$SG70545
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70520:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70546
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70547
	push	OFFSET FLAT:$SG70548
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70546:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 233  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_form_status_data ENDP
_TEXT	ENDS
EXTRN	_cgi_build_name:NEAR
EXTRN	_cgi_get_values:NEAR
EXTRN	_cgi_add_input:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
_DATA	SEGMENT
	ORG $+3
$SG70570 DB	'_EVA_SELTAB', 00H
$SG70581 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70586 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_html.c', 00H
$SG70587 DB	'form_tab_selection', 00H
	ORG $+1
$SG70589 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_html.c', 00H
$SG70590 DB	'form_tab_selection', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_mode$ = 12
_form$ = -4
_cgival$ = -28
_name$ = -36
_idobj$ = -8
_idform$ = -32
_i$70575 = -40
_form_tab_selection PROC NEAR

; 247  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H

; 248  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 249  : 	DynTable cgival = { 0 };

	mov	DWORD PTR _cgival$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cgival$[ebp+4], edx
	mov	DWORD PTR _cgival$[ebp+8], edx
	mov	DWORD PTR _cgival$[ebp+12], edx
	mov	DWORD PTR _cgival$[ebp+16], edx

; 250  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 251  : 	unsigned long idobj = DYNTAB_TOUL(&form->id_obj);

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
	mov	DWORD PTR _idobj$[ebp], eax

; 252  : 	unsigned long idform = DYNTAB_TOUL(&form->id_form);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idform$[ebp], eax

; 253  : 
; 254  : 	/* Build CGI name for hidden input */
; 255  : 	if(!form->tabs || form->nb_tabs < 2) RETURN_OK;

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+108], 0
	je	SHORT $L70566
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+112], 2
	jae	SHORT $L70565
$L70566:
	jmp	$eva_noerr$70567
$L70565:

; 256  : 	if(cgi_build_name(cntxt, &name, 'D', 0, idform, idobj, add_sz_str("_EVA_SELTAB"), NULL, 0, 0, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70570
	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _idform$[ebp]
	push	edx
	push	0
	push	68					; 00000044H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_build_name
	add	esp, 52					; 00000034H
	test	eax, eax
	je	SHORT $L70569
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 256		; 00000100H
	jmp	$eva_err$70571
$L70569:

; 257  : 
; 258  : 	if(mode)

	cmp	DWORD PTR _mode$[ebp], 0
	je	$L70572

; 260  : 		/* Read selected tab */
; 261  : 		if(cgi_get_values(cntxt, &cgival, name->data, 1)) STACK_ERROR;

	push	1
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_get_values
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70573
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 261		; 00000105H
	jmp	$eva_err$70571
$L70573:

; 262  : 		if(cgival.nbrows)

	cmp	DWORD PTR _cgival$[ebp], 0
	je	$L70579

; 264  : 			unsigned long i = 1;

	mov	DWORD PTR _i$70575[ebp], 1
$L70577:

; 265  : 			while(i < form->nb_ctrl && dyntab_cmp(&cgival, 0, 0, &form->ctrl[i].id, 0, 0)) i++;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _i$70575[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jae	SHORT $L70578
	push	0
	push	0
	mov	eax, DWORD PTR _i$70575[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70578
	mov	ecx, DWORD PTR _i$70575[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$70575[ebp], ecx
	jmp	SHORT $L70577
$L70578:

; 266  : 			form->seltab = i < form->nb_ctrl ? i : 0;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _i$70575[ebp]
	cmp	eax, DWORD PTR [edx+4]
	sbb	ecx, ecx
	and	ecx, DWORD PTR _i$70575[ebp]
	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+116], ecx

; 267  : 			DYNTAB_ADD_CELL(&form->ctrl->cgival, 1, 0, &cgival, 0, 0);

	push	1
	push	0
	push	0
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	1
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, 104				; 00000068H
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70579
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70581
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 267		; 0000010bH
	jmp	$eva_err$70571
$L70579:

; 270  : 	else

	jmp	$L70585
$L70572:

; 272  : 		/* Output selected tab */
; 273  : 		if(form->seltab &&
; 274  : 			cgi_add_input(cntxt, NULL, DYNBUF_VAL_SZ(name), DYNTAB_VAL_SZ(&form->ctrl[form->seltab].id, 0, 0)))

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+116], 0
	je	$L70585
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70778
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -44+[ebp], ecx
	jmp	SHORT $L70779
$L70778:
	mov	DWORD PTR -44+[ebp], 0
$L70779:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70780
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	mov	DWORD PTR -48+[ebp], edx
	jmp	SHORT $L70781
$L70780:
	mov	DWORD PTR -48+[ebp], 0
$L70781:
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+116]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+116]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR -44+[ebp]
	push	edx
	mov	eax, DWORD PTR -48+[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_add_input
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70585

; 275  : 			STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 275		; 00000113H
	jmp	SHORT $eva_err$70571
$L70585:
$eva_noerr$70567:

; 277  : 
; 278  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70586
	push	OFFSET FLAT:$SG70587
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70571:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70588
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70589
	push	OFFSET FLAT:$SG70590
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70588:
	lea	edx, DWORD PTR _cgival$[ebp]
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

; 279  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_form_tab_selection ENDP
_TEXT	ENDS
PUBLIC	_process_form
EXTRN	_ctrl_call_act_handler:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_sscanf:NEAR
EXTRN	_cgi_put_hidden:NEAR
EXTRN	_cgi_read_urlencoded:NEAR
EXTRN	_form_set_homepage:NEAR
EXTRN	_form_load:NEAR
EXTRN	_form_output:NEAR
EXTRN	_qry_obj_field:NEAR
EXTRN	_dynbuf_add_int:NEAR
EXTRN	_ctrl_from_cginame:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strchr:NEAR
EXTRN	_action_default:NEAR
_DATA	SEGMENT
	ORG $+1
$SG70604 DB	'OpenForm=%lu,%lu', 00H
	ORG $+3
$SG70607 DB	'%lu', 00H
$SG70611 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70615 DB	'%lu', 00H
$SG70619 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70630 DB	'D', 00H
	ORG $+2
$SG70632 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70636 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70639 DB	'/', 00H
	ORG $+2
$SG70641 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70643 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70646 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70649 DB	'$', 00H
	ORG $+2
$SG70651 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70655 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70658 DB	'#', 00H
	ORG $+2
$SG70660 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70665 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70669 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70676 DB	'OPENOBJ=', 00H
	ORG $+3
$SG70679 DB	'%lu', 00H
$SG70683 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70685 DB	'%lu', 00H
$SG70689 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70714 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_html.c', 00H
$SG70715 DB	'process_form', 00H
	ORG $+3
$SG70717 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_html.c', 00H
$SG70718 DB	'process_form', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cgi$70672 = -152
__tmp$70678 = -184
__tmp$70684 = -216
_html$70701 = -220
_b_terminate$70702 = -224
_cntxt$ = 8
_id_form$ = -20
_id_obj$ = -60
_data$ = -40
_idform$70601 = -68
_idobj$70602 = -64
_next$70605 = -72
__tmp$70606 = -104
__tmp$70614 = -136
_end$70624 = -144
_e$70625 = -148
_idctrl$70627 = -140
_process_form PROC NEAR

; 293  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 228				; 000000e4H
	push	edi

; 294  : 	DynTable id_form = { 0 };

	mov	DWORD PTR _id_form$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _id_form$[ebp+4], eax
	mov	DWORD PTR _id_form$[ebp+8], eax
	mov	DWORD PTR _id_form$[ebp+12], eax
	mov	DWORD PTR _id_form$[ebp+16], eax

; 295  : 	DynTable id_obj = { 0 };

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _id_obj$[ebp+4], ecx
	mov	DWORD PTR _id_obj$[ebp+8], ecx
	mov	DWORD PTR _id_obj$[ebp+12], ecx
	mov	DWORD PTR _id_obj$[ebp+16], ecx

; 296  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 297  : 
; 298  : 	/* Handle executable parameters */
; 299  : 	if(cntxt->qrystr)

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29736], 0
	je	$L70670

; 301  : 		unsigned long idform = 0, idobj = 0;

	mov	DWORD PTR _idform$70601[ebp], 0
	mov	DWORD PTR _idobj$70602[ebp], 0

; 302  : 		if(sscanf(cntxt->qrystr, "OpenForm=%lu,%lu", &idform, &idobj) == 2 && idform)

	lea	ecx, DWORD PTR _idobj$70602[ebp]
	push	ecx
	lea	edx, DWORD PTR _idform$70601[ebp]
	push	edx
	push	OFFSET FLAT:$SG70604
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29736]
	push	ecx
	call	_sscanf
	add	esp, 16					; 00000010H
	cmp	eax, 2
	jne	$L70670
	cmp	DWORD PTR _idform$70601[ebp], 0
	je	$L70670

; 304  : 			/* Handle OpenForm parameters IdForm,IdObj */
; 305  : 			char *next = strchr(cntxt->qrystr, '&');

	push	38					; 00000026H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29736]
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _next$70605[ebp], eax

; 306  : 			DYNTAB_ADD_INT(&cntxt->id_form, 0, 0, idform);

	mov	BYTE PTR __tmp$70606[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70606[ebp+1]
	rep stosd
	stosw
	stosb
	mov	ecx, DWORD PTR _idform$70601[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70607
	lea	edx, DWORD PTR __tmp$70606[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR __tmp$70606[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70609
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70611
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 306		; 00000132H
	jmp	$eva_err$70612
$L70609:

; 307  : 			if(idobj) DYNTAB_ADD_INT(&cntxt->id_obj, 0, 0, idobj);

	cmp	DWORD PTR _idobj$70602[ebp], 0
	je	SHORT $L70617
	mov	BYTE PTR __tmp$70614[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70614[ebp+1]
	rep stosd
	stosw
	stosb
	mov	ecx, DWORD PTR _idobj$70602[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70615
	lea	edx, DWORD PTR __tmp$70614[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR __tmp$70614[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70617
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70619
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 307		; 00000133H
	jmp	$eva_err$70612
$L70617:

; 308  : 
; 309  : 			/* Handle extra parameters as CGI input */
; 310  : 			if(next && next[1])

	cmp	DWORD PTR _next$70605[ebp], 0
	je	$L70670
	mov	ecx, DWORD PTR _next$70605[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	test	edx, edx
	je	$L70670

; 312  : 				M_FREE(cntxt->input);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29644]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29644], 0
$L70622:

; 313  : 				while(next)

	cmp	DWORD PTR _next$70605[ebp], 0
	je	$L70623

; 315  : 					char *end = strchr(next + 1, '&');

	push	38					; 00000026H
	mov	eax, DWORD PTR _next$70605[ebp]
	add	eax, 1
	push	eax
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _end$70624[ebp], eax

; 316  : 					char *e = NULL;

	mov	DWORD PTR _e$70625[ebp], 0

; 317  : 					unsigned long idctrl = strtoul(next + 1, &e, 10);

	push	10					; 0000000aH
	lea	ecx, DWORD PTR _e$70625[ebp]
	push	ecx
	mov	edx, DWORD PTR _next$70605[ebp]
	add	edx, 1
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idctrl$70627[ebp], eax

; 318  : 					DYNTAB_FREE(data);

	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 319  : 					DYNBUF_ADD_STR(&cntxt->input, "D");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70630
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29644				; 000073ccH
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70629
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70632
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 319		; 0000013fH
	jmp	$eva_err$70612
$L70629:

; 320  : 					if(idctrl)

	cmp	DWORD PTR _idctrl$70627[ebp], 0
	je	$L70642

; 322  : 						DYNBUF_ADD_INT(&cntxt->input, idctrl);

	mov	ecx, DWORD PTR _idctrl$70627[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29644				; 000073ccH
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70634
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70636
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 322		; 00000142H
	jmp	$eva_err$70612
$L70634:

; 323  : 						DYNBUF_ADD_STR(&cntxt->input, "/");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70639
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29644				; 000073ccH
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70638
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70641
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 323		; 00000143H
	jmp	$eva_err$70612
$L70638:

; 324  : 						next = e - 1;

	mov	edx, DWORD PTR _e$70625[ebp]
	sub	edx, 1
	mov	DWORD PTR _next$70605[ebp], edx

; 325  : 						if(qry_obj_field(cntxt, &data, idctrl, "_EVA_FIELD")) STACK_ERROR;

	push	OFFSET FLAT:$SG70643
	mov	eax, DWORD PTR _idctrl$70627[ebp]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_field
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70642
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 325		; 00000145H
	jmp	$eva_err$70612
$L70642:

; 327  : 					DYNBUF_ADD_INT(&cntxt->input, idform);

	mov	ecx, DWORD PTR _idform$70601[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29644				; 000073ccH
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70644
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70646
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 327		; 00000147H
	jmp	$eva_err$70612
$L70644:

; 328  : 					DYNBUF_ADD_STR(&cntxt->input, "$");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70649
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29644				; 000073ccH
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70648
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70651
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 328		; 00000148H
	jmp	$eva_err$70612
$L70648:

; 329  : 					if(idobj) DYNBUF_ADD_INT(&cntxt->input, idobj);

	cmp	DWORD PTR _idobj$70602[ebp], 0
	je	SHORT $L70653
	mov	edx, DWORD PTR _idobj$70602[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29644				; 000073ccH
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70653
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70655
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 329		; 00000149H
	jmp	$eva_err$70612
$L70653:

; 330  : 					DYNBUF_ADD_STR(&cntxt->input, "#");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70658
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29644				; 000073ccH
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70657
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70660
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 330		; 0000014aH
	jmp	$eva_err$70612
$L70657:

; 331  : 					if(data.nbrows) DYNBUF_ADD_CELL(&cntxt->input, &data, 0, 0, NO_CONV);

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L70663
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
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29644				; 000073ccH
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70663
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70665
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 331		; 0000014bH
	jmp	$eva_err$70612
$L70663:

; 332  : 					DYNBUF_ADD(&cntxt->input, next + 1, end ? end - next : 0, NO_CONV);

	cmp	DWORD PTR _end$70624[ebp], 0
	je	SHORT $L70783
	mov	edx, DWORD PTR _end$70624[ebp]
	sub	edx, DWORD PTR _next$70605[ebp]
	mov	DWORD PTR -228+[ebp], edx
	jmp	SHORT $L70784
$L70783:
	mov	DWORD PTR -228+[ebp], 0
$L70784:
	push	0
	push	0
	mov	eax, DWORD PTR -228+[ebp]
	push	eax
	mov	ecx, DWORD PTR _next$70605[ebp]
	add	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29644				; 000073ccH
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70667
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70669
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 332		; 0000014cH
	jmp	$eva_err$70612
$L70667:

; 333  : 					next = end;

	mov	edx, DWORD PTR _end$70624[ebp]
	mov	DWORD PTR _next$70605[ebp], edx

; 334  : 				}

	jmp	$L70622
$L70623:

; 335  : 				if(cgi_read_urlencoded(cntxt)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_read_urlencoded
	add	esp, 4
	test	eax, eax
	je	SHORT $L70670
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 335		; 0000014fH
	jmp	$eva_err$70612
$L70670:

; 339  : 
; 340  : 	/* If button clicked */
; 341  : 	if(cntxt->cgi)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29648], 0
	je	$L70695

; 343  : 		CGIData *cgi = cntxt->cgi + cntxt->cgibtn;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	add	eax, ecx
	mov	DWORD PTR _cgi$70672[ebp], eax

; 344  : 		if(cgi->IdForm && cgi->IdCtrl && cgi->name[0] != 'I' &&
; 345  : 			((cgi->subfield && strncmp(cgi->subfield, add_sz_str("OPENOBJ="))) ||
; 346  : 				cgi->IdCtrl != cgi->IdForm))

	mov	ecx, DWORD PTR _cgi$70672[ebp]
	cmp	DWORD PTR [ecx+20], 0
	je	$L70673
	mov	edx, DWORD PTR _cgi$70672[ebp]
	cmp	DWORD PTR [edx+16], 0
	je	$L70673
	mov	eax, DWORD PTR _cgi$70672[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 73					; 00000049H
	je	$L70673
	mov	eax, DWORD PTR _cgi$70672[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	SHORT $L70675
	push	8
	push	OFFSET FLAT:$SG70676
	mov	ecx, DWORD PTR _cgi$70672[ebp]
	mov	edx, DWORD PTR [ecx+32]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70674
$L70675:
	mov	eax, DWORD PTR _cgi$70672[ebp]
	mov	ecx, DWORD PTR _cgi$70672[ebp]
	mov	edx, DWORD PTR [eax+16]
	cmp	edx, DWORD PTR [ecx+20]
	je	$L70673
$L70674:

; 348  : 			/* Read form & object ids in CGI data */
; 349  : 			if(cgi->IdObj) DYNTAB_ADD_INT(&id_obj, 0, 0, cgi->IdObj);

	mov	eax, DWORD PTR _cgi$70672[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	SHORT $L70681
	mov	BYTE PTR __tmp$70678[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70678[ebp+1]
	rep stosd
	stosw
	stosb
	mov	ecx, DWORD PTR _cgi$70672[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	push	OFFSET FLAT:$SG70679
	lea	eax, DWORD PTR __tmp$70678[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$70678[ebp]
	push	ecx
	push	0
	push	0
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70681
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70683
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 349		; 0000015dH
	jmp	$eva_err$70612
$L70681:

; 350  : 			DYNTAB_ADD_INT(&id_form, 0, 0, cgi->IdForm);

	mov	BYTE PTR __tmp$70684[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70684[ebp+1]
	rep stosd
	stosw
	stosb
	mov	edx, DWORD PTR _cgi$70672[ebp]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	push	OFFSET FLAT:$SG70685
	lea	ecx, DWORD PTR __tmp$70684[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$70684[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _id_form$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70687
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70689
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 350		; 0000015eH
	jmp	$eva_err$70612
$L70687:

; 351  : 
; 352  : 			/* Load form holding the button clicked & find button control index */
; 353  : 			if(form_load(cntxt, &id_form, &id_obj, 0)) STACK_ERROR;

	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_form$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_load
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70690
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 353		; 00000161H
	jmp	$eva_err$70612
$L70690:

; 354  : 			cgi = cntxt->cgi + cntxt->cgibtn;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	add	ecx, edx
	mov	DWORD PTR _cgi$70672[ebp], ecx

; 355  : 			cntxt->form->i_ctrl_clic = ctrl_from_cginame(cntxt, cgi->name, cgi->name_sz);

	mov	edx, DWORD PTR _cgi$70672[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _cgi$70672[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_from_cginame
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	DWORD PTR [edx+124], eax

; 356  : 			cntxt->log_clkbtn = cgi->IdCtrl;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _cgi$70672[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	DWORD PTR [eax+32048], edx

; 357  : 			cntxt->log_clkform = cgi->IdForm;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _cgi$70672[ebp]
	mov	edx, DWORD PTR [ecx+20]
	mov	DWORD PTR [eax+32052], edx

; 358  : 
; 359  : 			/* Call button handler */
; 360  : 			CTRL_ACT_HDLR(cntxt->form->i_ctrl_clic);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_call_act_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L70691
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 360		; 00000168H
	jmp	$eva_err$70612
$L70691:

; 361  : 
; 362  : 			/* Reset focus data if form closed */
; 363  : 			if(!cntxt->form || cntxt->form->b_reload)

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+80], 0
	je	SHORT $L70693
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	cmp	DWORD PTR [ecx+140], 0
	je	SHORT $L70692
$L70693:

; 365  : 				M_FREE(cntxt->focus1);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+84]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+84], 0

; 366  : 				M_FREE(cntxt->focus2);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+88]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+88], 0

; 367  : 				M_FREE(cntxt->focus3);

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+92]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+92], 0
$L70692:

; 370  : 		else

	jmp	SHORT $L70695
$L70673:

; 371  : 			if(action_default(cntxt, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_action_default
	add	esp, 8
	test	eax, eax
	je	SHORT $L70695
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 371		; 00000173H
	jmp	$eva_err$70612
$L70695:

; 373  : 
; 374  : 	/* If loaded form is valid : output it */
; 375  : 	if(cntxt->form && !(cntxt->b_terminate & 1) &&
; 376  : 			(	(	!dyntab_cmp(&cntxt->id_form, 0, 0, &cntxt->form->id_form, 0, 0) &&
; 377  : 					!dyntab_cmp(&cntxt->id_obj, 0, 0, &cntxt->form->id_obj, 0, 0)	)
; 378  : 			|| (	!dyntab_cmp(&cntxt->alt_form, 0, 0, &cntxt->form->id_form, 0, 0) &&
; 379  : 					!dyntab_cmp(&cntxt->alt_obj, 0, 0, &cntxt->form->id_obj, 0, 0))) &&
; 380  : 		form_output(cntxt)) STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	$L70696
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29776]
	and	eax, 1
	test	eax, eax
	jne	$L70696
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	add	edx, 12					; 0000000cH
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70698
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	add	edx, 32					; 00000020H
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70697
$L70698:
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	add	edx, 12					; 0000000cH
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70696
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	add	edx, 32					; 00000020H
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 60					; 0000003cH
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70696
$L70697:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_output
	add	esp, 4
	test	eax, eax
	je	SHORT $L70696
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 380		; 0000017cH
	jmp	$eva_err$70612
$L70696:

; 381  : 
; 382  : 	/* Switch to homepage if no form selected */
; 383  : 	if(!cntxt->b_terminate && !dyntab_sz(&cntxt->id_form, 0, 0) && form_set_homepage(cntxt)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29776], 0
	jne	SHORT $L70699
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70699
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_set_homepage
	add	esp, 4
	test	eax, eax
	je	SHORT $L70699
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 383		; 0000017fH
	jmp	$eva_err$70612
$L70699:

; 384  : 
; 385  : 	/* Load & output menubar form if applicable */
; 386  : 	if(!(cntxt->b_terminate & 2) && dyntab_sz(&cntxt->menubar, 0, 0))

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29776]
	and	edx, 2
	test	edx, edx
	jne	$L70700
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29528				; 00007358H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70700

; 388  : 		DynBuffer *html = cntxt->html;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29784]
	mov	DWORD PTR _html$70701[ebp], edx

; 389  : 		int b_terminate = cntxt->b_terminate;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29776]
	mov	DWORD PTR _b_terminate$70702[ebp], ecx

; 390  : 		cntxt->b_terminate = 0;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29776], 0

; 391  : 		cntxt->html = NULL;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29784], 0

; 392  : 		if((!cntxt->form || dyntab_cmp(&cntxt->form->id_form, 0, 0, &cntxt->menubar, 0, 0)) && (
; 393  : 			form_load(cntxt, &cntxt->menubar, NULL, 0) ||
; 394  : 			form_output(cntxt) )) STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L70706
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29528				; 00007358H
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70705
$L70706:
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29528				; 00007358H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_load
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70707
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_output
	add	esp, 4
	test	eax, eax
	je	SHORT $L70705
$L70707:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 394		; 0000018aH
	jmp	$eva_err$70612
$L70705:

; 395  : 		M_FREE(cntxt->html0);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29792]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29792], 0

; 396  : 		cntxt->html0 = cntxt->html;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29784]
	mov	DWORD PTR [eax+29792], edx

; 397  : 		cntxt->html = html;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _html$70701[ebp]
	mov	DWORD PTR [eax+29784], ecx

; 398  : 		cntxt->b_terminate = b_terminate;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _b_terminate$70702[ebp]
	mov	DWORD PTR [edx+29776], eax
$L70700:

; 400  : 
; 401  : 	/* Load & output main form if needed */
; 402  : 	if(!(cntxt->b_terminate & 4) && !cntxt->html &&
; 403  : 		(form_load(cntxt, &cntxt->id_form, &cntxt->id_obj, 0) ||
; 404  : 		form_output(cntxt))) STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29776]
	and	edx, 4
	test	edx, edx
	jne	SHORT $L70708
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29784], 0
	jne	SHORT $L70708
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_load
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70709
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_output
	add	esp, 4
	test	eax, eax
	je	SHORT $L70708
$L70709:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 404		; 00000194H
	jmp	$eva_err$70612
$L70708:

; 405  : 
; 406  : 	/* Load & output alternate form if applicable */
; 407  : 	if(!(cntxt->b_terminate & 8) && !cntxt->html1 && cntxt->alt_form.nbrows && (
; 408  : 		form_load(cntxt, &cntxt->alt_form, &cntxt->alt_obj, 0) ||
; 409  : 		form_output(cntxt))) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29776]
	and	ecx, 8
	test	ecx, ecx
	jne	SHORT $L70710
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29788], 0
	jne	SHORT $L70710
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L70710
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 60					; 0000003cH
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_load
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70711
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_output
	add	esp, 4
	test	eax, eax
	je	SHORT $L70710
$L70711:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 409		; 00000199H
	jmp	SHORT $eva_err$70612
$L70710:

; 410  : 
; 411  : 	/* Ouput hidden input for CGI values not displayed as input */
; 412  : 	if(!(cntxt->b_terminate & 64) && cgi_put_hidden(cntxt)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29776]
	and	ecx, 64					; 00000040H
	test	ecx, ecx
	jne	SHORT $eva_noerr$70713
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_put_hidden
	add	esp, 4
	test	eax, eax
	je	SHORT $eva_noerr$70713
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 412		; 0000019cH
	jmp	SHORT $eva_err$70612
$eva_noerr$70713:

; 413  : 
; 414  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70714
	push	OFFSET FLAT:$SG70715
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70612:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70716
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70717
	push	OFFSET FLAT:$SG70718
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70716:
	lea	eax, DWORD PTR _id_form$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 415  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_process_form ENDP
_TEXT	ENDS
END
