	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_title.c
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
PUBLIC	_ctrl_add_title
EXTRN	_qry_obj_label:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_ctrl_add_child:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_ctrl_put_table_header:NEAR
EXTRN	_ctrl_put_table_footer:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_strstr:NEAR
EXTRN	_html_put_open_btn:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
$SG70250 DB	01H DUP (?)
	ALIGN	4

$SG70330 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70227 DB	'_EVA_DISPLAYFIELDS', 00H
	ORG $+1
$SG70228 DB	'_EVA_DISPLAYFIELDS', 00H
	ORG $+1
$SG70234 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70236 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70244 DB	'none', 00H
	ORG $+3
$SG70246 DB	'100%', 00H
	ORG $+3
$SG70247 DB	'_EVA_NewColumn', 00H
	ORG $+1
$SG70249 DB	'_EVA_TITLE_LABEL', 00H
	ORG $+3
$SG70252 DB	'_EVA_TITLE_BGCOLOR', 00H
	ORG $+1
$SG70254 DB	'_EVA_TITLE_BACKGROUND', 00H
	ORG $+2
$SG70259 DB	'Liste des fiches', 00H
	ORG $+3
$SG70261 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70265 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70275 DB	' (Nouvelle fiche)', 00H
	ORG $+2
$SG70277 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70281 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70285 DB	' - ', 00H
$SG70287 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70291 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70295 DB	'<td><table align=left cellspacing=0 cellpadding=0 border'
	DB	'=0><tr><td valign=top>', 00H
	ORG $+1
$SG70297 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70301 DB	'_eva_btn_helpbook.gif', 00H
	ORG $+2
$SG70303 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70306 DB	'_eva_btn_helpbook_s.gif', 00H
$SG70308 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70313 DB	'</td>', 00H
	ORG $+2
$SG70315 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70316 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70317 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70322 DB	'<font size=-2>', 00H
	ORG $+1
$SG70324 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70327 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70331 DB	' - ', 00H
$SG70333 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70336 DB	'</font><br>', 00H
$SG70338 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70341 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70345 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70348 DB	' ', 00H
	ORG $+2
$SG70350 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70353 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70357 DB	'</tr></table></td>', 0aH, 00H
$SG70359 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70362 DB	'<td align=right><table cellspacing=0 cellpadding=0 borde'
	DB	'r=0><tr>', 0aH, 00H
	ORG $+2
$SG70364 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70368 DB	'</tr></table></td>', 0aH, 00H
$SG70370 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70374 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_title.c', 00H
	ORG $+3
$SG70375 DB	'ctrl_add_title', 00H
	ORG $+1
$SG70377 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_title.c', 00H
	ORG $+3
$SG70378 DB	'ctrl_add_title', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -32
_ctrl$ = -80
_ctrltree$ = -28
_data$ = -56
_title$ = -84
_label$ = -72
_notes$ = -68
_img$ = -60
_imgsel$ = -8
_html$ = -36
_oldlabel$ = -76
_b_data$ = -64
_b_title$ = -4
_ctrl_add_title PROC NEAR

; 31   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 100				; 00000064H

; 32   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 33   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 34   : 	DynTable ctrltree = { 0 };

	mov	DWORD PTR _ctrltree$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _ctrltree$[ebp+4], edx
	mov	DWORD PTR _ctrltree$[ebp+8], edx
	mov	DWORD PTR _ctrltree$[ebp+12], edx
	mov	DWORD PTR _ctrltree$[ebp+16], edx

; 35   : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _data$[ebp+4], eax
	mov	DWORD PTR _data$[ebp+8], eax
	mov	DWORD PTR _data$[ebp+12], eax
	mov	DWORD PTR _data$[ebp+16], eax

; 36   : 	DynBuffer *title = NULL;

	mov	DWORD PTR _title$[ebp], 0

; 37   : 	DynBuffer *label = NULL;

	mov	DWORD PTR _label$[ebp], 0

; 38   : 	DynBuffer *notes = NULL;

	mov	DWORD PTR _notes$[ebp], 0

; 39   : 	DynBuffer *img = NULL;

	mov	DWORD PTR _img$[ebp], 0

; 40   : 	DynBuffer *imgsel = NULL;

	mov	DWORD PTR _imgsel$[ebp], 0

; 41   : 	DynBuffer **html = form->html;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR _html$[ebp], edx

; 42   : 	char *oldlabel = ctrl->LABEL;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	mov	DWORD PTR _oldlabel$[ebp], ecx

; 43   : 	int b_data = DYNTAB_FIELD_CELL(&form->ctrl->attr, DISPLAYFIELDS) ||
; 44   : 									CTRL_ATTR_CELL(DISPLAYFIELDS);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70227
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70385
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70383
	push	0
	push	-1
	push	OFFSET FLAT:$SG70228
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -88+[ebp], eax
	jmp	SHORT $L70384
$L70383:
	mov	DWORD PTR -88+[ebp], 0
$L70384:
	cmp	DWORD PTR -88+[ebp], 0
	jne	SHORT $L70385
	mov	DWORD PTR -92+[ebp], 0
	jmp	SHORT $L70386
$L70385:
	mov	DWORD PTR -92+[ebp], 1
$L70386:
	mov	edx, DWORD PTR -92+[ebp]
	mov	DWORD PTR _b_data$[ebp], edx

; 45   : 	int b_title = 0;

	mov	DWORD PTR _b_title$[ebp], 0

; 46   : 
; 47   : 	/* No output in print mode */
; 48   : 	if(form->step == HtmlPrint) RETURN_OK;

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 7
	jne	SHORT $L70230
	jmp	$eva_noerr$70231
$L70230:

; 49   : 
; 50   : 	/* Read control attributes */
; 51   : 	CTRL_ATTR(ctrltree, CTRLTREE);

	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70234
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70233
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70236
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 51		; 00000033H
	jmp	$eva_err$70237
$L70233:

; 52   : 
; 53   : 	switch(form->step)
; 54   : 	{

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+176]
	mov	DWORD PTR -96+[ebp], ecx
	mov	edx, DWORD PTR -96+[ebp]
	sub	edx, 3
	mov	DWORD PTR -96+[ebp], edx
	cmp	DWORD PTR -96+[ebp], 8
	ja	$L70372
	mov	ecx, DWORD PTR -96+[ebp]
	xor	eax, eax
	mov	al, BYTE PTR $L70389[ecx]
	jmp	DWORD PTR $L70390[eax*4]
$L70242:

; 55   : 	case HtmlEdit:
; 56   : 	case HtmlView:
; 57   : 	case HtmlPrint:
; 58   : 	case HtmlSaveDlg:
; 59   : 	case FormList: 
; 60   : 	case FormSearch:
; 61   : 	case FormStats: 
; 62   : 	case FormValues:
; 63   : 		/* Set title default attributes values */
; 64   : 		if(!ctrl->TABLERULES[0]) ctrl->TABLERULES = "none";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+448]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70243
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+448], OFFSET FLAT:$SG70244
$L70243:

; 65   : 		if(!ctrl->TABLEWIDTH[0]) ctrl->TABLEWIDTH = "100%";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+440]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70245
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+440], OFFSET FLAT:$SG70246
$L70245:

; 66   : 		ctrl->POSITION = "_EVA_NewColumn";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+296], OFFSET FLAT:$SG70247

; 67   : 		ctrl->NOTES = form->ctrl->NOTES;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [eax+288]
	mov	DWORD PTR [ecx+288], edx

; 68   : 		if(CTRL_ATTR_VAL(TITLE_LABEL)[0] != '1') ctrl->LABEL = form->ctrl->LABEL;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70387
	push	0
	push	-1
	push	OFFSET FLAT:$SG70249
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -100+[ebp], eax
	jmp	SHORT $L70388
$L70387:
	mov	DWORD PTR -100+[ebp], OFFSET FLAT:$SG70250
$L70388:
	mov	ecx, DWORD PTR -100+[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 49					; 00000031H
	je	SHORT $L70248
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [ecx+284]
	mov	DWORD PTR [edx+284], eax
$L70248:

; 69   : 		if(!ctrl->TABLEBGCOLOR[0]) ctrl->TABLEBGCOLOR = DYNTAB_FIELD_VAL(&cntxt->cnf_data, TITLE_BGCOLOR);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+452]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70251
	push	0
	push	-1
	push	OFFSET FLAT:$SG70252
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+452], eax
$L70251:

; 70   : 		if(!ctrl->TABLEBACKGROUND[0]) ctrl->TABLEBACKGROUND = DYNTAB_FIELD_VAL(&cntxt->cnf_data, TITLE_BACKGROUND);

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+456]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70253
	push	0
	push	-1
	push	OFFSET FLAT:$SG70254
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29360				; 000072b0H
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+456], eax
$L70253:

; 71   : 
; 72   : 		/* Build title label & value */
; 73   : 		if(form->step == FormList || form->step == FormSearch)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 8
	je	SHORT $L70256
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 9
	jne	SHORT $L70255
$L70256:

; 75   : 			/* List or search mode - use form label as value */
; 76   :  			DYNBUF_ADD_STR(&label, "Liste des fiches");

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70259
	lea	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70258
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70261
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 76		; 0000004cH
	jmp	$eva_err$70237
$L70258:

; 77   :  			DYNBUF_ADD(&title, ctrl->LABEL, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	push	edx
	lea	eax, DWORD PTR _title$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70263
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70265
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 77		; 0000004dH
	jmp	$eva_err$70237
$L70263:

; 79   : 		else

	jmp	$L70274
$L70255:

; 81   : 			if(qry_obj_label(cntxt, &label, &notes, NULL, &title, &notes, &img, &imgsel, NULL, 0, NULL, 0))

	push	0
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _imgsel$[ebp]
	push	eax
	lea	ecx, DWORD PTR _img$[ebp]
	push	ecx
	lea	edx, DWORD PTR _notes$[ebp]
	push	edx
	lea	eax, DWORD PTR _title$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _notes$[ebp]
	push	ecx
	lea	edx, DWORD PTR _label$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_label
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L70270

; 82   : 				STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 82		; 00000052H
	jmp	$eva_err$70237
$L70270:

; 83   : 			b_title = title != NULL;

	xor	edx, edx
	cmp	DWORD PTR _title$[ebp], 0
	setne	dl
	mov	DWORD PTR _b_title$[ebp], edx

; 84   : 			if(!dyntab_sz(&form->id_obj, 0, 0) && b_data) DYNBUF_ADD_STR(&title, " (Nouvelle fiche)");

	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70274
	cmp	DWORD PTR _b_data$[ebp], 0
	je	SHORT $L70274
	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70275
	lea	ecx, DWORD PTR _title$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70274
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70277
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 84		; 00000054H
	jmp	$eva_err$70237
$L70274:

; 86   : 
; 87   : 		/* Handle form title */
; 88   : 		DYNBUF_ADD_BUF(&form->title, label, NO_CONV);

	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L70279
	push	0
	push	0
	mov	ecx, DWORD PTR _label$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _label$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 84					; 00000054H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70279
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70281
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 88		; 00000058H
	jmp	$eva_err$70237
$L70279:

; 89   : 		if(label && title) DYNBUF_ADD_STR(&form->title, " - ");

	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L70284
	cmp	DWORD PTR _title$[ebp], 0
	je	SHORT $L70284
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG70285
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 84					; 00000054H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70284
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70287
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 89		; 00000059H
	jmp	$eva_err$70237
$L70284:

; 90   : 		DYNBUF_ADD_BUF(&form->title, title, NO_CONV);

	cmp	DWORD PTR _title$[ebp], 0
	je	SHORT $L70289
	push	0
	push	0
	mov	ecx, DWORD PTR _title$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _title$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 84					; 00000054H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70289
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70291
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 90		; 0000005aH
	jmp	$eva_err$70237
$L70289:

; 91   : 
; 92   : 		/* Switch output to html_tiltle & output HTML table header */
; 93   : 		form->html = &form->html_title;

	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 212				; 000000d4H
	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+232], ecx

; 94   : 		if(ctrl_put_table_header(cntxt, ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_put_table_header
	add	esp, 8
	test	eax, eax
	je	SHORT $L70292
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 94		; 0000005eH
	jmp	$eva_err$70237
$L70292:

; 95   : 
; 96   : 		/* Output title button */
; 97   : 		DYNBUF_ADD_STR(form->html, "<td><table align=left cellspacing=0 cellpadding=0 border=0><tr><td valign=top>");

	push	0
	push	0
	push	78					; 0000004eH
	push	OFFSET FLAT:$SG70295
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70294
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70297
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 97		; 00000061H
	jmp	$eva_err$70237
$L70294:

; 98   : 		if(!img)

	cmp	DWORD PTR _img$[ebp], 0
	jne	SHORT $L70305

; 100  : 			DYNBUF_ADD_STR(&img, "_eva_btn_helpbook.gif");

	push	0
	push	0
	push	21					; 00000015H
	push	OFFSET FLAT:$SG70301
	lea	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70300
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70303
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 100		; 00000064H
	jmp	$eva_err$70237
$L70300:

; 101  : 			DYNBUF_ADD_STR(&imgsel, "_eva_btn_helpbook_s.gif");

	push	0
	push	0
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70306
	lea	ecx, DWORD PTR _imgsel$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70305
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70308
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 101		; 00000065H
	jmp	$eva_err$70237
$L70305:

; 103  : 		if(html_put_open_btn(cntxt, NULL, label, title, notes, img, imgsel, 0, 0, 0, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _imgsel$[ebp]
	push	ecx
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	mov	eax, DWORD PTR _notes$[ebp]
	push	eax
	mov	ecx, DWORD PTR _title$[ebp]
	push	ecx
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_html_put_open_btn
	add	esp, 48					; 00000030H
	test	eax, eax
	je	SHORT $L70310
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 103		; 00000067H
	jmp	$eva_err$70237
$L70310:

; 104  : 		DYNBUF_ADD_STR(form->html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70313
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70312
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70315
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 104		; 00000068H
	jmp	$eva_err$70237
$L70312:

; 105  : 
; 106  : 		/* Output title text */
; 107  : 		ctrl->LABELPOS = "_EVA_NONE";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+292], OFFSET FLAT:$SG70316

; 108  : 		ctrl->OPTIONBUTTON = "_EVA_NONE";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+336], OFFSET FLAT:$SG70317

; 109  : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70318
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 109		; 0000006dH
	jmp	$eva_err$70237
$L70318:

; 110  : 		if(b_data && b_title)

	cmp	DWORD PTR _b_data$[ebp], 0
	je	$L70319
	cmp	DWORD PTR _b_title$[ebp], 0
	je	$L70319

; 112  : 			DYNBUF_ADD_STR(form->html, "<font size=-2>");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70322
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70321
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70324
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 112		; 00000070H
	jmp	$eva_err$70237
$L70321:

; 113  : 			DYNBUF_ADD_BUF(form->html, label, TO_HTML);

	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L70325
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	eax, DWORD PTR _label$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _label$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70325
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70327
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 113		; 00000071H
	jmp	$eva_err$70237
$L70325:

; 114  : 			if(label && !strstr(label->data, form->ctrl->LABEL))

	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L70329
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	mov	ecx, DWORD PTR _label$[ebp]
	add	ecx, 8
	push	ecx
	call	_strstr
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70329

; 115  : 				DYNBUF_ADD3(form->html, " - ", form->ctrl->LABEL, 0, TO_HTML, "");

	push	0
	push	OFFSET FLAT:$SG70330
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	push	3
	push	OFFSET FLAT:$SG70331
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70329
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70333
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 115		; 00000073H
	jmp	$eva_err$70237
$L70329:

; 116  : 			DYNBUF_ADD_STR(form->html, "</font><br>");

	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70336
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70335
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70338
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 116		; 00000074H
	jmp	$eva_err$70237
$L70335:

; 117  : 			DYNBUF_ADD_BUF(form->html, title, TO_HTML);

	cmp	DWORD PTR _title$[ebp], 0
	je	SHORT $L70339
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR _title$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _title$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70339
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70341
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 117		; 00000075H
	jmp	$eva_err$70237
$L70339:

; 119  : 		else

	jmp	$L70351
$L70319:

; 121  : 			DYNBUF_ADD_BUF(form->html, label, TO_HTML);

	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L70343
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	edx, DWORD PTR _label$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _label$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70343
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70345
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 121		; 00000079H
	jmp	$eva_err$70237
$L70343:

; 122  : 			DYNBUF_ADD_STR(form->html, " ");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70348
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70347
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70350
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 122		; 0000007aH
	jmp	$eva_err$70237
$L70347:

; 123  : 			DYNBUF_ADD_BUF(form->html, title, TO_HTML);

	cmp	DWORD PTR _title$[ebp], 0
	je	SHORT $L70351
	push	1
	push	OFFSET FLAT:_plain_to_html
	mov	ecx, DWORD PTR _title$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _title$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70351
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70353
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 123		; 0000007bH
	jmp	$eva_err$70237
$L70351:

; 125  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70354
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 125		; 0000007dH
	jmp	$eva_err$70237
$L70354:

; 126  : 		DYNBUF_ADD_STR(form->html, "</tr></table></td>\n");

	push	0
	push	0
	push	19					; 00000013H
	push	OFFSET FLAT:$SG70357
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70356
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70359
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 126		; 0000007eH
	jmp	$eva_err$70237
$L70356:

; 127  : 		ctrl->LABEL = oldlabel;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _oldlabel$[ebp]
	mov	DWORD PTR [eax+284], ecx

; 128  : 
; 129  : 		/* Add lower level controls */
; 130  : 		DYNBUF_ADD_STR(form->html, "<td align=right><table cellspacing=0 cellpadding=0 border=0><tr>\n");

	push	0
	push	0
	push	65					; 00000041H
	push	OFFSET FLAT:$SG70362
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70361
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70364
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 130		; 00000082H
	jmp	$eva_err$70237
$L70361:

; 131  : 		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70365
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 131		; 00000083H
	jmp	$eva_err$70237
$L70365:
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	mov	DWORD PTR _ctrl$[ebp], eax

; 132  : 		DYNBUF_ADD_STR(form->html, "</tr></table></td>\n");

	push	0
	push	0
	push	19					; 00000013H
	push	OFFSET FLAT:$SG70368
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70367
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70370
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 132		; 00000084H
	jmp	$eva_err$70237
$L70367:

; 133  : 
; 134  : 		/* Output HTML table footer */
; 135  : 		if(ctrl_put_table_footer(cntxt, ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_put_table_footer
	add	esp, 8
	test	eax, eax
	je	SHORT $L70371
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 135		; 00000087H
	jmp	SHORT $eva_err$70237
$L70371:

; 136  : 		form->html = html;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _html$[ebp]
	mov	DWORD PTR [edx+232], eax

; 137  : 		break;

	jmp	SHORT $eva_noerr$70231
$L70372:

; 138  : 
; 139  : 	default:
; 140  : 		/* Add lower level controls */
; 141  : 		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70373
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 141		; 0000008dH
	jmp	SHORT $eva_err$70237
$L70373:
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx
$eva_noerr$70231:

; 143  : 
; 144  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70374
	push	OFFSET FLAT:$SG70375
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70237:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70376
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70377
	push	OFFSET FLAT:$SG70378
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70376:
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _label$[ebp], 0
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
	mov	ecx, DWORD PTR _title$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _title$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 145  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70390:
	DD	$L70242
	DD	$L70372
$L70389:
	DB	0
	DB	0
	DB	1
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
_ctrl_add_title ENDP
_TEXT	ENDS
END
