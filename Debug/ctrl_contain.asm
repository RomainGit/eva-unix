	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c
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
PUBLIC	_ctrl_add_tab
EXTRN	_cgi_build_basename:NEAR
EXTRN	_mem_realloc:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_ctrl_add_child:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_ctrl_put_table_header:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_ctrl_put_table_footer:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
_BSS	SEGMENT
$SG70238 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70215 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70217 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70230 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70232 DB	'_EVA_NewLine', 00H
	ORG $+3
$SG70234 DB	'none', 00H
	ORG $+3
$SG70236 DB	'_EVA_LEFT', 00H
	ORG $+2
$SG70237 DB	'_EVA_TABS_POS', 00H
	ORG $+2
$SG70239 DB	'EVATabBorderH', 00H
	ORG $+2
$SG70240 DB	'EVATabBorderV', 00H
	ORG $+2
$SG70249 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70250 DB	'_EVA_TOP', 00H
	ORG $+3
$SG70251 DB	'+1', 00H
	ORG $+1
$SG70252 DB	'1', 00H
	ORG $+2
$SG70253 DB	'100%', 00H
	ORG $+3
$SG70265 DB	' -->', 0aH, 00H
	ORG $+2
$SG70266 DB	0aH, '<!--- Start Tab ', 00H
	ORG $+2
$SG70268 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70274 DB	' -->', 0aH, 00H
	ORG $+2
$SG70275 DB	0aH, '<!--- End Tab ', 00H
$SG70277 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70285 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG70286 DB	'ctrl_add_tab', 00H
	ORG $+3
$SG70288 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG70289 DB	'ctrl_add_tab', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -24
_ctrl$ = -32
_ctrltree$ = -20
_prev$ = -28
_newdest$70225 = -36
_id$70242 = -40
_ctrl_add_tab PROC NEAR

; 25   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H

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

; 28   : 	DynTable ctrltree = { 0 };

	mov	DWORD PTR _ctrltree$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _ctrltree$[ebp+4], edx
	mov	DWORD PTR _ctrltree$[ebp+8], edx
	mov	DWORD PTR _ctrltree$[ebp+12], edx
	mov	DWORD PTR _ctrltree$[ebp+16], edx

; 29   : 	DynBuffer **prev = form->html;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR _prev$[ebp], ecx

; 30   : 
; 31   : 	/* Read control attributes */
; 32   : 	CTRL_ATTR(ctrltree, CTRLTREE);

	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70215
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70214
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70217
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 32		; 00000020H
	jmp	$eva_err$70218
$L70214:

; 33   : 
; 34   : 	switch(form->step)
; 35   : 	{

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+176]
	mov	DWORD PTR -44+[ebp], edx
	cmp	DWORD PTR -44+[ebp], 7
	ja	$L70282
	mov	eax, DWORD PTR -44+[ebp]
	jmp	DWORD PTR $L71419[eax*4]
$L70223:

; 36   : 	case CtrlRead:
; 37   : 		/* Set cginame */
; 38   : 		if(cgi_build_basename(cntxt, &ctrl->cginame, i_ctrl, 'T')) STACK_ERROR;

	push	84					; 00000054H
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_build_basename
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70224
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 38		; 00000026H
	jmp	$eva_err$70218
$L70224:

; 39   : 
; 40   : 		/* Handle tabs list */
; 41   : 		M_REALLOC(unsigned long, form->tabs, form->nb_tabs);

	push	8
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+112]
	shl	eax, 2
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	push	edx
	call	_mem_realloc
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newdest$70225[ebp], eax
	cmp	DWORD PTR _newdest$70225[ebp], 0
	jne	SHORT $L70228
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70230
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 41		; 00000029H
	jmp	$eva_err$70218
$L70228:
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _newdest$70225[ebp]
	mov	DWORD PTR [edx+108], eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	add	edx, 1
	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+112], edx

; 42   : 		form->tabs[form->nb_tabs - 1] = i_ctrl;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	mov	DWORD PTR [ecx+edx*4-4], eax

; 43   : 
; 44   : 		/* Set fixed values for tabs */
; 45   : 		ctrl->POSITION = "_EVA_NewLine";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+296], OFFSET FLAT:$SG70232

; 46   : 		ctrl->COLSPAN = 0;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+328], 0

; 47   : 		ctrl->ROWSPAN = 0;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+332], 0

; 48   : 		if(!ctrl->TABLERULES[0] && !*ctrl->TABLE_STYLE) ctrl->TABLERULES = "none";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+448]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70233
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+476]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70233
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+448], OFFSET FLAT:$SG70234
$L70233:

; 49   : 		if(!ctrl->CELL_STYLE[0]) ctrl->CELL_STYLE = !strcmp(ATTR_VAL(form->ctrl, TABS_POS), "_EVA_LEFT") ? "EVATabBorderH" : "EVATabBorderV";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+468]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70235
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L71415
	push	0
	push	-1
	push	OFFSET FLAT:$SG70237
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L71416
$L71415:
	mov	DWORD PTR -48+[ebp], OFFSET FLAT:$SG70238
$L71416:
	push	OFFSET FLAT:$SG70236
	mov	edx, DWORD PTR -48+[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71417
	mov	DWORD PTR -52+[ebp], OFFSET FLAT:$SG70239
	jmp	SHORT $L71418
$L71417:
	mov	DWORD PTR -52+[ebp], OFFSET FLAT:$SG70240
$L71418:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR -52+[ebp]
	mov	DWORD PTR [eax+468], ecx
$L70235:

; 50   : 
; 51   : 		/* Handle tab optimization */
; 52   : 		if(form->opttabid)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+120], 0
	je	SHORT $L70246

; 54   : 			unsigned long id = DYNTAB_TOUL(&ctrl->id);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id$70242[ebp], eax

; 55   : 			if(form->opttabid == ~0UL) form->opttabid = id;

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+120], -1
	jne	SHORT $L70244
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _id$70242[ebp]
	mov	DWORD PTR [edx+120], eax
$L70244:

; 56   : 			if(form->opttabid == id)

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+120]
	cmp	edx, DWORD PTR _id$70242[ebp]
	jne	SHORT $L70245

; 57   : 				form->seltab = i_ctrl;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	mov	DWORD PTR [eax+116], ecx

; 58   : 			else

	jmp	SHORT $L70246
$L70245:

; 59   : 				break;

	jmp	$eva_noerr$70284
$L70246:

; 61   : 
; 62   : 		/* Add lower level controls */
; 63   : 		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70247
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 63		; 0000003fH
	jmp	$eva_err$70218
$L70247:
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 64   : 		break;

	jmp	$eva_noerr$70284
$L70248:

; 65   : 
; 66   : 	case HtmlPrint:
; 67   : 		/* Set tab title print format */
; 68   : 		ctrl->OPTIONBUTTON = "_EVA_NONE";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+336], OFFSET FLAT:$SG70249

; 69   : 		ctrl->LABELPOS = "_EVA_TOP";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+292], OFFSET FLAT:$SG70250

; 70   : 		ctrl->LABELFONTSIZE = "+1";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+412], OFFSET FLAT:$SG70251

; 71   : 		ctrl->LABELBOLD = "1";

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+420], OFFSET FLAT:$SG70252

; 72   : 		ctrl->TABLEWIDTH = "100%";

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+440], OFFSET FLAT:$SG70253

; 73   : 
; 74   : 		/* Position control & output HTML table header */
; 75   : 		form->html = &form->html_tab;

	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 224				; 000000e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+232], edx

; 76   : 		if(ctrl_format_pos(cntxt, ctrl, 1) ||
; 77   : 			ctrl_put_table_header(cntxt, ctrl)) STACK_ERROR;

	push	1
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70255
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_put_table_header
	add	esp, 8
	test	eax, eax
	je	SHORT $L70254
$L70255:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 77		; 0000004dH
	jmp	$eva_err$70218
$L70254:

; 78   : 
; 79   : 		/* Add lower level controls */
; 80   : 		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70256
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 80		; 00000050H
	jmp	$eva_err$70218
$L70256:
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	mov	DWORD PTR _ctrl$[ebp], eax

; 81   : 
; 82   : 		/* Output HTML table footer */
; 83   : 		if(ctrl_put_table_footer(cntxt, ctrl) ||
; 84   : 			ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_table_footer
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70258
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70257
$L70258:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 84		; 00000054H
	jmp	$eva_err$70218
$L70257:

; 85   : 		break;

	jmp	$eva_noerr$70284
$L70259:

; 86   : 
; 87   : 	case HtmlEdit:
; 88   : 	case HtmlView:
; 89   : 
; 90   : 		/* Handle active tab */
; 91   : 		if(!form->seltab) form->seltab = i_ctrl;

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+116], 0
	jne	SHORT $L70260
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	mov	DWORD PTR [ecx+116], edx
$L70260:

; 92   : 
; 93   : 		/* If tab is active */
; 94   : 		if(form->seltab == i_ctrl)

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+116]
	cmp	ecx, DWORD PTR _i_ctrl$[ebp]
	jne	$L70261

; 96   : 			/* Output lower level controls */
; 97   : 			form->html = &form->html_tab;

	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 224				; 000000e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+232], edx

; 98   : 			if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(form->html, "\n<!--- Start Tab ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29860]
	and	edx, 128				; 00000080H
	test	edx, edx
	je	SHORT $L70264
	push	5
	push	OFFSET FLAT:$SG70265
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70266
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70264
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70268
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 98		; 00000062H
	jmp	$eva_err$70218
$L70264:

; 99   : 			CTRL_ADD_CHILD(i_ctrl, NULL);

	push	0
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70270
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 99		; 00000063H
	jmp	$eva_err$70218
$L70270:
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 100  : 			if(cntxt->debug & DEBUG_HTML) DYNBUF_ADD3(form->html, "\n<!--- End Tab ", ctrl->LABEL, 0, NO_CONV, " -->\n");

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29860]
	and	ecx, 128				; 00000080H
	test	ecx, ecx
	je	SHORT $L70273
	push	5
	push	OFFSET FLAT:$SG70274
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70275
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70273
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70277
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 100		; 00000064H
	jmp	$eva_err$70218
$L70273:

; 102  : 		else if(!form->opttabid)

	jmp	SHORT $L70279
$L70261:
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+120], 0
	jne	SHORT $L70279

; 104  : 			/* Process lower level controls with no HTML output
; 105  : 				This is needed because other tabs may be output by controls
; 106  : 				located in hidden tabs */
; 107  : 			form->html = NULL;

	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+232], 0

; 108  : 			CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70281
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 108		; 0000006cH
	jmp	$eva_err$70218
$L70281:
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx
$L70279:

; 110  : 		ctrl->b_selected = 1;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+196], 1

; 111  : 
; 112  : 		/* Switch to form bottom after first level tab */
; 113  : 		form->html = prev;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _prev$[ebp]
	mov	DWORD PTR [eax+232], ecx

; 114  : 		break;

	jmp	SHORT $eva_noerr$70284
$L70282:

; 115  : 
; 116  : 	default:
; 117  : 		/* Add lower level controls */
; 118  : 		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70283
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 118		; 00000076H
	jmp	SHORT $eva_err$70218
$L70283:
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx
$eva_noerr$70284:

; 120  : 
; 121  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70285
	push	OFFSET FLAT:$SG70286
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70218:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70287
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70288
	push	OFFSET FLAT:$SG70289
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70287:
	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 122  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L71419:
	DD	$L70223
	DD	$L70282
	DD	$L70282
	DD	$L70282
	DD	$L70259
	DD	$L70282
	DD	$L70259
	DD	$L70248
_ctrl_add_tab ENDP
_TEXT	ENDS
PUBLIC	_ctrl_tab_image
EXTRN	__snprintf:NEAR
_BSS	SEGMENT
	ALIGN	4

_?img@?1??ctrl_tab_image@@9@9 DB 040H DUP (?)
$SG70300 DB	01H DUP (?)
	ALIGN	4

$SG70301 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70299 DB	'_', 00H
	ORG $+2
$SG70302 DB	'_eva_tab_%s%s%s.gif', 00H
_DATA	ENDS
_TEXT	SEGMENT
_pfx$ = 8
_pos$ = 12
_ctrl_tab_image PROC NEAR

; 133  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 134  : 	static char img[64];
; 135  : 	snprintf(add_sz_str(img), "_eva_tab_%s%s%s.gif", pfx ? pfx : "", pfx ? "_" : "", pos);

	cmp	DWORD PTR _pfx$[ebp], 0
	je	SHORT $L71421
	mov	DWORD PTR -4+[ebp], OFFSET FLAT:$SG70299
	jmp	SHORT $L71422
$L71421:
	mov	DWORD PTR -4+[ebp], OFFSET FLAT:$SG70300
$L71422:
	cmp	DWORD PTR _pfx$[ebp], 0
	je	SHORT $L71423
	mov	eax, DWORD PTR _pfx$[ebp]
	mov	DWORD PTR -8+[ebp], eax
	jmp	SHORT $L71424
$L71423:
	mov	DWORD PTR -8+[ebp], OFFSET FLAT:$SG70301
$L71424:
	mov	ecx, DWORD PTR _pos$[ebp]
	push	ecx
	mov	edx, DWORD PTR -4+[ebp]
	push	edx
	mov	eax, DWORD PTR -8+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70302
	push	63					; 0000003fH
	push	OFFSET FLAT:_?img@?1??ctrl_tab_image@@9@9
	call	__snprintf
	add	esp, 24					; 00000018H

; 136  : 
; 137  : 	return img;

	mov	eax, OFFSET FLAT:_?img@?1??ctrl_tab_image@@9@9

; 138  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_tab_image ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_tab_header
EXTRN	_put_html_format_pos:NEAR
EXTRN	_put_html_button_sz:NEAR
EXTRN	_atoi:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_put_html_img:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_html_tooltip:BYTE
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_ctrl_add_opt_btn:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_put_showhelp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70330 DB	01H DUP (?)
	ALIGN	4

$SG70333 DB	01H DUP (?)
	ALIGN	4

$SG70336 DB	01H DUP (?)
	ALIGN	4

$SG70339 DB	01H DUP (?)
	ALIGN	4

$SG70342 DB	01H DUP (?)
	ALIGN	4

$SG70347 DB	01H DUP (?)
	ALIGN	4

$SG70354 DB	01H DUP (?)
	ALIGN	4

$SG70412 DB	01H DUP (?)
	ALIGN	4

$SG70417 DB	01H DUP (?)
	ALIGN	4

$SG70419 DB	01H DUP (?)
	ALIGN	4

$SG70440 DB	01H DUP (?)
	ALIGN	4

$SG70474 DB	01H DUP (?)
	ALIGN	4

$SG70495 DB	01H DUP (?)
	ALIGN	4

$SG70515 DB	01H DUP (?)
	ALIGN	4

$SG70595 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70329 DB	'_EVA_TABSHEIGHT', 00H
$SG70332 DB	'_EVA_TABSWIDTH', 00H
	ORG $+1
$SG70335 DB	'_EVA_TABSBGCOLOR', 00H
	ORG $+3
$SG70338 DB	'_EVA_TABSBORDER', 00H
$SG70341 DB	'_EVA_TABS_POS', 00H
	ORG $+2
$SG70344 DB	'_EVA_LEFT', 00H
	ORG $+2
$SG70346 DB	'_EVA_TABS_HEADER_MODE', 00H
	ORG $+2
$SG70349 DB	'_EVA_MENUPOS', 00H
	ORG $+3
$SG70351 DB	'_EVA_TABS_HEADER_MODE', 00H
	ORG $+2
$SG70353 DB	'_EVA_TABSHEIGHT', 00H
$SG70363 DB	'_EVA_TAB', 00H
	ORG $+3
$SG70372 DB	'FFFFFF', 00H
	ORG $+1
$SG70373 DB	'top', 00H
$SG70374 DB	'bottom', 00H
	ORG $+1
$SG70375 DB	'right', 00H
	ORG $+2
$SG70376 DB	'_EVA_NewColumn', 00H
	ORG $+1
$SG70379 DB	' rules=none cellspacing=0 cellpadding=0', 00H
$SG70380 DB	'<table border=', 00H
	ORG $+1
$SG70382 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70386 DB	' width=100%', 00H
$SG70388 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70391 DB	'><tr>', 00H
	ORG $+2
$SG70393 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70395 DB	'FFFFFF', 00H
	ORG $+1
$SG70405 DB	']', 00H
	ORG $+2
$SG70406 DB	'[', 00H
	ORG $+2
$SG70408 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70413 DB	0aH, 0aH, 00H
	ORG $+1
$SG70415 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70416 DB	'_EVA_IMAGE', 00H
	ORG $+1
$SG70418 DB	'_EVA_IMAGESEL', 00H
	ORG $+2
$SG70425 DB	'left_s', 00H
	ORG $+1
$SG70426 DB	'mid_sl', 00H
	ORG $+1
$SG70427 DB	'left', 00H
	ORG $+3
$SG70428 DB	'mid_sr', 00H
	ORG $+1
$SG70429 DB	'mid', 00H
$SG70433 DB	'<td width=1 valign=top', 00H
	ORG $+1
$SG70435 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70441 DB	' bgcolor=#', 00H
	ORG $+1
$SG70443 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70446 DB	'.gif''>', 00H
	ORG $+1
$SG70447 DB	' background=''../img/_eva_tab_bg_', 00H
	ORG $+3
$SG70449 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70459 DB	'</td>', 00H
	ORG $+2
$SG70461 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70469 DB	'+0', 00H
	ORG $+1
$SG70470 DB	'../img/_eva_tab_bg_s.gif', 00H
	ORG $+3
$SG70471 DB	'center', 00H
	ORG $+1
$SG70472 DB	'_EVA_NewColumn', 00H
	ORG $+1
$SG70475 DB	'<img src=../img/_eva_nop.gif height=2><br>', 00H
	ORG $+1
$SG70477 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70483 DB	''')', 00H
	ORG $+1
$SG70484 DB	'<td class=EVAUnselHTab background=''../img/_eva_tab_bg.g'
	DB	'if'' align=center onClick=cb(''', 00H
	ORG $+3
$SG70486 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70489 DB	'''', 00H
	ORG $+2
$SG70490 DB	' title=''', 00H
	ORG $+3
$SG70492 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70496 DB	'>', 00H
	ORG $+2
$SG70498 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70501 DB	'</td>', 00H
	ORG $+2
$SG70503 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70505 DB	'right_s', 00H
$SG70506 DB	'right', 00H
	ORG $+2
$SG70509 DB	'<td width=1 valign=top', 00H
	ORG $+1
$SG70511 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70516 DB	' bgcolor=#', 00H
	ORG $+1
$SG70518 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70521 DB	'.gif''>', 00H
	ORG $+1
$SG70522 DB	' background=''../img/_eva_tab_bg_', 00H
	ORG $+3
$SG70524 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70534 DB	'</td></tr><tr>', 00H
	ORG $+1
$SG70536 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70539 DB	'></td>', 00H
	ORG $+1
$SG70540 DB	'<td bgcolor=#000000 colspan=', 00H
	ORG $+3
$SG70542 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70545 DB	'>', 00H
	ORG $+2
$SG70546 DB	'<td bgcolor=#', 00H
	ORG $+2
$SG70548 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70555 DB	'bot', 00H
$SG70558 DB	'></td>', 00H
	ORG $+1
$SG70559 DB	'</td><td bgcolor=#', 00H
	ORG $+1
$SG70561 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70564 DB	'>', 00H
	ORG $+2
$SG70565 DB	'<td bgcolor=#', 00H
	ORG $+2
$SG70567 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70574 DB	'bot', 00H
$SG70577 DB	'</td>', 00H
	ORG $+2
$SG70579 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70582 DB	'></td>', 00H
	ORG $+1
$SG70583 DB	'<td bgcolor=#000000 colspan=', 00H
	ORG $+3
$SG70585 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70590 DB	'</tr><tr>', 00H
	ORG $+2
$SG70592 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70596 DB	'<td class=EVASelVTab bgcolor=#', 00H
	ORG $+1
$SG70598 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70601 DB	'>', 00H
	ORG $+2
$SG70602 DB	' height=', 00H
	ORG $+3
$SG70604 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70607 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70613 DB	''')', 00H
	ORG $+1
$SG70614 DB	'<td class=EVAUnselVTab onClick=cb(''', 00H
$SG70616 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70619 DB	'''', 00H
	ORG $+2
$SG70620 DB	' title=''', 00H
	ORG $+3
$SG70622 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70626 DB	'>', 00H
	ORG $+2
$SG70627 DB	' height=', 00H
	ORG $+3
$SG70629 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70636 DB	'_eva_item.gif', 00H
	ORG $+2
$SG70639 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70642 DB	'</td>', 00H
	ORG $+2
$SG70644 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70653 DB	'+0', 00H
	ORG $+1
$SG70654 DB	'30', 00H
	ORG $+1
$SG70655 DB	'middle', 00H
	ORG $+1
$SG70656 DB	'_EVA_NewLine', 00H
	ORG $+3
$SG70657 DB	'_EVA_NewColumn', 00H
	ORG $+1
$SG70665 DB	'<td>', 00H
	ORG $+3
$SG70667 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70672 DB	'</td><td bgcolor=black width=1>', 00H
$SG70674 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70677 DB	'</td></tr><tr><td colspan=2 bgcolor=black height=1></td>'
	DB	'</tr><tr>', 00H
	ORG $+2
$SG70679 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70683 DB	'<td>', 00H
	ORG $+3
$SG70685 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70690 DB	'</td>', 00H
	ORG $+2
$SG70692 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70696 DB	'<td>', 00H
	ORG $+3
$SG70698 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70702 DB	'</td>', 00H
	ORG $+2
$SG70704 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70707 DB	'</tr></table></td>', 00H
	ORG $+1
$SG70709 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70710 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG70711 DB	'ctrl_add_tab_header', 00H
$SG70713 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG70714 DB	'ctrl_add_tab_header', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_form$ = -16
_ctrl$ = -76
_tooltip$ = -68
_i$ = -52
_i_sel$ = -44
_dispmode$ = -40
_tabcolor$ = -64
_imgselbase_l$ = -72
_imgselbase_r$ = -4
_img$ = -24
_imgsel$ = -12
_imgbase$ = -36
_tabsheight$ = -60
_tabswidth$ = -48
_tabsbgcolor$ = -20
_tabsborder$ = -80
_tabspos$ = -56
_b_left$ = -32
_type$ = -28
_rightmenu$ = -8
_i_ctrl$70399 = -92
_scur$70400 = -88
_sprv$70401 = -84
_snxt$70402 = -96
_ctrl_add_tab_header PROC NEAR

; 148  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 228				; 000000e4H

; 149  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 150  : 	EVA_ctrl *ctrl = form->ctrl;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _ctrl$[ebp], eax

; 151  : 	DynBuffer *tooltip = NULL;

	mov	DWORD PTR _tooltip$[ebp], 0

; 152  : 	unsigned long i, i_sel = 0;

	mov	DWORD PTR _i_sel$[ebp], 0

; 153  : 	enum { TopBtns, LeftBtns, TopTabs, LeftTabs } dispmode = TopBtns;

	mov	DWORD PTR _dispmode$[ebp], 0

; 154  : 	char *tabcolor;
; 155  : 	char *imgselbase_l = NULL;

	mov	DWORD PTR _imgselbase_l$[ebp], 0

; 156  : 	char *imgselbase_r = NULL;

	mov	DWORD PTR _imgselbase_r$[ebp], 0

; 157  : 	char *img, *imgsel, *imgbase;
; 158  : 
; 159  : 	/* Read form tabs attributes */
; 160  : 	char *tabsheight = CTRL_ATTR_VAL(TABSHEIGHT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71426
	push	0
	push	-1
	push	OFFSET FLAT:$SG70329
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -100+[ebp], eax
	jmp	SHORT $L71427
$L71426:
	mov	DWORD PTR -100+[ebp], OFFSET FLAT:$SG70330
$L71427:
	mov	edx, DWORD PTR -100+[ebp]
	mov	DWORD PTR _tabsheight$[ebp], edx

; 161  : 	char *tabswidth = CTRL_ATTR_VAL(TABSWIDTH);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71428
	push	0
	push	-1
	push	OFFSET FLAT:$SG70332
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -104+[ebp], eax
	jmp	SHORT $L71429
$L71428:
	mov	DWORD PTR -104+[ebp], OFFSET FLAT:$SG70333
$L71429:
	mov	ecx, DWORD PTR -104+[ebp]
	mov	DWORD PTR _tabswidth$[ebp], ecx

; 162  : 	char *tabsbgcolor = CTRL_ATTR_VAL(TABSBGCOLOR);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71430
	push	0
	push	-1
	push	OFFSET FLAT:$SG70335
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -108+[ebp], eax
	jmp	SHORT $L71431
$L71430:
	mov	DWORD PTR -108+[ebp], OFFSET FLAT:$SG70336
$L71431:
	mov	eax, DWORD PTR -108+[ebp]
	mov	DWORD PTR _tabsbgcolor$[ebp], eax

; 163  : 	char *tabsborder = CTRL_ATTR_VAL(TABSBORDER);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71432
	push	0
	push	-1
	push	OFFSET FLAT:$SG70338
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -112+[ebp], eax
	jmp	SHORT $L71433
$L71432:
	mov	DWORD PTR -112+[ebp], OFFSET FLAT:$SG70339
$L71433:
	mov	edx, DWORD PTR -112+[ebp]
	mov	DWORD PTR _tabsborder$[ebp], edx

; 164  : 	char *tabspos = CTRL_ATTR_VAL(TABS_POS);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71434
	push	0
	push	-1
	push	OFFSET FLAT:$SG70341
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -116+[ebp], eax
	jmp	SHORT $L71435
$L71434:
	mov	DWORD PTR -116+[ebp], OFFSET FLAT:$SG70342
$L71435:
	mov	ecx, DWORD PTR -116+[ebp]
	mov	DWORD PTR _tabspos$[ebp], ecx

; 165  : 	int b_left = !strcmp(tabspos, "_EVA_LEFT");

	push	OFFSET FLAT:$SG70344
	mov	edx, DWORD PTR _tabspos$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _b_left$[ebp], eax

; 166  : 	char *type = CTRL_ATTR_VAL(TABS_HEADER_MODE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71436
	push	0
	push	-1
	push	OFFSET FLAT:$SG70346
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -120+[ebp], eax
	jmp	SHORT $L71437
$L71436:
	mov	DWORD PTR -120+[ebp], OFFSET FLAT:$SG70347
$L71437:
	mov	ecx, DWORD PTR -120+[ebp]
	mov	DWORD PTR _type$[ebp], ecx

; 167  : 	int rightmenu = *DYNTAB_FIELD_VAL(&cntxt->user_data, MENUPOS) == '1';

	push	0
	push	-1
	push	OFFSET FLAT:$SG70349
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

; 168  : 	if(!*type) type = DYNTAB_FIELD_VAL(&cntxt->cnf_data, TABS_HEADER_MODE);

	mov	edx, DWORD PTR _type$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70350
	push	0
	push	-1
	push	OFFSET FLAT:$SG70351
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29360				; 000072b0H
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _type$[ebp], eax
$L70350:

; 169  : 	if(!*tabsheight) tabsheight = ATTR_VAL(&cntxt->srvfmt, TABSHEIGHT);

	mov	edx, DWORD PTR _tabsheight$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70352
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 269748				; 00041db4H
	test	ecx, ecx
	je	SHORT $L71438
	push	0
	push	-1
	push	OFFSET FLAT:$SG70353
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269792				; 00041de0H
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -124+[ebp], eax
	jmp	SHORT $L71439
$L71438:
	mov	DWORD PTR -124+[ebp], OFFSET FLAT:$SG70354
$L71439:
	mov	eax, DWORD PTR -124+[ebp]
	mov	DWORD PTR _tabsheight$[ebp], eax
$L70352:

; 170  : 
; 171  : 	/* Remove hidden tabs */
; 172  : 	for(i = 0; i < form->nb_tabs; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70355
$L70356:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70355:
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+112]
	jae	$L70357

; 174  : 		if(form->tabs[i] == form->seltab) i_sel = i;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [edx+eax*4]
	cmp	edx, DWORD PTR [ecx+116]
	jne	SHORT $L70358
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _i_sel$[ebp], eax
$L70358:

; 175  : 		if(form->ctrl[form->tabs[i]].b_selected) continue;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR [edx+eax*4]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+ecx+196], 0
	je	SHORT $L70359
	jmp	SHORT $L70356
$L70359:

; 176  : 		form->nb_tabs--;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	sub	edx, 1
	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+112], edx

; 177  : 		if(i < form->nb_tabs) memcpy(form->tabs + i, form->tabs + i + 1, (form->nb_tabs - i) * sizeof(form->tabs[0]));

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+112]
	jae	SHORT $L70360
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	sub	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 2
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+108]
	mov	ecx, DWORD PTR _i$[ebp]
	lea	edx, DWORD PTR [eax+ecx*4+4]
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	mov	edx, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [ecx+edx*4]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
$L70360:

; 178  : 		i--;

	mov	ecx, DWORD PTR _i$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx

; 179  : 	}

	jmp	$L70356
$L70357:

; 180  : 	if(form->nb_tabs < 2) RETURN_OK;

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+112], 2
	jae	SHORT $L70361
	jmp	$eva_noerr$70362
$L70361:

; 181  : 
; 182  : 	/* Set tabs display mode */
; 183  : 	dispmode = (!strcmp(type, "_EVA_TAB") && cntxt->jsenabled) ?
; 184  : 				b_left ? LeftTabs : TopTabs :
; 185  : 				b_left ? LeftBtns : TopBtns;

	push	OFFSET FLAT:$SG70363
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71440
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29676], 0
	je	SHORT $L71440
	xor	edx, edx
	cmp	DWORD PTR _b_left$[ebp], 0
	setne	dl
	add	edx, 2
	mov	DWORD PTR -128+[ebp], edx
	jmp	SHORT $L71441
$L71440:
	xor	eax, eax
	cmp	DWORD PTR _b_left$[ebp], 0
	setne	al
	mov	DWORD PTR -128+[ebp], eax
$L71441:
	mov	ecx, DWORD PTR -128+[ebp]
	mov	DWORD PTR _dispmode$[ebp], ecx

; 186  : 
; 187  : 	/* Put tabs buttons bar header */
; 188  : 	ctrl = form->ctrl + form->seltab;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+116]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 189  : 	if(put_html_format_pos(cntxt, "_EVA_NewColumn", rightmenu ? "right" : NULL,
; 190  : 			b_left ? "top" : "bottom", tabswidth,
; 191  : 			(dispmode == TopTabs || dispmode == TopBtns) ? tabsheight : NULL,
; 192  : 			(dispmode == TopTabs || !*tabsbgcolor) ? "FFFFFF" : tabsbgcolor,
; 193  : 			NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1))

	cmp	DWORD PTR _dispmode$[ebp], 2
	je	SHORT $L71442
	mov	eax, DWORD PTR _tabsbgcolor$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71442
	mov	edx, DWORD PTR _tabsbgcolor$[ebp]
	mov	DWORD PTR -132+[ebp], edx
	jmp	SHORT $L71443
$L71442:
	mov	DWORD PTR -132+[ebp], OFFSET FLAT:$SG70372
$L71443:
	cmp	DWORD PTR _dispmode$[ebp], 2
	je	SHORT $L71444
	cmp	DWORD PTR _dispmode$[ebp], 0
	je	SHORT $L71444
	mov	DWORD PTR -136+[ebp], 0
	jmp	SHORT $L71445
$L71444:
	mov	eax, DWORD PTR _tabsheight$[ebp]
	mov	DWORD PTR -136+[ebp], eax
$L71445:
	cmp	DWORD PTR _b_left$[ebp], 0
	je	SHORT $L71446
	mov	DWORD PTR -140+[ebp], OFFSET FLAT:$SG70373
	jmp	SHORT $L71447
$L71446:
	mov	DWORD PTR -140+[ebp], OFFSET FLAT:$SG70374
$L71447:
	push	1
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR -132+[ebp]
	push	ecx
	mov	edx, DWORD PTR -136+[ebp]
	push	edx
	mov	eax, DWORD PTR _tabswidth$[ebp]
	push	eax
	mov	ecx, DWORD PTR -140+[ebp]
	push	ecx
	mov	edx, DWORD PTR _rightmenu$[ebp]
	neg	edx
	sbb	edx, edx
	and	edx, OFFSET FLAT:$SG70375
	push	edx
	push	OFFSET FLAT:$SG70376
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_format_pos
	add	esp, 76					; 0000004cH
	test	eax, eax
	je	SHORT $L70371

; 194  : 		STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 194		; 000000c2H
	jmp	$eva_err$70377
$L70371:

; 195  : 	DYNBUF_ADD3_INT(form->html, "<table border=", atoi(tabsborder), " rules=none cellspacing=0 cellpadding=0");

	push	39					; 00000027H
	push	OFFSET FLAT:$SG70379
	mov	edx, DWORD PTR _tabsborder$[ebp]
	push	edx
	call	_atoi
	add	esp, 4
	push	eax
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70380
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70378
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70382
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 195		; 000000c3H
	jmp	$eva_err$70377
$L70378:

; 196  : 	if(b_left) DYNBUF_ADD_STR(form->html, " width=100%");

	cmp	DWORD PTR _b_left$[ebp], 0
	je	SHORT $L70385
	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70386
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70385
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70388
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 196		; 000000c4H
	jmp	$eva_err$70377
$L70385:

; 197  : 	DYNBUF_ADD_STR(form->html, "><tr>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70391
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70390
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70393
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 197		; 000000c5H
	jmp	$eva_err$70377
$L70390:

; 198  : 	tabcolor = ctrl->BGCOLOR;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+320]
	mov	DWORD PTR _tabcolor$[ebp], ecx

; 199  : 	if(!*tabcolor) tabcolor = "FFFFFF";

	mov	edx, DWORD PTR _tabcolor$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70394
	mov	DWORD PTR _tabcolor$[ebp], OFFSET FLAT:$SG70395
$L70394:

; 200  : 
; 201  : 	/* Output each tab */
; 202  : 	for(i = 0; i < form->nb_tabs; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70396
$L70397:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70396:
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+112]
	jae	$L70398

; 204  : 		unsigned long i_ctrl = form->tabs[i];

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR [edx+eax*4]
	mov	DWORD PTR _i_ctrl$70399[ebp], ecx

; 205  : 		int scur = i == i_sel;

	mov	edx, DWORD PTR _i$[ebp]
	xor	eax, eax
	cmp	edx, DWORD PTR _i_sel$[ebp]
	sete	al
	mov	DWORD PTR _scur$70400[ebp], eax

; 206  : 		int sprv = i && i - 1 == i_sel;

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L71448
	mov	ecx, DWORD PTR _i$[ebp]
	sub	ecx, 1
	cmp	ecx, DWORD PTR _i_sel$[ebp]
	jne	SHORT $L71448
	mov	DWORD PTR -144+[ebp], 1
	jmp	SHORT $L71449
$L71448:
	mov	DWORD PTR -144+[ebp], 0
$L71449:
	mov	edx, DWORD PTR -144+[ebp]
	mov	DWORD PTR _sprv$70401[ebp], edx

; 207  : 		int snxt = i < form->nb_tabs && i + 1 == i_sel;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+112]
	jae	SHORT $L71450
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	cmp	edx, DWORD PTR _i_sel$[ebp]
	jne	SHORT $L71450
	mov	DWORD PTR -148+[ebp], 1
	jmp	SHORT $L71451
$L71450:
	mov	DWORD PTR -148+[ebp], 0
$L71451:
	mov	eax, DWORD PTR -148+[ebp]
	mov	DWORD PTR _snxt$70402[ebp], eax

; 208  : 
; 209  : 		/* Build tooltip */
; 210  : 		ctrl = form->ctrl + i_ctrl;

	mov	ecx, DWORD PTR _i_ctrl$70399[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	mov	DWORD PTR _ctrl$[ebp], eax

; 211  : 		M_FREE(tooltip);

	mov	ecx, DWORD PTR _tooltip$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _tooltip$[ebp], 0

; 212  : 		DYNBUF_ADD3(&tooltip, "[", ctrl->LABEL, 0, NO_CONV, "]");

	push	1
	push	OFFSET FLAT:$SG70405
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70406
	lea	ecx, DWORD PTR _tooltip$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70404
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70408
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 212		; 000000d4H
	jmp	$eva_err$70377
$L70404:

; 213  : 		if(ctrl->NOTES && ctrl->NOTES[0]) DYNBUF_ADD3(&tooltip, "\n\n", ctrl->NOTES, 0, NO_CONV, "");

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+288], 0
	je	SHORT $L70411
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+288]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70411
	push	0
	push	OFFSET FLAT:$SG70412
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+288]
	push	eax
	push	2
	push	OFFSET FLAT:$SG70413
	lea	ecx, DWORD PTR _tooltip$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70411
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70415
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 213		; 000000d5H
	jmp	$eva_err$70377
$L70411:

; 214  : 
; 215  : 		/* Get images */
; 216  : 		img = CTRL_ATTR_VAL(IMAGE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71452
	push	0
	push	-1
	push	OFFSET FLAT:$SG70416
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -152+[ebp], eax
	jmp	SHORT $L71453
$L71452:
	mov	DWORD PTR -152+[ebp], OFFSET FLAT:$SG70417
$L71453:
	mov	edx, DWORD PTR -152+[ebp]
	mov	DWORD PTR _img$[ebp], edx

; 217  : 		imgsel = CTRL_ATTR_VAL(IMAGESEL);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71454
	push	0
	push	-1
	push	OFFSET FLAT:$SG70418
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -156+[ebp], eax
	jmp	SHORT $L71455
$L71454:
	mov	DWORD PTR -156+[ebp], OFFSET FLAT:$SG70419
$L71455:
	mov	ecx, DWORD PTR -156+[ebp]
	mov	DWORD PTR _imgsel$[ebp], ecx

; 218  : 
; 219  : 		/* Select display type */
; 220  : 		switch(dispmode)
; 221  : 		{

	mov	edx, DWORD PTR _dispmode$[ebp]
	mov	DWORD PTR -160+[ebp], edx
	cmp	DWORD PTR -160+[ebp], 1
	je	$L70645
	cmp	DWORD PTR -160+[ebp], 2
	je	SHORT $L70424
	cmp	DWORD PTR -160+[ebp], 3
	je	$L70586
	jmp	$L70680
$L70424:

; 222  : 		case TopTabs:
; 223  : 			/* Display top tabs : select apropriate image */
; 224  : 			imgbase = scur ?
; 225  : 					!i ? "left_s" : "mid_sl" :
; 226  : 					!i ? "left" : sprv ? "mid_sr" : "mid";

	cmp	DWORD PTR _scur$70400[ebp], 0
	je	SHORT $L71462
	cmp	DWORD PTR _i$[ebp], 0
	jne	SHORT $L71456
	mov	DWORD PTR -164+[ebp], OFFSET FLAT:$SG70425
	jmp	SHORT $L71457
$L71456:
	mov	DWORD PTR -164+[ebp], OFFSET FLAT:$SG70426
$L71457:
	mov	eax, DWORD PTR -164+[ebp]
	mov	DWORD PTR -168+[ebp], eax
	jmp	SHORT $L71463
$L71462:
	cmp	DWORD PTR _i$[ebp], 0
	jne	SHORT $L71460
	mov	DWORD PTR -172+[ebp], OFFSET FLAT:$SG70427
	jmp	SHORT $L71461
$L71460:
	cmp	DWORD PTR _sprv$70401[ebp], 0
	je	SHORT $L71458
	mov	DWORD PTR -176+[ebp], OFFSET FLAT:$SG70428
	jmp	SHORT $L71459
$L71458:
	mov	DWORD PTR -176+[ebp], OFFSET FLAT:$SG70429
$L71459:
	mov	ecx, DWORD PTR -176+[ebp]
	mov	DWORD PTR -172+[ebp], ecx
$L71461:
	mov	edx, DWORD PTR -172+[ebp]
	mov	DWORD PTR -168+[ebp], edx
$L71463:
	mov	eax, DWORD PTR -168+[ebp]
	mov	DWORD PTR _imgbase$[ebp], eax

; 227  : 			if(imgselbase_l && !imgselbase_r) imgselbase_r = imgbase;

	cmp	DWORD PTR _imgselbase_l$[ebp], 0
	je	SHORT $L70430
	cmp	DWORD PTR _imgselbase_r$[ebp], 0
	jne	SHORT $L70430
	mov	ecx, DWORD PTR _imgbase$[ebp]
	mov	DWORD PTR _imgselbase_r$[ebp], ecx
$L70430:

; 228  : 
; 229  : 			/* Output tab separator */
; 230  : 			DYNBUF_ADD_STR(form->html, "<td width=1 valign=top");

	push	0
	push	0
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70433
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70432
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70435
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 230		; 000000e6H
	jmp	$eva_err$70377
$L70432:

; 231  : 			if(scur || sprv || snxt)

	cmp	DWORD PTR _scur$70400[ebp], 0
	jne	SHORT $L70437
	cmp	DWORD PTR _sprv$70401[ebp], 0
	jne	SHORT $L70437
	cmp	DWORD PTR _snxt$70402[ebp], 0
	je	SHORT $L70439
$L70437:

; 232  : 				DYNBUF_ADD3(form->html, " bgcolor=#", tabcolor, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70440
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _tabcolor$[ebp]
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70441
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70439
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70443
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 232		; 000000e8H
	jmp	$eva_err$70377
$L70439:

; 233  : 			DYNBUF_ADD3(form->html, " background='../img/_eva_tab_bg_", imgbase, 0, NO_CONV, ".gif'>");

	push	6
	push	OFFSET FLAT:$SG70446
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _imgbase$[ebp]
	push	edx
	push	32					; 00000020H
	push	OFFSET FLAT:$SG70447
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70445
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70449
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 233		; 000000e9H
	jmp	$eva_err$70377
$L70445:

; 234  : 			if(put_html_image(cntxt, NULL, ctrl_tab_image(NULL, imgbase), NULL, NULL, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _imgbase$[ebp]
	push	ecx
	push	0
	call	_ctrl_tab_image
	add	esp, 8
	push	eax
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_img
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70456
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 234		; 000000eaH
	jmp	$eva_err$70377
$L70456:

; 235  : 			DYNBUF_ADD_STR(form->html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70459
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70458
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70461
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 235		; 000000ebH
	jmp	$eva_err$70377
$L70458:

; 236  : 
; 237  : 			/* Output tab itself */
; 238  : 			if(scur)

	cmp	DWORD PTR _scur$70400[ebp], 0
	je	$L70462

; 240  : 				/* Selected tab */
; 241  : 				imgselbase_l = imgbase;

	mov	edx, DWORD PTR _imgbase$[ebp]
	mov	DWORD PTR _imgselbase_l$[ebp], edx

; 242  : 				if(put_html_format_pos(cntxt, "_EVA_NewColumn", "center",
; 243  : 						NULL, NULL, NULL, tabcolor, "../img/_eva_tab_bg_s.gif",
; 244  : 						0, 0, ctrl->FONTFACE, "+0", NULL, NULL, 1, 0, 0, 0, 1))

	push	1
	push	0
	push	0
	push	0
	push	1
	push	0
	push	0
	push	OFFSET FLAT:$SG70469
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+352]
	push	ecx
	push	0
	push	0
	push	OFFSET FLAT:$SG70470
	mov	edx, DWORD PTR _tabcolor$[ebp]
	push	edx
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70471
	push	OFFSET FLAT:$SG70472
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_format_pos
	add	esp, 76					; 0000004cH
	test	eax, eax
	je	SHORT $L70468

; 245  : 					STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 245		; 000000f5H
	jmp	$eva_err$70377
$L70468:

; 246  : 				DYNBUF_ADD3(form->html, "<img src=../img/_eva_nop.gif height=2><br>", ctrl->LABEL, 0, TO_HTML, "");

	push	0
	push	OFFSET FLAT:$SG70474
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	push	42					; 0000002aH
	push	OFFSET FLAT:$SG70475
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70473
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70477
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 246		; 000000f6H
	jmp	$eva_err$70377
$L70473:

; 247  : 				if(ctrl_add_opt_btn(cntxt, ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_opt_btn
	add	esp, 8
	test	eax, eax
	je	SHORT $L70478
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 247		; 000000f7H
	jmp	$eva_err$70377
$L70478:

; 249  : 			else

	jmp	$L70494
$L70462:

; 253  : 					"<td class=EVAUnselHTab background='../img/_eva_tab_bg.gif' align=center "
; 254  : 						"onClick=cb('", ctrl->cginame, NO_CONV, "')");

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+40], 0
	je	SHORT $L71464
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -180+[ebp], edx
	jmp	SHORT $L71465
$L71464:
	mov	DWORD PTR -180+[ebp], 0
$L71465:
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L71466
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	add	edx, 8
	mov	DWORD PTR -184+[ebp], edx
	jmp	SHORT $L71467
$L71466:
	mov	DWORD PTR -184+[ebp], 0
$L71467:
	push	2
	push	OFFSET FLAT:$SG70483
	push	0
	push	0
	mov	eax, DWORD PTR -180+[ebp]
	push	eax
	mov	ecx, DWORD PTR -184+[ebp]
	push	ecx
	push	84					; 00000054H
	push	OFFSET FLAT:$SG70484
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70482
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70486
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 254		; 000000feH
	jmp	$eva_err$70377
$L70482:

; 255  : 				DYNBUF_ADD3_BUF(form->html, " title='", tooltip, HTML_TOOLTIP, "'");

	cmp	DWORD PTR _tooltip$[ebp], 0
	je	SHORT $L71468
	mov	eax, DWORD PTR _tooltip$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -188+[ebp], ecx
	jmp	SHORT $L71469
$L71468:
	mov	DWORD PTR -188+[ebp], 0
$L71469:
	cmp	DWORD PTR _tooltip$[ebp], 0
	je	SHORT $L71470
	mov	edx, DWORD PTR _tooltip$[ebp]
	add	edx, 8
	mov	DWORD PTR -192+[ebp], edx
	jmp	SHORT $L71471
$L71470:
	mov	DWORD PTR -192+[ebp], 0
$L71471:
	push	1
	push	OFFSET FLAT:$SG70489
	push	1
	push	OFFSET FLAT:_html_tooltip
	mov	eax, DWORD PTR -188+[ebp]
	push	eax
	mov	ecx, DWORD PTR -192+[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70490
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70488
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70492
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 255		; 000000ffH
	jmp	$eva_err$70377
$L70488:

; 256  : 				if(put_showhelp(cntxt, form->html)) STACK_ERROR;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_showhelp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70493
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 256		; 00000100H
	jmp	$eva_err$70377
$L70493:

; 257  : 				DYNBUF_ADD3(form->html, ">", ctrl->LABEL, 0, TO_HTML, "");

	push	0
	push	OFFSET FLAT:$SG70495
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70496
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70494
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70498
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 257		; 00000101H
	jmp	$eva_err$70377
$L70494:

; 259  : 			DYNBUF_ADD_STR(form->html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70501
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70500
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70503
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 259		; 00000103H
	jmp	$eva_err$70377
$L70500:

; 260  : 
; 261  : 			/* Output last tab separator */
; 262  : 			if(i == form->nb_tabs - 1)

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+112]
	sub	eax, 1
	cmp	DWORD PTR _i$[ebp], eax
	jne	$L70581

; 264  : 				imgbase = scur ? "right_s" : "right";

	cmp	DWORD PTR _scur$70400[ebp], 0
	je	SHORT $L71472
	mov	DWORD PTR -196+[ebp], OFFSET FLAT:$SG70505
	jmp	SHORT $L71473
$L71472:
	mov	DWORD PTR -196+[ebp], OFFSET FLAT:$SG70506
$L71473:
	mov	ecx, DWORD PTR -196+[ebp]
	mov	DWORD PTR _imgbase$[ebp], ecx

; 265  : 				DYNBUF_ADD_STR(form->html, "<td width=1 valign=top");

	push	0
	push	0
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70509
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70508
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70511
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 265		; 00000109H
	jmp	$eva_err$70377
$L70508:

; 266  : 				if(scur)

	cmp	DWORD PTR _scur$70400[ebp], 0
	je	SHORT $L70514

; 267  : 					DYNBUF_ADD3(form->html, " bgcolor=#", tabcolor, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70515
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _tabcolor$[ebp]
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70516
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70514
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70518
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 267		; 0000010bH
	jmp	$eva_err$70377
$L70514:

; 268  : 				DYNBUF_ADD3(form->html, " background='../img/_eva_tab_bg_", imgbase, 0, NO_CONV, ".gif'>");

	push	6
	push	OFFSET FLAT:$SG70521
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _imgbase$[ebp]
	push	edx
	push	32					; 00000020H
	push	OFFSET FLAT:$SG70522
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70520
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70524
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 268		; 0000010cH
	jmp	$eva_err$70377
$L70520:

; 269  : 				if(put_html_image(cntxt, NULL, ctrl_tab_image(NULL, imgbase), NULL, NULL, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _imgbase$[ebp]
	push	ecx
	push	0
	call	_ctrl_tab_image
	add	esp, 8
	push	eax
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_img
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70531
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 269		; 0000010dH
	jmp	$eva_err$70377
$L70531:

; 270  : 				DYNBUF_ADD_STR(form->html, "</td></tr><tr>");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70534
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70533
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70536
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 270		; 0000010eH
	jmp	$eva_err$70377
$L70533:

; 271  : 
; 272  : 				/* Output bottom black line */
; 273  : 				if(i_sel) DYNBUF_ADD3_INT(form->html, "<td bgcolor=#000000 colspan=", i_sel * 2, "></td>");

	cmp	DWORD PTR _i_sel$[ebp], 0
	je	SHORT $L70538
	push	6
	push	OFFSET FLAT:$SG70539
	mov	edx, DWORD PTR _i_sel$[ebp]
	shl	edx, 1
	push	edx
	push	28					; 0000001cH
	push	OFFSET FLAT:$SG70540
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70538
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70542
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 273		; 00000111H
	jmp	$eva_err$70377
$L70538:

; 274  : 				DYNBUF_ADD3(form->html, "<td bgcolor=#", tabcolor, 0, NO_CONV, ">");

	push	1
	push	OFFSET FLAT:$SG70545
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _tabcolor$[ebp]
	push	ecx
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70546
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70544
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70548
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 274		; 00000112H
	jmp	$eva_err$70377
$L70544:

; 275  : 				if(put_html_image(cntxt, NULL, ctrl_tab_image("bot", imgselbase_l), NULL, NULL, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _imgselbase_l$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70555
	call	_ctrl_tab_image
	add	esp, 8
	push	eax
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_img
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70554
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 275		; 00000113H
	jmp	$eva_err$70377
$L70554:

; 276  : 				DYNBUF_ADD3(form->html, "</td><td bgcolor=#", tabcolor, 0, NO_CONV, "></td>");

	push	6
	push	OFFSET FLAT:$SG70558
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _tabcolor$[ebp]
	push	eax
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70559
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70557
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70561
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 276		; 00000114H
	jmp	$eva_err$70377
$L70557:

; 277  : 				DYNBUF_ADD3(form->html, "<td bgcolor=#", tabcolor, 0, NO_CONV, ">");

	push	1
	push	OFFSET FLAT:$SG70564
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _tabcolor$[ebp]
	push	edx
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70565
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70563
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70567
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 277		; 00000115H
	jmp	$eva_err$70377
$L70563:

; 278  : 				if(put_html_image(cntxt, NULL, ctrl_tab_image("bot", imgselbase_r ? imgselbase_r : imgbase), NULL, NULL, NULL, 0)) STACK_ERROR;

	cmp	DWORD PTR _imgselbase_r$[ebp], 0
	je	SHORT $L71474
	mov	ecx, DWORD PTR _imgselbase_r$[ebp]
	mov	DWORD PTR -200+[ebp], ecx
	jmp	SHORT $L71475
$L71474:
	mov	edx, DWORD PTR _imgbase$[ebp]
	mov	DWORD PTR -200+[ebp], edx
$L71475:
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR -200+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70574
	call	_ctrl_tab_image
	add	esp, 8
	push	eax
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_img
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70573
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 278		; 00000116H
	jmp	$eva_err$70377
$L70573:

; 279  : 				DYNBUF_ADD_STR(form->html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70577
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70576
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70579
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 279		; 00000117H
	jmp	$eva_err$70377
$L70576:

; 280  : 				if(i_sel < form->nb_tabs - 1)

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	sub	edx, 1
	cmp	DWORD PTR _i_sel$[ebp], edx
	jae	SHORT $L70581

; 281  : 					DYNBUF_ADD3_INT(form->html, "<td bgcolor=#000000 colspan=", (form->nb_tabs - i_sel - 1) * 2, "></td>");

	push	6
	push	OFFSET FLAT:$SG70582
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	sub	ecx, DWORD PTR _i_sel$[ebp]
	lea	edx, DWORD PTR [ecx+ecx-2]
	push	edx
	push	28					; 0000001cH
	push	OFFSET FLAT:$SG70583
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70581
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70585
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 281		; 00000119H
	jmp	$eva_err$70377
$L70581:

; 283  : 			break;

	jmp	$L70421
$L70586:

; 284  : 
; 285  : 		case LeftTabs:
; 286  : 			/* Output left tabs */
; 287  : 			if(i) DYNBUF_ADD_STR(form->html, "</tr><tr>");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70589
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70590
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70589
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70592
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 287		; 0000011fH
	jmp	$eva_err$70377
$L70589:

; 288  : 			if(scur)

	cmp	DWORD PTR _scur$70400[ebp], 0
	je	$L70593

; 290  : 				/* Selected tab */
; 291  : 				DYNBUF_ADD3(form->html, "<td class=EVASelVTab bgcolor=#", tabcolor, 0, TO_HTML, "");

	push	0
	push	OFFSET FLAT:$SG70595
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _tabcolor$[ebp]
	push	edx
	push	30					; 0000001eH
	push	OFFSET FLAT:$SG70596
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70594
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70598
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 291		; 00000123H
	jmp	$eva_err$70377
$L70594:

; 292  : 				DYNBUF_ADD3(form->html, " height=", tabsheight, 0, NO_CONV, ">");

	push	1
	push	OFFSET FLAT:$SG70601
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _tabsheight$[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70602
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70600
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70604
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 292		; 00000124H
	jmp	$eva_err$70377
$L70600:

; 293  : 				DYNBUF_ADD(form->html, ctrl->LABEL, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70605
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70607
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 293		; 00000125H
	jmp	$eva_err$70377
$L70605:

; 294  : 				if(ctrl_add_opt_btn(cntxt, ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_opt_btn
	add	esp, 8
	test	eax, eax
	je	SHORT $L70608
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 294		; 00000126H
	jmp	$eva_err$70377
$L70608:

; 296  : 			else

	jmp	$L70637
$L70593:

; 300  : 					"<td class=EVAUnselVTab onClick=cb('", ctrl->cginame, NO_CONV, "')");

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	SHORT $L71476
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -204+[ebp], eax
	jmp	SHORT $L71477
$L71476:
	mov	DWORD PTR -204+[ebp], 0
$L71477:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+40], 0
	je	SHORT $L71478
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	add	eax, 8
	mov	DWORD PTR -208+[ebp], eax
	jmp	SHORT $L71479
$L71478:
	mov	DWORD PTR -208+[ebp], 0
$L71479:
	push	2
	push	OFFSET FLAT:$SG70613
	push	0
	push	0
	mov	ecx, DWORD PTR -204+[ebp]
	push	ecx
	mov	edx, DWORD PTR -208+[ebp]
	push	edx
	push	35					; 00000023H
	push	OFFSET FLAT:$SG70614
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70612
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70616
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 300		; 0000012cH
	jmp	$eva_err$70377
$L70612:

; 301  : 				DYNBUF_ADD3_BUF(form->html, " title='", tooltip, HTML_TOOLTIP, "'");

	cmp	DWORD PTR _tooltip$[ebp], 0
	je	SHORT $L71480
	mov	ecx, DWORD PTR _tooltip$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -212+[ebp], edx
	jmp	SHORT $L71481
$L71480:
	mov	DWORD PTR -212+[ebp], 0
$L71481:
	cmp	DWORD PTR _tooltip$[ebp], 0
	je	SHORT $L71482
	mov	eax, DWORD PTR _tooltip$[ebp]
	add	eax, 8
	mov	DWORD PTR -216+[ebp], eax
	jmp	SHORT $L71483
$L71482:
	mov	DWORD PTR -216+[ebp], 0
$L71483:
	push	1
	push	OFFSET FLAT:$SG70619
	push	1
	push	OFFSET FLAT:_html_tooltip
	mov	ecx, DWORD PTR -212+[ebp]
	push	ecx
	mov	edx, DWORD PTR -216+[ebp]
	push	edx
	push	8
	push	OFFSET FLAT:$SG70620
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70618
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70622
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 301		; 0000012dH
	jmp	$eva_err$70377
$L70618:

; 302  : 				if(put_showhelp(cntxt, form->html)) STACK_ERROR;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_showhelp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70623
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 302		; 0000012eH
	jmp	$eva_err$70377
$L70623:

; 303  : 				DYNBUF_ADD3(form->html, " height=", tabsheight, 0, NO_CONV, ">");

	push	1
	push	OFFSET FLAT:$SG70626
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _tabsheight$[ebp]
	push	edx
	push	8
	push	OFFSET FLAT:$SG70627
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70625
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70629
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 303		; 0000012fH
	jmp	$eva_err$70377
$L70625:

; 304  : 				if(put_html_image(cntxt, NULL, "_eva_item.gif", NULL, NULL, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70636
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_img
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70635
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 304		; 00000130H
	jmp	$eva_err$70377
$L70635:

; 305  : 				DYNBUF_ADD(form->html, ctrl->LABEL, 0, TO_HTML);

	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70637
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70639
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 305		; 00000131H
	jmp	$eva_err$70377
$L70637:

; 307  : 			DYNBUF_ADD_STR(form->html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70642
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70641
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70644
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 307		; 00000133H
	jmp	$eva_err$70377
$L70641:

; 308  : 			break;

	jmp	$L70421
$L70645:

; 309  : 
; 310  : 		case LeftBtns:
; 311  : 			/* Output left buttons */
; 312  : 			if(scur)

	cmp	DWORD PTR _scur$70400[ebp], 0
	je	$L70646

; 314  : 				/* Selected tab */
; 315  : 				if(put_html_format_pos(cntxt, i ? "_EVA_NewLine" : "_EVA_NewColumn", NULL,
; 316  : 						"middle", NULL, "30", tabcolor, NULL,
; 317  : 						2, 0, ctrl->FONTFACE, "+0", NULL, NULL, 1, 0, 0, 0, 1))

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L71484
	mov	DWORD PTR -220+[ebp], OFFSET FLAT:$SG70656
	jmp	SHORT $L71485
$L71484:
	mov	DWORD PTR -220+[ebp], OFFSET FLAT:$SG70657
$L71485:
	push	1
	push	0
	push	0
	push	0
	push	1
	push	0
	push	0
	push	OFFSET FLAT:$SG70653
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+352]
	push	edx
	push	0
	push	2
	push	0
	mov	eax, DWORD PTR _tabcolor$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70654
	push	0
	push	OFFSET FLAT:$SG70655
	push	0
	mov	ecx, DWORD PTR -220+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_format_pos
	add	esp, 76					; 0000004cH
	test	eax, eax
	je	SHORT $L70652

; 318  : 					STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 318		; 0000013eH
	jmp	$eva_err$70377
$L70652:

; 319  : 				if(put_html_button(cntxt, ctrl->cginame->data, ctrl->LABEL, imgsel, NULL, tooltip->data, 0, 1)) STACK_ERROR;

	push	1
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _tooltip$[ebp]
	add	ecx, 8
	push	ecx
	push	0
	mov	edx, DWORD PTR _imgsel$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+40]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70660
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 319		; 0000013fH
	jmp	$eva_err$70377
$L70660:

; 320  : 				if(ctrl_add_opt_btn(cntxt, cntxt->form->ctrl + form->seltab)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+116]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [ecx]
	add	ecx, eax
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_opt_btn
	add	esp, 8
	test	eax, eax
	je	SHORT $L70661
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 320		; 00000140H
	jmp	$eva_err$70377
$L70661:

; 322  : 			else

	jmp	$L70671
$L70646:

; 324  : 				/* Other tabs */
; 325  : 				DYNBUF_ADD_STR(form->html, "<td>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70665
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70664
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70667
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 325		; 00000145H
	jmp	$eva_err$70377
$L70664:

; 326  : 				if(put_html_button(cntxt, ctrl->cginame->data, ctrl->LABEL, img, imgsel, tooltip->data, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _tooltip$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _imgsel$[ebp]
	push	eax
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70669
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 326		; 00000146H
	jmp	$eva_err$70377
$L70669:

; 327  : 				DYNBUF_ADD_STR(form->html, "</td><td bgcolor=black width=1>");

	push	0
	push	0
	push	31					; 0000001fH
	push	OFFSET FLAT:$SG70672
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70671
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70674
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 327		; 00000147H
	jmp	$eva_err$70377
$L70671:

; 329  : 			DYNBUF_ADD_STR(form->html, "</td></tr><tr><td colspan=2 bgcolor=black height=1></td></tr><tr>");

	push	0
	push	0
	push	65					; 00000041H
	push	OFFSET FLAT:$SG70677
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70676
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70679
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 329		; 00000149H
	jmp	$eva_err$70377
$L70676:

; 330  : 			break;

	jmp	$L70421
$L70680:

; 331  : 
; 332  : 		default:
; 333  : 			DYNBUF_ADD_STR(form->html, "<td>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70683
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70682
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70685
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 333		; 0000014dH
	jmp	$eva_err$70377
$L70682:

; 334  : 			if(put_html_button(cntxt,
; 335  : 					ctrl->cginame->data,
; 336  : 					ctrl->LABEL,
; 337  : 					scur ? imgsel : img,
; 338  : 					scur ? img : imgsel,
; 339  : 					tooltip->data,
; 340  : 					0, scur))

	cmp	DWORD PTR _scur$70400[ebp], 0
	je	SHORT $L71486
	mov	edx, DWORD PTR _img$[ebp]
	mov	DWORD PTR -224+[ebp], edx
	jmp	SHORT $L71487
$L71486:
	mov	eax, DWORD PTR _imgsel$[ebp]
	mov	DWORD PTR -224+[ebp], eax
$L71487:
	cmp	DWORD PTR _scur$70400[ebp], 0
	je	SHORT $L71488
	mov	ecx, DWORD PTR _imgsel$[ebp]
	mov	DWORD PTR -228+[ebp], ecx
	jmp	SHORT $L71489
$L71488:
	mov	edx, DWORD PTR _img$[ebp]
	mov	DWORD PTR -228+[ebp], edx
$L71489:
	mov	eax, DWORD PTR _scur$70400[ebp]
	push	eax
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _tooltip$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR -224+[ebp]
	push	edx
	mov	eax, DWORD PTR -228+[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70687

; 341  : 				STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 341		; 00000155H
	jmp	$eva_err$70377
$L70687:

; 342  : 			DYNBUF_ADD_STR(form->html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70690
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70689
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70692
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 342		; 00000156H
	jmp	$eva_err$70377
$L70689:

; 343  : 
; 344  : 			/* Put option button for current tab */
; 345  : 			if(i == form->nb_tabs - 1)

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+112]
	sub	eax, 1
	cmp	DWORD PTR _i$[ebp], eax
	jne	$L70701

; 347  : 				DYNBUF_ADD_STR(form->html, "<td>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70696
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70695
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70698
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 347		; 0000015bH
	jmp	$eva_err$70377
$L70695:

; 348  : 				if(ctrl_add_opt_btn(cntxt, cntxt->form->ctrl + form->seltab)) STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+116]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR [eax]
	add	eax, edx
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_opt_btn
	add	esp, 8
	test	eax, eax
	je	SHORT $L70699
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 348		; 0000015cH
	jmp	$eva_err$70377
$L70699:

; 349  : 				DYNBUF_ADD_STR(form->html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70702
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70701
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70704
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 349		; 0000015dH
	jmp	SHORT $eva_err$70377
$L70701:
$L70421:

; 352  : 	}

	jmp	$L70397
$L70398:

; 353  : 	DYNBUF_ADD_STR(form->html, "</tr></table></td>")

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70707
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70706
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70709
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 353		; 00000161H
	jmp	SHORT $eva_err$70377
$L70706:
$eva_noerr$70362:

; 354  : 
; 355  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70710
	push	OFFSET FLAT:$SG70711
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70377:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70712
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70713
	push	OFFSET FLAT:$SG70714
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70712:
	mov	ecx, DWORD PTR _tooltip$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _tooltip$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 356  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_tab_header ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_group
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70727 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70726 DB	'_EVA_BORDER_STYLE', 00H
	ORG $+2
$SG70731 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70733 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70745 DB	'_EVA_RoundCorner', 00H
	ORG $+3
$SG70748 DB	'<table cellpadding=0 cellspacing=0 border=0', 00H
$SG70750 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70752 DB	'100%', 00H
	ORG $+3
$SG70755 DB	' width=100%', 00H
$SG70757 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70760 DB	'><tr><td width=10><img src=/img/bord_tl.gif></td>', 00H
	ORG $+2
$SG70762 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70765 DB	'<td background=/img/bord_t.gif align=center></td>', 00H
	ORG $+2
$SG70767 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70770 DB	'<td width=10><img src=/img/bord_tr.gif></td></tr>', 00H
	ORG $+2
$SG70772 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70775 DB	'<tr><td background=/img/bord_l.gif></td><td>', 00H
	ORG $+3
$SG70777 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70780 DB	'none', 00H
	ORG $+3
$SG70783 DB	'_EVA_BORDER', 00H
$SG70788 DB	'_EVA_RoundCorner', 00H
	ORG $+3
$SG70791 DB	'</td><td background=/img/bord_r.gif></td></tr>', 00H
	ORG $+1
$SG70793 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70796 DB	'<tr><td><img src=/img/bord_bl.gif></td>', 00H
$SG70798 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70801 DB	'<td background=/img/bord_b.gif></td>', 00H
	ORG $+3
$SG70803 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70806 DB	'<td><img src=/img/bord_br.gif></td></tr></table>', 00H
	ORG $+3
$SG70808 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70812 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG70813 DB	'ctrl_add_group', 00H
	ORG $+1
$SG70815 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG70816 DB	'ctrl_add_group', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -24
_ctrl$ = -32
_br_style$ = -28
_ctrltree$ = -20
_ctrl_add_group PROC NEAR

; 369  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH

; 370  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 371  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 372  : 	char *br_style = CTRL_ATTR_VAL(BORDER_STYLE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71491
	push	0
	push	-1
	push	OFFSET FLAT:$SG70726
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -36+[ebp], eax
	jmp	SHORT $L71492
$L71491:
	mov	DWORD PTR -36+[ebp], OFFSET FLAT:$SG70727
$L71492:
	mov	eax, DWORD PTR -36+[ebp]
	mov	DWORD PTR _br_style$[ebp], eax

; 373  : 	DynTable ctrltree = { 0 };

	mov	DWORD PTR _ctrltree$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _ctrltree$[ebp+4], ecx
	mov	DWORD PTR _ctrltree$[ebp+8], ecx
	mov	DWORD PTR _ctrltree$[ebp+12], ecx
	mov	DWORD PTR _ctrltree$[ebp+16], ecx

; 374  : 
; 375  : 	/* Read control attributes */
; 376  : 	CTRL_ATTR(ctrltree, CTRLTREE);

	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70731
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70730
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70733
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 376		; 00000178H
	jmp	$eva_err$70734
$L70730:

; 377  : 
; 378  : 	/* Add lower level controls if no output */
; 379  : 	if(!form->html)

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+232], 0
	jne	SHORT $L70735

; 381  : 		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70736
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 381		; 0000017dH
	jmp	$eva_err$70734
$L70736:
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 382  : 		RETURN_OK;

	jmp	$eva_noerr$70737
$L70735:

; 384  : 
; 385  : 	switch(form->step)
; 386  : 	{

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+176]
	mov	DWORD PTR -40+[ebp], ecx
	cmp	DWORD PTR -40+[ebp], 4
	je	SHORT $L70742
	cmp	DWORD PTR -40+[ebp], 5
	jle	$L70810
	cmp	DWORD PTR -40+[ebp], 7
	jle	SHORT $L70742
	jmp	$L70810
$L70742:

; 387  : 	case HtmlEdit:
; 388  : 	case HtmlView:
; 389  : 	case HtmlPrint:
; 390  : 
; 391  : 		/* Position control */
; 392  : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70743
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 392		; 00000188H
	jmp	$eva_err$70734
$L70743:

; 393  : 
; 394  : 		/* Handle border style : output surrounding table */
; 395  : 		if(!strcmp(br_style, "_EVA_RoundCorner"))

	push	OFFSET FLAT:$SG70745
	mov	edx, DWORD PTR _br_style$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70774

; 397  : 			DYNBUF_ADD_STR(form->html, "<table cellpadding=0 cellspacing=0 border=0");

	push	0
	push	0
	push	43					; 0000002bH
	push	OFFSET FLAT:$SG70748
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70747
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70750
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 397		; 0000018dH
	jmp	$eva_err$70734
$L70747:

; 398  : 			if(!strcmp(ctrl->TABLEWIDTH, "100%")) DYNBUF_ADD_STR(form->html, " width=100%");

	push	OFFSET FLAT:$SG70752
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+440]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70754
	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70755
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70754
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70757
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 398		; 0000018eH
	jmp	$eva_err$70734
$L70754:

; 399  : 			DYNBUF_ADD_STR(form->html, "><tr><td width=10><img src=/img/bord_tl.gif></td>");

	push	0
	push	0
	push	49					; 00000031H
	push	OFFSET FLAT:$SG70760
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70759
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70762
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 399		; 0000018fH
	jmp	$eva_err$70734
$L70759:

; 400  : 			DYNBUF_ADD_STR(form->html, "<td background=/img/bord_t.gif align=center></td>");

	push	0
	push	0
	push	49					; 00000031H
	push	OFFSET FLAT:$SG70765
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70764
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70767
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 400		; 00000190H
	jmp	$eva_err$70734
$L70764:

; 401  : 			DYNBUF_ADD_STR(form->html, "<td width=10><img src=/img/bord_tr.gif></td></tr>");

	push	0
	push	0
	push	49					; 00000031H
	push	OFFSET FLAT:$SG70770
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70769
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70772
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 401		; 00000191H
	jmp	$eva_err$70734
$L70769:

; 402  : 			DYNBUF_ADD_STR(form->html, "<tr><td background=/img/bord_l.gif></td><td>");

	push	0
	push	0
	push	44					; 0000002cH
	push	OFFSET FLAT:$SG70775
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70774
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70777
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 402		; 00000192H
	jmp	$eva_err$70734
$L70774:

; 404  : 
; 405  : 		/* Set default values for groups */
; 406  : 		if(!ctrl->CELL_STYLE[0] && !ctrl->TABLE_STYLE[0])

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+468]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70782
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+476]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70782

; 408  : 			if(!ctrl->TABLERULES[0]) ctrl->TABLERULES = "none";

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+448]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70779
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+448], OFFSET FLAT:$SG70780
$L70779:

; 409  : 			if(!CTRL_ATTR_CELL(BORDER)) ctrl->BORDER = 1;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71493
	push	0
	push	-1
	push	OFFSET FLAT:$SG70783
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L71494
$L71493:
	mov	DWORD PTR -44+[ebp], 0
$L71494:
	cmp	DWORD PTR -44+[ebp], 0
	jne	SHORT $L70782
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+460], 1
$L70782:

; 411  : 
; 412  : 		/* Output HTML table header */
; 413  : 		if(ctrl_put_table_header(cntxt, ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_put_table_header
	add	esp, 8
	test	eax, eax
	je	SHORT $L70784
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 413		; 0000019dH
	jmp	$eva_err$70734
$L70784:

; 414  : 
; 415  : 		/* Add lower level controls */
; 416  : 		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70785
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 416		; 000001a0H
	jmp	$eva_err$70734
$L70785:
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 417  : 
; 418  : 		/* Output HTML table footer */
; 419  : 		if(ctrl_put_table_footer(cntxt, ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_put_table_footer
	add	esp, 8
	test	eax, eax
	je	SHORT $L70786
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 419		; 000001a3H
	jmp	$eva_err$70734
$L70786:

; 420  : 
; 421  : 		/* Handle border style : output surrounding table */
; 422  : 		if(!strcmp(br_style, "_EVA_RoundCorner"))

	push	OFFSET FLAT:$SG70788
	mov	eax, DWORD PTR _br_style$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70805

; 424  : 			DYNBUF_ADD_STR(form->html, "</td><td background=/img/bord_r.gif></td></tr>");

	push	0
	push	0
	push	46					; 0000002eH
	push	OFFSET FLAT:$SG70791
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70790
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70793
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 424		; 000001a8H
	jmp	$eva_err$70734
$L70790:

; 425  : 			DYNBUF_ADD_STR(form->html, "<tr><td><img src=/img/bord_bl.gif></td>");

	push	0
	push	0
	push	39					; 00000027H
	push	OFFSET FLAT:$SG70796
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70795
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70798
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 425		; 000001a9H
	jmp	$eva_err$70734
$L70795:

; 426  : 			DYNBUF_ADD_STR(form->html, "<td background=/img/bord_b.gif></td>");

	push	0
	push	0
	push	36					; 00000024H
	push	OFFSET FLAT:$SG70801
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70800
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70803
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 426		; 000001aaH
	jmp	$eva_err$70734
$L70800:

; 427  : 			DYNBUF_ADD_STR(form->html, "<td><img src=/img/bord_br.gif></td></tr></table>");

	push	0
	push	0
	push	48					; 00000030H
	push	OFFSET FLAT:$SG70806
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70805
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70808
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 427		; 000001abH
	jmp	SHORT $eva_err$70734
$L70805:

; 429  : 
; 430  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70809
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 430		; 000001aeH
	jmp	SHORT $eva_err$70734
$L70809:

; 431  : 		break;

	jmp	SHORT $eva_noerr$70737
$L70810:

; 432  : 
; 433  : 	default:
; 434  : 		/* Add lower level controls */
; 435  : 		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70811
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 435		; 000001b3H
	jmp	SHORT $eva_err$70734
$L70811:
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx
$eva_noerr$70737:

; 437  : 
; 438  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70812
	push	OFFSET FLAT:$SG70813
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70734:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70814
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70815
	push	OFFSET FLAT:$SG70816
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70814:
	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 439  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_group ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_menubar
_DATA	SEGMENT
	ORG $+1
$SG70835 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG70836 DB	'ctrl_add_menubar', 00H
	ORG $+3
$SG70838 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG70839 DB	'ctrl_add_menubar', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -12
_html$ = -8
_ctrl_add_menubar PROC NEAR

; 452  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 453  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 454  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 455  : 	DynBuffer ** html = form->html;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR _html$[ebp], eax

; 456  : 
; 457  : 	/* No output in print mode */
; 458  : 	if(form->step == HtmlPrint) RETURN_OK;

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 7
	jne	SHORT $L70828
	jmp	SHORT $eva_noerr$70829
$L70828:

; 459  : 
; 460  : 	/* Switch output buffer */
; 461  : 	if(form->html && (form->step == HtmlEdit || form->step == HtmlView)) form->html = &form->html_menu;

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+232], 0
	je	SHORT $L70830
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 4
	je	SHORT $L70831
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 6
	jne	SHORT $L70830
$L70831:
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 228				; 000000e4H
	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+232], edx
$L70830:

; 462  : 
; 463  : 	/* Handle as group */
; 464  : 	if(!ctrl->ROWSPAN) ctrl->ROWSPAN = 3;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+332], 0
	jne	SHORT $L70832
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+332], 3
$L70832:

; 465  : 	if(ctrl_add_group(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_group
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$70829
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 465		; 000001d1H
	jmp	SHORT $eva_err$70834
$eva_noerr$70829:

; 466  : 
; 467  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70835
	push	OFFSET FLAT:$SG70836
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70834:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70837
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70838
	push	OFFSET FLAT:$SG70839
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70837:
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _html$[ebp]
	mov	DWORD PTR [edx+232], eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 468  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_menubar ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_pack
EXTRN	_ctrl_eval_valtyp:NEAR
EXTRN	_dyntab_from_tab:NEAR
EXTRN	_ctrl_check_condlist:NEAR
EXTRN	_ctrl_check_condseq:NEAR
EXTRN	_dyntab_order_lines:NEAR
EXTRN	_dyntab_group:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70855 DB	01H DUP (?)
	ALIGN	4

$SG70858 DB	01H DUP (?)
	ALIGN	4

$SG70862 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG70854 DB	'_EVA_SRCOBJ', 00H
$SG70857 DB	'_EVA_DISPLAY_MODE', 00H
	ORG $+2
$SG70861 DB	'_EVA_DEBUG_ACCESS', 00H
	ORG $+2
$SG70871 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70873 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70877 DB	'_EVA_COND_CTRL', 00H
	ORG $+1
$SG70881 DB	'_EVA_COND_CTRLTREE', 00H
	ORG $+1
$SG70883 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70888 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70890 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70894 DB	'_EVA_CTRLTREE_ALT', 00H
	ORG $+2
$SG70896 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70899 DB	'_EVA_CONDSEQ', 00H
	ORG $+3
$SG70904 DB	'_EVA_COND_CTRLTREE', 00H
	ORG $+1
$SG70906 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70909 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70912 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70914 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70917 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70922 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70926 DB	'_EVA_LISTOBJ', 00H
	ORG $+3
$SG70928 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70931 DB	'_EVA_SRCFIELD', 00H
	ORG $+2
$SG70933 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70935 DB	'DISTINCT', 00H
	ORG $+3
$SG70943 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG70944 DB	'ctrl_add_pack', 00H
	ORG $+2
$SG70946 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG70947 DB	'ctrl_add_pack', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -44
_ctrl$ = -84
_listobj$ = -20
_fieldexpr$ = -76
_ctrltree$ = -40
_srcobj$ = -56
_dispmode$ = -52
_step$ = -80
_sql_trace$ = -48
_res$70878 = -88
_lines$70900 = -96
_match$70901 = -92
_ctrl_add_pack PROC NEAR

; 485  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 116				; 00000074H

; 486  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 487  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 488  : 	DynTable listobj = { 0 };

	mov	DWORD PTR _listobj$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _listobj$[ebp+4], edx
	mov	DWORD PTR _listobj$[ebp+8], edx
	mov	DWORD PTR _listobj$[ebp+12], edx
	mov	DWORD PTR _listobj$[ebp+16], edx

; 489  : 	DynTable fieldexpr = { 0 };

	mov	DWORD PTR _fieldexpr$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _fieldexpr$[ebp+4], eax
	mov	DWORD PTR _fieldexpr$[ebp+8], eax
	mov	DWORD PTR _fieldexpr$[ebp+12], eax
	mov	DWORD PTR _fieldexpr$[ebp+16], eax

; 490  : 	DynTable ctrltree = { 0 };

	mov	DWORD PTR _ctrltree$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _ctrltree$[ebp+4], ecx
	mov	DWORD PTR _ctrltree$[ebp+8], ecx
	mov	DWORD PTR _ctrltree$[ebp+12], ecx
	mov	DWORD PTR _ctrltree$[ebp+16], ecx

; 491  : 	char *srcobj = CTRL_ATTR_VAL(SRCOBJ);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71497
	push	0
	push	-1
	push	OFFSET FLAT:$SG70854
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -100+[ebp], eax
	jmp	SHORT $L71498
$L71497:
	mov	DWORD PTR -100+[ebp], OFFSET FLAT:$SG70855
$L71498:
	mov	eax, DWORD PTR -100+[ebp]
	mov	DWORD PTR _srcobj$[ebp], eax

; 492  :  	char *dispmode = CTRL_ATTR_VAL(DISPLAY_MODE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71499
	push	0
	push	-1
	push	OFFSET FLAT:$SG70857
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -104+[ebp], eax
	jmp	SHORT $L71500
$L71499:
	mov	DWORD PTR -104+[ebp], OFFSET FLAT:$SG70858
$L71500:
	mov	edx, DWORD PTR -104+[ebp]
	mov	DWORD PTR _dispmode$[ebp], edx

; 493  : 	int step = form->step;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+176]
	mov	DWORD PTR _step$[ebp], ecx

; 494  : 	int sql_trace = cntxt->sql_trace;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29852]
	mov	DWORD PTR _sql_trace$[ebp], eax

; 495  : 	cntxt->sql_trace = atoi(CTRL_ATTR_VAL(DEBUG_ACCESS));

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71501
	push	0
	push	-1
	push	OFFSET FLAT:$SG70861
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -108+[ebp], eax
	jmp	SHORT $L71502
$L71501:
	mov	DWORD PTR -108+[ebp], OFFSET FLAT:$SG70862
$L71502:
	mov	edx, DWORD PTR -108+[ebp]
	push	edx
	call	_atoi
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29852], eax

; 496  : 
; 497  : 	/* Select controls to add in ctrl->val */
; 498  : 	switch(form->step)
; 499  : 	{

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR -112+[ebp], eax
	cmp	DWORD PTR -112+[ebp], 0
	je	SHORT $L70867
	jmp	$L70937
$L70867:

; 500  : 	case CtrlRead:
; 501  : 		if(!*srcobj)

	mov	ecx, DWORD PTR _srcobj$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L70868

; 503  : 			/* List of predefined controls */
; 504  : 			CTRL_ATTR(ctrltree, CTRLTREE);

	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70871
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70870
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70873
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 504		; 000001f8H
	jmp	$eva_err$70874
$L70870:

; 506  : 		else if(!strcmp(srcobj, "_EVA_COND_CTRL"))

	jmp	$L70923
$L70868:
	push	OFFSET FLAT:$SG70877
	mov	edx, DWORD PTR _srcobj$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70876

; 508  : 			/* Condition controls - Process condition list */
; 509  : 			int res;
; 510  : 			CTRL_ATTR(listobj, COND_CTRLTREE);

	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70881
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70880
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70883
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 510		; 000001feH
	jmp	$eva_err$70874
$L70880:

; 511  : 			if(ctrl_check_condlist(cntxt, &res, &listobj, ~0UL)) STACK_ERROR;

	push	-1
	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	lea	eax, DWORD PTR _res$70878[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_check_condlist
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70884
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 511		; 000001ffH
	jmp	$eva_err$70874
$L70884:

; 512  : 
; 513  : 			/* Handle matched condition */
; 514  : 			if(res) CTRL_ATTR(ctrltree, CTRLTREE)

	cmp	DWORD PTR _res$70878[ebp], 0
	je	SHORT $L70885
	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70888
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70887
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70890
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 514		; 00000202H
	jmp	$eva_err$70874
$L70887:

; 515  : 			else CTRL_ATTR(ctrltree, CTRLTREE_ALT);

	jmp	SHORT $L70893
$L70885:
	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70894
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70893
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70896
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 515		; 00000203H
	jmp	$eva_err$70874
$L70893:

; 517  : 		else if(!strcmp(srcobj, "_EVA_CONDSEQ"))

	jmp	$L70923
$L70876:
	push	OFFSET FLAT:$SG70899
	mov	ecx, DWORD PTR _srcobj$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70898

; 519  : 			/* Conditions sequence - Process condition table */
; 520  : 			unsigned long lines, match;
; 521  : 			CTRL_ATTR_TAB(listobj, COND_CTRLTREE);

	lea	edx, DWORD PTR _listobj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70904
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _listobj$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70903
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70906
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 521		; 00000209H
	jmp	$eva_err$70874
$L70903:
	lea	ecx, DWORD PTR _listobj$[ebp]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70907
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70909
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 521		; 00000209H
	jmp	$eva_err$70874
$L70907:

; 522  : 			CTRL_ATTR_TAB(fieldexpr, CTRLTREE);

	lea	ecx, DWORD PTR _fieldexpr$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70912
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _fieldexpr$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70911
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70914
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 522		; 0000020aH
	jmp	$eva_err$70874
$L70911:
	lea	eax, DWORD PTR _fieldexpr$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70915
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70917
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 522		; 0000020aH
	jmp	$eva_err$70874
$L70915:

; 523  : 			if(ctrl_check_condseq(cntxt, &listobj, &match)) STACK_ERROR;

	lea	eax, DWORD PTR _match$70901[ebp]
	push	eax
	lea	ecx, DWORD PTR _listobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_check_condseq
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70918
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 523		; 0000020bH
	jmp	$eva_err$70874
$L70918:

; 524  : 
; 525  : 			/* Handle matched condition */
; 526  : 			lines = fieldexpr.nbrows > listobj.nbrows ? fieldexpr.nbrows : listobj.nbrows;

	mov	ecx, DWORD PTR _fieldexpr$[ebp]
	cmp	ecx, DWORD PTR _listobj$[ebp]
	jbe	SHORT $L71503
	mov	edx, DWORD PTR _fieldexpr$[ebp]
	mov	DWORD PTR -116+[ebp], edx
	jmp	SHORT $L71504
$L71503:
	mov	eax, DWORD PTR _listobj$[ebp]
	mov	DWORD PTR -116+[ebp], eax
$L71504:
	mov	ecx, DWORD PTR -116+[ebp]
	mov	DWORD PTR _lines$70900[ebp], ecx

; 527  : 			if((!lines || match < lines) &&
; 528  : 				dyntab_from_tab(&ctrltree, 0, 0, &fieldexpr, match, 0, match + 1, fieldexpr.nbcols, 17)) RETURN_ERR_MEMORY;

	cmp	DWORD PTR _lines$70900[ebp], 0
	je	SHORT $L70920
	mov	edx, DWORD PTR _match$70901[ebp]
	cmp	edx, DWORD PTR _lines$70900[ebp]
	jae	SHORT $L70919
$L70920:
	push	17					; 00000011H
	mov	eax, DWORD PTR _fieldexpr$[ebp+8]
	push	eax
	mov	ecx, DWORD PTR _match$70901[ebp]
	add	ecx, 1
	push	ecx
	push	0
	mov	edx, DWORD PTR _match$70901[ebp]
	push	edx
	lea	eax, DWORD PTR _fieldexpr$[ebp]
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_from_tab
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70919
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70922
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 528		; 00000210H
	jmp	$eva_err$70874
$L70919:

; 530  : 		else

	jmp	$L70923
$L70898:

; 532  : 			CTRL_ATTR(listobj, LISTOBJ);

	lea	ecx, DWORD PTR _listobj$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70926
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70925
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70928
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 532		; 00000214H
	jmp	$eva_err$70874
$L70925:

; 533  : 			CTRL_ATTR(fieldexpr, SRCFIELD);

	lea	eax, DWORD PTR _fieldexpr$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70931
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _fieldexpr$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70930
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70933
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 533		; 00000215H
	jmp	$eva_err$70874
$L70930:

; 534  : 			if(ctrl_eval_valtyp(cntxt, ctrl, &ctrltree, srcobj, &listobj, &fieldexpr)) STACK_ERROR;

	lea	edx, DWORD PTR _fieldexpr$[ebp]
	push	edx
	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _srcobj$[ebp]
	push	ecx
	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_eval_valtyp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70934
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 534		; 00000216H
	jmp	$eva_err$70874
$L70934:

; 535  : 			dyntab_group(&ctrltree, "DISTINCT");

	push	OFFSET FLAT:$SG70935
	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	call	_dyntab_group
	add	esp, 8
$L70923:

; 537  : 
; 538  : 		/* Add lower level controls */
; 539  : 		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70936
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 539		; 0000021bH
	jmp	$eva_err$70874
$L70936:
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 540  : 		break;

	jmp	SHORT $eva_noerr$70942
$L70937:

; 541  : 
; 542  : 	default:
; 543  : 		/* Handle display mode */
; 544  : 		if(*dispmode)

	mov	edx, DWORD PTR _dispmode$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70939

; 546  : 			form->opttabid = 0;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+120], 0

; 547  : 			if(form->step == HtmlView) form->step = HtmlPrint;

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 6
	jne	SHORT $L70939
	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+176], 7
$L70939:

; 549  : 
; 550  : 		/* Add lower level controls */
; 551  : 		CTRL_ADD_CHILD(i_ctrl, NULL);

	push	0
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70941
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 551		; 00000227H
	jmp	SHORT $eva_err$70874
$L70941:
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	mov	DWORD PTR _ctrl$[ebp], eax
$eva_noerr$70942:

; 553  : 
; 554  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70943
	push	OFFSET FLAT:$SG70944
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70874:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70945
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70946
	push	OFFSET FLAT:$SG70947
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70945:
	lea	eax, DWORD PTR _listobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _fieldexpr$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _step$[ebp]
	mov	DWORD PTR [eax+176], ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _sql_trace$[ebp]
	mov	DWORD PTR [edx+29852], eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 555  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_add_pack ENDP
_TEXT	ENDS
PUBLIC	_ctrl_table_count_lines
EXTRN	_dyntab_cell:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70970 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70982 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG70983 DB	'ctrl_table_count_lines', 00H
	ORG $+1
$SG70985 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG70986 DB	'ctrl_table_count_lines', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_lines$ = 16
_form$ = -4
_ctrl$ = -16
_j$ = -8
_i_child$ = -12
_maxnum$70966 = -20
_maxline$70967 = -24
_val$70974 = -28
_ctrl_table_count_lines PROC NEAR

; 569  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 570  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 571  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 572  : 	unsigned long j, i_child;
; 573  : 
; 574  : 	/* For each child control */
; 575  : 	for(i_child = ctrl->i_child; i_child; i_child = ctrl->i_brother)

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR _i_child$[ebp], eax
	jmp	SHORT $L70963
$L70964:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	mov	DWORD PTR _i_child$[ebp], edx
$L70963:
	cmp	DWORD PTR _i_child$[ebp], 0
	je	$eva_noerr$70981

; 577  : 		unsigned long maxnum = 0, maxline = 0;

	mov	DWORD PTR _maxnum$70966[ebp], 0
	mov	DWORD PTR _maxline$70967[ebp], 0

; 578  : 		ctrl = form->ctrl + i_child;

	mov	eax, DWORD PTR _i_child$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 579  : 		if(!(ctrl->access & (AccessEdit|AccessView))) continue;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+184]
	and	ecx, 3
	test	ecx, ecx
	jne	SHORT $L70968
	jmp	SHORT $L70964
$L70968:

; 580  : 
; 581  : 		/* Count # of lines in control */
; 582  : 		if(!strcmp(ctrl->CONTROL, "_EVA_INPUT"))

	push	OFFSET FLAT:$SG70970
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70978

; 584  : 			for(j = 0; j < ctrl->val.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70971
$L70972:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70971:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+64]
	jae	SHORT $L70973

; 586  : 				/* Transform Num in Line if applicable */
; 587  : 				DynTableCell *val = dyntab_cell(&ctrl->val, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70974[ebp], eax

; 588  : 				if(val->Num && !val->Line)

	mov	eax, DWORD PTR _val$70974[ebp]
	cmp	DWORD PTR [eax+36], 0
	je	SHORT $L70975
	mov	ecx, DWORD PTR _val$70974[ebp]
	cmp	DWORD PTR [ecx+40], 0
	jne	SHORT $L70975

; 590  : 					val->Line = val->Num;

	mov	edx, DWORD PTR _val$70974[ebp]
	mov	eax, DWORD PTR _val$70974[ebp]
	mov	ecx, DWORD PTR [eax+36]
	mov	DWORD PTR [edx+40], ecx

; 591  : 					val->Num = 1;

	mov	edx, DWORD PTR _val$70974[ebp]
	mov	DWORD PTR [edx+36], 1
$L70975:

; 593  : 				if(val->Num > maxnum) maxnum = val->Num;

	mov	eax, DWORD PTR _val$70974[ebp]
	mov	ecx, DWORD PTR [eax+36]
	cmp	ecx, DWORD PTR _maxnum$70966[ebp]
	jbe	SHORT $L70976
	mov	edx, DWORD PTR _val$70974[ebp]
	mov	eax, DWORD PTR [edx+36]
	mov	DWORD PTR _maxnum$70966[ebp], eax
$L70976:

; 594  : 				if(val->Line > maxline) maxline = val->Line;

	mov	ecx, DWORD PTR _val$70974[ebp]
	mov	edx, DWORD PTR [ecx+40]
	cmp	edx, DWORD PTR _maxline$70967[ebp]
	jbe	SHORT $L70977
	mov	eax, DWORD PTR _val$70974[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	DWORD PTR _maxline$70967[ebp], ecx
$L70977:

; 595  : 			}

	jmp	SHORT $L70972
$L70973:

; 596  : 			if(maxline > *lines) *lines = maxline;

	mov	edx, DWORD PTR _lines$[ebp]
	mov	eax, DWORD PTR _maxline$70967[ebp]
	cmp	eax, DWORD PTR [edx]
	jbe	SHORT $L70978
	mov	ecx, DWORD PTR _lines$[ebp]
	mov	edx, DWORD PTR _maxline$70967[ebp]
	mov	DWORD PTR [ecx], edx
$L70978:

; 598  : 		if(ctrl_table_count_lines(cntxt, i_child, lines)) STACK_ERROR;

	mov	eax, DWORD PTR _lines$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_child$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_table_count_lines
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70979
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 598		; 00000256H
	jmp	SHORT $eva_err$70980
$L70979:

; 599  : 	}

	jmp	$L70964
$eva_noerr$70981:

; 600  : 
; 601  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70982
	push	OFFSET FLAT:$SG70983
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70980:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70984
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70985
	push	OFFSET FLAT:$SG70986
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70984:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 602  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_table_count_lines ENDP
_TEXT	ENDS
PUBLIC	_ctrl_table_null_lines
_DATA	SEGMENT
	ORG $+1
$SG71009 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG71018 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG71019 DB	'ctrl_table_null_lines', 00H
	ORG $+2
$SG71021 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG71022 DB	'ctrl_table_null_lines', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_lines$ = 16
_b_null$ = 20
_form$ = -4
_ctrl$ = -16
_j$ = -8
_i_child$ = -12
_val$71013 = -20
_ctrl_table_null_lines PROC NEAR

; 617  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 618  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 619  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 620  : 	unsigned long j, i_child;
; 621  : 
; 622  : 	/* For each child control */
; 623  : 	for(i_child = ctrl->i_child; i_child; i_child = ctrl->i_brother)

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR _i_child$[ebp], eax
	jmp	SHORT $L71004
$L71005:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	mov	DWORD PTR _i_child$[ebp], edx
$L71004:
	cmp	DWORD PTR _i_child$[ebp], 0
	je	$eva_noerr$71017

; 625  : 		ctrl = form->ctrl + i_child;

	mov	eax, DWORD PTR _i_child$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	DWORD PTR _ctrl$[ebp], edx

; 626  : 		if(!(ctrl->access & (AccessEdit|AccessView))) continue;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+184]
	and	ecx, 3
	test	ecx, ecx
	jne	SHORT $L71007
	jmp	SHORT $L71005
$L71007:

; 627  : 
; 628  : 		/* Set values with null line index to last line */
; 629  : 		if(!strcmp(ctrl->CONTROL, "_EVA_INPUT"))

	push	OFFSET FLAT:$SG71009
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71012

; 630  : 			for(j = 0; j < ctrl->val.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71010
$L71011:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L71010:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+64]
	jae	SHORT $L71012

; 632  : 				DynTableCell *val = dyntab_cell(&ctrl->val, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$71013[ebp], eax

; 633  : 				if(!val->Line)

	mov	eax, DWORD PTR _val$71013[ebp]
	cmp	DWORD PTR [eax+40], 0
	jne	SHORT $L71014

; 635  : 					val->Line = lines + 1;

	mov	ecx, DWORD PTR _lines$[ebp]
	add	ecx, 1
	mov	edx, DWORD PTR _val$71013[ebp]
	mov	DWORD PTR [edx+40], ecx

; 636  : 					*b_null = 1;

	mov	eax, DWORD PTR _b_null$[ebp]
	mov	DWORD PTR [eax], 1
$L71014:

; 638  : 			}

	jmp	SHORT $L71011
$L71012:

; 639  : 		if(ctrl_table_null_lines(cntxt, i_child, lines, b_null)) STACK_ERROR;

	mov	ecx, DWORD PTR _b_null$[ebp]
	push	ecx
	mov	edx, DWORD PTR _lines$[ebp]
	push	edx
	mov	eax, DWORD PTR _i_child$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_table_null_lines
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71015
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 639		; 0000027fH
	jmp	SHORT $eva_err$71016
$L71015:

; 640  : 	}

	jmp	$L71005
$eva_noerr$71017:

; 641  : 
; 642  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71018
	push	OFFSET FLAT:$SG71019
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71016:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L71020
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG71021
	push	OFFSET FLAT:$SG71022
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71020:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 643  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_table_null_lines ENDP
_TEXT	ENDS
PUBLIC	_ctrl_table_ins_line
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_line$ = 16
_form$ = -4
_ctrl$ = -16
_ichild$ = -12
_i$ = -8
_c$71039 = -20
_ctrl_table_ins_line PROC NEAR

; 655  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

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

; 658  : 	unsigned long ichild = ctrl->i_child, i;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR _ichild$[ebp], eax

; 659  : 
; 660  : 	/* Insert line in control values */
; 661  : 	for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71036
$L71037:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71036:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+64]
	jae	SHORT $L71038

; 663  : 		DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$71039[ebp], eax

; 664  : 		if(c->Line >= line) c->Line++;

	mov	eax, DWORD PTR _c$71039[ebp]
	mov	ecx, DWORD PTR [eax+40]
	cmp	ecx, DWORD PTR _line$[ebp]
	jb	SHORT $L71040
	mov	edx, DWORD PTR _c$71039[ebp]
	mov	eax, DWORD PTR [edx+40]
	add	eax, 1
	mov	ecx, DWORD PTR _c$71039[ebp]
	mov	DWORD PTR [ecx+40], eax
$L71040:

; 665  : 	}

	jmp	SHORT $L71037
$L71038:

; 666  : 
; 667  : 	/* Process children */
; 668  : 	while(ichild)

	cmp	DWORD PTR _ichild$[ebp], 0
	je	SHORT $L71043

; 670  : 		ctrl_table_ins_line(cntxt, ichild, line);

	mov	edx, DWORD PTR _line$[ebp]
	push	edx
	mov	eax, DWORD PTR _ichild$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_table_ins_line
	add	esp, 12					; 0000000cH

; 671  : 		ichild = form->ctrl[ichild].i_brother;

	mov	edx, DWORD PTR _ichild$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [ecx+edx+28]
	mov	DWORD PTR _ichild$[ebp], edx

; 672  : 	}

	jmp	SHORT $L71038
$L71043:

; 673  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_table_ins_line ENDP
_TEXT	ENDS
PUBLIC	_ctrl_table_del_line
EXTRN	_dyntab_del_rows:NEAR
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_line$ = 16
_form$ = -4
_ctrl$ = -20
_ichild$ = -16
_i$ = -12
_tbl$ = -8
_c$71060 = -24
_ctrl_table_del_line PROC NEAR

; 683  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 684  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 685  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 686  : 	unsigned long ichild = ctrl->i_child, i;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR _ichild$[ebp], eax

; 687  : 	ObjTableFormat *tbl = ctrl->objtbl;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	mov	DWORD PTR _tbl$[ebp], edx

; 688  : 
; 689  : 	/* Remove line in control values */
; 690  : 	for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71057
$L71058:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71057:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	SHORT $L71059

; 692  : 		DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$71060[ebp], eax

; 693  : 		if(c->Line > line) c->Line--;

	mov	edx, DWORD PTR _c$71060[ebp]
	mov	eax, DWORD PTR [edx+40]
	cmp	eax, DWORD PTR _line$[ebp]
	jbe	SHORT $L71061
	mov	ecx, DWORD PTR _c$71060[ebp]
	mov	edx, DWORD PTR [ecx+40]
	sub	edx, 1
	mov	eax, DWORD PTR _c$71060[ebp]
	mov	DWORD PTR [eax+40], edx

; 694  : 		else if(c->Line == line)

	jmp	SHORT $L71063
$L71061:
	mov	ecx, DWORD PTR _c$71060[ebp]
	mov	edx, DWORD PTR [ecx+40]
	cmp	edx, DWORD PTR _line$[ebp]
	jne	SHORT $L71063

; 696  : 			dyntab_del_rows(&ctrl->val, i, 1);

	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_del_rows
	add	esp, 12					; 0000000cH

; 697  : 			i--;

	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71063:

; 699  : 	}

	jmp	SHORT $L71058
$L71059:

; 700  : 	if(tbl)

	cmp	DWORD PTR _tbl$[ebp], 0
	je	SHORT $L71064

; 702  : 		tbl->ctrlline = 0;

	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+56], 0

; 703  : 		tbl->status &= ~(TblCtrl_opensel | TblCtrl_opensearch);

	mov	ecx, DWORD PTR _tbl$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, -545				; fffffddfH
	mov	eax, DWORD PTR _tbl$[ebp]
	mov	DWORD PTR [eax+32], edx
$L71064:

; 705  : 
; 706  : 	/* Process children */
; 707  : 	while(ichild)

	cmp	DWORD PTR _ichild$[ebp], 0
	je	SHORT $L71067

; 709  : 		ctrl_table_del_line(cntxt, ichild, line);

	mov	ecx, DWORD PTR _line$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ichild$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_table_del_line
	add	esp, 12					; 0000000cH

; 710  : 		ichild = form->ctrl[ichild].i_brother;

	mov	ecx, DWORD PTR _ichild$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+ecx+28]
	mov	DWORD PTR _ichild$[ebp], ecx

; 711  : 	}

	jmp	SHORT $L71064
$L71067:

; 712  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_table_del_line ENDP
_TEXT	ENDS
PUBLIC	_ctrl_table_prepare_lines
_BSS	SEGMENT
	ALIGN	4

$SG71080 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG71085 DB	'INS', 00H
$SG71088 DB	'DEL', 00H
$SG71094 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG71095 DB	'ctrl_table_prepare_lines', 00H
	ORG $+3
$SG71097 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG71098 DB	'ctrl_table_prepare_lines', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -8
_ctrl$ = -20
_b_null$ = -16
_btn$ = -12
_line$ = -4
_ctrl_table_prepare_lines PROC NEAR

; 723  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH

; 724  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 725  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 726  : 	int b_null = 0;

	mov	DWORD PTR _b_null$[ebp], 0

; 727  : 	char *btn = CGI_CLICK_BTN_SUBFIELD;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29648], 0
	je	SHORT $L71510
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 66					; 00000042H
	jne	SHORT $L71510
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29656]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	cmp	DWORD PTR [eax+ecx+32], 0
	je	SHORT $L71510
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx+32]
	mov	DWORD PTR -24+[ebp], edx
	jmp	SHORT $L71511
$L71510:
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG71080
$L71511:
	mov	eax, DWORD PTR -24+[ebp]
	mov	DWORD PTR _btn$[ebp], eax

; 728  : 	unsigned long line = cntxt->cgi ? cntxt->cgi[cntxt->cgibtn].Line : 0;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29648], 0
	je	SHORT $L71512
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+40]
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L71513
$L71512:
	mov	DWORD PTR -28+[ebp], 0
$L71513:
	mov	ecx, DWORD PTR -28+[ebp]
	mov	DWORD PTR _line$[ebp], ecx

; 729  : 
; 730  : 	/* Handle control buttons clicks */
; 731  : 	if(line && DYNTAB_TOUL(&ctrl->id) == cntxt->cgi[cntxt->cgibtn].IdCtrl)

	cmp	DWORD PTR _line$[ebp], 0
	je	$L71087
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [ecx+29648]
	cmp	eax, DWORD PTR [ecx+edx+16]
	jne	SHORT $L71087

; 733  : 		if(!strcmp(btn, "INS"))

	push	OFFSET FLAT:$SG71085
	mov	edx, DWORD PTR _btn$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71084

; 734  : 			ctrl_table_ins_line(cntxt, i_ctrl, line);

	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_table_ins_line
	add	esp, 12					; 0000000cH

; 735  : 		else if(!strcmp(btn, "DEL"))

	jmp	SHORT $L71087
$L71084:
	push	OFFSET FLAT:$SG71088
	mov	eax, DWORD PTR _btn$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71087

; 736  : 			ctrl_table_del_line(cntxt, i_ctrl, line);

	mov	ecx, DWORD PTR _line$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_table_del_line
	add	esp, 12					; 0000000cH
$L71087:

; 738  : 
; 739  : 	/* Count # of lines in data */
; 740  : 	if(ctrl_table_count_lines(cntxt, i_ctrl, &ctrl->lines)) STACK_ERROR;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 224				; 000000e0H
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_table_count_lines
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71089
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 740		; 000002e4H
	jmp	SHORT $eva_err$71090
$L71089:

; 741  : 	if(ctrl_table_null_lines(cntxt, i_ctrl, ctrl->lines, &b_null)) STACK_ERROR;

	lea	edx, DWORD PTR _b_null$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+224]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_table_null_lines
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71091
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 741		; 000002e5H
	jmp	SHORT $eva_err$71090
$L71091:

; 742  : 	if(b_null) ctrl->lines++;

	cmp	DWORD PTR _b_null$[ebp], 0
	je	SHORT $eva_noerr$71093
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+224]
	add	eax, 1
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+224], eax
$eva_noerr$71093:

; 743  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71094
	push	OFFSET FLAT:$SG71095
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71090:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71096
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71097
	push	OFFSET FLAT:$SG71098
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71096:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 744  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_table_prepare_lines ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_table
EXTRN	_table_free:NEAR
EXTRN	_table_row_bgcolor:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_dynbuf_add_int:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_ctrl_from_id:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_ctrl_put_label:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strlen:NEAR
EXTRN	_ctrl_primary_handler:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG71123 DB	01H DUP (?)
	ALIGN	4

$SG71127 DB	01H DUP (?)
	ALIGN	4

$SG71131 DB	01H DUP (?)
	ALIGN	4

$SG71134 DB	01H DUP (?)
	ALIGN	4

$SG71317 DB	01H DUP (?)
	ALIGN	4

$SG71339 DB	01H DUP (?)
	ALIGN	4

$SG71364 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG71122 DB	'_EVA_MINVAL', 00H
$SG71126 DB	'_EVA_MAXVAL', 00H
$SG71130 DB	'_EVA_ERRNBVAL', 00H
	ORG $+2
$SG71133 DB	'_EVA_NO_DELINS_BTN', 00H
	ORG $+1
$SG71140 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG71142 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71164 DB	'Warn', 00H
	ORG $+3
$SG71165 DB	'No', 00H
	ORG $+1
$SG71172 DB	0aH, 00H
	ORG $+2
$SG71174 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71176 DB	' lignes maximum', 00H
$SG71177 DB	'Vous devez saisir ', 00H
	ORG $+1
$SG71179 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71182 DB	'%lu', 00H
$SG71186 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71191 DB	'%lu', 00H
$SG71195 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71198 DB	'%lu', 00H
$SG71202 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71211 DB	'%lu', 00H
$SG71215 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71228 DB	' - Ligne n', 0b0H, ' ', 00H
	ORG $+3
$SG71229 DB	'<td align=right bgcolor=#DDDDDD><font size=-1><b><u>', 00H
	ORG $+3
$SG71231 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71234 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71237 DB	'</b></u></font></td>', 00H
	ORG $+3
$SG71239 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71243 DB	'</font></td>', 00H
	ORG $+3
$SG71244 DB	'<td bgcolor=#DDDDDD><font size=-1>', 00H
	ORG $+1
$SG71246 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71250 DB	'<td></td>', 00H
	ORG $+2
$SG71252 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71255 DB	'</tr><tr>', 00H
	ORG $+2
$SG71257 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71267 DB	'_EVA_BORDER', 00H
$SG71273 DB	'<th>&nbsp;</th>', 0aH, 00H
	ORG $+3
$SG71275 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71283 DB	'_EVA_LEFT', 00H
	ORG $+2
$SG71285 DB	'left', 00H
	ORG $+3
$SG71286 DB	'_EVA_NewColumn', 00H
	ORG $+1
$SG71288 DB	'_EVA_NewHeader', 00H
	ORG $+1
$SG71289 DB	'_EVA_NONE', 00H
	ORG $+2
$SG71293 DB	'<th>&nbsp;</th>', 00H
$SG71295 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71299 DB	'</tr><tr>', 0aH, 00H
	ORG $+1
$SG71301 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71311 DB	'<td valign=top align=right', 00H
	ORG $+1
$SG71313 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71318 DB	' bgcolor=#', 00H
	ORG $+1
$SG71320 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71322 DB	'</td>', 0aH, 00H
	ORG $+1
$SG71323 DB	'>', 00H
	ORG $+2
$SG71325 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71333 DB	'<td valign=top', 00H
	ORG $+1
$SG71335 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71340 DB	' bgcolor=#', 00H
	ORG $+1
$SG71342 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71345 DB	'><table cellspacing=0 cellpadding=0 border=0 rules=none '
	DB	'width=100%><tr>', 0aH, 00H
	ORG $+3
$SG71347 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71352 DB	'</tr></table></td>', 0aH, 00H
$SG71354 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71358 DB	'<td valign=top', 00H
	ORG $+1
$SG71360 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71365 DB	' bgcolor=#', 00H
	ORG $+1
$SG71367 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71370 DB	'>', 00H
	ORG $+2
$SG71372 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71375 DB	'INS', 00H
$SG71379 DB	'Ins', 0e9H, 'rer une ligne au dessus', 00H
$SG71380 DB	'_eva_plus_s.gif', 00H
$SG71381 DB	'_eva_plus.gif', 00H
	ORG $+2
$SG71384 DB	'DEL', 00H
$SG71388 DB	'Supprimer la ligne', 00H
	ORG $+1
$SG71389 DB	'_eva_cancel_s.gif', 00H
	ORG $+2
$SG71390 DB	'_eva_cancel.gif', 00H
$SG71393 DB	'</td>', 00H
	ORG $+2
$SG71395 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71399 DB	'</tr><tr>', 0aH, 00H
	ORG $+1
$SG71401 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71406 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG71407 DB	'ctrl_add_table', 00H
	ORG $+1
$SG71409 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_contain.c', 00H
	ORG $+1
$SG71410 DB	'ctrl_add_table', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -24
_ctrl$ = -744
_ctrltree$ = -20
_name$ = -736
_html$ = -692
_i$ = -716
_j$ = -724
_k$ = -728
_i_child$ = -732
_b_first$ = -696
_savedlg_outmode$ = -700
_tbl$ = -688
_minval$ = -708
_maxval$ = -704
_errnbval$ = -720
_mode_disp$ = -740
_no_delins$ = -712
_b_error$71156 = -756
_b_modified$71157 = -748
_has_data$71158 = -752
__tmp$71180 = -788
__tmp$71189 = -820
__tmp$71196 = -852
_err0$71206 = -856
_err1$71207 = -860
__tmp$71209 = -892
_b_modified$71221 = -896
_b_error$71222 = -900
_child$71279 = -904
_bgcolor$71306 = -908
_ctrl_add_table PROC NEAR

; 759  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 944				; 000003b0H
	push	edi

; 760  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 761  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 762  : 	DynTable ctrltree = { 0 };

	mov	DWORD PTR _ctrltree$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _ctrltree$[ebp+4], edx
	mov	DWORD PTR _ctrltree$[ebp+8], edx
	mov	DWORD PTR _ctrltree$[ebp+12], edx
	mov	DWORD PTR _ctrltree$[ebp+16], edx

; 763  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 764  : 	DynBuffer **html = form->html;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR _html$[ebp], ecx

; 765  : 	unsigned long i, j, k, i_child;
; 766  : 	int b_first;
; 767  : 	int savedlg_outmode = form->savedlg_outmode;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+204]
	mov	DWORD PTR _savedlg_outmode$[ebp], eax

; 768  : 	ObjTableFormat tbl = {0};

	mov	DWORD PTR _tbl$[ebp], 0
	mov	ecx, 165				; 000000a5H
	xor	eax, eax
	lea	edi, DWORD PTR _tbl$[ebp+4]
	rep stosd

; 769  : 	unsigned long minval = strtoul(CTRL_ATTR_VAL(MINVAL), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71515
	push	0
	push	-1
	push	OFFSET FLAT:$SG71122
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -912+[ebp], eax
	jmp	SHORT $L71516
$L71515:
	mov	DWORD PTR -912+[ebp], OFFSET FLAT:$SG71123
$L71516:
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR -912+[ebp]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _minval$[ebp], eax

; 770  : 	unsigned long maxval = strtoul(CTRL_ATTR_VAL(MAXVAL), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71517
	push	0
	push	-1
	push	OFFSET FLAT:$SG71126
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -916+[ebp], eax
	jmp	SHORT $L71518
$L71517:
	mov	DWORD PTR -916+[ebp], OFFSET FLAT:$SG71127
$L71518:
	push	10					; 0000000aH
	push	0
	mov	ecx, DWORD PTR -916+[ebp]
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _maxval$[ebp], eax

; 771  : 	unsigned long errnbval = strtoul(CTRL_ATTR_VAL(ERRNBVAL), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71519
	push	0
	push	-1
	push	OFFSET FLAT:$SG71130
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -920+[ebp], eax
	jmp	SHORT $L71520
$L71519:
	mov	DWORD PTR -920+[ebp], OFFSET FLAT:$SG71131
$L71520:
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR -920+[ebp]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _errnbval$[ebp], eax

; 772  : 	int mode_disp = atoi(CTRL_ATTR_VAL(NO_DELINS_BTN));

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71521
	push	0
	push	-1
	push	OFFSET FLAT:$SG71133
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -924+[ebp], eax
	jmp	SHORT $L71522
$L71521:
	mov	DWORD PTR -924+[ebp], OFFSET FLAT:$SG71134
$L71522:
	mov	edx, DWORD PTR -924+[ebp]
	push	edx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _mode_disp$[ebp], eax

; 773  : 	int no_delins = mode_disp & 1;

	mov	eax, DWORD PTR _mode_disp$[ebp]
	and	eax, 1
	mov	DWORD PTR _no_delins$[ebp], eax

; 774  : 
; 775  : 	/* Return if a table is already beeing output (no table in table) */
; 776  : 	if(form->Line) RETURN_OK;

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+240], 0
	je	SHORT $L71136
	jmp	$eva_noerr$71137
$L71136:

; 777  : 
; 778  : 	/* Read control attributes */
; 779  : 	CTRL_ATTR(ctrltree, CTRLTREE);

	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71140
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71139
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71142
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 779		; 0000030bH
	jmp	$eva_err$71143
$L71139:

; 780  : 
; 781  : 	switch(form->step)
; 782  : 	{

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+176]
	mov	DWORD PTR -928+[ebp], edx
	cmp	DWORD PTR -928+[ebp], 7
	ja	$L71404
	mov	eax, DWORD PTR -928+[ebp]
	jmp	DWORD PTR $L71531[eax*4]
$L71148:

; 783  : 	case CtrlRead:
; 784  : 		/* Add lower level controls */
; 785  : 		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71149
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 785		; 00000311H
	jmp	$eva_err$71143
$L71149:
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 786  : 
; 787  : 		/* Prepare line indexes */
; 788  : 		if(ctrl_table_prepare_lines(cntxt, i_ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_table_prepare_lines
	add	esp, 8
	test	eax, eax
	je	SHORT $L71150
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 788		; 00000314H
	jmp	$eva_err$71143
$L71150:

; 789  : 		break;

	jmp	$eva_noerr$71137
$L71151:

; 790  : 
; 791  : 	case InputCheck:
; 792  : 		/* Process each line in table  */
; 793  : 		for(j = 0; j < minval || j < ctrl->lines; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71152
$L71153:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L71152:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _minval$[ebp]
	jb	SHORT $L71155
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+224]
	jae	$L71154
$L71155:

; 795  : 			/* Process each control in line */
; 796  : 			int b_error = form->error;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	mov	DWORD PTR _b_error$71156[ebp], ecx

; 797  : 			int b_modified = form->b_modified;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+128]
	mov	DWORD PTR _b_modified$71157[ebp], eax

; 798  : 			int has_data = form->has_data;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+136]
	mov	DWORD PTR _has_data$71158[ebp], edx

; 799  : 			form->error = 0;

	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+132], 0

; 800  : 			form->b_modified = 0;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+128], 0

; 801  : 			form->has_data = 0;

	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+136], 0

; 802  : 			form->Line= j + 1;

	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+240], eax

; 803  : 			for(i = 0; i < ctrltree.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71159
$L71160:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71159:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _ctrltree$[ebp]
	jae	$L71161

; 805  : 				/* Get control index */
; 806  : 				i_child = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(&ctrltree, i, 0));

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_from_id
	add	esp, 16					; 00000010H
	mov	DWORD PTR _i_child$[ebp], eax

; 807  : 				if(!i_child) continue;

	cmp	DWORD PTR _i_child$[ebp], 0
	jne	SHORT $L71162
	jmp	SHORT $L71160
$L71162:

; 808  : 
; 809  : 				/* Handle min # of lines */
; 810  : 				if(!i && errnbval && ctrl->lines < minval && i < minval)

	cmp	DWORD PTR _i$[ebp], 0
	jne	SHORT $L71163
	cmp	DWORD PTR _errnbval$[ebp], 0
	je	SHORT $L71163
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+224]
	cmp	edx, DWORD PTR _minval$[ebp]
	jae	SHORT $L71163
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _minval$[ebp]
	jae	SHORT $L71163

; 811  : 					form->ctrl[i_child].ALLOWEMPTY = (errnbval == 1) ? "Warn" : "No";

	cmp	DWORD PTR _errnbval$[ebp], 1
	jne	SHORT $L71523
	mov	DWORD PTR -932+[ebp], OFFSET FLAT:$SG71164
	jmp	SHORT $L71524
$L71523:
	mov	DWORD PTR -932+[ebp], OFFSET FLAT:$SG71165
$L71524:
	mov	ecx, DWORD PTR _i_child$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	edx, DWORD PTR -932+[ebp]
	mov	DWORD PTR [eax+ecx+340], edx
$L71163:

; 812  : 
; 813  : 				/* Call columns control handler for the line */
; 814  : 				CTRL_PRI_HDLR(i_child);

	cmp	DWORD PTR _i_child$[ebp], 0
	je	SHORT $L71167
	mov	eax, DWORD PTR _i_child$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_primary_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L71167
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 814		; 0000032eH
	jmp	$eva_err$71143
$L71167:

; 815  : 
; 816  : 				/* Handle max # of lines */
; 817  : 				if(maxval && errnbval && j >= maxval && form->ctrl[i_child].error < 2 && form->ctrl[i_child].val.nbrows)

	cmp	DWORD PTR _maxval$[ebp], 0
	je	$L71168
	cmp	DWORD PTR _errnbval$[ebp], 0
	je	$L71168
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _maxval$[ebp]
	jb	$L71168
	mov	ecx, DWORD PTR _i_child$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+ecx+212], 2
	jge	$L71168
	mov	ecx, DWORD PTR _i_child$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+ecx+64], 0
	je	$L71168

; 819  : 					form->ctrl[i_child].error = errnbval;

	mov	ecx, DWORD PTR _i_child$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	edx, DWORD PTR _errnbval$[ebp]
	mov	DWORD PTR [eax+ecx+212], edx

; 820  : 					if(form->ctrl[i_child].errmsg) DYNBUF_ADD_STR(&form->ctrl[i_child].errmsg, "\n");

	mov	eax, DWORD PTR _i_child$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	DWORD PTR [edx+eax+216], 0
	je	SHORT $L71171
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71172
	mov	eax, DWORD PTR _i_child$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	lea	eax, DWORD PTR [edx+eax+216]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71171
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71174
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 820		; 00000334H
	jmp	$eva_err$71143
$L71171:

; 821  : 					DYNBUF_ADD3_INT(&form->ctrl[i_child].errmsg, "Vous devez saisir ", maxval, " lignes maximum");

	push	15					; 0000000fH
	push	OFFSET FLAT:$SG71176
	mov	eax, DWORD PTR _maxval$[ebp]
	push	eax
	push	18					; 00000012H
	push	OFFSET FLAT:$SG71177
	mov	ecx, DWORD PTR _i_child$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	lea	ecx, DWORD PTR [eax+ecx+216]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71175
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71179
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 821		; 00000335H
	jmp	$eva_err$71143
$L71175:

; 822  : 					form->error |= form->ctrl[i_child].error;

	mov	ecx, DWORD PTR _i_child$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	edx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [edx+132]
	or	edx, DWORD PTR [eax+ecx+212]
	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+132], edx
$L71168:

; 824  : 
; 825  : 				 /* Store column error status in column 1 of ctrl->allval */
; 826  : 				DYNTAB_ADD_INT(&ctrl->allval, i , 1, (unsigned long int)form->ctrl[i_child].error);

	mov	BYTE PTR __tmp$71180[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$71180[ebp+1]
	rep stosd
	stosw
	stosb
	mov	ecx, DWORD PTR _i_child$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+ecx+212]
	push	ecx
	push	OFFSET FLAT:$SG71182
	lea	edx, DWORD PTR __tmp$71180[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR __tmp$71180[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 124				; 0000007cH
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71184
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71186
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 826		; 0000033aH
	jmp	$eva_err$71143
$L71184:

; 827  : 			}

	jmp	$L71160
$L71161:

; 828  : 
; 829  : 			/* If not last empty line */
; 830  : 			if(!ctrl->lines || j < ctrl->lines || form->has_data || j < minval)

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+224], 0
	je	SHORT $L71188
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+224]
	jb	SHORT $L71188
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+136], 0
	jne	SHORT $L71188
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _minval$[ebp]
	jae	$L71187
$L71188:

; 832  : 				/* Store line error & modified status in ctrl->val */
; 833  : 				DYNTAB_ADD_INT(&ctrl->val, j , 0, (unsigned long int)form->b_modified);

	mov	BYTE PTR __tmp$71189[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$71189[ebp+1]
	rep stosd
	stosw
	stosb
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	push	edx
	push	OFFSET FLAT:$SG71191
	lea	eax, DWORD PTR __tmp$71189[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$71189[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71193
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71195
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 833		; 00000341H
	jmp	$eva_err$71143
$L71193:

; 834  : 				DYNTAB_ADD_INT(&ctrl->val, j , 1, (unsigned long int)form->error);

	mov	BYTE PTR __tmp$71196[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$71196[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	push	ecx
	push	OFFSET FLAT:$SG71198
	lea	edx, DWORD PTR __tmp$71196[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR __tmp$71196[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71200
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71202
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 834		; 00000342H
	jmp	$eva_err$71143
$L71200:

; 835  : 				form->error |= b_error;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+132]
	or	eax, DWORD PTR _b_error$71156[ebp]
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+132], eax

; 836  : 				form->b_modified |= b_modified;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+128]
	or	eax, DWORD PTR _b_modified$71157[ebp]
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+128], eax

; 837  : 				form->has_data |= has_data;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+136]
	or	eax, DWORD PTR _has_data$71158[ebp]
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+136], eax

; 838  : 
; 839  : 				/* Store column error status in column 0 of ctrl->allval */
; 840  : 				for(i = 0; i < ctrltree.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71203
$L71204:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L71203:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _ctrltree$[ebp]
	jae	$L71205

; 842  : 					/* Keep most serious error condition */
; 843  : 					int err0 = atoi(dyntab_val(&ctrl->allval, i, 0));

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 124				; 0000007cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _err0$71206[ebp], eax

; 844  : 					int err1 = atoi(dyntab_val(&ctrl->allval, i, 1));

	push	1
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 124				; 0000007cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _err1$71207[ebp], eax

; 845  : 					if(err1 > err0) DYNTAB_ADD_INT(&ctrl->allval, i, 0, (long unsigned int)err1);

	mov	edx, DWORD PTR _err1$71207[ebp]
	cmp	edx, DWORD PTR _err0$71206[ebp]
	jle	SHORT $L71213
	mov	BYTE PTR __tmp$71209[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$71209[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _err1$71207[ebp]
	push	eax
	push	OFFSET FLAT:$SG71211
	lea	ecx, DWORD PTR __tmp$71209[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$71209[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 124				; 0000007cH
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71213
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71215
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 845		; 0000034dH
	jmp	$eva_err$71143
$L71213:

; 846  : 				}

	jmp	$L71204
$L71205:

; 848  : 			else

	jmp	SHORT $L71216
$L71187:

; 850  : 				/* Restore form status */
; 851  : 				form->error = b_error;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _b_error$71156[ebp]
	mov	DWORD PTR [ecx+132], edx

; 852  : 				form->b_modified = b_modified;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _b_modified$71157[ebp]
	mov	DWORD PTR [eax+128], ecx

; 853  : 				form->has_data = has_data;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _has_data$71158[ebp]
	mov	DWORD PTR [edx+136], eax
$L71216:

; 855  : 		}

	jmp	$L71153
$L71154:

; 856  : 		form->Line = 0;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+240], 0

; 857  : 		break;

	jmp	$eva_noerr$71137
$L71217:

; 858  : 
; 859  : 	case HtmlSaveDlg:
; 860  : 		/* Process each line in table  */
; 861  : 		for(j = 0, b_first = 1; j < ctrl->val.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	mov	DWORD PTR _b_first$[ebp], 1
	jmp	SHORT $L71218
$L71219:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L71218:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+64]
	jae	$L71220

; 863  : 			/* Output line in Edit mode if error, warning or modified */
; 864  : 			int b_modified = atoi(dyntab_val(&ctrl->val, j, 0));

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _b_modified$71221[ebp], eax

; 865  : 			int b_error = atoi(dyntab_val(&ctrl->val, j, 1));

	push	1
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _b_error$71222[ebp], eax

; 866  : 			if(!(
; 867  : 				(b_error & 1 && savedlg_outmode & 1) ||
; 868  : 				(b_error & 2 && savedlg_outmode & 2) ||
; 869  : 				(b_modified && savedlg_outmode & 4))) continue;

	mov	eax, DWORD PTR _b_error$71222[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L71224
	mov	ecx, DWORD PTR _savedlg_outmode$[ebp]
	and	ecx, 1
	test	ecx, ecx
	jne	SHORT $L71223
$L71224:
	mov	edx, DWORD PTR _b_error$71222[ebp]
	and	edx, 2
	test	edx, edx
	je	SHORT $L71225
	mov	eax, DWORD PTR _savedlg_outmode$[ebp]
	and	eax, 2
	test	eax, eax
	jne	SHORT $L71223
$L71225:
	cmp	DWORD PTR _b_modified$71221[ebp], 0
	je	SHORT $L71226
	mov	ecx, DWORD PTR _savedlg_outmode$[ebp]
	and	ecx, 4
	test	ecx, ecx
	jne	SHORT $L71223
$L71226:
	jmp	$L71219
$L71223:

; 870  : 
; 871  : 			/* Output label, line number & notes for each line */
; 872  : 			form->savedlg_outmode = 15;

	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+204], 15			; 0000000fH

; 873  : 			DYNBUF_ADD3(html, "<td align=right bgcolor=#DDDDDD><font size=-1><b><u>", ctrl->LABEL, 0, TO_HTML, " - Ligne n° ");

	push	12					; 0000000cH
	push	OFFSET FLAT:$SG71228
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	push	52					; 00000034H
	push	OFFSET FLAT:$SG71229
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71227
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71231
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 873		; 00000369H
	jmp	$eva_err$71143
$L71227:

; 874  : 			DYNBUF_ADD_INT(html, j + 1);

	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	push	edx
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L71232
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71234
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 874		; 0000036aH
	jmp	$eva_err$71143
$L71232:

; 875  : 			DYNBUF_ADD_STR(html, "</b></u></font></td>");

	push	0
	push	0
	push	20					; 00000014H
	push	OFFSET FLAT:$SG71237
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71236
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71239
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 875		; 0000036bH
	jmp	$eva_err$71143
$L71236:

; 876  : 			if(b_first)

	cmp	DWORD PTR _b_first$[ebp], 0
	je	SHORT $L71240

; 878  : 				if(ctrl->NOTES) DYNBUF_ADD3(html, "<td bgcolor=#DDDDDD><font size=-1>", ctrl->NOTES, 0, TO_HTML, "</font></td>");

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+288], 0
	je	SHORT $L71242
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG71243
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+288]
	push	edx
	push	34					; 00000022H
	push	OFFSET FLAT:$SG71244
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71242
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71246
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 878		; 0000036eH
	jmp	$eva_err$71143
$L71242:

; 879  : 				b_first = 0;

	mov	DWORD PTR _b_first$[ebp], 0

; 881  : 			else

	jmp	SHORT $L71249
$L71240:

; 882  : 				DYNBUF_ADD_STR(html, "<td></td>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG71250
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71249
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71252
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 882		; 00000372H
	jmp	$eva_err$71143
$L71249:

; 883  : 			DYNBUF_ADD_STR(html, "</tr><tr>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG71255
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71254
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71257
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 883		; 00000373H
	jmp	$eva_err$71143
$L71254:

; 884  : 
; 885  : 			for(i = 0; i < ctrltree.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71258
$L71259:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71258:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _ctrltree$[ebp]
	jae	$L71260

; 887  : 				/* Add controls for the line */
; 888  : 				i_child = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(&ctrltree, i, 0));

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_from_id
	add	esp, 16					; 00000010H
	mov	DWORD PTR _i_child$[ebp], eax

; 889  : 				if(!i_child) continue;

	cmp	DWORD PTR _i_child$[ebp], 0
	jne	SHORT $L71261
	jmp	SHORT $L71259
$L71261:

; 890  : 				form->Line = j + 1;

	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+240], edx

; 891  : 				CTRL_PRI_HDLR(i_child);

	cmp	DWORD PTR _i_child$[ebp], 0
	je	SHORT $L71263
	mov	ecx, DWORD PTR _i_child$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_primary_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L71263
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 891		; 0000037bH
	jmp	$eva_err$71143
$L71263:

; 892  : 			}

	jmp	$L71259
$L71260:

; 893  : 			form->savedlg_outmode = savedlg_outmode;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _savedlg_outmode$[ebp]
	mov	DWORD PTR [ecx+204], edx

; 894  : 		}

	jmp	$L71219
$L71220:

; 895  : 		form->Line = 0;

	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+240], 0

; 896  : 		break;

	jmp	$eva_noerr$71137
$L71264:

; 897  : 
; 898  : 	case HtmlEdit:
; 899  : 	case HtmlPrint:
; 900  : 	case HtmlView:
; 901  : 		/* Set default values for tables */
; 902  : 		if(!CTRL_ATTR_CELL(BORDER)) ctrl->BORDER = 1;

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L71525
	push	0
	push	-1
	push	OFFSET FLAT:$SG71267
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -936+[ebp], eax
	jmp	SHORT $L71526
$L71525:
	mov	DWORD PTR -936+[ebp], 0
$L71526:
	cmp	DWORD PTR -936+[ebp], 0
	jne	SHORT $L71266
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+460], 1
$L71266:

; 903  : 
; 904  : 		/* Position control & output HTML table header */
; 905  : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71268
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 905		; 00000389H
	jmp	$eva_err$71143
$L71268:

; 906  : 		if(ctrl_put_table_header(cntxt, ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_put_table_header
	add	esp, 8
	test	eax, eax
	je	SHORT $L71269
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 906		; 0000038aH
	jmp	$eva_err$71143
$L71269:

; 907  : 
; 908  : 		/* Output labels line */
; 909  : 		no_delins |= form->step != HtmlEdit || !(ctrl->access & AccessEdit);

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 4
	jne	SHORT $L71527
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+184]
	and	edx, 2
	test	edx, edx
	je	SHORT $L71527
	mov	DWORD PTR -940+[ebp], 0
	jmp	SHORT $L71528
$L71527:
	mov	DWORD PTR -940+[ebp], 1
$L71528:
	mov	eax, DWORD PTR _no_delins$[ebp]
	or	eax, DWORD PTR -940+[ebp]
	mov	DWORD PTR _no_delins$[ebp], eax

; 910  : 		if(!(mode_disp & 2)) DYNBUF_ADD_STR(form->html, "<th>&nbsp;</th>\n");

	mov	ecx, DWORD PTR _mode_disp$[ebp]
	and	ecx, 2
	test	ecx, ecx
	jne	SHORT $L71272
	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG71273
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71272
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71275
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 910		; 0000038eH
	jmp	$eva_err$71143
$L71272:

; 911  : 		for(i = 0; i < ctrltree.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71276
$L71277:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L71276:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _ctrltree$[ebp]
	jae	$L71278

; 913  : 			EVA_ctrl *child;
; 914  : 			i_child = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(&ctrltree, i, 0));

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_from_id
	add	esp, 16					; 00000010H
	mov	DWORD PTR _i_child$[ebp], eax

; 915  : 			if(!i_child) continue;

	cmp	DWORD PTR _i_child$[ebp], 0
	jne	SHORT $L71280
	jmp	SHORT $L71277
$L71280:

; 916  : 			child = form->ctrl + i_child;

	mov	edx, DWORD PTR _i_child$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _child$71279[ebp], ecx

; 917  : 			if(!(child->access & (AccessEdit|AccessView))) continue;

	mov	edx, DWORD PTR _child$71279[ebp]
	mov	eax, DWORD PTR [edx+184]
	and	eax, 3
	test	eax, eax
	jne	SHORT $L71281
	jmp	$L71277
$L71281:

; 918  : 			child->error = (ctrl->lines || minval) ? atoi(dyntab_val(&ctrl->allval, i, 0)) : 0;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+224], 0
	jne	SHORT $L71529
	cmp	DWORD PTR _minval$[ebp], 0
	jne	SHORT $L71529
	mov	DWORD PTR -944+[ebp], 0
	jmp	SHORT $L71530
$L71529:
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 124				; 0000007cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -944+[ebp], eax
$L71530:
	mov	ecx, DWORD PTR _child$71279[ebp]
	mov	edx, DWORD PTR -944+[ebp]
	mov	DWORD PTR [ecx+212], edx

; 919  : 			if(!(mode_disp & 2))

	mov	eax, DWORD PTR _mode_disp$[ebp]
	and	eax, 2
	test	eax, eax
	jne	$L71282

; 921  : 				child->LABELPOS = "_EVA_LEFT";

	mov	ecx, DWORD PTR _child$71279[ebp]
	mov	DWORD PTR [ecx+292], OFFSET FLAT:$SG71283

; 922  : 				if(!child->LABELALIGN[0]) child->LABELALIGN = "left";

	mov	edx, DWORD PTR _child$71279[ebp]
	mov	eax, DWORD PTR [edx+384]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L71284
	mov	edx, DWORD PTR _child$71279[ebp]
	mov	DWORD PTR [edx+384], OFFSET FLAT:$SG71285
$L71284:

; 923  : 				child->POSITION = "_EVA_NewColumn";

	mov	eax, DWORD PTR _child$71279[ebp]
	mov	DWORD PTR [eax+296], OFFSET FLAT:$SG71286

; 924  : 				if(ctrl_put_label(cntxt, child, "_EVA_NewHeader")) STACK_ERROR;

	push	OFFSET FLAT:$SG71288
	mov	ecx, DWORD PTR _child$71279[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_label
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71287
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 924		; 0000039cH
	jmp	$eva_err$71143
$L71287:

; 925  : 				child->LABELPOS = "_EVA_NONE";

	mov	ecx, DWORD PTR _child$71279[ebp]
	mov	DWORD PTR [ecx+292], OFFSET FLAT:$SG71289
$L71282:

; 927  : 		}

	jmp	$L71277
$L71278:

; 928  : 		if(!no_delins) DYNBUF_ADD_STR(form->html, "<th>&nbsp;</th>");

	cmp	DWORD PTR _no_delins$[ebp], 0
	jne	SHORT $L71292
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG71293
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71292
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71295
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 928		; 000003a0H
	jmp	$eva_err$71143
$L71292:

; 929  : 		if(!(mode_disp & 2)) DYNBUF_ADD_STR(form->html, "</tr><tr>\n");

	mov	eax, DWORD PTR _mode_disp$[ebp]
	and	eax, 2
	test	eax, eax
	jne	SHORT $L71298
	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71299
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71298
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71301
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 929		; 000003a1H
	jmp	$eva_err$71143
$L71298:

; 930  : 
; 931  : 		/* Process each line in table  */
; 932  : 		k = ctrl->lines + (form->step == HtmlEdit ? 1 : 0);

	mov	edx, DWORD PTR _form$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+176], 4
	sete	al
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+224]
	add	edx, eax
	mov	DWORD PTR _k$[ebp], edx

; 933  : 		if(k < minval) k = minval;

	mov	eax, DWORD PTR _k$[ebp]
	cmp	eax, DWORD PTR _minval$[ebp]
	jae	SHORT $L71302
	mov	ecx, DWORD PTR _minval$[ebp]
	mov	DWORD PTR _k$[ebp], ecx
$L71302:

; 934  : 		for(j = 0; j < k; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71303
$L71304:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L71303:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _k$[ebp]
	jae	$L71305

; 936  : 			char *bgcolor = table_row_bgcolor(cntxt, &tbl, j, NULL);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _tbl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_row_bgcolor
	add	esp, 16					; 00000010H
	mov	DWORD PTR _bgcolor$71306[ebp], eax

; 937  : 			if(!(mode_disp & 4))

	mov	ecx, DWORD PTR _mode_disp$[ebp]
	and	ecx, 4
	test	ecx, ecx
	jne	$L71321

; 939  : 				DYNBUF_ADD_STR(form->html, "<td valign=top align=right");

	push	0
	push	0
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG71311
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71310
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71313
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 939		; 000003abH
	jmp	$eva_err$71143
$L71310:

; 940  : 				if(*bgcolor && strlen(bgcolor) == 6) DYNBUF_ADD3(form->html, " bgcolor=#", bgcolor, 6, NO_CONV, "");

	mov	eax, DWORD PTR _bgcolor$71306[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71316
	mov	edx, DWORD PTR _bgcolor$71306[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	cmp	eax, 6
	jne	SHORT $L71316
	push	0
	push	OFFSET FLAT:$SG71317
	push	0
	push	0
	push	6
	mov	eax, DWORD PTR _bgcolor$71306[ebp]
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71318
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71316
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71320
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 940		; 000003acH
	jmp	$eva_err$71143
$L71316:

; 941  : 				DYNBUF_ADD3_INT(form->html, ">", j + 1, "</td>\n")

	push	6
	push	OFFSET FLAT:$SG71322
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	push	edx
	push	1
	push	OFFSET FLAT:$SG71323
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71321
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71325
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 941		; 000003adH
	jmp	$eva_err$71143
$L71321:

; 943  : 
; 944  : 			/* Process each control in line */
; 945  : 			for(i = 0; i < ctrltree.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L71326
$L71327:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L71326:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _ctrltree$[ebp]
	jae	$L71328

; 947  : 				/* Add controls for the line */
; 948  : 				i_child = ctrl_from_id(cntxt, i_ctrl, DYNTAB_VAL_SZ(&ctrltree, i, 0));

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _ctrltree$[ebp]
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
	mov	DWORD PTR _i_child$[ebp], eax

; 949  : 				if(!i_child) continue;

	cmp	DWORD PTR _i_child$[ebp], 0
	jne	SHORT $L71329
	jmp	SHORT $L71327
$L71329:

; 950  : 				if(!(form->ctrl[i_child].access & (AccessEdit|AccessView))) continue;

	mov	eax, DWORD PTR _i_child$[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+eax+184]
	and	eax, 3
	test	eax, eax
	jne	SHORT $L71330
	jmp	$L71327
$L71330:

; 951  : 				form->Line = j + 1;

	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+240], ecx

; 952  : 				DYNBUF_ADD_STR(form->html, "<td valign=top");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG71333
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71332
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71335
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 952		; 000003b8H
	jmp	$eva_err$71143
$L71332:

; 953  : 				if(*bgcolor && strlen(bgcolor) == 6) DYNBUF_ADD3(form->html, " bgcolor=#", bgcolor, 6, NO_CONV, "");

	mov	ecx, DWORD PTR _bgcolor$71306[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L71338
	mov	eax, DWORD PTR _bgcolor$71306[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	cmp	eax, 6
	jne	SHORT $L71338
	push	0
	push	OFFSET FLAT:$SG71339
	push	0
	push	0
	push	6
	mov	ecx, DWORD PTR _bgcolor$71306[ebp]
	push	ecx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71340
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71338
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71342
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 953		; 000003b9H
	jmp	$eva_err$71143
$L71338:

; 955  : 				"<table cellspacing=0 cellpadding=0 border=0 rules=none width=100%><tr>\n");

	push	0
	push	0
	push	72					; 00000048H
	push	OFFSET FLAT:$SG71345
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71344
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71347
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 955		; 000003bbH
	jmp	$eva_err$71143
$L71344:

; 956  : 				CTRL_PRI_HDLR(i_child);

	cmp	DWORD PTR _i_child$[ebp], 0
	je	SHORT $L71349
	mov	ecx, DWORD PTR _i_child$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_primary_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L71349
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 956		; 000003bcH
	jmp	$eva_err$71143
$L71349:

; 957  : 				DYNBUF_ADD_STR(form->html, "</tr></table></td>\n");

	push	0
	push	0
	push	19					; 00000013H
	push	OFFSET FLAT:$SG71352
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71351
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71354
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 957		; 000003bdH
	jmp	$eva_err$71143
$L71351:

; 958  : 			}

	jmp	$L71327
$L71328:

; 959  : 
; 960  : 			/* Output DEL/INS buttons if edit mode */
; 961  : 			if(!no_delins)

	cmp	DWORD PTR _no_delins$[ebp], 0
	jne	$L71392

; 963  : 				DYNBUF_ADD_STR(form->html, "<td valign=top");

	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG71358
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71357
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71360
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 963		; 000003c3H
	jmp	$eva_err$71143
$L71357:

; 964  : 				if(*bgcolor && strlen(bgcolor) == 6) DYNBUF_ADD3(form->html, " bgcolor=#", bgcolor, 6, NO_CONV, "");

	mov	eax, DWORD PTR _bgcolor$71306[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L71363
	mov	edx, DWORD PTR _bgcolor$71306[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	cmp	eax, 6
	jne	SHORT $L71363
	push	0
	push	OFFSET FLAT:$SG71364
	push	0
	push	0
	push	6
	mov	eax, DWORD PTR _bgcolor$71306[ebp]
	push	eax
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71365
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71363
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71367
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 964		; 000003c4H
	jmp	$eva_err$71143
$L71363:

; 965  : 				DYNBUF_ADD_STR(form->html, ">");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG71370
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71369
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71372
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 965		; 000003c5H
	jmp	$eva_err$71143
$L71369:

; 966  : 				CTRL_CGINAMEBTN(&name, NULL, add_sz_str("INS"));

	push	3
	push	OFFSET FLAT:$SG71375
	push	66					; 00000042H
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
	je	SHORT $L71374
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 966		; 000003c6H
	jmp	$eva_err$71143
$L71374:

; 967  : 				if(put_html_button_sz(cntxt, name->data, NULL, "_eva_plus.gif", "_eva_plus_s.gif",
; 968  : 					"Insérer une ligne au dessus", NULL, 0, 0, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71379
	push	OFFSET FLAT:$SG71380
	push	OFFSET FLAT:$SG71381
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71378
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 968		; 000003c8H
	jmp	$eva_err$71143
$L71378:

; 969  : 				CTRL_CGINAMEBTN(&name, NULL, add_sz_str("DEL"));

	push	3
	push	OFFSET FLAT:$SG71384
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
	je	SHORT $L71383
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 969		; 000003c9H
	jmp	$eva_err$71143
$L71383:

; 970  : 				if(put_html_button_sz(cntxt, name->data, NULL, "_eva_cancel.gif", "_eva_cancel_s.gif",
; 971  : 					"Supprimer la ligne", NULL, 0, 0, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG71388
	push	OFFSET FLAT:$SG71389
	push	OFFSET FLAT:$SG71390
	push	0
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L71387
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 971		; 000003cbH
	jmp	$eva_err$71143
$L71387:

; 972  : 				DYNBUF_ADD_STR(form->html, "</td>");

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71393
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71392
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71395
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 972		; 000003ccH
	jmp	$eva_err$71143
$L71392:

; 974  : 
; 975  : 			if(j < k) DYNBUF_ADD_STR(form->html, "</tr><tr>\n");

	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _k$[ebp]
	jae	SHORT $L71398
	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG71399
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71398
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71401
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 975		; 000003cfH
	jmp	$eva_err$71143
$L71398:

; 976  : 		}

	jmp	$L71304
$L71305:

; 977  : 		form->Line = 0;

	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+240], 0

; 978  : 
; 979  : 		/* Output HTML table footer */
; 980  : 		if(ctrl_put_table_footer(cntxt, ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_put_table_footer
	add	esp, 8
	test	eax, eax
	je	SHORT $L71402
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 980		; 000003d4H
	jmp	SHORT $eva_err$71143
$L71402:

; 981  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71403
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 981		; 000003d5H
	jmp	SHORT $eva_err$71143
$L71403:

; 982  : 		break;

	jmp	SHORT $eva_noerr$71137
$L71404:

; 983  : 
; 984  : 	default:
; 985  : 		/* Add lower level controls */
; 986  : 		CTRL_ADD_CHILD(i_ctrl, &ctrltree);

	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71405
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 986		; 000003daH
	jmp	SHORT $eva_err$71143
$L71405:
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, ecx
	mov	DWORD PTR _ctrl$[ebp], eax
$eva_noerr$71137:

; 988  : 
; 989  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71406
	push	OFFSET FLAT:$SG71407
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$71143:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L71408
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG71409
	push	OFFSET FLAT:$SG71410
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71408:
	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	lea	edx, DWORD PTR _tbl$[ebp]
	push	edx
	call	_table_free
	add	esp, 4
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 990  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
$L71531:
	DD	$L71148
	DD	$L71404
	DD	$L71151
	DD	$L71217
	DD	$L71264
	DD	$L71404
	DD	$L71264
	DD	$L71264
_ctrl_add_table ENDP
_TEXT	ENDS
END
