	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_fileupload.c
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
PUBLIC	_ctrl_add_fileupload
EXTRN	_table_read_controls:NEAR
EXTRN	_table_process_controls:NEAR
EXTRN	_put_html_button_sz:NEAR
EXTRN	_ctrl_relation_put_table:NEAR
EXTRN	_put_html_text_input:NEAR
EXTRN	_table_put_html_obj_list:NEAR
EXTRN	_atoi:NEAR
EXTRN	_qry_complete_data:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_ctrl_put_hidden:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_qry_cache_idobj_field:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_ctrl_put_hidden_old:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
$SG70217 DB	01H DUP (?)
	ALIGN	4

$SG70290 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70216 DB	'_EVA_TABLESEARCH', 00H
	ORG $+3
$SG70219 DB	'_EVA_NONE', 00H
	ORG $+2
$SG70221 DB	'No', 00H
	ORG $+1
$SG70232 DB	'_EVA_DISPLAYFIELDS', 00H
	ORG $+1
$SG70235 DB	'_EVA_FORMLIST_FILTER', 00H
	ORG $+3
$SG70268 DB	'''', 00H
	ORG $+2
$SG70269 DB	'<input type=file name=''', 00H
$SG70271 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70273 DB	'>', 0aH, 00H
	ORG $+1
$SG70274 DB	' size=', 00H
	ORG $+1
$SG70276 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70281 DB	'Nop', 00H
$SG70286 DB	'Lance la transmission du fichier', 0aH, 0aH, 'Cliquez d'''
	DB	'abord sur le bouton ''Parcourir ...'' puis choisissez le fich'
	DB	'ier ', 0e0H, ' transmettre (un seul fichier ', 0e0H, ' la foi'
	DB	's)', 0aH, 0aH, 'La transmission peut prendre un certain temps'
	DB	' si le fichier est important', 0aH, 0aH, 'Note : le fichier e'
	DB	'st aussi transmis quand vous cliquez un autre bouton ou si vo'
	DB	'us changez une valeur dynamique', 0aH, 0aH, 'Si vous avez uti'
	DB	'lis', 0e9H, ' Parcourir et que vous ne voulez pas transmettre'
	DB	' le fichier, effacez le champ ', 0e0H, ' gauche du bouton Par'
	DB	'courir', 00H
	ORG $+3
$SG70287 DB	'Lancer', 00H
	ORG $+1
$SG70289 DB	'_EVA_INPUT_DESCRIPTION', 00H
	ORG $+1
$SG70293 DB	'FILE_DESCRIPTION', 00H
	ORG $+3
$SG70299 DB	'TRANSMIT_FILE', 00H
	ORG $+2
$SG70304 DB	'Transmettre un fichier au serveur', 00H
	ORG $+2
$SG70305 DB	'Transmettre ...', 00H
$SG70313 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_fileu'
	DB	'pload.c', 00H
$SG70314 DB	'ctrl_add_fileupload', 00H
$SG70316 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_fileu'
	DB	'pload.c', 00H
$SG70317 DB	'ctrl_add_fileupload', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -8
_ctrl$ = -52
_cgival$ = -32
_name$ = -48
_i$ = -12
_tablesearch$ = -44
_b_search$ = -40
_b_multiple$ = -36
_b_loadfile$ = -4
_list$70234 = -56
_idlist$70236 = -60
_columns$70260 = -64
_ctrl_add_fileupload PROC NEAR

; 26   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 100				; 00000064H

; 27   : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 28   : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 29   : 	DynTable cgival = {0};

	mov	DWORD PTR _cgival$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cgival$[ebp+4], edx
	mov	DWORD PTR _cgival$[ebp+8], edx
	mov	DWORD PTR _cgival$[ebp+12], edx
	mov	DWORD PTR _cgival$[ebp+16], edx

; 30   : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 31   : 	unsigned long i;
; 32   : 	char *tablesearch = CTRL_ATTR_VAL(TABLESEARCH);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70322
	push	0
	push	-1
	push	OFFSET FLAT:$SG70216
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -68+[ebp], eax
	jmp	SHORT $L70323
$L70322:
	mov	DWORD PTR -68+[ebp], OFFSET FLAT:$SG70217
$L70323:
	mov	ecx, DWORD PTR -68+[ebp]
	mov	DWORD PTR _tablesearch$[ebp], ecx

; 33   : 	int b_search = strcmp(tablesearch, "_EVA_NONE");

	push	OFFSET FLAT:$SG70219
	mov	edx, DWORD PTR _tablesearch$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	mov	DWORD PTR _b_search$[ebp], eax

; 34   : 	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+344]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70324
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+344]
	push	ecx
	push	OFFSET FLAT:$SG70221
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70324
	mov	DWORD PTR -72+[ebp], 1
	jmp	SHORT $L70325
$L70324:
	mov	DWORD PTR -72+[ebp], 0
$L70325:
	mov	edx, DWORD PTR -72+[ebp]
	mov	DWORD PTR _b_multiple$[ebp], edx

; 35   : 	int b_loadfile = cntxt->cgiencodemultipart && (!b_search || form->i_ctrl_clic == i_ctrl);

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29668], 0
	je	SHORT $L70327
	cmp	DWORD PTR _b_search$[ebp], 0
	je	SHORT $L70326
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	cmp	edx, DWORD PTR _i_ctrl$[ebp]
	jne	SHORT $L70327
$L70326:
	mov	DWORD PTR -76+[ebp], 1
	jmp	SHORT $L70328
$L70327:
	mov	DWORD PTR -76+[ebp], 0
$L70328:
	mov	eax, DWORD PTR -76+[ebp]
	mov	DWORD PTR _b_loadfile$[ebp], eax

; 36   : 
; 37   : 	switch(form->step)
; 38   : 	{

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+176]
	mov	DWORD PTR -80+[ebp], edx
	cmp	DWORD PTR -80+[ebp], 7
	ja	$L70310
	mov	eax, DWORD PTR -80+[ebp]
	jmp	DWORD PTR $L70339[eax*4]
$L70227:

; 39   : 	case CtrlRead:
; 40   : 		if(ctrl->storage) ctrl->storage = 3;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+36], 0
	je	SHORT $L70228
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+36], 3
$L70228:

; 41   : 
; 42   : 		/* If not transmit mode : handle files list */
; 43   : 		if(!b_loadfile)

	cmp	DWORD PTR _b_loadfile$[ebp], 0
	jne	$L70244

; 45   : 			/* Read table format data if needed */
; 46   : 			if(!CTRL_ATTR_CELL(DISPLAYFIELDS))

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70329
	push	0
	push	-1
	push	OFFSET FLAT:$SG70232
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -84+[ebp], eax
	jmp	SHORT $L70330
$L70329:
	mov	DWORD PTR -84+[ebp], 0
$L70330:
	cmp	DWORD PTR -84+[ebp], 0
	jne	$L70242

; 48   : 				if(!cntxt->objdata_FORMLIST_FILTER.nbrows)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+269648], 0
	jne	$L70238

; 50   : 					DynTableCell *list = DYNTAB_FIELD_CELL(&cntxt->cnf_data, FORMLIST_FILTER);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70235
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 29360				; 000072b0H
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _list$70234[ebp], eax

; 51   : 					unsigned long idlist = (list && list->txt) ? atoi(list->txt) : 0;

	cmp	DWORD PTR _list$70234[ebp], 0
	je	SHORT $L70331
	mov	eax, DWORD PTR _list$70234[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70331
	mov	ecx, DWORD PTR _list$70234[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_atoi
	add	esp, 4
	mov	DWORD PTR -88+[ebp], eax
	jmp	SHORT $L70332
$L70331:
	mov	DWORD PTR -88+[ebp], 0
$L70332:
	mov	eax, DWORD PTR -88+[ebp]
	mov	DWORD PTR _idlist$70236[ebp], eax

; 52   : 					if(qry_cache_idobj(&cntxt->objdata_FORMLIST_FILTER, idlist)) STACK_ERROR;

	push	3
	push	0
	mov	ecx, DWORD PTR _idlist$70236[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269648				; 00041d50H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70238
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 52		; 00000034H
	jmp	$eva_err$70239
$L70238:

; 54   : 				if(qry_complete_data(cntxt, &ctrl->attr, &cntxt->objdata_FORMLIST_FILTER, NULL, NULL)) STACK_ERROR;

	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 269648				; 00041d50H
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_complete_data
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70242
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 54		; 00000036H
	jmp	$eva_err$70239
$L70242:

; 56   : 
; 57   : 			/* Handle table buttons clics */
; 58   : 			if(table_read_controls(cntxt, i_ctrl, NULL) ||
; 59   : 				table_process_controls(cntxt, i_ctrl)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_table_read_controls
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70245
	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_table_process_controls
	add	esp, 8
	test	eax, eax
	je	SHORT $L70244
$L70245:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 59		; 0000003bH
	jmp	$eva_err$70239
$L70244:

; 61   : 		for(i = 0; i < ctrl->val.nbrows; i++) dyntab_cell(&ctrl->val, i, 0)->b_relation = 1;

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70246
$L70247:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70246:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+64]
	jae	SHORT $L70248
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	BYTE PTR [eax+12], 1
	jmp	SHORT $L70247
$L70248:

; 62   : 		break;

	jmp	$eva_noerr$70312
$L70249:

; 63   : 
; 64   : 	case HtmlEdit:
; 65   : 		/* Read control status */
; 66   : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70250
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 66		; 00000042H
	jmp	$eva_err$70239
$L70250:

; 67   : 
; 68   : 		/* Output control values */
; 69   : 		if(!b_loadfile)

	cmp	DWORD PTR _b_loadfile$[ebp], 0
	jne	SHORT $L70251

; 71   : 			/* Output relation table if applicable */
; 72   : 			if(ctrl_relation_put_table(cntxt, i_ctrl, table_put_html_obj_list)) STACK_ERROR;

	push	OFFSET FLAT:_table_put_html_obj_list
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_relation_put_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70252
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 72		; 00000048H
	jmp	$eva_err$70239
$L70252:

; 74   : 		else

	jmp	SHORT $L70256
$L70251:

; 75   : 			/* Output as hidden inputs if no table */
; 76   : 			for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70254
$L70255:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70254:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+64]
	jae	SHORT $L70256

; 77   : 				if(ctrl_put_hidden(cntxt, ctrl, i)) STACK_ERROR;

	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_put_hidden
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70257
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 77		; 0000004dH
	jmp	$eva_err$70239
$L70257:
	jmp	SHORT $L70255
$L70256:

; 78   : 
; 79   : 		/* If new value allowed */
; 80   : 		if(form->step == HtmlEdit && (b_loadfile || b_multiple || !ctrl->val.nbrows))

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	jne	$L70303
	cmp	DWORD PTR _b_loadfile$[ebp], 0
	jne	SHORT $L70259
	cmp	DWORD PTR _b_multiple$[ebp], 0
	jne	SHORT $L70259
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	$L70303
$L70259:

; 82   : 			int columns = ctrl->COLUMNS;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+380]
	mov	DWORD PTR _columns$70260[ebp], edx

; 83   : 			if(!columns) columns = 5;

	cmp	DWORD PTR _columns$70260[ebp], 0
	jne	SHORT $L70261
	mov	DWORD PTR _columns$70260[ebp], 5
$L70261:

; 84   : 
; 85   : 			/* Handle transmit mode : Add HTML input of type file + upload button + description input */
; 86   : 			if(b_loadfile)

	cmp	DWORD PTR _b_loadfile$[ebp], 0
	je	$L70262

; 88   : 				/* Add HTML input of type file */
; 89   : 				CTRL_CGINAMEVAL(&name, ctrl->val.nbrows);

	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	push	1
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70264
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 89		; 00000059H
	jmp	$eva_err$70239
$L70264:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+196], 1

; 90   : 				DYNBUF_ADD3_BUF(form->html, "<input type=file name='", name, NO_CONV, "'");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70333
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -92+[ebp], eax
	jmp	SHORT $L70334
$L70333:
	mov	DWORD PTR -92+[ebp], 0
$L70334:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70335
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -96+[ebp], ecx
	jmp	SHORT $L70336
$L70335:
	mov	DWORD PTR -96+[ebp], 0
$L70336:
	push	1
	push	OFFSET FLAT:$SG70268
	push	0
	push	0
	mov	edx, DWORD PTR -92+[ebp]
	push	edx
	mov	eax, DWORD PTR -96+[ebp]
	push	eax
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70269
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70267
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70271
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 90		; 0000005aH
	jmp	$eva_err$70239
$L70267:

; 91   : 				DYNBUF_ADD3_INT(form->html, " size=", columns, ">\n");

	push	2
	push	OFFSET FLAT:$SG70273
	mov	edx, DWORD PTR _columns$70260[ebp]
	push	edx
	push	6
	push	OFFSET FLAT:$SG70274
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70272
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70276
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 91		; 0000005bH
	jmp	$eva_err$70239
$L70272:

; 92   : 				if(ctrl_put_hidden_old(cntxt, ctrl, ctrl->val.nbrows, name, NULL, 0)) STACK_ERROR;

	push	0
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+64]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_hidden_old
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70278
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 92		; 0000005cH
	jmp	$eva_err$70239
$L70278:

; 93   : 
; 94   : 				/* Add upload button + name & description inputs */
; 95   : 				CTRL_CGINAMEBTN(&name, NULL, add_sz_str("Nop"));

	push	3
	push	OFFSET FLAT:$SG70281
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
	je	SHORT $L70280
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 95		; 0000005fH
	jmp	$eva_err$70239
$L70280:

; 96   : 				if(put_html_button(cntxt, name->data, "Lancer",
; 97   : 									NULL, NULL,
; 98   : 									"Lance la transmission du fichier\n\n"
; 99   : 									"Cliquez d'abord sur le bouton 'Parcourir ...' puis choisissez le fichier à transmettre (un seul fichier à la fois)\n\n"
; 100  : 									"La transmission peut prendre un certain temps si le fichier est important\n\n"
; 101  : 									"Note : le fichier est aussi transmis quand vous cliquez un autre bouton ou si vous changez une valeur dynamique\n\n"
; 102  : 									"Si vous avez utilisé Parcourir et que vous ne voulez pas transmettre le fichier, effacez le champ à gauche du bouton Parcourir"
; 103  : 									,0, 0))

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70286
	push	0
	push	0
	push	OFFSET FLAT:$SG70287
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70285

; 104  : 					STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 104		; 00000068H
	jmp	$eva_err$70239
$L70285:

; 105  : 
; 106  : 				/* Output file description input if applicable */
; 107  : 				if(*CTRL_ATTR_VAL(INPUT_DESCRIPTION))

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70337
	push	0
	push	-1
	push	OFFSET FLAT:$SG70289
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -100+[ebp], eax
	jmp	SHORT $L70338
$L70337:
	mov	DWORD PTR -100+[ebp], OFFSET FLAT:$SG70290
$L70338:
	mov	eax, DWORD PTR -100+[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70295

; 109  : 					CTRL_CGINAMESUBFIELD(&name, NULL, "FILE_DESCRIPTION");

	push	16					; 00000010H
	push	OFFSET FLAT:$SG70293
	push	68					; 00000044H
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
	je	SHORT $L70292
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 109		; 0000006dH
	jmp	$eva_err$70239
$L70292:

; 110  : 					if(put_html_text_input(cntxt, name->data, name->cnt,
; 111  : 										NULL, 0, 0, 0, 3, 30, 128))

	push	128					; 00000080H
	push	30					; 0000001eH
	push	3
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_text_input
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70295

; 112  : 						STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 112		; 00000070H
	jmp	$eva_err$70239
$L70295:

; 115  : 			else

	jmp	SHORT $L70303
$L70262:

; 117  : 				/* Add open upload dialog button */
; 118  : 				CTRL_CGINAMEBTN(&name, NULL, add_sz_str("TRANSMIT_FILE"));

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70299
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
	je	SHORT $L70298
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 118		; 00000076H
	jmp	$eva_err$70239
$L70298:

; 119  : 				if(put_html_button(cntxt, name->data, "Transmettre ...",
; 120  : 									NULL, NULL, "Transmettre un fichier au serveur", 0, 0))

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70304
	push	0
	push	0
	push	OFFSET FLAT:$SG70305
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70303

; 121  : 					STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 121		; 00000079H
	jmp	$eva_err$70239
$L70303:

; 124  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70306
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 124		; 0000007cH
	jmp	$eva_err$70239
$L70306:

; 125  : 		break;

	jmp	SHORT $eva_noerr$70312
$L70307:

; 126  : 
; 127  : 	case HtmlPrint:
; 128  : 	case HtmlView:
; 129  : 		if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70308
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 129		; 00000081H
	jmp	SHORT $eva_err$70239
$L70308:

; 130  : 		if(ctrl_relation_put_table(cntxt, i_ctrl, table_put_html_obj_list)) STACK_ERROR;

	push	OFFSET FLAT:_table_put_html_obj_list
	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_relation_put_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70309
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 130		; 00000082H
	jmp	SHORT $eva_err$70239
$L70309:

; 131  : 		if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70310
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 131		; 00000083H
	jmp	SHORT $eva_err$70239
$L70310:
$eva_noerr$70312:

; 135  : 
; 136  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70313
	push	OFFSET FLAT:$SG70314
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70239:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70315
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70316
	push	OFFSET FLAT:$SG70317
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70315:
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

; 137  : }

	mov	esp, ebp
	pop	ebp
	ret	0
$L70339:
	DD	$L70227
	DD	$L70310
	DD	$L70310
	DD	$L70310
	DD	$L70249
	DD	$L70310
	DD	$L70307
	DD	$L70307
_ctrl_add_fileupload ENDP
_TEXT	ENDS
END
