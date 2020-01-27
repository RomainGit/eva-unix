	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_io.c
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
PUBLIC	_form_load
EXTRN	_put_html_button_sz:NEAR
EXTRN	_cgi_build_basename:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_cgi_get_values:NEAR
EXTRN	_cgi_filter_values:NEAR
EXTRN	_form_free:NEAR
EXTRN	_sql_use_db:NEAR
EXTRN	_atoi:NEAR
EXTRN	_form_tab_selection:NEAR
EXTRN	_mem_alloc:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_strtoul:NEAR
EXTRN	_qry_obj_idfield:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_ctrl_add_new:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_ctrl_add_child:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_ctrl_set_attr_txt:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_dyntab_from_list:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_ctrl_check_access:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_cmp:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
$SG70269 DB	01H DUP (?)
	ALIGN	4

$SG70273 DB	01H DUP (?)
	ALIGN	4

$SG70291 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70227 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70231 DB	'%lu', 00H
$SG70235 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70238 DB	'%lu', 00H
$SG70242 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70249 DB	0a7H, 00H
	ORG $+2
$SG70251 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70255 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70259 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70262 DB	'_EVA_FORM', 00H
	ORG $+2
$SG70266 DB	'_EVA_NO_FORMSTAMP', 00H
	ORG $+2
$SG70268 DB	'_EVA_FORMSAVEAS', 00H
$SG70272 DB	'_EVA_OPTIMIZE_TAB', 00H
	ORG $+2
$SG70275 DB	'_EVA_OPEN_MODE_EDIT', 00H
$SG70279 DB	'_EVA_DISPLAYFIELDS', 00H
	ORG $+1
$SG70282 DB	'_EVA_DISPLAYFIELDS', 00H
	ORG $+1
$SG70292 DB	'_EVA_SELTAB', 00H
$SG70297 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70299 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70309 DB	'<td align=center><font size=+1><b><br><br>Acc', 0e8H, 's'
	DB	' non autoris', 0e9H, '<br><br></b></font>', 00H
$SG70311 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70315 DB	'L''acc', 0e8H, 's ', 0e0H, ' cette fiche ', 00H
	ORG $+1
$SG70317 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70321 DB	'_EVA_DISPLAYFIELDS', 00H
	ORG $+1
$SG70322 DB	'_EVA_FORM', 00H
	ORG $+2
$SG70325 DB	'L''ajout de fiches', 00H
	ORG $+2
$SG70327 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70331 DB	'L''acc', 0e8H, 's au formulaire', 00H
	ORG $+2
$SG70333 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70335 DB	'] vous est refus', 0e9H, '<br><br>Contactez votre admini'
	DB	'stateur si vous avez besoin de cet acc', 0e8H, 's<br><br>', 00H
$SG70336 DB	' [', 00H
	ORG $+1
$SG70338 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70341 DB	'Retourne ', 0e0H, ' la page pr', 0e9H, 'c', 0e9H, 'dente'
	DB	00H
	ORG $+2
$SG70342 DB	'_eva_btn_gobackobj_fr_s.gif', 00H
$SG70343 DB	'_eva_btn_gobackobj_fr.gif', 00H
	ORG $+2
$SG70344 DB	'Revenir', 00H
$SG70345 DB	'B$#.CLOSE', 00H
	ORG $+2
$SG70348 DB	'<br><br></td>', 00H
	ORG $+2
$SG70350 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70354 DB	'<td align=center><table noborder width=100% bgcolor=#FFF'
	DB	'FFF><tr><td align=center><b>Vous devez vous identifier pour a'
	DB	'cc', 0e9H, 'der ', 0e0H, ' cette fiche</b></td></tr></table><'
	DB	'hr><table noborder width=100% bgcolor=#FFFFFF><tr><td></td></'
	DB	'tr><tr><td align=right width=50%><font size=-1 color=#0000AA>'
	DB	'Identifiant</font></td><td><input type=password name=''D$#_EV'
	DB	'A_LOGINSUBMIT''></td></tr><tr><td align=right><font size=-1 c'
	DB	'olor=#0000AA>Mot de passe</font></td><td><input type=password'
	DB	' name=''D$#_EVA_LOGINSUBMITP''></td></tr></table><hr><table n'
	DB	'oborder width=100% height=50 bgcolor=#FFFFFF><tr><td align=ce'
	DB	'nter><input type=submit value="Valider l''identification"></t'
	DB	'd></tr></table><hr>', 00H
	ORG $+1
$SG70356 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70360 DB	'<script>document.mainform[''D$#_EVA_LOGINSUBMIT''].focus'
	DB	'();</script>', 00H
	ORG $+1
$SG70362 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70364 DB	'_EVA_AUTO_TITLEBAR', 00H
	ORG $+1
$SG70366 DB	'1', 00H
	ORG $+2
$SG70367 DB	'_EVA_AUTO_TITLEBAR', 00H
	ORG $+1
$SG70370 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_io.c', 00H
	ORG $+2
$SG70371 DB	'form_load', 00H
	ORG $+2
$SG70373 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_io.c', 00H
	ORG $+2
$SG70374 DB	'form_load', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_id_form$ = 12
_id_obj$ = 16
_mode$ = 20
_form$ = -24
_ctrl$ = -44
_ctrltree$ = -20
_idobj$ = -28
_idform$ = -40
_b_noacc$ = -36
_b_opttab$ = -32
_size1$70223 = -48
__tmp$70230 = -80
__tmp$70237 = -112
_cgi$70287 = -116
_form_load PROC NEAR

; 33   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 172				; 000000acH
	push	edi

; 34   : 	EVA_form *form = NULL;

	mov	DWORD PTR _form$[ebp], 0

; 35   :  	EVA_ctrl *ctrl;
; 36   : 	DynTable ctrltree = { 0 };

	mov	DWORD PTR _ctrltree$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _ctrltree$[ebp+4], eax
	mov	DWORD PTR _ctrltree$[ebp+8], eax
	mov	DWORD PTR _ctrltree$[ebp+12], eax
	mov	DWORD PTR _ctrltree$[ebp+16], eax

; 37   : 	unsigned long idobj = DYNTAB_TOUL(id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj$[ebp], eax

; 38   : 	unsigned long idform = DYNTAB_TOUL(id_form);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _id_form$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idform$[ebp], eax

; 39   : 	int b_noacc = 0;

	mov	DWORD PTR _b_noacc$[ebp], 0

; 40   : 	int b_opttab = 0;

	mov	DWORD PTR _b_opttab$[ebp], 0

; 41   : 
; 42   : 	/* Alloc & intialize form structure */
; 43   : 	M_ALLOC(form, sizeof(EVA_form));

	mov	DWORD PTR _size1$70223[ebp], 244	; 000000f4H
	mov	eax, DWORD PTR _size1$70223[ebp]
	push	eax
	call	_mem_alloc
	add	esp, 4
	mov	DWORD PTR _form$[ebp], eax
	cmp	DWORD PTR _size1$70223[ebp], 0
	je	SHORT $L70225
	cmp	DWORD PTR _form$[ebp], 0
	jne	SHORT $L70225
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70227
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 43		; 0000002bH
	jmp	$eva_err$70228
$L70225:

; 44   : 	DYNTAB_ADD_INT(&form->id_form, 0, 0, idform);

	mov	BYTE PTR __tmp$70230[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70230[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _idform$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70231
	lea	ecx, DWORD PTR __tmp$70230[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$70230[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70233
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70235
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 44		; 0000002cH
	jmp	$eva_err$70228
$L70233:

; 45   : 	form_free(cntxt);

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_free
	add	esp, 4

; 46   : 	cntxt->form = form;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+80], edx

; 47   : 
; 48   : 	/* Store object id if not null */
; 49   : 	if(idobj) DYNTAB_ADD_INT(&form->id_obj, 0, 0, idobj);

	cmp	DWORD PTR _idobj$[ebp], 0
	je	SHORT $L70240
	mov	BYTE PTR __tmp$70237[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70237[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70238
	lea	ecx, DWORD PTR __tmp$70237[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$70237[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70240
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70242
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 49		; 00000031H
	jmp	$eva_err$70228
$L70240:

; 50   : 	form->b_newobj = idobj == 0;

	xor	eax, eax
	cmp	DWORD PTR _idobj$[ebp], 0
	sete	al
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+72], eax

; 51   : 
; 52   : 	/* Read current object data if object exists */
; 53   : 	if(idobj && qry_obj_idfield(cntxt, &form->objdata, idobj, 0)) STACK_ERROR;

	cmp	DWORD PTR _idobj$[ebp], 0
	je	SHORT $L70243
	push	0
	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 52					; 00000034H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70243
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 53		; 00000035H
	jmp	$eva_err$70228
$L70243:

; 54   : 
; 55   : 	/* Create new control for form */
; 56   : 	form->step = CtrlRead;

	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+176], 0

; 57   : 	if(ctrl_add_new(cntxt, idform, NULL)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _idform$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_new
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70245
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 57		; 00000039H
	jmp	$eva_err$70228
$L70245:

; 58   : 
; 59   : 	/* Set form params : cginame, previous context, access */
; 60   : 	ctrl = form->ctrl;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _ctrl$[ebp], edx

; 61   : 	if(cgi_build_basename(cntxt, &ctrl->cginame, 0, 'F') ||
; 62   : 		cgi_get_values(cntxt, &ctrl->cgival, form->ctrl->cginame->data, 0))	STACK_ERROR;

	push	70					; 00000046H
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_build_basename
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70247
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+40]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 104				; 00000068H
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_get_values
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70246
$L70247:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 62		; 0000003eH
	jmp	$eva_err$70228
$L70246:

; 63   : 	if(dyntab_from_list(&ctrltree, DYNTAB_VAL_SZ(&ctrl->cgival, 0, 0), "§", 0, 4)) RETURN_ERR_MEMORY;

	push	4
	push	0
	push	OFFSET FLAT:$SG70249
	push	0
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 104				; 00000068H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_from_list
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70248
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70251
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 63		; 0000003fH
	jmp	$eva_err$70228
$L70248:

; 64   : 	if(dyntab_sz(&ctrltree, 0, 0)) DYNTAB_ADD_CELL(&form->call_data, 0, 0, &ctrltree, 0, 0);

	push	0
	push	0
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70253
	push	1
	push	0
	push	0
	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 88					; 00000058H
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70253
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70255
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 64		; 00000040H
	jmp	$eva_err$70228
$L70253:

; 65   : 	form->prevstep = atoi(dyntab_val(&ctrltree, 2, 0));

	push	0
	push	2
	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atoi
	add	esp, 4
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+168], eax

; 66   : 	if(dyntab_sz(&ctrltree, 3, 0)) DYNTAB_ADD_CELL(&form->dlg_ctrl, 0, 0, &ctrltree, 3, 0);

	push	0
	push	3
	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70257
	push	1
	push	0
	push	3
	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 180				; 000000b4H
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70257
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70259
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 66		; 00000042H
	jmp	$eva_err$70228
$L70257:

; 67   : 
; 68   : 	/* Check if control is a form */
; 69   : 	if(!strcmp(ctrl->CONTROL, "_EVA_FORM") || mode == 4)

	push	OFFSET FLAT:$SG70262
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70261
	cmp	DWORD PTR _mode$[ebp], 4
	jne	$L70260
$L70261:

; 71   : 		/* Handle save as form */
; 72   : 		if(!dyntab_sz(&form->id_obj, 0, 0) || !CTRL_ATTR_CELL(NO_FORMSTAMP))

	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70265
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70693
	push	0
	push	-1
	push	OFFSET FLAT:$SG70266
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -120+[ebp], eax
	jmp	SHORT $L70694
$L70693:
	mov	DWORD PTR -120+[ebp], 0
$L70694:
	cmp	DWORD PTR -120+[ebp], 0
	jne	SHORT $L70270
$L70265:

; 74   : 			form->id_formsave = strtoul(CTRL_ATTR_VAL(FORMSAVEAS), NULL, 10);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70695
	push	0
	push	-1
	push	OFFSET FLAT:$SG70268
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -124+[ebp], eax
	jmp	SHORT $L70696
$L70695:
	mov	DWORD PTR -124+[ebp], OFFSET FLAT:$SG70269
$L70696:
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR -124+[ebp]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+80], eax

; 75   : 			if(!form->id_formsave) form->id_formsave = DYNTAB_TOUL(&form->id_form);

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+80], 0
	jne	SHORT $L70270
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+80], eax
$L70270:

; 77   : 		b_opttab = *CTRL_ATTR_VAL(OPTIMIZE_TAB) == '1';

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70697
	push	0
	push	-1
	push	OFFSET FLAT:$SG70272
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -128+[ebp], eax
	jmp	SHORT $L70698
$L70697:
	mov	DWORD PTR -128+[ebp], OFFSET FLAT:$SG70273
$L70698:
	mov	eax, DWORD PTR -128+[ebp]
	movsx	ecx, BYTE PTR [eax]
	xor	edx, edx
	cmp	ecx, 49					; 00000031H
	sete	dl
	mov	DWORD PTR _b_opttab$[ebp], edx

; 78   : 
; 79   : 		/* Calc output mode : check access, new object & edit on open in user preferences */
; 80   : 		if(ctrl_check_access(cntxt, form->ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_check_access
	add	esp, 8
	test	eax, eax
	je	SHORT $L70274
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 80		; 00000050H
	jmp	$eva_err$70228
$L70274:

; 81   : 		form->nextstep = mode == 1 ? HtmlEdit : (mode == 2 || mode == 4) ? HtmlView : mode == 3 ? HtmlPrint :
; 82   : 					form->prevstep > HtmlSaveDlg ? form->prevstep :
; 83   : 					(DYNTAB_FIELD_CELL(&cntxt->user_data, OPEN_MODE_EDIT) || !idobj) ?
; 84   : 						HtmlEdit : HtmlView;

	cmp	DWORD PTR _mode$[ebp], 1
	jne	SHORT $L70707
	mov	DWORD PTR -132+[ebp], 4
	jmp	$L70708
$L70707:
	cmp	DWORD PTR _mode$[ebp], 2
	je	$L70699
	cmp	DWORD PTR _mode$[ebp], 4
	je	$L70699
	cmp	DWORD PTR _mode$[ebp], 3
	jne	SHORT $L70704
	mov	DWORD PTR -136+[ebp], 7
	jmp	SHORT $L70705
$L70704:
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+168], 3
	jle	SHORT $L70702
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+168]
	mov	DWORD PTR -140+[ebp], eax
	jmp	SHORT $L70703
$L70702:
	push	0
	push	-1
	push	OFFSET FLAT:$SG70275
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29428				; 000072f4H
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70700
	cmp	DWORD PTR _idobj$[ebp], 0
	je	SHORT $L70700
	mov	DWORD PTR -144+[ebp], 6
	jmp	SHORT $L70701
$L70700:
	mov	DWORD PTR -144+[ebp], 4
$L70701:
	mov	edx, DWORD PTR -144+[ebp]
	mov	DWORD PTR -140+[ebp], edx
$L70703:
	mov	eax, DWORD PTR -140+[ebp]
	mov	DWORD PTR -136+[ebp], eax
$L70705:
	mov	ecx, DWORD PTR -136+[ebp]
	mov	DWORD PTR -148+[ebp], ecx
	jmp	SHORT $L70706
$L70699:
	mov	DWORD PTR -148+[ebp], 6
$L70706:
	mov	edx, DWORD PTR -148+[ebp]
	mov	DWORD PTR -132+[ebp], edx
$L70708:
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR -132+[ebp]
	mov	DWORD PTR [eax+172], ecx

; 85   : 		if(idobj || !CTRL_ATTR_CELL(DISPLAYFIELDS))

	cmp	DWORD PTR _idobj$[ebp], 0
	jne	SHORT $L70278
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70709
	push	0
	push	-1
	push	OFFSET FLAT:$SG70279
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -152+[ebp], eax
	jmp	SHORT $L70710
$L70709:
	mov	DWORD PTR -152+[ebp], 0
$L70710:
	cmp	DWORD PTR -152+[ebp], 0
	jne	SHORT $L70277
$L70278:

; 87   : 			form->step = form->nextstep;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+172]
	mov	DWORD PTR [eax+176], edx

; 88   : 			if(form->step && ctrl_check_access(cntxt, form->ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 0
	je	SHORT $L70280
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_check_access
	add	esp, 8
	test	eax, eax
	je	SHORT $L70280
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 88		; 00000058H
	jmp	$eva_err$70228
$L70280:

; 89   : 			form->step = CtrlRead;

	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+176], 0
$L70277:

; 91   : 
; 92   : 		/* Check if user has access rights to the form */
; 93   : 		b_noacc = (idobj ? ctrl->access & (AccessEdit | AccessView) :
; 94   : 						( (!CTRL_ATTR_CELL(DISPLAYFIELDS) && (ctrl->access & AccessView) )  ||
; 95   : 							(ctrl->access & AccessCreate))) ? 0 : 1;

	cmp	DWORD PTR _idobj$[ebp], 0
	je	SHORT $L70716
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+184]
	and	ecx, 3
	mov	DWORD PTR -156+[ebp], ecx
	jmp	SHORT $L70717
$L70716:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70711
	push	0
	push	-1
	push	OFFSET FLAT:$SG70282
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -160+[ebp], eax
	jmp	SHORT $L70712
$L70711:
	mov	DWORD PTR -160+[ebp], 0
$L70712:
	cmp	DWORD PTR -160+[ebp], 0
	jne	SHORT $L70713
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+184]
	and	ecx, 1
	test	ecx, ecx
	jne	SHORT $L70714
$L70713:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+184]
	and	eax, 4
	test	eax, eax
	jne	SHORT $L70714
	mov	DWORD PTR -164+[ebp], 0
	jmp	SHORT $L70715
$L70714:
	mov	DWORD PTR -164+[ebp], 1
$L70715:
	mov	ecx, DWORD PTR -164+[ebp]
	mov	DWORD PTR -156+[ebp], ecx
$L70717:
	xor	edx, edx
	cmp	DWORD PTR -156+[ebp], 0
	sete	dl
	mov	DWORD PTR _b_noacc$[ebp], edx

; 97   : 	else

	jmp	SHORT $L70283
$L70260:

; 98   : 		b_noacc = 1;

	mov	DWORD PTR _b_noacc$[ebp], 1
$L70283:

; 99   : 
; 100  : 	/* Access granted */
; 101  : 	if(!b_noacc)

	cmp	DWORD PTR _b_noacc$[ebp], 0
	jne	$L70284

; 103  : 		/* Set View mode if no edit access */
; 104  : 		if(dyntab_sz(&form->id_obj, 0, 0) && form->nextstep == HtmlEdit && !(ctrl->access & AccessEdit))

	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70285
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+172], 4
	jne	SHORT $L70285
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+184]
	and	eax, 2
	test	eax, eax
	jne	SHORT $L70285

; 105  : 			form->nextstep = HtmlView;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+172], 6
$L70285:

; 106  : 
; 107  : 		/* Handle tab selection */
; 108  : 		if(b_opttab)

	cmp	DWORD PTR _b_opttab$[ebp], 0
	je	$L70294

; 110  : 			CGIData *cgi = cntxt->cgi + cntxt->cgibtn;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	add	edx, eax
	mov	DWORD PTR _cgi$70287[ebp], edx

; 111  : 			if(cgi->IdForm == idform && cgi->IdObj == idobj && cgi->name[0] == 'T')

	mov	eax, DWORD PTR _cgi$70287[ebp]
	mov	ecx, DWORD PTR [eax+20]
	cmp	ecx, DWORD PTR _idform$[ebp]
	jne	SHORT $L70288
	mov	edx, DWORD PTR _cgi$70287[ebp]
	mov	eax, DWORD PTR [edx+24]
	cmp	eax, DWORD PTR _idobj$[ebp]
	jne	SHORT $L70288
	mov	ecx, DWORD PTR _cgi$70287[ebp]
	mov	edx, DWORD PTR [ecx]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 84					; 00000054H
	jne	SHORT $L70288

; 112  : 				form->opttabid = cgi->IdCtrl;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _cgi$70287[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	DWORD PTR [ecx+120], eax
$L70288:

; 113  : 			if(!form->opttabid)

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+120], 0
	jne	SHORT $L70289

; 115  : 				if(cgi_filter_values(cntxt, &ctrltree,
; 116  : 					'D', ~0UL, idform, idobj, "_EVA_SELTAB", "", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	OFFSET FLAT:$SG70291
	push	OFFSET FLAT:$SG70292
	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _idform$[ebp]
	push	eax
	push	-1
	push	68					; 00000044H
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70290
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 116		; 00000074H
	jmp	$eva_err$70228
$L70290:

; 117  : 				form->opttabid = DYNTAB_TOUL(&ctrltree);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+120], eax
$L70289:

; 119  : 			if(!form->opttabid) form->opttabid = ~0UL;

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+120], 0
	jne	SHORT $L70294
	mov	ecx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [ecx+120], -1
$L70294:

; 121  : 
; 122  : 		/* Read form controls */
; 123  : 		CTRL_ATTR(ctrltree, CTRLTREE);

	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70297
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	push	0
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70296
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70299
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 123		; 0000007bH
	jmp	$eva_err$70228
$L70296:

; 124  : 		if(ctrl_add_child(cntxt, 0, &ctrltree)) STACK_ERROR;

	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70300
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 124		; 0000007cH
	jmp	$eva_err$70228
$L70300:

; 125  : 		ctrl = form->ctrl;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _ctrl$[ebp], edx

; 126  : 		if(idobj)

	cmp	DWORD PTR _idobj$[ebp], 0
	je	SHORT $L70301

; 128  : 			form->step = HtmlView;

	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+176], 6

; 129  : 			if(ctrl_check_access(cntxt, ctrl)) STACK_ERROR;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_check_access
	add	esp, 8
	test	eax, eax
	je	SHORT $L70302
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 129		; 00000081H
	jmp	$eva_err$70228
$L70302:

; 130  : 			b_noacc = (idobj ? ctrl->access & (AccessEdit | AccessView) : ctrl->access & AccessCreate) ? 0 : 2;

	cmp	DWORD PTR _idobj$[ebp], 0
	je	SHORT $L70718
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+184]
	and	edx, 3
	mov	DWORD PTR -168+[ebp], edx
	jmp	SHORT $L70719
$L70718:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+184]
	and	ecx, 4
	mov	DWORD PTR -168+[ebp], ecx
$L70719:
	mov	edx, DWORD PTR -168+[ebp]
	neg	edx
	sbb	edx, edx
	and	edx, -2					; fffffffeH
	add	edx, 2
	mov	DWORD PTR _b_noacc$[ebp], edx

; 131  : 			form->step = CtrlRead;

	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+176], 0
$L70301:

; 133  : 
; 134  : 		/* Handle tab selection */
; 135  : 		if(form_tab_selection(cntxt, 1)) STACK_ERROR;

	push	1
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_tab_selection
	add	esp, 8
	test	eax, eax
	je	SHORT $L70303
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 135		; 00000087H
	jmp	$eva_err$70228
$L70303:

; 137  : 
; 138  : 	/* Access not granted */
; 139  : 	else if(dyntab_cmp(id_form, 0, 0, &cntxt->menubar, 0, 0))

	jmp	$L70365
$L70284:
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29528				; 00007358H
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _id_form$[ebp]
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	$L70365

; 141  : 		/* Output error message for identified user */
; 142  : 		form->html = &form->html_top;

	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 216				; 000000d8H
	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+232], edx

; 143  : 		if(cntxt->b_identified)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29400], 0
	je	$L70306

; 146  : 				"<td align=center>"
; 147  : 				"<font size=+1><b><br><br>Accès non autorisé<br><br></b></font>");

	push	0
	push	0
	push	79					; 0000004fH
	push	OFFSET FLAT:$SG70309
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70308
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70311
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 147		; 00000093H
	jmp	$eva_err$70228
$L70308:

; 148  : 			if(idobj)

	cmp	DWORD PTR _idobj$[ebp], 0
	je	SHORT $L70312

; 149  :  				DYNBUF_ADD_STR(form->html, "L'accès à cette fiche ")

	push	0
	push	0
	push	22					; 00000016H
	push	OFFSET FLAT:$SG70315
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70314
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70317
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 149		; 00000095H
	jmp	$eva_err$70228
$L70314:

; 150  : 			else if(CTRL_ATTR_CELL(DISPLAYFIELDS) && !strcmp(ctrl->CONTROL, "_EVA_FORM"))

	jmp	$L70330
$L70312:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70720
	push	0
	push	-1
	push	OFFSET FLAT:$SG70321
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -172+[ebp], eax
	jmp	SHORT $L70721
$L70720:
	mov	DWORD PTR -172+[ebp], 0
$L70721:
	cmp	DWORD PTR -172+[ebp], 0
	je	SHORT $L70320
	push	OFFSET FLAT:$SG70322
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70320

; 151  :  				DYNBUF_ADD_STR(form->html, "L'ajout de fiches")

	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70325
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70324
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70327
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 151		; 00000097H
	jmp	$eva_err$70228
$L70324:

; 152  : 			else

	jmp	SHORT $L70330
$L70320:

; 153  :  				DYNBUF_ADD_STR(form->html, "L'accès au formulaire");

	push	0
	push	0
	push	21					; 00000015H
	push	OFFSET FLAT:$SG70331
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70330
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70333
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 153		; 00000099H
	jmp	$eva_err$70228
$L70330:

; 155  : 				"] vous est refusé<br><br>"
; 156  : 				"Contactez votre administateur si vous avez besoin de cet accès<br><br>");

	push	95					; 0000005fH
	push	OFFSET FLAT:$SG70335
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	push	2
	push	OFFSET FLAT:$SG70336
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70334
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70338
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 156		; 0000009cH
	jmp	$eva_err$70228
$L70334:

; 157  : 			if(put_html_button(cntxt, "B$#.CLOSE", "Revenir", "_eva_btn_gobackobj_fr.gif", "_eva_btn_gobackobj_fr_s.gif",
; 158  : 									"Retourne à la page précédente", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70341
	push	OFFSET FLAT:$SG70342
	push	OFFSET FLAT:$SG70343
	push	OFFSET FLAT:$SG70344
	push	OFFSET FLAT:$SG70345
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70340
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 158		; 0000009eH
	jmp	$eva_err$70228
$L70340:

; 159  : 			DYNBUF_ADD_STR(form->html, "<br><br></td>");

	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70348
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70347
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70350
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 159		; 0000009fH
	jmp	$eva_err$70228
$L70347:

; 161  : 		/* Output login message for non identified user */
; 162  : 		else

	jmp	$L70359
$L70306:

; 165  : 				"<td align=center>"
; 166  : 				"<table noborder width=100% bgcolor=#FFFFFF><tr><td align=center>"
; 167  : 				"<b>Vous devez vous identifier pour accéder à cette fiche</b>"
; 168  : 				"</td></tr></table><hr>"
; 169  : 				"<table noborder width=100% bgcolor=#FFFFFF><tr><td>"
; 170  : 				"</td></tr><tr><td align=right width=50%><font size=-1 color=#0000AA>"
; 171  : 					"Identifiant</font></td><td><input type=password name='D$#_EVA_LOGINSUBMIT'></td></tr>"
; 172  : 				"<tr><td align=right><font size=-1 color=#0000AA>"
; 173  : 					"Mot de passe</font></td><td><input type=password name='D$#_EVA_LOGINSUBMITP'>"
; 174  : 				"</td></tr></table><hr>"
; 175  : 				"<table noborder width=100% height=50 bgcolor=#FFFFFF><tr><td align=center>"
; 176  : 				"<input type=submit value=\"Valider l'identification\"></td></tr></table><hr>");

	push	0
	push	0
	push	662					; 00000296H
	push	OFFSET FLAT:$SG70354
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70353
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70356
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 176		; 000000b0H
	jmp	$eva_err$70228
$L70353:

; 177  : 			if(cntxt->jsenabled) DYNBUF_ADD_STR(form->html,

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29676], 0
	je	SHORT $L70359

; 178  : 				"<script>document.mainform['D$#_EVA_LOGINSUBMIT'].focus();</script>");

	push	0
	push	0
	push	66					; 00000042H
	push	OFFSET FLAT:$SG70360
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70359
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70362
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 178		; 000000b2H
	jmp	$eva_err$70228
$L70359:

; 180  : 
; 181  : 		/* Add auto title */
; 182  : 		CTRL_SETATTRDEF("1", AUTO_TITLEBAR);

	push	0
	push	0
	push	OFFSET FLAT:$SG70364
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70365
	push	1
	push	OFFSET FLAT:$SG70366
	push	OFFSET FLAT:$SG70367
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_set_attr_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70365
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 182		; 000000b6H
	jmp	SHORT $eva_err$70228
$L70365:

; 184  : 
; 185  : 	/* Restore used database if extern form */
; 186  : 	if(form->b_extern && sql_use_db(cntxt, cntxt->dbname)) STACK_ERROR;

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+76], 0
	je	SHORT $eva_noerr$70369
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29804]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_sql_use_db
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$70369
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 186		; 000000baH
	jmp	SHORT $eva_err$70228
$eva_noerr$70369:

; 187  : 
; 188  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70370
	push	OFFSET FLAT:$SG70371
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70228:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70372
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70373
	push	OFFSET FLAT:$SG70374
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70372:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70375
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_free
	add	esp, 4
$L70375:
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 189  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_form_load ENDP
_TEXT	ENDS
PUBLIC	_form_load_from_ctrl
EXTRN	_cgi_clear_form_inputs:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_dynbuf_add_int:NEAR
EXTRN	_dynbuf_add3_int:NEAR
EXTRN	_strcspn:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70412 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70416 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70425 DB	0a7H, 00H
	ORG $+2
$SG70429 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70434 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70440 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70443 DB	'/', 00H
	ORG $+2
$SG70444 DB	'/', 00H
	ORG $+2
$SG70446 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70450 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70452 DB	'/', 00H
	ORG $+2
$SG70453 DB	'/', 00H
	ORG $+2
$SG70455 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70458 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70460 DB	'.', 00H
	ORG $+2
$SG70461 DB	'/', 00H
	ORG $+2
$SG70463 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70466 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70469 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70472 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70480 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70486 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70487 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_io.c', 00H
	ORG $+2
$SG70488 DB	'form_load_from_ctrl', 00H
$SG70490 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_io.c', 00H
	ORG $+2
$SG70491 DB	'form_load_from_ctrl', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_id_form$ = 12
_id_obj$ = 16
_loc$ = 20
_mode$ = 24
_form$ = -4
_idform$ = -72
_sqlres$ = -48
_data$ = -24
_call_data$ = -76
_cgi$ = -80
_idform0$ = -84
_idobj0$ = -52
_b_reuse$ = -28
_sz$70424 = -88
_form_load_from_ctrl PROC NEAR

; 217  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 108				; 0000006cH

; 218  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 219  : 	DynTable idform = { 0 };

	mov	DWORD PTR _idform$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _idform$[ebp+4], edx
	mov	DWORD PTR _idform$[ebp+8], edx
	mov	DWORD PTR _idform$[ebp+12], edx
	mov	DWORD PTR _idform$[ebp+16], edx

; 220  : 	DynTable sqlres = { 0 };

	mov	DWORD PTR _sqlres$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _sqlres$[ebp+4], eax
	mov	DWORD PTR _sqlres$[ebp+8], eax
	mov	DWORD PTR _sqlres$[ebp+12], eax
	mov	DWORD PTR _sqlres$[ebp+16], eax

; 221  : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _data$[ebp+4], ecx
	mov	DWORD PTR _data$[ebp+8], ecx
	mov	DWORD PTR _data$[ebp+12], ecx
	mov	DWORD PTR _data$[ebp+16], ecx

; 222  : 	DynBuffer *call_data = NULL;

	mov	DWORD PTR _call_data$[ebp], 0

; 223  : 	CGIData *cgi = cntxt->cgi + cntxt->cgibtn;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	add	edx, eax
	mov	DWORD PTR _cgi$[ebp], edx

; 224  : 	unsigned long idform0 = form ? DYNTAB_TOUL(&form->id_form) : 0;

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L70723
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -92+[ebp], eax
	jmp	SHORT $L70724
$L70723:
	mov	DWORD PTR -92+[ebp], 0
$L70724:
	mov	ecx, DWORD PTR -92+[ebp]
	mov	DWORD PTR _idform0$[ebp], ecx

; 225  : 	unsigned long idobj0 = form ? DYNTAB_TOUL(&form->id_obj) : 0;

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L70725
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -96+[ebp], eax
	jmp	SHORT $L70726
$L70725:
	mov	DWORD PTR -96+[ebp], 0
$L70726:
	mov	eax, DWORD PTR -96+[ebp]
	mov	DWORD PTR _idobj0$[ebp], eax

; 226  : 	int b_reuse = loc == 3;

	xor	ecx, ecx
	cmp	DWORD PTR _loc$[ebp], 3
	sete	cl
	mov	DWORD PTR _b_reuse$[ebp], ecx

; 227  : 	if(b_reuse) loc = 0;

	cmp	DWORD PTR _b_reuse$[ebp], 0
	je	SHORT $L70402
	mov	DWORD PTR _loc$[ebp], 0
$L70402:

; 228  : 
; 229  : 	/* Check params */
; 230  : 	if(!dyntab_sz(id_form, 0, 0) && !dyntab_sz(id_obj, 0, 0)) RETURN_OK;

	push	0
	push	0
	mov	edx, DWORD PTR _id_form$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70403
	push	0
	push	0
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70403
	jmp	$eva_noerr$70404
$L70403:

; 231  : 
; 232  : 	/* Set placement if same as caller */
; 233  : 	if(!loc) loc = (!form || !dyntab_sz(&cntxt->alt_form, 0, 0) ||

	cmp	DWORD PTR _loc$[ebp], 0
	jne	SHORT $L70405

; 234  : 		dyntab_cmp(&form->id_obj, 0, 0, &cntxt->alt_obj, 0, 0) ||
; 235  : 		dyntab_cmp(&form->id_form, 0, 0, &cntxt->alt_form, 0, 0)) ? 1 : 2;

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L70727
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70727
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 60					; 0000003cH
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70727
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70727
	mov	DWORD PTR -100+[ebp], 2
	jmp	SHORT $L70728
$L70727:
	mov	DWORD PTR -100+[ebp], 1
$L70728:
	mov	eax, DWORD PTR -100+[ebp]
	mov	DWORD PTR _loc$[ebp], eax
$L70405:

; 236  : 
; 237  : 	/* If no form given */
; 238  : 	if(!dyntab_sz(id_form, 0, 0))

	push	0
	push	0
	mov	ecx, DWORD PTR _id_form$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70406

; 240  : 		/* Read object formstamp */
; 241  : 		if(qry_obj_idfield(cntxt, &sqlres, DYNTAB_TOUL(id_obj), cntxt->val_FORMSTAMP)) STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+269636]
	push	eax
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70408
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 241		; 000000f1H
	jmp	$eva_err$70409
$L70408:

; 242  : 
; 243  : 		/* TODO - handle form access - take first available */
; 244  : 		DYNTAB_ADD_CELL(&idform, 0, 0, &sqlres, 0, 0);

	push	1
	push	0
	push	0
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	eax, DWORD PTR _idform$[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70410
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70412
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 244		; 000000f4H
	jmp	$eva_err$70409
$L70410:

; 246  : 	else

	jmp	SHORT $L70414
$L70406:

; 247  : 		DYNTAB_ADD_CELL(&idform, 0, 0, id_form, 0, 0);

	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _id_form$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	lea	ecx, DWORD PTR _idform$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70414
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70416
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 247		; 000000f7H
	jmp	$eva_err$70409
$L70414:

; 248  : 
; 249  : 	/* If no form to open : return */
; 250  : 	if(!dyntab_sz(&idform, 0, 0)) RETURN_OK;

	push	0
	push	0
	lea	ecx, DWORD PTR _idform$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70417
	jmp	$eva_noerr$70404
$L70417:

; 251  : 
; 252  : 	/* reuse caller data if reuse form */
; 253  : 	if(b_reuse)

	cmp	DWORD PTR _b_reuse$[ebp], 0
	je	$L70418

; 255  : 		if(!form)

	cmp	DWORD PTR _form$[ebp], 0
	jne	$L70419

; 257  : 			idform0 = cgi->IdForm;

	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	DWORD PTR _idform0$[ebp], eax

; 258  : 			idobj0 = cgi->IdObj;

	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR _idobj0$[ebp], edx

; 259  : 			if(cgi_filter_values(cntxt, &sqlres, 'F', ~0UL, idform0, idobj0, NULL, NULL, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _idobj0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _idform0$[ebp]
	push	ecx
	push	-1
	push	70					; 00000046H
	lea	edx, DWORD PTR _sqlres$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70422
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 259		; 00000103H
	jmp	$eva_err$70409
$L70422:

; 260  : 			if(sqlres.nbrows && sqlres.cell->len)

	cmp	DWORD PTR _sqlres$[ebp], 0
	je	SHORT $L70427
	mov	edx, DWORD PTR _sqlres$[ebp+16]
	cmp	DWORD PTR [edx+4], 0
	je	SHORT $L70427

; 262  : 				size_t sz = strcspn(sqlres.cell->txt, "§");

	push	OFFSET FLAT:$SG70425
	mov	eax, DWORD PTR _sqlres$[ebp+16]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_strcspn
	add	esp, 8
	mov	DWORD PTR _sz$70424[ebp], eax

; 263  : 				DYNBUF_ADD(&call_data, sqlres.cell->txt, sz, NO_CONV);

	push	0
	push	0
	mov	edx, DWORD PTR _sz$70424[ebp]
	push	edx
	mov	eax, DWORD PTR _sqlres$[ebp+16]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _call_data$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70427
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70429
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 263		; 00000107H
	jmp	$eva_err$70409
$L70427:

; 266  : 		else

	jmp	SHORT $L70432
$L70419:

; 267  : 			DYNBUF_ADD_CELL(&call_data, &form->call_data, 0, 0, NO_CONV);

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
	lea	ecx, DWORD PTR _call_data$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70432
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70434
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 267		; 0000010bH
	jmp	$eva_err$70409
$L70432:

; 269  : 	else

	jmp	$L70464
$L70418:

; 271  : 		/* Memorise caller data : id_form/id_obj/id_ctrl/Num.Line  */
; 272  : 		if(form)

	cmp	DWORD PTR _form$[ebp], 0
	je	$L70436

; 274  : 			DYNBUF_ADD_CELL(&call_data, &form->id_form, 0, 0, NO_CONV);

	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _call_data$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70438
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70440
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 274		; 00000112H
	jmp	$eva_err$70409
$L70438:

; 275  : 			DYNBUF_ADD3_CELL(&call_data, "/", &form->id_obj, 0, 0, NO_CONV, "/");

	push	1
	push	OFFSET FLAT:$SG70443
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 32					; 00000020H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG70444
	lea	edx, DWORD PTR _call_data$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70442
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70446
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 275		; 00000113H
	jmp	$eva_err$70409
$L70442:

; 277  : 		else

	jmp	SHORT $L70451
$L70436:

; 279  : 			DYNBUF_ADD_INT(&call_data, cgi->IdForm);

	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	lea	ecx, DWORD PTR _call_data$[ebp]
	push	ecx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70448
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70450
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 279		; 00000117H
	jmp	$eva_err$70409
$L70448:

; 280  : 			DYNBUF_ADD3_INT(&call_data, "/", cgi->IdObj, "/");

	push	1
	push	OFFSET FLAT:$SG70452
	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70453
	lea	eax, DWORD PTR _call_data$[ebp]
	push	eax
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70451
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70455
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 280		; 00000118H
	jmp	$eva_err$70409
$L70451:

; 282  : 		DYNBUF_ADD_INT(&call_data, cgi->IdCtrl);

	mov	eax, DWORD PTR _cgi$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	lea	edx, DWORD PTR _call_data$[ebp]
	push	edx
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70456
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70458
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 282		; 0000011aH
	jmp	$eva_err$70409
$L70456:

; 283  : 		DYNBUF_ADD3_INT(&call_data, "/", cgi->Num, ".");

	push	1
	push	OFFSET FLAT:$SG70460
	mov	edx, DWORD PTR _cgi$[ebp]
	mov	eax, DWORD PTR [edx+36]
	push	eax
	push	1
	push	OFFSET FLAT:$SG70461
	lea	ecx, DWORD PTR _call_data$[ebp]
	push	ecx
	call	_dynbuf_add3_int
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70459
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70463
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 283		; 0000011bH
	jmp	$eva_err$70409
$L70459:

; 284  : 		DYNBUF_ADD_INT(&call_data, cgi->Line);

	mov	ecx, DWORD PTR _cgi$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	push	edx
	lea	eax, DWORD PTR _call_data$[ebp]
	push	eax
	call	_dynbuf_add_int
	add	esp, 8
	test	eax, eax
	je	SHORT $L70464
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70466
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 284		; 0000011cH
	jmp	$eva_err$70409
$L70464:

; 286  : 
; 287  : 	/* Set next opened form & obj */
; 288  : 	DYNTAB_ADD_CELL(loc == 2 ? &cntxt->alt_form: &cntxt->id_form, 0, 0, &idform, 0, 0);

	cmp	DWORD PTR _loc$[ebp], 2
	jne	SHORT $L70729
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 40					; 00000028H
	mov	DWORD PTR -104+[ebp], eax
	jmp	SHORT $L70730
$L70729:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR -104+[ebp], ecx
$L70730:
	push	1
	push	0
	push	0
	lea	edx, DWORD PTR _idform$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR -104+[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70467
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70469
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 288		; 00000120H
	jmp	$eva_err$70409
$L70467:

; 289  : 	DYNTAB_ADD_CELL(loc == 2 ? &cntxt->alt_obj : &cntxt->id_obj, 0, 0, id_obj, 0, 0);

	cmp	DWORD PTR _loc$[ebp], 2
	jne	SHORT $L70731
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 60					; 0000003cH
	mov	DWORD PTR -108+[ebp], eax
	jmp	SHORT $L70732
$L70731:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 20					; 00000014H
	mov	DWORD PTR -108+[ebp], ecx
$L70732:
	push	1
	push	0
	push	0
	mov	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR -108+[ebp]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70470
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70472
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 289		; 00000121H
	jmp	$eva_err$70409
$L70470:

; 290  : 
; 291  : 	/* Clear previous form is reused */
; 292  : 	if(b_reuse) cgi_clear_form_inputs(cntxt, idform0, idobj0, 0);

	cmp	DWORD PTR _b_reuse$[ebp], 0
	je	SHORT $L70473
	push	0
	mov	eax, DWORD PTR _idobj0$[ebp]
	push	eax
	mov	ecx, DWORD PTR _idform0$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_clear_form_inputs
	add	esp, 16					; 00000010H
$L70473:

; 293  : 
; 294  : 	/* Load new form & set caller data */
; 295  : 	if(form_load(cntxt, &idform, id_obj, mode)) STACK_ERROR;

	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	lea	edx, DWORD PTR _idform$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_load
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70474
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 295		; 00000127H
	jmp	$eva_err$70409
$L70474:

; 296  : 	if(call_data && !cntxt->form->call_data.nbrows)

	cmp	DWORD PTR _call_data$[ebp], 0
	je	$L70484
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	cmp	DWORD PTR [eax+88], 0
	jne	$L70484

; 297  : 		DYNTAB_ADD_BUF(&cntxt->form->call_data, 0, 0, call_data);

	cmp	DWORD PTR _call_data$[ebp], 0
	je	SHORT $L70476
	mov	ecx, DWORD PTR _call_data$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $L70476
	push	0
	push	0
	mov	edx, DWORD PTR _call_data$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _call_data$[ebp]
	add	ecx, 8
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	add	eax, 88					; 00000058H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70478
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70480
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 297		; 00000129H
	jmp	SHORT $eva_err$70409
$L70478:
	jmp	SHORT $L70484
$L70476:
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	add	ecx, 88					; 00000058H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70484
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70486
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 297		; 00000129H
	jmp	SHORT $eva_err$70409
$L70484:
$eva_noerr$70404:

; 298  : 
; 299  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70487
	push	OFFSET FLAT:$SG70488
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70409:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70489
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70490
	push	OFFSET FLAT:$SG70491
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70489:
	lea	eax, DWORD PTR _idform$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _sqlres$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _call_data$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _call_data$[ebp], 0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 300  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_form_load_from_ctrl ENDP
_TEXT	ENDS
PUBLIC	_form_close_nosave
EXTRN	_cgi_extract:NEAR
EXTRN	_form_set_homepage:NEAR
_DATA	SEGMENT
$SG70545 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70549 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70559 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70563 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70573 DB	'%lu', 00H
$SG70577 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70580 DB	'%lu', 00H
$SG70584 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70586 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_io.c', 00H
	ORG $+2
$SG70587 DB	'form_close_nosave', 00H
	ORG $+2
$SG70589 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_io.c', 00H
	ORG $+2
$SG70590 DB	'form_close_nosave', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_idform$ = 12
_idobj$ = 16
_call_data$ = 20
_id_obj$ = -100
_id_form$ = -24
_id_ctrl$ = -144
_call_data1$ = -76
_field$ = -48
_name$ = -120
_idobj0$ = -80
_idform0$ = -124
_idobj1$ = -56
_idform1$ = -28
_homepage$ = -116
_menubar$ = -52
_b_alt$ = -112
_dest_form$ = -108
_dest_obj$ = -4
_i$ = -104
_idobj2$70539 = -152
_idform2$70541 = -148
_i$70565 = -156
__tmp$70572 = -188
__tmp$70579 = -220
_form_close_nosave PROC NEAR

; 320  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 232				; 000000e8H
	push	edi

; 321  : 	DynTable id_obj = { 0 };

	mov	DWORD PTR _id_obj$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _id_obj$[ebp+4], eax
	mov	DWORD PTR _id_obj$[ebp+8], eax
	mov	DWORD PTR _id_obj$[ebp+12], eax
	mov	DWORD PTR _id_obj$[ebp+16], eax

; 322  : 	DynTable id_form = { 0 };

	mov	DWORD PTR _id_form$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _id_form$[ebp+4], ecx
	mov	DWORD PTR _id_form$[ebp+8], ecx
	mov	DWORD PTR _id_form$[ebp+12], ecx
	mov	DWORD PTR _id_form$[ebp+16], ecx

; 323  : 	DynTable id_ctrl = { 0 };

	mov	DWORD PTR _id_ctrl$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _id_ctrl$[ebp+4], edx
	mov	DWORD PTR _id_ctrl$[ebp+8], edx
	mov	DWORD PTR _id_ctrl$[ebp+12], edx
	mov	DWORD PTR _id_ctrl$[ebp+16], edx

; 324  : 	DynTable call_data1 = { 0 };

	mov	DWORD PTR _call_data1$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _call_data1$[ebp+4], eax
	mov	DWORD PTR _call_data1$[ebp+8], eax
	mov	DWORD PTR _call_data1$[ebp+12], eax
	mov	DWORD PTR _call_data1$[ebp+16], eax

; 325  : 	DynTable field = { 0 };

	mov	DWORD PTR _field$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _field$[ebp+4], ecx
	mov	DWORD PTR _field$[ebp+8], ecx
	mov	DWORD PTR _field$[ebp+12], ecx
	mov	DWORD PTR _field$[ebp+16], ecx

; 326  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 327  : 	unsigned long idobj0 = DYNTAB_TOUL(&cntxt->id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj0$[ebp], eax

; 328  : 	unsigned long idform0 = DYNTAB_TOUL(&cntxt->id_form);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idform0$[ebp], eax

; 329  : 	unsigned long idobj1 = DYNTAB_TOUL(&cntxt->alt_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 60					; 0000003cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj1$[ebp], eax

; 330  : 	unsigned long idform1 = DYNTAB_TOUL(&cntxt->alt_form);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idform1$[ebp], eax

; 331  : 	unsigned long homepage = DYNTAB_TOUL(&cntxt->homepage);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29548				; 0000736cH
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _homepage$[ebp], eax

; 332  : 	unsigned long menubar = DYNTAB_TOUL(&cntxt->menubar);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29528				; 00007358H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _menubar$[ebp], eax

; 333  : 	int b_alt = idform1 == idform && idobj1 == idobj;

	mov	edx, DWORD PTR _idform1$[ebp]
	cmp	edx, DWORD PTR _idform$[ebp]
	jne	SHORT $L70734
	mov	eax, DWORD PTR _idobj1$[ebp]
	cmp	eax, DWORD PTR _idobj$[ebp]
	jne	SHORT $L70734
	mov	DWORD PTR -224+[ebp], 1
	jmp	SHORT $L70735
$L70734:
	mov	DWORD PTR -224+[ebp], 0
$L70735:
	mov	ecx, DWORD PTR -224+[ebp]
	mov	DWORD PTR _b_alt$[ebp], ecx

; 334  : 	DynTable *dest_form = b_alt ? &cntxt->alt_form : &cntxt->id_form;

	cmp	DWORD PTR _b_alt$[ebp], 0
	je	SHORT $L70736
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 40					; 00000028H
	mov	DWORD PTR -228+[ebp], edx
	jmp	SHORT $L70737
$L70736:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR -228+[ebp], eax
$L70737:
	mov	ecx, DWORD PTR -228+[ebp]
	mov	DWORD PTR _dest_form$[ebp], ecx

; 335  : 	DynTable *dest_obj = b_alt ? &cntxt->alt_obj : &cntxt->id_obj;

	cmp	DWORD PTR _b_alt$[ebp], 0
	je	SHORT $L70738
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 60					; 0000003cH
	mov	DWORD PTR -232+[ebp], edx
	jmp	SHORT $L70739
$L70738:
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 20					; 00000014H
	mov	DWORD PTR -232+[ebp], eax
$L70739:
	mov	ecx, DWORD PTR -232+[ebp]
	mov	DWORD PTR _dest_obj$[ebp], ecx

; 336  : 	unsigned long i;
; 337  : 
; 338  : 	/* Clear current form position */
; 339  : 	dyntab_free(dest_form);

	mov	edx, DWORD PTR _dest_form$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 340  : 	dyntab_free(dest_obj);

	mov	eax, DWORD PTR _dest_obj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 341  : 
; 342  : 	/* If no caller field given */
; 343  : 	if(!call_data)

	cmp	DWORD PTR _call_data$[ebp], 0
	jne	$L70534

; 345  : 		/* Search for form field in CGI input */
; 346  : 		for(i = 0; i < cntxt->nb_cgi && !(cntxt->cgi[i].name[0] == 'F' &&
; 347  : 					cntxt->cgi[i].IdObj == idobj && cntxt->cgi[i].IdForm == idform); i++);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70528
$L70529:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70528:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+29652]
	jae	SHORT $L70530
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 70					; 00000046H
	jne	SHORT $L70531
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+24]
	cmp	eax, DWORD PTR _idobj$[ebp]
	jne	SHORT $L70531
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx+20]
	cmp	ecx, DWORD PTR _idform$[ebp]
	je	SHORT $L70530
$L70531:
	jmp	SHORT $L70529
$L70530:

; 348  : 		if(i < cntxt->nb_cgi)

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+29652]
	jae	SHORT $L70534

; 350  : 			call_data = &call_data1;

	lea	ecx, DWORD PTR _call_data1$[ebp]
	mov	DWORD PTR _call_data$[ebp], ecx

; 351  : 			if(cgi_extract(cntxt, cntxt->cgi[i].value, '§', call_data, NULL))

	push	0
	mov	edx, DWORD PTR _call_data$[ebp]
	push	edx
	push	-89					; ffffffa7H
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+8]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_extract
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70534

; 352  : 				STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 352		; 00000160H
	jmp	$eva_err$70535
$L70534:

; 355  : 
; 356  : 	/* Parse caller field */
; 357  : 	if(cgi_extract(cntxt, dyntab_val(call_data, 0, 0), '/', &id_form, &id_obj, &id_ctrl, &field, NULL))

	push	0
	lea	eax, DWORD PTR _field$[ebp]
	push	eax
	lea	ecx, DWORD PTR _id_ctrl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	lea	eax, DWORD PTR _id_form$[ebp]
	push	eax
	push	47					; 0000002fH
	push	0
	push	0
	mov	ecx, DWORD PTR _call_data$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_extract
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70537

; 358  : 		STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 358		; 00000166H
	jmp	$eva_err$70535
$L70537:

; 359  : 
; 360  : 	/* If caller field available */
; 361  : 	if(dyntab_sz(&id_form, 0, 0))

	push	0
	push	0
	lea	ecx, DWORD PTR _id_form$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70552

; 363  : 		unsigned long idobj2 = DYNTAB_TOUL(&id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj2$70539[ebp], eax

; 364  : 		unsigned long idform2 = DYNTAB_TOUL(&id_form);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _id_form$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idform2$70541[ebp], eax

; 365  : 
; 366  : 		/* Put caller form & obj in destination location */
; 367  : 		DYNTAB_ADD_CELL(dest_form, 0, 0, &id_form, 0, 0);

	push	1
	push	0
	push	0
	lea	ecx, DWORD PTR _id_form$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _dest_form$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70543
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70545
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 367		; 0000016fH
	jmp	$eva_err$70535
$L70543:

; 368  : 		dyntab_free(dest_obj);

	mov	edx, DWORD PTR _dest_obj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 369  : 		if(idobj2) DYNTAB_ADD_CELL(dest_obj, 0, 0, &id_obj, 0, 0);

	cmp	DWORD PTR _idobj2$70539[ebp], 0
	je	SHORT $L70547
	push	1
	push	0
	push	0
	lea	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _dest_obj$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70547
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70549
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 369		; 00000171H
	jmp	$eva_err$70535
$L70547:

; 370  : 
; 371  : 		/* Clear form position if home page or menubar or already in page */
; 372  : 		if(idform2 == homepage) form_set_homepage(cntxt);

	mov	ecx, DWORD PTR _idform2$70541[ebp]
	cmp	ecx, DWORD PTR _homepage$[ebp]
	jne	SHORT $L70550
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_set_homepage
	add	esp, 4

; 373  : 		else if(idform2 == menubar ||

	jmp	SHORT $L70552
$L70550:

; 374  : 			(idform2 == idform0 && idobj2 == idobj0) ||
; 375  : 			(idform2 == idform1 && idobj2 == idobj1))

	mov	eax, DWORD PTR _idform2$70541[ebp]
	cmp	eax, DWORD PTR _menubar$[ebp]
	je	SHORT $L70553
	mov	ecx, DWORD PTR _idform2$70541[ebp]
	cmp	ecx, DWORD PTR _idform0$[ebp]
	jne	SHORT $L70554
	mov	edx, DWORD PTR _idobj2$70539[ebp]
	cmp	edx, DWORD PTR _idobj0$[ebp]
	je	SHORT $L70553
$L70554:
	mov	eax, DWORD PTR _idform2$70541[ebp]
	cmp	eax, DWORD PTR _idform1$[ebp]
	jne	SHORT $L70552
	mov	ecx, DWORD PTR _idobj2$70539[ebp]
	cmp	ecx, DWORD PTR _idobj1$[ebp]
	jne	SHORT $L70552
$L70553:

; 377  : 			dyntab_free(dest_form);

	mov	edx, DWORD PTR _dest_form$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 378  : 			dyntab_free(dest_obj);

	mov	eax, DWORD PTR _dest_obj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
$L70552:

; 381  : 
; 382  : 	/* If main form closed : place alt form as top form */
; 383  : 	if(!dyntab_cmp(&cntxt->alt_obj, 0, 0, &cntxt->id_obj, 0, 0) &&
; 384  : 		!dyntab_cmp(&cntxt->alt_form, 0, 0, &cntxt->id_form, 0, 0))

	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 60					; 0000003cH
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70555
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70555

; 386  : 		DYNTAB_FREE(cntxt->alt_form);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 387  : 		DYNTAB_FREE(cntxt->alt_obj);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 60					; 0000003cH
	push	eax
	call	_dyntab_free
	add	esp, 4
$L70555:

; 389  : 	if(!dyntab_sz(&cntxt->id_form, 0, 0) && dyntab_sz(&cntxt->alt_form, 0, 0))

	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70556
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70556

; 391  : 		DYNTAB_FREE(cntxt->id_obj);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	call	_dyntab_free
	add	esp, 4

; 392  : 		DYNTAB_ADD_CELL(&cntxt->id_form, 0, 0, &cntxt->alt_form, 0, 0);

	push	1
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70557
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70559
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 392		; 00000188H
	jmp	$eva_err$70535
$L70557:

; 393  : 		if(dyntab_sz(&cntxt->alt_obj, 0, 0)) DYNTAB_ADD_CELL(&cntxt->id_obj, 0, 0, &cntxt->alt_obj, 0, 0);

	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 60					; 0000003cH
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70561
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 60					; 0000003cH
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70561
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70563
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 393		; 00000189H
	jmp	$eva_err$70535
$L70561:

; 394  : 		DYNTAB_FREE(cntxt->alt_form);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 395  : 		DYNTAB_FREE(cntxt->alt_obj);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 60					; 0000003cH
	push	edx
	call	_dyntab_free
	add	esp, 4
$L70556:

; 397  : 
; 398  : 	/* Clear form data in CGI inputs */
; 399  : 	cgi_clear_form_inputs(cntxt, idform, idobj, 0);

	push	0
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _idform$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_clear_form_inputs
	add	esp, 16					; 00000010H

; 400  : 
; 401  : 	/* If no form to display */
; 402  : 	if(!dyntab_sz(&cntxt->id_form, 0, 0))

	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70582

; 404  : 		/* Look for next opened form in CGI inputs */
; 405  : 		unsigned long i = 0;

	mov	DWORD PTR _i$70565[ebp], 0

; 406  : 		if(cntxt->nb_cgi) for(i = 1; i < cntxt->nb_cgi; i++)

	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29652], 0
	je	$L70569
	mov	DWORD PTR _i$70565[ebp], 1
	jmp	SHORT $L70567
$L70568:
	mov	edx, DWORD PTR _i$70565[ebp]
	add	edx, 1
	mov	DWORD PTR _i$70565[ebp], edx
$L70567:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _i$70565[ebp]
	cmp	ecx, DWORD PTR [eax+29652]
	jae	SHORT $L70569

; 407  : 			if(cntxt->cgi[i].name[0] == 'F' && cntxt->cgi[i].IdForm &&
; 408  : 				cntxt->cgi[i].IdForm != homepage &&
; 409  : 				cntxt->cgi[i].IdForm != menubar)

	mov	edx, DWORD PTR _i$70565[ebp]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 70					; 00000046H
	jne	SHORT $L70570
	mov	ecx, DWORD PTR _i$70565[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	cmp	DWORD PTR [eax+ecx+20], 0
	je	SHORT $L70570
	mov	ecx, DWORD PTR _i$70565[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx+20]
	cmp	ecx, DWORD PTR _homepage$[ebp]
	je	SHORT $L70570
	mov	edx, DWORD PTR _i$70565[ebp]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx+20]
	cmp	edx, DWORD PTR _menubar$[ebp]
	je	SHORT $L70570

; 410  : 				break;

	jmp	SHORT $L70569
$L70570:

; 411  : 		if(i < cntxt->nb_cgi)

	jmp	$L70568
$L70569:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _i$70565[ebp]
	cmp	ecx, DWORD PTR [eax+29652]
	jae	$L70582

; 413  : 			DYNTAB_ADD_INT(&cntxt->id_form, 0, 0, cntxt->cgi[i].IdForm);

	mov	BYTE PTR __tmp$70572[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70572[ebp+1]
	rep stosd
	stosw
	stosb
	mov	edx, DWORD PTR _i$70565[ebp]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx+20]
	push	edx
	push	OFFSET FLAT:$SG70573
	lea	eax, DWORD PTR __tmp$70572[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$70572[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70575
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70577
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 413		; 0000019dH
	jmp	$eva_err$70535
$L70575:

; 414  : 			DYNTAB_FREE(cntxt->id_obj);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 415  : 			if(cntxt->cgi[i].IdObj) DYNTAB_ADD_INT(&cntxt->id_obj, 0, 0, cntxt->cgi[i].IdObj);

	mov	eax, DWORD PTR _i$70565[ebp]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	cmp	DWORD PTR [edx+eax+24], 0
	je	$L70582
	mov	BYTE PTR __tmp$70579[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70579[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _i$70565[ebp]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+24]
	push	eax
	push	OFFSET FLAT:$SG70580
	lea	ecx, DWORD PTR __tmp$70579[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$70579[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70582
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70584
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 415		; 0000019fH
	jmp	SHORT $eva_err$70535
$L70582:
$eva_noerr$70585:

; 418  : 
; 419  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70586
	push	OFFSET FLAT:$SG70587
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70535:
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
	lea	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _id_form$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _id_ctrl$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _call_data1$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 420  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_form_close_nosave ENDP
_TEXT	ENDS
PUBLIC	_form_output
EXTRN	_ctrl_handlers:BYTE
EXTRN	_ctrl_call_act_handler:NEAR
EXTRN	_form_free_html:NEAR
EXTRN	_form_save_dialog:NEAR
EXTRN	_form_put_html:NEAR
EXTRN	_ctrl_from_cginame:NEAR
_DATA	SEGMENT
	ORG $+2
$SG70609 DB	'_EVA_BUTTON', 00H
$SG70616 DB	'_EVA_CONFIRMCHANGE', 00H
	ORG $+1
$SG70628 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70630 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70642 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_io.c', 00H
	ORG $+2
$SG70643 DB	'form_output', 00H
$SG70645 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_io.c', 00H
	ORG $+2
$SG70646 DB	'form_output', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_form$ = -28
_ctrltree$ = -24
_b_alt$ = -40
_id_form$ = -4
_id_obj$ = -32
_b_done$ = -36
_i$70606 = -44
_nextstep$70619 = -48
_form_output PROC NEAR

; 432  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H

; 433  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 434  : 	DynTable ctrltree = { 0 };

	mov	DWORD PTR _ctrltree$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _ctrltree$[ebp+4], edx
	mov	DWORD PTR _ctrltree$[ebp+8], edx
	mov	DWORD PTR _ctrltree$[ebp+12], edx
	mov	DWORD PTR _ctrltree$[ebp+16], edx

; 435  : 	int b_alt = form &&
; 436  : 				!dyntab_cmp(&cntxt->alt_form, 0, 0, &form->id_form, 0, 0) &&
; 437  : 				!dyntab_cmp(&cntxt->alt_obj, 0, 0, &form->id_obj, 0, 0);

	cmp	DWORD PTR _form$[ebp], 0
	je	SHORT $L70741
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70741
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
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
	jne	SHORT $L70741
	mov	DWORD PTR -52+[ebp], 1
	jmp	SHORT $L70742
$L70741:
	mov	DWORD PTR -52+[ebp], 0
$L70742:
	mov	ecx, DWORD PTR -52+[ebp]
	mov	DWORD PTR _b_alt$[ebp], ecx

; 438  : 	DynTable *id_form = b_alt ? &cntxt->alt_form : &cntxt->id_form;

	cmp	DWORD PTR _b_alt$[ebp], 0
	je	SHORT $L70743
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 40					; 00000028H
	mov	DWORD PTR -56+[ebp], edx
	jmp	SHORT $L70744
$L70743:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR -56+[ebp], eax
$L70744:
	mov	ecx, DWORD PTR -56+[ebp]
	mov	DWORD PTR _id_form$[ebp], ecx

; 439  : 	DynTable *id_obj = b_alt ? &cntxt->alt_obj : &cntxt->id_obj;

	cmp	DWORD PTR _b_alt$[ebp], 0
	je	SHORT $L70745
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 60					; 0000003cH
	mov	DWORD PTR -60+[ebp], edx
	jmp	SHORT $L70746
$L70745:
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 20					; 00000014H
	mov	DWORD PTR -60+[ebp], eax
$L70746:
	mov	ecx, DWORD PTR -60+[ebp]
	mov	DWORD PTR _id_obj$[ebp], ecx

; 440  : 	int b_done = 0;

	mov	DWORD PTR _b_done$[ebp], 0

; 441  : 	if(!form) RETURN_OK;

	cmp	DWORD PTR _form$[ebp], 0
	jne	SHORT $L70603
	jmp	$eva_noerr$70604
$L70603:

; 442  : 
; 443  : 	/* If dialog mode not processed : call control action handler */
; 444  : 	if(!form->html && dyntab_sz(&form->dlg_ctrl, 0, 0))

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+232], 0
	jne	$L70617
	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 180				; 000000b4H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70617

; 446  : 		/* Get dialog control index */
; 447  : 		unsigned long i = ctrl_from_cginame(cntxt, DYNTAB_VAL_SZ(&form->dlg_ctrl, 0, 0));

	push	0
	push	0
	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 180				; 000000b4H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	0
	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 180				; 000000b4H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_from_cginame
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _i$70606[ebp], eax

; 448  : 		if(i)

	cmp	DWORD PTR _i$70606[ebp], 0
	je	$L70607

; 450  : 			/* Control index found : use control handler */
; 451  : 			if(!strcmp(form->ctrl[i].CONTROL, "_EVA_BUTTON"))

	push	OFFSET FLAT:$SG70609
	mov	ecx, DWORD PTR _i$70606[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+ecx+272]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70608

; 453  : 				/* Button dialog : call action handler */
; 454  : 				CTRL_ACT_HDLR(i);

	mov	edx, DWORD PTR _i$70606[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_call_act_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $L70610
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 454		; 000001c6H
	jmp	$eva_err$70611
$L70610:

; 456  : 			else

	jmp	$L70613
$L70608:

; 458  : 				/* Other controls : call secondary handler */
; 459  : 				form->step = form->nextstep;

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+172]
	mov	DWORD PTR [edx+176], ecx

; 460  : 				form->html = &form->html_top;

	mov	edx, DWORD PTR _form$[ebp]
	add	edx, 216				; 000000d8H
	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+232], edx

; 461  : 				CTRL_SEC_HDLR(i);

	cmp	DWORD PTR _i$70606[ebp], 0
	je	SHORT $L70613
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _i$70606[ebp]
	imul	eax, 480				; 000001e0H
	mov	ecx, DWORD PTR [edx]
	mov	edx, DWORD PTR [ecx+eax+32]
	shl	edx, 4
	cmp	DWORD PTR _ctrl_handlers[edx+12], 0
	je	SHORT $L70613
	mov	eax, DWORD PTR _i$70606[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _i$70606[ebp]
	imul	ecx, 480				; 000001e0H
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [edx+ecx+32]
	shl	eax, 4
	call	DWORD PTR _ctrl_handlers[eax+12]
	add	esp, 8
	test	eax, eax
	je	SHORT $L70613
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 461		; 000001cdH
	jmp	$eva_err$70611
$L70613:

; 464  : 		else

	jmp	SHORT $L70615
$L70607:

; 465  : 			/* Control index not found : simulate close button */
; 466  : 			if(form_save_dialog(cntxt, 0, "_EVA_CONFIRMCHANGE", BUTN_CLOSE | BUTN_SAVE_CLOSE, &b_done)) STACK_ERROR;

	lea	edx, DWORD PTR _b_done$[ebp]
	push	edx
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70616
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_save_dialog
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70615
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 466		; 000001d2H
	jmp	$eva_err$70611
$L70615:

; 467  : 
; 468  : 		/* Do not output form if cleared */
; 469  : 		if(!cntxt->form) RETURN_OK;

	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+80], 0
	jne	SHORT $L70617
	jmp	$eva_noerr$70604
$L70617:

; 471  : 
; 472  : 	/* Reload form if applicable */
; 473  : 	if(form->b_reload)

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+140], 0
	je	SHORT $L70618

; 475  : 		EVA_execmode nextstep = form->nextstep;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+172]
	mov	DWORD PTR _nextstep$70619[ebp], edx

; 476  : 		if(form_load(cntxt, id_form, id_obj, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _id_form$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_load
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70620
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 476		; 000001dcH
	jmp	$eva_err$70611
$L70620:

; 477  : 		form = cntxt->form;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	DWORD PTR _form$[ebp], edx

; 478  : 		form->nextstep = nextstep;

	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR _nextstep$70619[ebp]
	mov	DWORD PTR [eax+172], ecx
$L70618:

; 480  : 
; 481  : 	/* If no output prepared : prepare form HTML output */
; 482  : 	if(!form->html)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+232], 0
	jne	$L70632

; 484  : 		/* Set display mode */
; 485  : 		if(form->nextstep < HtmlSaveDlg || form->nextstep > FormValues)

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+172], 3
	jl	SHORT $L70623
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+172], 11			; 0000000bH
	jle	SHORT $L70622
$L70623:

; 486  : 			form->nextstep = HtmlView;

	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+172], 6

; 487  : 		else if(dyntab_sz(&form->id_obj, 0, 0) &&

	jmp	SHORT $L70625
$L70622:

; 488  : 				form->nextstep == HtmlEdit &&
; 489  : 				!(form->ctrl->access & AccessEdit))

	push	0
	push	0
	mov	eax, DWORD PTR _form$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70625
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+172], 4
	jne	SHORT $L70625
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+184]
	and	ecx, 2
	test	ecx, ecx
	jne	SHORT $L70625

; 490  : 			form->nextstep = HtmlView;

	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+172], 6
$L70625:

; 491  : 
; 492  : 		/* Prepare form buffers */
; 493  : 		ATTR_OPTIONAL(ctrltree, CTRLTREE, form->ctrl);

	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70628
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, 44					; 0000002cH
	push	edx
	push	0
	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70627
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70630
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 493		; 000001edH
	jmp	$eva_err$70611
$L70627:

; 494  : 		form_free_html(cntxt);

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_free_html
	add	esp, 4

; 495  : 		switch(form->nextstep)
; 496  : 		{

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+172]
	mov	DWORD PTR -64+[ebp], edx
	cmp	DWORD PTR -64+[ebp], 4
	je	SHORT $L70635
	jmp	SHORT $L70636
$L70635:

; 497  : 		case HtmlEdit:
; 498  : 			/* Check input if edit mode */
; 499  : 			form->step = InputCheck;

	mov	eax, DWORD PTR _form$[ebp]
	mov	DWORD PTR [eax+176], 2

; 500  : 			if(ctrl_add_child(cntxt, 0, &ctrltree)) STACK_ERROR;

	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70636
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 500		; 000001f4H
	jmp	$eva_err$70611
$L70636:

; 501  : 
; 502  : 		default:
; 503  : 			form->step = form->nextstep;

	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+172]
	mov	DWORD PTR [ecx+176], eax

; 504  : 			form->html = &form->html_top;

	mov	ecx, DWORD PTR _form$[ebp]
	add	ecx, 216				; 000000d8H
	mov	edx, DWORD PTR _form$[ebp]
	mov	DWORD PTR [edx+232], ecx

; 505  : 			if(ctrl_add_child(cntxt, 0, &ctrltree)) STACK_ERROR;

	lea	eax, DWORD PTR _ctrltree$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_add_child
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70638
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 505		; 000001f9H
	jmp	$eva_err$70611
$L70638:
$L70632:

; 508  : 
; 509  : 	/* Output form */
; 510  : 	if(cntxt->form && form_put_html(cntxt)) STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	je	SHORT $L70639
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_put_html
	add	esp, 4
	test	eax, eax
	je	SHORT $L70639
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 510		; 000001feH
	jmp	SHORT $eva_err$70611
$L70639:

; 511  : 
; 512  : 	/* Switch to alt buffer if form displayed in bottom position */
; 513  : 	if(b_alt)

	cmp	DWORD PTR _b_alt$[ebp], 0
	je	SHORT $L70640

; 515  : 		M_FREE(cntxt->html1);

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29788]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29788], 0

; 516  : 		cntxt->html1 = cntxt->html;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29784]
	mov	DWORD PTR [eax+29788], edx

; 517  : 		cntxt->html = NULL;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29784], 0
$L70640:

; 519  : 	form_free(cntxt);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_free
	add	esp, 4
$eva_noerr$70604:

; 520  : 
; 521  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70642
	push	OFFSET FLAT:$SG70643
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70611:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70644
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70645
	push	OFFSET FLAT:$SG70646
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70644:
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 522  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_form_output ENDP
_TEXT	ENDS
PUBLIC	_form_get_html
EXTRN	_ctrl_primary_handler:NEAR
_DATA	SEGMENT
$SG70663 DB	'%lu', 00H
$SG70667 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70670 DB	'%lu', 00H
$SG70674 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70678 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG70680 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70681 DB	'_EVA_SameCell', 00H
	ORG $+2
$SG70684 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_io.c', 00H
	ORG $+2
$SG70685 DB	'form_get_html', 00H
	ORG $+2
$SG70687 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\form_io.c', 00H
	ORG $+2
$SG70688 DB	'form_get_html', 00H
_DATA	ENDS
_TEXT	SEGMENT
_id_obj$ = 20
_idform$ = -60
_idobj$ = -40
_ctrltree$ = -20
__tmp$70662 = -92
__tmp$70669 = -124
_cntxt$ = 8
_res$ = 12
_id_form$ = 16
_form_get_html PROC NEAR

; 540  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 124				; 0000007cH
	push	edi

; 541  : 	DynTable idform = { 0 };

	mov	DWORD PTR _idform$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _idform$[ebp+4], eax
	mov	DWORD PTR _idform$[ebp+8], eax
	mov	DWORD PTR _idform$[ebp+12], eax
	mov	DWORD PTR _idform$[ebp+16], eax

; 542  : 	DynTable idobj = { 0 };

	mov	DWORD PTR _idobj$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _idobj$[ebp+4], ecx
	mov	DWORD PTR _idobj$[ebp+8], ecx
	mov	DWORD PTR _idobj$[ebp+12], ecx
	mov	DWORD PTR _idobj$[ebp+16], ecx

; 543  : 	DynTable ctrltree = { 0 };

	mov	DWORD PTR _ctrltree$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _ctrltree$[ebp+4], edx
	mov	DWORD PTR _ctrltree$[ebp+8], edx
	mov	DWORD PTR _ctrltree$[ebp+12], edx
	mov	DWORD PTR _ctrltree$[ebp+16], edx

; 544  : 
; 545  : 	/* Load form */
; 546  : 	DYNTAB_ADD_INT(&idform, 0, 0, id_form);

	mov	BYTE PTR __tmp$70662[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70662[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _id_form$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70663
	lea	ecx, DWORD PTR __tmp$70662[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$70662[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _idform$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70665
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70667
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 546		; 00000222H
	jmp	$eva_err$70668
$L70665:

; 547  : 	DYNTAB_ADD_INT(&idobj, 0, 0, id_obj);

	mov	BYTE PTR __tmp$70669[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70669[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70670
	lea	ecx, DWORD PTR __tmp$70669[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$70669[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _idobj$[ebp]
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70672
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70674
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 547		; 00000223H
	jmp	$eva_err$70668
$L70672:

; 548  : 	if(form_load(cntxt, &idform, &idobj, 4)) STACK_ERROR;

	push	4
	lea	eax, DWORD PTR _idobj$[ebp]
	push	eax
	lea	ecx, DWORD PTR _idform$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_load
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70675
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 548		; 00000224H
	jmp	$eva_err$70668
$L70675:

; 549  : 	ATTR_OPTIONAL(ctrltree, CTRLTREE, cntxt->form->ctrl);

	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70678
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 44					; 0000002cH
	push	ecx
	push	0
	lea	edx, DWORD PTR _ctrltree$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70677
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70680
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 549		; 00000225H
	jmp	SHORT $eva_err$70668
$L70677:

; 550  : 
; 551  : 	/* Send output to result */
; 552  : 	cntxt->form->html = res;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _res$[ebp]
	mov	DWORD PTR [eax+232], ecx

; 553  : 	cntxt->form->step = HtmlView;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	DWORD PTR [eax+176], 6

; 554  : 	cntxt->form->ctrl->POSITION = "_EVA_SameCell";

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [eax+296], OFFSET FLAT:$SG70681

; 555  : 	if(ctrl_primary_handler(cntxt, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_primary_handler
	add	esp, 8
	test	eax, eax
	je	SHORT $eva_noerr$70683
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 555		; 0000022bH
	jmp	SHORT $eva_err$70668
$eva_noerr$70683:

; 556  : 
; 557  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70684
	push	OFFSET FLAT:$SG70685
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70668:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70686
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70687
	push	OFFSET FLAT:$SG70688
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70686:
	lea	edx, DWORD PTR _idform$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _idobj$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _ctrltree$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 558  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_form_get_html ENDP
_TEXT	ENDS
END
