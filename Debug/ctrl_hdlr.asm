	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_hdlr.c
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
PUBLIC	_ctrl_handlers
PUBLIC	_action_handlers
EXTRN	_dlg_openedforms:NEAR
EXTRN	_ctrl_add_option:NEAR
EXTRN	_ctrl_add_button:NEAR
EXTRN	_ctrl_add_relation:NEAR
EXTRN	_ctrl_add_input_list:NEAR
EXTRN	_ctrl_add_text:NEAR
EXTRN	_ctrl_add_input_image:NEAR
EXTRN	_ctrl_add_input_field:NEAR
EXTRN	_ctrl_add_date:NEAR
EXTRN	_ctrl_add_hour:NEAR
EXTRN	_ctrl_add_input_email:NEAR
EXTRN	_ctrl_add_input_tel:NEAR
EXTRN	_ctrl_add_number:NEAR
EXTRN	_ctrl_add_chkbox:NEAR
EXTRN	_ctrl_add_fileupload:NEAR
EXTRN	_ctrl_add_httplink:NEAR
EXTRN	_ctrl_add_input_color:NEAR
EXTRN	_ctrl_add_input:NEAR
EXTRN	_ctrl_add_tab:NEAR
EXTRN	_ctrl_add_group:NEAR
EXTRN	_ctrl_add_menubar:NEAR
EXTRN	_ctrl_add_pack:NEAR
EXTRN	_ctrl_add_table:NEAR
EXTRN	_ctrl_add_title:NEAR
EXTRN	_ctrl_add_output_list_simple:NEAR
EXTRN	_ctrl_add_output_stats:NEAR
EXTRN	_ctrl_add_output_calendar:NEAR
EXTRN	_ctrl_add_output_planning:NEAR
EXTRN	_ctrl_add_output_catalog:NEAR
EXTRN	_ctrl_add_statictext:NEAR
EXTRN	_ctrl_add_image:NEAR
EXTRN	_ctrl_add_anchor:NEAR
EXTRN	_ctrl_add_unknown:NEAR
EXTRN	_ctrl_add_reltree:NEAR
EXTRN	_ctrl_add_exprval:NEAR
EXTRN	_action_formbuttons:NEAR
EXTRN	_action_launchproc:NEAR
EXTRN	_action_openform:NEAR
EXTRN	_action_closeall:NEAR
EXTRN	_action_export:NEAR
EXTRN	_action_sequence:NEAR
EXTRN	_action_import:NEAR
EXTRN	_action_update:NEAR
EXTRN	_action_sql_script:NEAR
EXTRN	_action_email:NEAR
EXTRN	_action_end_session:NEAR
EXTRN	_action_delete:NEAR
EXTRN	_action_copyobj:NEAR
EXTRN	_action_default:NEAR
EXTRN	_action_create_objects:NEAR
EXTRN	_action_pay_site:NEAR
_DATA	SEGMENT
_ctrl_handlers DD FLAT:$SG70201
	DD	00H
	DD	FLAT:_ctrl_add_option
	DD	00H
	DD	FLAT:$SG70204
	DD	00H
	DD	FLAT:_ctrl_add_button
	DD	00H
	DD	FLAT:$SG70207
	DD	FLAT:$SG70208
	DD	FLAT:_ctrl_add_input
	DD	FLAT:_ctrl_add_relation
	DD	FLAT:$SG70209
	DD	FLAT:$SG70210
	DD	FLAT:_ctrl_add_input
	DD	FLAT:_ctrl_add_input_list
	DD	FLAT:$SG70211
	DD	FLAT:$SG70212
	DD	FLAT:_ctrl_add_input
	DD	FLAT:_ctrl_add_chkbox
	DD	FLAT:$SG70213
	DD	FLAT:$SG70214
	DD	FLAT:_ctrl_add_input
	DD	FLAT:_ctrl_add_date
	DD	FLAT:$SG70215
	DD	FLAT:$SG70216
	DD	FLAT:_ctrl_add_input
	DD	FLAT:_ctrl_add_hour
	DD	FLAT:$SG70217
	DD	FLAT:$SG70218
	DD	FLAT:_ctrl_add_input
	DD	FLAT:_ctrl_add_number
	DD	FLAT:$SG70219
	DD	FLAT:$SG70220
	DD	FLAT:_ctrl_add_input
	DD	FLAT:_ctrl_add_fileupload
	DD	FLAT:$SG70221
	DD	FLAT:$SG70222
	DD	FLAT:_ctrl_add_input
	DD	FLAT:_ctrl_add_httplink
	DD	FLAT:$SG70223
	DD	FLAT:$SG70224
	DD	FLAT:_ctrl_add_input
	DD	FLAT:_ctrl_add_input_email
	DD	FLAT:$SG70225
	DD	FLAT:$SG70226
	DD	FLAT:_ctrl_add_input
	DD	FLAT:_ctrl_add_input_tel
	DD	FLAT:$SG70227
	DD	FLAT:$SG70228
	DD	FLAT:_ctrl_add_input
	DD	FLAT:_ctrl_add_input_color
	DD	FLAT:$SG70229
	DD	FLAT:$SG70230
	DD	FLAT:_ctrl_add_input
	DD	FLAT:_ctrl_add_input_field
	DD	FLAT:$SG70231
	DD	FLAT:$SG70232
	DD	FLAT:_ctrl_add_input
	DD	FLAT:_ctrl_add_input_image
	DD	FLAT:$SG70233
	DD	00H
	DD	FLAT:_ctrl_add_input
	DD	FLAT:_ctrl_add_text
	DD	FLAT:$SG70235
	DD	FLAT:$SG70236
	DD	FLAT:_ctrl_add_tab
	DD	00H
	DD	FLAT:$SG70238
	DD	FLAT:$SG70239
	DD	FLAT:_ctrl_add_group
	DD	00H
	DD	FLAT:$SG70241
	DD	FLAT:$SG70242
	DD	FLAT:_ctrl_add_title
	DD	00H
	DD	FLAT:$SG70244
	DD	FLAT:$SG70245
	DD	FLAT:_ctrl_add_menubar
	DD	00H
	DD	FLAT:$SG70247
	DD	FLAT:$SG70248
	DD	FLAT:_ctrl_add_table
	DD	00H
	DD	FLAT:$SG70250
	DD	FLAT:$SG70251
	DD	FLAT:_ctrl_add_pack
	DD	00H
	DD	FLAT:$SG70253
	DD	00H
	DD	FLAT:_ctrl_add_pack
	DD	00H
	DD	FLAT:$SG70256
	DD	FLAT:$SG70257
	DD	FLAT:_ctrl_add_reltree
	DD	00H
	DD	FLAT:$SG70259
	DD	FLAT:$SG70260
	DD	FLAT:_ctrl_add_output_list_simple
	DD	00H
	DD	FLAT:$SG70262
	DD	FLAT:$SG70263
	DD	FLAT:_ctrl_add_output_list_simple
	DD	00H
	DD	FLAT:$SG70265
	DD	FLAT:$SG70266
	DD	FLAT:_ctrl_add_output_stats
	DD	00H
	DD	FLAT:$SG70268
	DD	FLAT:$SG70269
	DD	FLAT:_ctrl_add_output_calendar
	DD	00H
	DD	FLAT:$SG70271
	DD	FLAT:$SG70272
	DD	FLAT:_ctrl_add_output_planning
	DD	00H
	DD	FLAT:$SG70274
	DD	FLAT:$SG70275
	DD	FLAT:_ctrl_add_output_catalog
	DD	00H
	DD	FLAT:$SG70277
	DD	00H
	DD	FLAT:_ctrl_add_statictext
	DD	00H
	DD	FLAT:$SG70280
	DD	00H
	DD	FLAT:_ctrl_add_image
	DD	00H
	DD	FLAT:$SG70283
	DD	00H
	DD	FLAT:_ctrl_add_exprval
	DD	00H
	DD	FLAT:$SG70286
	DD	00H
	DD	FLAT:_ctrl_add_anchor
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:_ctrl_add_unknown
	DD	00H
_action_handlers DD FLAT:$SG70292
	DD	00H
	DD	FLAT:_action_openform
	ORG $+4
	DD	FLAT:$SG70294
	DD	00H
	DD	FLAT:_action_launchproc
	ORG $+4
	DD	FLAT:$SG70296
	DD	00H
	DD	FLAT:_action_formbuttons
	ORG $+4
	DD	FLAT:$SG70298
	DD	00H
	DD	FLAT:_action_formbuttons
	ORG $+4
	DD	FLAT:$SG70300
	DD	00H
	DD	FLAT:_action_formbuttons
	ORG $+4
	DD	FLAT:$SG70302
	DD	00H
	DD	FLAT:_action_formbuttons
	ORG $+4
	DD	FLAT:$SG70304
	DD	00H
	DD	FLAT:_action_formbuttons
	ORG $+4
	DD	FLAT:$SG70306
	DD	00H
	DD	FLAT:_action_formbuttons
	ORG $+4
	DD	FLAT:$SG70308
	DD	00H
	DD	FLAT:_action_formbuttons
	ORG $+4
	DD	FLAT:$SG70310
	DD	00H
	DD	FLAT:_action_formbuttons
	ORG $+4
	DD	FLAT:$SG70312
	DD	00H
	DD	FLAT:_action_formbuttons
	ORG $+4
	DD	FLAT:$SG70314
	DD	00H
	DD	FLAT:_action_formbuttons
	ORG $+4
	DD	FLAT:$SG70316
	DD	00H
	DD	FLAT:_action_formbuttons
	ORG $+4
	DD	FLAT:$SG70318
	DD	00H
	DD	FLAT:_action_closeall
	ORG $+4
	DD	FLAT:$SG70320
	DD	00H
	DD	FLAT:_action_export
	ORG $+4
	DD	FLAT:$SG70322
	DD	00H
	DD	FLAT:_action_create_objects
	ORG $+4
	DD	FLAT:$SG70324
	DD	00H
	DD	FLAT:_action_import
	ORG $+4
	DD	FLAT:$SG70326
	DD	00H
	DD	FLAT:_action_delete
	ORG $+4
	DD	FLAT:$SG70328
	DD	00H
	DD	FLAT:_action_copyobj
	ORG $+4
	DD	FLAT:$SG70330
	DD	00H
	DD	FLAT:_action_end_session
	ORG $+4
	DD	FLAT:$SG70332
	DD	00H
	DD	FLAT:_action_update
	ORG $+4
	DD	FLAT:$SG70334
	DD	00H
	DD	FLAT:_dlg_openedforms
	ORG $+4
	DD	FLAT:$SG70336
	DD	00H
	DD	FLAT:_action_sql_script
	ORG $+4
	DD	FLAT:$SG70338
	DD	00H
	DD	FLAT:_action_email
	ORG $+4
	DD	FLAT:$SG70340
	DD	00H
	DD	FLAT:_action_sequence
	ORG $+4
	DD	FLAT:$SG70342
	DD	00H
	DD	FLAT:_action_pay_site
	ORG $+4
	DD	00H
	DD	00H
	DD	FLAT:_action_default
	ORG $+4
$SG70201 DB	'_EVA_OPTION', 00H
$SG70204 DB	'_EVA_BUTTON', 00H
$SG70207 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70208 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG70209 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70210 DB	'_EVA_LIST', 00H
	ORG $+2
$SG70211 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70212 DB	'_EVA_CHECKBOX', 00H
	ORG $+2
$SG70213 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70214 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70215 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70216 DB	'_EVA_HOUR', 00H
	ORG $+2
$SG70217 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70218 DB	'_EVA_NUMBER', 00H
$SG70219 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70220 DB	'_EVA_FILEUPLOAD', 00H
$SG70221 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70222 DB	'_EVA_HTTPLINK', 00H
	ORG $+2
$SG70223 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70224 DB	'_EVA_EMAIL', 00H
	ORG $+1
$SG70225 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70226 DB	'_EVA_TELEPHONE', 00H
	ORG $+1
$SG70227 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70228 DB	'_EVA_COLOR', 00H
	ORG $+1
$SG70229 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70230 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70231 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70232 DB	'_EVA_IMAGE', 00H
	ORG $+1
$SG70233 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70235 DB	'_EVA_CONTAINER', 00H
	ORG $+1
$SG70236 DB	'_EVA_TAB', 00H
	ORG $+3
$SG70238 DB	'_EVA_CONTAINER', 00H
	ORG $+1
$SG70239 DB	'_EVA_GROUP', 00H
	ORG $+1
$SG70241 DB	'_EVA_CONTAINER', 00H
	ORG $+1
$SG70242 DB	'_EVA_TITLE', 00H
	ORG $+1
$SG70244 DB	'_EVA_CONTAINER', 00H
	ORG $+1
$SG70245 DB	'_EVA_MENUBAR', 00H
	ORG $+3
$SG70247 DB	'_EVA_CONTAINER', 00H
	ORG $+1
$SG70248 DB	'_EVA_TABLE', 00H
	ORG $+1
$SG70250 DB	'_EVA_CONTAINER', 00H
	ORG $+1
$SG70251 DB	'_EVA_PACKAGE', 00H
	ORG $+3
$SG70253 DB	'_EVA_CONTAINER', 00H
	ORG $+1
$SG70256 DB	'_EVA_OUTPUT', 00H
$SG70257 DB	'_EVA_RELTREE', 00H
	ORG $+3
$SG70259 DB	'_EVA_OUTPUT', 00H
$SG70260 DB	'_EVA_LIST', 00H
	ORG $+2
$SG70262 DB	'_EVA_OUTPUT', 00H
$SG70263 DB	'_EVA_LIST_SIMPLE', 00H
	ORG $+3
$SG70265 DB	'_EVA_OUTPUT', 00H
$SG70266 DB	'_EVA_STATLIST', 00H
	ORG $+2
$SG70268 DB	'_EVA_OUTPUT', 00H
$SG70269 DB	'_EVA_CALENDAR', 00H
	ORG $+2
$SG70271 DB	'_EVA_OUTPUT', 00H
$SG70272 DB	'_EVA_PLANNING', 00H
	ORG $+2
$SG70274 DB	'_EVA_OUTPUT', 00H
$SG70275 DB	'_EVA_CATALOG', 00H
	ORG $+3
$SG70277 DB	'_EVA_STATICTEXT', 00H
$SG70280 DB	'_EVA_IMAGE', 00H
	ORG $+1
$SG70283 DB	'_EVA_CALC', 00H
	ORG $+2
$SG70286 DB	'_EVA_ANCHOR', 00H
$SG70292 DB	'_EVA_OPENFORM', 00H
	ORG $+2
$SG70294 DB	'_EVA_LAUNCHPROC', 00H
$SG70296 DB	'_EVA_NEWOBJ', 00H
$SG70298 DB	'_EVA_SAVE', 00H
	ORG $+2
$SG70300 DB	'_EVA_SAVECLOSE', 00H
	ORG $+1
$SG70302 DB	'_EVA_CLOSE', 00H
	ORG $+1
$SG70304 DB	'_EVA_PRINTMODE', 00H
	ORG $+1
$SG70306 DB	'_EVA_EDITMODE', 00H
	ORG $+2
$SG70308 DB	'_EVA_VIEWMODE', 00H
	ORG $+2
$SG70310 DB	'_EVA_LISTMODE', 00H
	ORG $+2
$SG70312 DB	'_EVA_STATSMODE', 00H
	ORG $+1
$SG70314 DB	'_EVA_VALUESMODE', 00H
$SG70316 DB	'_EVA_SEARCHMODE', 00H
$SG70318 DB	'_EVA_CLOSEALL', 00H
	ORG $+2
$SG70320 DB	'_EVA_EXPORT', 00H
$SG70322 DB	'_EVA_CREATE', 00H
$SG70324 DB	'_EVA_IMPORT', 00H
$SG70326 DB	'_EVA_DELETE', 00H
$SG70328 DB	'_EVA_COPYOBJ', 00H
	ORG $+3
$SG70330 DB	'_EVA_END_SESSION', 00H
	ORG $+3
$SG70332 DB	'_EVA_UPDATE', 00H
$SG70334 DB	'_EVA_OPENEDFORMS_DLG', 00H
	ORG $+3
$SG70336 DB	'_EVA_SQL_SCRIPT', 00H
$SG70338 DB	'_EVA_EMAIL', 00H
	ORG $+1
$SG70340 DB	'_EVA_ACTION_SEQ', 00H
$SG70342 DB	'_EVA_PAY_SITE', 00H
_DATA	ENDS
PUBLIC	_ctrl_call_act_handler
EXTRN	_strcmp:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_field_val:NEAR
_BSS	SEGMENT
$SG70359 DB	01H DUP (?)
	ALIGN	4

$SG70361 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG70358 DB	'_EVA_BUTTON', 00H
$SG70360 DB	'_EVA_ACTION', 00H
$SG70368 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_hdlr.c', 00H
$SG70369 DB	'ctrl_call_act_handler', 00H
	ORG $+2
$SG70371 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_hdlr.c', 00H
$SG70372 DB	'ctrl_call_act_handler', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -16
_i$ = -12
_action$ = -8
_ctrl_call_act_handler PROC NEAR

; 113  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 114  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 115  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 116  : 	unsigned long i = 0; 

	mov	DWORD PTR _i$[ebp], 0

; 117  : 	char *action = strcmp(ctrl->CONTROL, "_EVA_BUTTON") ? "" : CTRL_ATTR_VAL(ACTION); 

	push	OFFSET FLAT:$SG70358
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70379
	mov	DWORD PTR -20+[ebp], OFFSET FLAT:$SG70359
	jmp	SHORT $L70380
$L70379:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70377
	push	0
	push	-1
	push	OFFSET FLAT:$SG70360
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L70378
$L70377:
	mov	DWORD PTR -24+[ebp], OFFSET FLAT:$SG70361
$L70378:
	mov	edx, DWORD PTR -24+[ebp]
	mov	DWORD PTR -20+[ebp], edx
$L70380:
	mov	eax, DWORD PTR -20+[ebp]
	mov	DWORD PTR _action$[ebp], eax
$L70363:

; 118  : 
; 119  : 	while(action_handlers[i].control && strcmp(action_handlers[i].control, action)) i++; 

	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 4
	cmp	DWORD PTR _action_handlers[ecx], 0
	je	SHORT $L70364
	mov	edx, DWORD PTR _action$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _action_handlers[eax]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70364
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
	jmp	SHORT $L70363
$L70364:

; 120  : 	if(action_handlers[i].h0 && action_handlers[i].h0(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	cmp	DWORD PTR _action_handlers[eax+8], 0
	je	SHORT $eva_noerr$70367
	mov	ecx, DWORD PTR _i_ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	call	DWORD PTR _action_handlers[eax+8]
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$70367
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 120		; 00000078H
	jmp	SHORT $eva_err$70366
$eva_noerr$70367:

; 121  : 
; 122  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70368
	push	OFFSET FLAT:$SG70369
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70366:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70370
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70371
	push	OFFSET FLAT:$SG70372
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70370:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 123  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_call_act_handler ENDP
_TEXT	ENDS
END
