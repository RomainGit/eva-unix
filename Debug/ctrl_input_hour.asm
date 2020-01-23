	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_hour.c
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
PUBLIC	_ctrl_add_hour
EXTRN	_ctrl_autofocus:NEAR
EXTRN	_sscanf:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_put_value_fmt:NEAR
EXTRN	_no_quote:BYTE
EXTRN	_dynbuf_add:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
_DATA	SEGMENT
$SG70216 DB	'No', 00H
	ORG $+1
$SG70232 DB	'%2d%2d%2d', 00H
	ORG $+2
$SG70244 DB	0aH, 00H
	ORG $+2
$SG70246 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70250 DB	'] n''est pas correcte', 0aH, 'Utilisez le format 0000 ', 0e0H
	DB	' 2359', 00H
$SG70251 DB	'L''heure [', 00H
	ORG $+2
$SG70253 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70260 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70268 DB	'<br>', 00H
	ORG $+3
$SG70270 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70277 DB	'''', 00H
	ORG $+2
$SG70278 DB	'<input type=text size=6 name=''', 00H
	ORG $+1
$SG70280 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70284 DB	'''>', 00H
	ORG $+1
$SG70285 DB	' value=''', 00H
	ORG $+3
$SG70287 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70292 DB	'_EVA_HOUR', 00H
	ORG $+2
$SG70296 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_hour.'
	DB	'c', 00H
	ORG $+2
$SG70297 DB	'ctrl_add_hour', 00H
	ORG $+2
$SG70299 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_hour.'
	DB	'c', 00H
	ORG $+2
$SG70300 DB	'ctrl_add_hour', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -24
_name$ = -20
_i$ = -8
_j$ = -12
_b_multiple$ = -16
_val$70226 = -28
_h$70227 = -36
_m$70228 = -40
_s$70229 = -32
_val$70264 = -44
__c$70281 = -48
_ctrl_add_hour PROC NEAR

; 25   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 88					; 00000058H

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

; 28   : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 29   : 	unsigned long i, j;
; 30   : 	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+344]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70305
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+344]
	push	eax
	push	OFFSET FLAT:$SG70216
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70305
	mov	DWORD PTR -52+[ebp], 1
	jmp	SHORT $L70306
$L70305:
	mov	DWORD PTR -52+[ebp], 0
$L70306:
	mov	ecx, DWORD PTR -52+[ebp]
	mov	DWORD PTR _b_multiple$[ebp], ecx

; 31   : 
; 32   : 	switch(form->step)
; 33   : 	{

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR -56+[ebp], eax
	mov	ecx, DWORD PTR -56+[ebp]
	sub	ecx, 2
	mov	DWORD PTR -56+[ebp], ecx
	cmp	DWORD PTR -56+[ebp], 5
	ja	$L70294
	mov	edx, DWORD PTR -56+[ebp]
	jmp	DWORD PTR $L70324[edx*4]
$L70222:

; 34   : 	case CtrlRead:
; 35   : 		break;
; 36   : 
; 37   : 	case InputCheck:
; 38   : 		/* Check each value */
; 39   : 		for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70223
$L70224:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70223:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	$L70225

; 41   : 			/* Get hour values */
; 42   : 			DynTableCell *val = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70226[ebp], eax

; 43   : 			int h = 0, m = 0, s = 0;

	mov	DWORD PTR _h$70227[ebp], 0
	mov	DWORD PTR _m$70228[ebp], 0
	mov	DWORD PTR _s$70229[ebp], 0

; 44   : 			if(!val || !val->txt || !val->len) continue;

	cmp	DWORD PTR _val$70226[ebp], 0
	je	SHORT $L70231
	mov	edx, DWORD PTR _val$70226[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L70231
	mov	eax, DWORD PTR _val$70226[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L70230
$L70231:
	jmp	SHORT $L70224
$L70230:

; 45   : 			sscanf(val->txt, "%2d%2d%2d", &h, &m, &s);

	lea	ecx, DWORD PTR _s$70229[ebp]
	push	ecx
	lea	edx, DWORD PTR _m$70228[ebp]
	push	edx
	lea	eax, DWORD PTR _h$70227[ebp]
	push	eax
	push	OFFSET FLAT:$SG70232
	mov	ecx, DWORD PTR _val$70226[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_sscanf
	add	esp, 20					; 00000014H

; 46   : 
; 47   : 			/* Check hour is valid */
; 48   : 			for(j = 0; j < val->len && h >= 0; j++) if(val->txt[j] < '0' || val->txt[j] > '9') h = -1;

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70233
$L70234:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70233:
	mov	ecx, DWORD PTR _val$70226[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jae	SHORT $L70235
	cmp	DWORD PTR _h$70227[ebp], 0
	jl	SHORT $L70235
	mov	eax, DWORD PTR _val$70226[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR [ecx+edx]
	cmp	eax, 48					; 00000030H
	jl	SHORT $L70237
	mov	ecx, DWORD PTR _val$70226[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _j$[ebp]
	movsx	ecx, BYTE PTR [edx+eax]
	cmp	ecx, 57					; 00000039H
	jle	SHORT $L70236
$L70237:
	mov	DWORD PTR _h$70227[ebp], -1
$L70236:

; 49   : 			if((val->len != 4 && val->len != 6) || h < 0 || h > 23 || m < 0 || m > 59 || s < 0 || s > 59)

	jmp	SHORT $L70234
$L70235:
	mov	edx, DWORD PTR _val$70226[ebp]
	cmp	DWORD PTR [edx+4], 4
	je	SHORT $L70240
	mov	eax, DWORD PTR _val$70226[ebp]
	cmp	DWORD PTR [eax+4], 6
	jne	SHORT $L70239
$L70240:
	cmp	DWORD PTR _h$70227[ebp], 0
	jl	SHORT $L70239
	cmp	DWORD PTR _h$70227[ebp], 23		; 00000017H
	jg	SHORT $L70239
	cmp	DWORD PTR _m$70228[ebp], 0
	jl	SHORT $L70239
	cmp	DWORD PTR _m$70228[ebp], 59		; 0000003bH
	jg	SHORT $L70239
	cmp	DWORD PTR _s$70229[ebp], 0
	jl	SHORT $L70239
	cmp	DWORD PTR _s$70229[ebp], 59		; 0000003bH
	jle	$L70249
$L70239:

; 51   : 				ctrl->error = 2;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+212], 2

; 52   : 				if(ctrl->errmsg) DYNBUF_ADD_STR(&ctrl->errmsg, "\n");

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+216], 0
	je	SHORT $L70243
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70244
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 216				; 000000d8H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70243
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70246
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 52		; 00000034H
	jmp	$eva_err$70247
$L70243:

; 53   : 				DYNBUF_ADD3_CELL(&ctrl->errmsg, "L'heure [", &ctrl->val, i, 0, NO_CONV, "] n'est pas correcte\nUtilisez le format 0000 à 2359");

	push	51					; 00000033H
	push	OFFSET FLAT:$SG70250
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	9
	push	OFFSET FLAT:$SG70251
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 216				; 000000d8H
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70249
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70253
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 53		; 00000035H
	jmp	$eva_err$70247
$L70249:

; 55   : 		}

	jmp	$L70224
$L70225:

; 56   : 		break;

	jmp	$eva_noerr$70295
$L70254:

; 57   : 
; 58   : 	case HtmlEdit:
; 59   : 	case HtmlPrint:
; 60   : 	case HtmlView:
; 61   : 		if(!form->html) break;

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+232], 0
	jne	SHORT $L70255
	jmp	$eva_noerr$70295
$L70255:

; 62   : 		/* Add HTML code for control */
; 63   : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70256
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 63		; 0000003fH
	jmp	$eva_err$70247
$L70256:

; 64   : 
; 65   : 		/* Handle empty value in view mode */
; 66   : 		if(form->step != HtmlEdit && !ctrl->val.nbrows && ctrl->LABEL_NOSEL) DYNBUF_ADD(form->html, ctrl->LABEL_NOSEL, 0, TO_HTML);

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	je	SHORT $L70258
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	SHORT $L70258
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+348], 0
	je	SHORT $L70258
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+348]
	push	eax
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70258
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70260
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 66		; 00000042H
	jmp	$eva_err$70247
$L70258:

; 67   : 
; 68   : 		/* Add HTML code for each value */
; 69   : 		j = ctrl->val.nbrows + ((form->step == HtmlEdit && (b_multiple || !ctrl->val.nbrows)) ? 1 : 0);

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	jne	SHORT $L70308
	cmp	DWORD PTR _b_multiple$[ebp], 0
	jne	SHORT $L70307
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	SHORT $L70308
$L70307:
	mov	DWORD PTR -60+[ebp], 1
	jmp	SHORT $L70309
$L70308:
	mov	DWORD PTR -60+[ebp], 0
$L70309:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	add	edx, DWORD PTR -60+[ebp]
	mov	DWORD PTR _j$[ebp], edx

; 70   : 		for(i = 0; i < j; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70261
$L70262:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70261:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _j$[ebp]
	jae	$L70263

; 72   : 			/* Separate multiple values with a line break */
; 73   : 			DynTableCell *val = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70264[ebp], eax

; 74   : 			if(i) DYNBUF_ADD_STR(form->html, "<br>");

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70267
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70268
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70267
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70270
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 74		; 0000004aH
	jmp	$eva_err$70247
$L70267:

; 75   : 
; 76   : 			/* Handle edit mode */
; 77   : 			if(form->step == HtmlEdit)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	jne	$L70271

; 79   : 				CTRL_CGINAMEVAL(&name, i);

	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70273
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 79		; 0000004fH
	jmp	$eva_err$70247
$L70273:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+196], 1

; 80   : 				DYNBUF_ADD3_BUF(form->html, "<input type=text size=6 name='", name, NO_CONV, "'");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70310
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -64+[ebp], edx
	jmp	SHORT $L70311
$L70310:
	mov	DWORD PTR -64+[ebp], 0
$L70311:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70312
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	mov	DWORD PTR -68+[ebp], eax
	jmp	SHORT $L70313
$L70312:
	mov	DWORD PTR -68+[ebp], 0
$L70313:
	push	1
	push	OFFSET FLAT:$SG70277
	push	0
	push	0
	mov	ecx, DWORD PTR -64+[ebp]
	push	ecx
	mov	edx, DWORD PTR -68+[ebp]
	push	edx
	push	30					; 0000001eH
	push	OFFSET FLAT:$SG70278
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70276
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70280
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 80		; 00000050H
	jmp	$eva_err$70247
$L70276:

; 81   : 				DYNBUF_ADD3_CELLP(form->html, " value='", val, HTML_NO_QUOTE, "'>");

	mov	ecx, DWORD PTR _val$70264[ebp]
	mov	DWORD PTR __c$70281[ebp], ecx
	cmp	DWORD PTR __c$70281[ebp], 0
	je	SHORT $L70314
	mov	edx, DWORD PTR __c$70281[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L70315
$L70314:
	mov	DWORD PTR -72+[ebp], 0
$L70315:
	cmp	DWORD PTR __c$70281[ebp], 0
	je	SHORT $L70316
	mov	ecx, DWORD PTR __c$70281[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR -76+[ebp], edx
	jmp	SHORT $L70317
$L70316:
	mov	DWORD PTR -76+[ebp], 0
$L70317:
	push	2
	push	OFFSET FLAT:$SG70284
	push	1
	push	OFFSET FLAT:_no_quote
	mov	eax, DWORD PTR -72+[ebp]
	push	eax
	mov	ecx, DWORD PTR -76+[ebp]
	push	ecx
	push	8
	push	OFFSET FLAT:$SG70285
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70283
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70287
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 81		; 00000051H
	jmp	$eva_err$70247
$L70283:

; 82   : 				if(ctrl_autofocus(cntxt, DYNBUF_VAL_SZ(name), !val || !val->txt || !val->len)) STACK_ERROR;

	cmp	DWORD PTR _val$70264[ebp], 0
	je	SHORT $L70318
	mov	eax, DWORD PTR _val$70264[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70318
	mov	ecx, DWORD PTR _val$70264[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L70318
	mov	DWORD PTR -80+[ebp], 0
	jmp	SHORT $L70319
$L70318:
	mov	DWORD PTR -80+[ebp], 1
$L70319:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70320
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -84+[ebp], eax
	jmp	SHORT $L70321
$L70320:
	mov	DWORD PTR -84+[ebp], 0
$L70321:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70322
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -88+[ebp], ecx
	jmp	SHORT $L70323
$L70322:
	mov	DWORD PTR -88+[ebp], 0
$L70323:
	mov	edx, DWORD PTR -80+[ebp]
	push	edx
	mov	eax, DWORD PTR -84+[ebp]
	push	eax
	mov	ecx, DWORD PTR -88+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_autofocus
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70289
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 82		; 00000052H
	jmp	SHORT $eva_err$70247
$L70289:

; 84   : 			else

	jmp	SHORT $L70291
$L70271:

; 85   : 				if(put_value_fmt(cntxt, form->html, val->txt, val->len, "_EVA_HOUR")) STACK_ERROR;

	push	OFFSET FLAT:$SG70292
	mov	ecx, DWORD PTR _val$70264[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _val$70264[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_value_fmt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70291
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 85		; 00000055H
	jmp	SHORT $eva_err$70247
$L70291:

; 86   : 		}

	jmp	$L70262
$L70263:

; 87   : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70294
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 87		; 00000057H
	jmp	SHORT $eva_err$70247
$L70294:
$eva_noerr$70295:

; 92   : 
; 93   : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70296
	push	OFFSET FLAT:$SG70297
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70247:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70298
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70299
	push	OFFSET FLAT:$SG70300
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70298:
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

; 94   : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70324:
	DD	$L70222
	DD	$L70294
	DD	$L70254
	DD	$L70294
	DD	$L70254
	DD	$L70254
_ctrl_add_hour ENDP
_TEXT	ENDS
END
