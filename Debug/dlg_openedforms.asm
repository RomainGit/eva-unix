	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dlg_openedforms.c
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
PUBLIC	_dlg_openedforms_output
EXTRN	_table_free:NEAR
EXTRN	_put_html_button_sz:NEAR
EXTRN	_table_row_bgcolor:NEAR
EXTRN	__snprintf:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_cgi_build_finalname:NEAR
EXTRN	_cgi_filter_values:NEAR
EXTRN	_cgi_check_form_change:NEAR
EXTRN	_put_html_chkbox:NEAR
EXTRN	_qry_complete_data:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_qry_obj_idfield:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_cmp:NEAR
EXTRN	_dyntab_del_rows:NEAR
EXTRN	_ctrl_add_symbol_btn:NEAR
_BSS	SEGMENT
$SG70306 DB	01H DUP (?)
	ALIGN	4

$SG70455 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70238 DB	'<font face=Arial><table border=0 width=100% bgcolor=#EEE'
	DB	'EEE><tr><td align=center><font size=+1><b>Liste des formulair'
	DB	'es ouverts</b></font></td>', 00H
$SG70240 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70245 DB	'<td align=center>', 00H
	ORG $+2
$SG70247 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70251 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70253 DB	'VIEW', 00H
	ORG $+3
$SG70257 DB	'Afficher les formulaires s', 0e9H, 'lectionn', 0e9H, 's '
	DB	'dans les colonnes Haut et bas', 0aH, 0aH, 'Vous pouvez affich'
	DB	'er deux formulaires simultan', 0e9H, 'ment', 00H
	ORG $+3
$SG70258 DB	'_eva_btn_2forms_fr_s.gif', 00H
	ORG $+3
$SG70259 DB	'_eva_btn_2forms_fr.gif', 00H
	ORG $+1
$SG70262 DB	'</td>', 00H
	ORG $+2
$SG70264 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70267 DB	'<td align=right>', 00H
	ORG $+3
$SG70269 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70273 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70275 DB	'MENU', 00H
	ORG $+3
$SG70279 DB	'Retour ', 0e0H, ' la page d''accueil', 00H
	ORG $+1
$SG70280 DB	'_eva_menu_s.gif', 00H
$SG70281 DB	'_eva_menu.gif', 00H
	ORG $+2
$SG70284 DB	'</td></tr></table><table border=1 cellspacing=0 rules=ro'
	DB	'ws bgcolor=#EEEEEE width=100%><tr><td></td><td></td><td align'
	DB	'=center><font size=-2>Haut</font></td><td align=center><font '
	DB	'size=-2>Bas</font></td><td></td></tr>', 00H
$SG70286 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70298 DB	'FFFFFF', 00H
	ORG $+1
$SG70301 DB	'<tr>', 00H
	ORG $+3
$SG70303 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70317 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70319 DB	'%lu', 00H
$SG70323 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70325 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70329 DB	'SYMBOL+NAME+LABEL+OBJNOTES', 00H
	ORG $+1
$SG70330 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dlg_openedforms.'
	DB	'c', 00H
	ORG $+2
$SG70331 DB	'dlg_openedforms_output', 00H
	ORG $+1
$SG70335 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70337 DB	'TOPFRM', 00H
	ORG $+1
$SG70340 DB	'>', 00H
	ORG $+2
$SG70341 DB	'<td align=center bgcolor=', 00H
	ORG $+2
$SG70343 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70346 DB	'%lu,%lu', 00H
$SG70350 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70352 DB	'BOTFRM', 00H
	ORG $+1
$SG70355 DB	'>', 00H
	ORG $+2
$SG70356 DB	'</td><td align=center bgcolor=', 00H
	ORG $+1
$SG70358 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70361 DB	'%lu,%lu', 00H
$SG70364 DB	'</td>', 00H
	ORG $+2
$SG70366 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70370 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70372 DB	'CLOSE=%lu,%lu', 00H
	ORG $+2
$SG70375 DB	'>', 00H
	ORG $+2
$SG70376 DB	'<td align=right bgcolor=', 00H
	ORG $+3
$SG70378 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70382 DB	'Attention : fiche modifi', 0e9H, 'e', 0aH, 0aH, 'Un dial'
	DB	'ogue vous demande de confirmer la fermeture', 0aH, 0aH, 'D', 0e9H
	DB	'cochez la case ''Confirmation'' pour ne pas afficher de confi'
	DB	'rmation', 00H
	ORG $+3
$SG70383 DB	'_eva_btn_close1_fr_s.gif', 00H
	ORG $+3
$SG70384 DB	'_eva_btn_close1_fr.gif', 00H
	ORG $+1
$SG70385 DB	'Fermer', 00H
	ORG $+1
$SG70390 DB	'_eva_btn_close_fr_s.gif', 00H
$SG70391 DB	'_eva_btn_close_fr.gif', 00H
	ORG $+2
$SG70392 DB	'Fermer', 00H
	ORG $+1
$SG70395 DB	'</td></tr>', 00H
	ORG $+1
$SG70397 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70405 DB	'<tr><td colspan=6 align=center bgcolor=#DDDDDD><b>Aucune'
	DB	' fen', 0eaH, 'tre ouverte</b>', 00H
	ORG $+3
$SG70407 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70412 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70414 DB	'CONFIRM', 00H
$SG70418 DB	''' value=1>', 00H
	ORG $+1
$SG70419 DB	'<input type=hidden name=''', 00H
	ORG $+2
$SG70421 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70425 DB	'<tr><td colspan=6><table width=100% height=50><tr>', 00H
	ORG $+1
$SG70427 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70432 DB	'<td align=center>', 00H
	ORG $+2
$SG70434 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70438 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70440 DB	'CLOSEALLNOSAVE', 00H
	ORG $+1
$SG70444 DB	'Ferme tous les formulaires ouverts et retourne ', 0e0H, ' '
	DB	'la page d''accueil', 0aH, 0aH, 'Les fiches modifi', 0e9H, 'es'
	DB	' ne sont pas ferm', 0e9H, 'es si la case ''Confirmation'' est'
	DB	' coch', 0e9H, 'e', 0aH, 0aH, 'Dans le cas contraire, les donn'
	DB	0e9H, 'es modifi', 0e9H, 'es sont perdues', 00H
	ORG $+3
$SG70445 DB	'_eva_btn_closeall1_fr_s.gif', 00H
$SG70446 DB	'_eva_btn_closeall1_fr.gif', 00H
	ORG $+2
$SG70450 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70452 DB	'CONFIRM', 00H
$SG70454 DB	'checked', 00H
$SG70456 DB	'</td><td align=center colspan=2><input type=checkbox nam'
	DB	'e=''%s'' %s>Confirmation', 00H
	ORG $+1
$SG70459 DB	'</td><td align=right>', 00H
	ORG $+2
$SG70461 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70465 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70467 DB	'CLOSEALL', 00H
	ORG $+3
$SG70471 DB	'Ferme tous les formulaires non modifi', 0e9H, 's et affi'
	DB	'che le premier formulaire modifi', 0e9H, 00H
	ORG $+3
$SG70472 DB	'_eva_btn_closeall_fr_s.gif', 00H
	ORG $+1
$SG70473 DB	'_eva_btn_closeall_fr.gif', 00H
	ORG $+3
$SG70477 DB	'<td align=right>', 00H
	ORG $+3
$SG70479 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70483 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70485 DB	'CLOSEALL', 00H
	ORG $+3
$SG70488 DB	'Ferme tous les formulaires ouverts et retourne ', 0e0H, ' '
	DB	'la page d''accueil', 00H
	ORG $+1
$SG70489 DB	'_eva_btn_closeall_fr_s.gif', 00H
	ORG $+1
$SG70490 DB	'_eva_btn_closeall_fr.gif', 00H
	ORG $+3
$SG70491 DB	'Tout fermer', 00H
$SG70494 DB	'</td></tr></table>', 00H
	ORG $+1
$SG70496 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70499 DB	'</td></tr></table></font>', 00H
	ORG $+2
$SG70501 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70503 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dlg_openedforms.'
	DB	'c', 00H
	ORG $+2
$SG70504 DB	'dlg_openedforms_output', 00H
	ORG $+1
$SG70506 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dlg_openedforms.'
	DB	'c', 00H
	ORG $+2
$SG70507 DB	'dlg_openedforms_output', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_cginame$ = 12
_b_confirm$ = 16
__form$ = -940
_i$ = -972
_j$ = -976
_idobj0$ = -944
_idform0$ = -988
_idobj1$ = -696
_idform1$ = -4
_bgcolor$ = -968
_cgival$ = -964
_data$ = -692
_html$ = -672
_name$ = -984
_b_modif$ = -980
_tbl$ = -668
_cgi$70291 = -1060
_objref$70292 = -1056
_b_modified$70293 = -992
_k$70308 = -1064
__tmp$70318 = -1096
_c$70324 = -1100
_printbuf$70429 = -1612
_dlg_openedforms_output PROC NEAR

; 37   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 1660				; 0000067cH
	push	edi

; 38   : 	EVA_form _form = {0};

	mov	DWORD PTR __form$[ebp], 0
	mov	ecx, 60					; 0000003cH
	xor	eax, eax
	lea	edi, DWORD PTR __form$[ebp+4]
	rep stosd

; 39   : 	unsigned long i, j;
; 40   : 	unsigned long idobj0 = DYNTAB_TOUL(&cntxt->id_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj0$[ebp], eax

; 41   : 	unsigned long idform0 = DYNTAB_TOUL(&cntxt->id_form);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idform0$[ebp], eax

; 42   : 	unsigned long idobj1 = DYNTAB_TOUL(&cntxt->alt_obj);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 60					; 0000003cH
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idobj1$[ebp], eax

; 43   : 	unsigned long idform1 = DYNTAB_TOUL(&cntxt->alt_form);

	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _idform1$[ebp], eax

; 44   : 	char *bgcolor;
; 45   : 	DynTable cgival = { 0 };

	mov	DWORD PTR _cgival$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _cgival$[ebp+4], ecx
	mov	DWORD PTR _cgival$[ebp+8], ecx
	mov	DWORD PTR _cgival$[ebp+12], ecx
	mov	DWORD PTR _cgival$[ebp+16], ecx

; 46   : 	DynTable data = { 0 };

	mov	DWORD PTR _data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _data$[ebp+4], edx
	mov	DWORD PTR _data$[ebp+8], edx
	mov	DWORD PTR _data$[ebp+12], edx
	mov	DWORD PTR _data$[ebp+16], edx

; 47   : 	DynBuffer **html;
; 48   : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 49   : 	int b_modif = 0;

	mov	DWORD PTR _b_modif$[ebp], 0

; 50   : 	ObjTableFormat tbl = {0};

	mov	DWORD PTR _tbl$[ebp], 0
	mov	ecx, 165				; 000000a5H
	xor	eax, eax
	lea	edi, DWORD PTR _tbl$[ebp+4]
	rep stosd

; 51   : 
; 52   : 	/* Output main table header for opened forms list */
; 53   : 	if(!cntxt->form) cntxt->form = &_form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+80], 0
	jne	SHORT $L70235
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR __form$[ebp]
	mov	DWORD PTR [ecx+80], edx
$L70235:

; 54   : 	html = &cntxt->html;

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29784				; 00007458H
	mov	DWORD PTR _html$[ebp], eax

; 55   : 	cntxt->form->html = html;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _html$[ebp]
	mov	DWORD PTR [edx+232], eax

; 57   : 		"<font face=Arial>"
; 58   : 		"<table border=0 width=100% bgcolor=#EEEEEE><tr>"
; 59   : 		"<td align=center><font size=+1><b>Liste des formulaires ouverts</b></font></td>");

	push	0
	push	0
	push	143					; 0000008fH
	push	OFFSET FLAT:$SG70238
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70237
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70240
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 59		; 0000003bH
	jmp	$eva_err$70241
$L70237:

; 60   : 
; 61   : 	/* Output goback & menu buttons */
; 62   : 	if(dyntab_cmp(&cntxt->id_form, 0, 0, &cntxt->menubar, 0, 0) && 
; 63   : 		dyntab_cmp(&cntxt->id_form, 0, 0, &cntxt->homepage, 0, 0))

	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29528				; 00007358H
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	$L70261
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29548				; 0000736cH
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	$L70261

; 65   : 		DYNBUF_ADD_STR(html, "<td align=center>")

	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70245
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70244
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70247
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 65		; 00000041H
	jmp	$eva_err$70241
$L70244:

; 66   : 		NAME_BUTTON("VIEW");

	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	cmp	DWORD PTR _cginame$[ebp], 0
	je	SHORT $L70249
	push	0
	push	0
	mov	eax, DWORD PTR _cginame$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _cginame$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70249
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70251
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 66		; 00000042H
	jmp	$eva_err$70241
$L70249:
	push	0
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70253
	push	66					; 00000042H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_build_finalname
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70252
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 66		; 00000042H
	jmp	$eva_err$70241
$L70252:

; 67   : 		if(put_html_button(cntxt, name->data, NULL, "_eva_btn_2forms_fr.gif", "_eva_btn_2forms_fr_s.gif", 
; 68   : 			"Afficher les formulaires sélectionnés dans les colonnes Haut et bas\n\n"
; 69   : 			"Vous pouvez afficher deux formulaires simultanément", 0, 0)) STACK_ERROR; 

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70257
	push	OFFSET FLAT:$SG70258
	push	OFFSET FLAT:$SG70259
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70256
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 69		; 00000045H
	jmp	$eva_err$70241
$L70256:

; 70   : 		DYNBUF_ADD_STR(html, "</td>")

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70262
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70261
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70264
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 70		; 00000046H
	jmp	$eva_err$70241
$L70261:

; 72   : 	DYNBUF_ADD_STR(html, "<td align=right>")

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70267
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70266
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70269
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 72		; 00000048H
	jmp	$eva_err$70241
$L70266:

; 73   : 	NAME_BUTTON("MENU");

	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	cmp	DWORD PTR _cginame$[ebp], 0
	je	SHORT $L70271
	push	0
	push	0
	mov	ecx, DWORD PTR _cginame$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _cginame$[ebp]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70271
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70273
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 73		; 00000049H
	jmp	$eva_err$70241
$L70271:
	push	0
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70275
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_build_finalname
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70274
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 73		; 00000049H
	jmp	$eva_err$70241
$L70274:

; 74   : 	if(put_html_button(cntxt, name->data, NULL, "_eva_menu.gif", "_eva_menu_s.gif", 
; 75   : 		"Retour à la page d'accueil", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70279
	push	OFFSET FLAT:$SG70280
	push	OFFSET FLAT:$SG70281
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70278
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 75		; 0000004bH
	jmp	$eva_err$70241
$L70278:

; 77   : 		"</td></tr></table>"
; 78   : 		"<table border=1 cellspacing=0 rules=rows bgcolor=#EEEEEE width=100%><tr>"
; 79   : 		"<td></td><td></td><td align=center><font size=-2>Haut</font></td><td align=center><font size=-2>Bas</font></td><td></td></tr>")

	push	0
	push	0
	push	215					; 000000d7H
	push	OFFSET FLAT:$SG70284
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70283
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70286
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 79		; 0000004fH
	jmp	$eva_err$70241
$L70283:

; 80   : 
; 81   : 	/* For each form found in CGI data */
; 82   : 	for(i = cntxt->nb_cgi - 1, j = 0; i; i--) if(cntxt->cgi[i].name[0] == 'F')

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29652]
	sub	edx, 1
	mov	DWORD PTR _i$[ebp], edx
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70287
$L70288:
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70287:
	cmp	DWORD PTR _i$[ebp], 0
	je	$L70289
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 70					; 00000046H
	jne	$L70394

; 84   : 		CGIData *cgi = cntxt->cgi + i;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	add	edx, eax
	mov	DWORD PTR _cgi$70291[ebp], edx

; 85   : 		char objref[64];
; 86   : 		int b_modified = cgi_check_form_change(cntxt, cgi->IdForm, cgi->IdObj);

	mov	eax, DWORD PTR _cgi$70291[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	mov	edx, DWORD PTR _cgi$70291[ebp]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_check_form_change
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _b_modified$70293[ebp], eax

; 87   : 		if(b_modified == 2) continue;

	cmp	DWORD PTR _b_modified$70293[ebp], 2
	jne	SHORT $L70294
	jmp	$L70288
$L70294:

; 88   : 		b_modif |= b_modified;

	mov	edx, DWORD PTR _b_modif$[ebp]
	or	edx, DWORD PTR _b_modified$70293[ebp]
	mov	DWORD PTR _b_modif$[ebp], edx

; 89   : 		bgcolor = table_row_bgcolor(cntxt, &tbl, j++, NULL);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	mov	DWORD PTR -1616+[ebp], eax
	mov	ecx, DWORD PTR -1616+[ebp]
	push	ecx
	lea	edx, DWORD PTR _tbl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
	call	_table_row_bgcolor
	add	esp, 16					; 00000010H
	mov	DWORD PTR _bgcolor$[ebp], eax

; 90   : 		if(!bgcolor || !*bgcolor) bgcolor = "FFFFFF";

	cmp	DWORD PTR _bgcolor$[ebp], 0
	je	SHORT $L70297
	mov	edx, DWORD PTR _bgcolor$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70296
$L70297:
	mov	DWORD PTR _bgcolor$[ebp], OFFSET FLAT:$SG70298
$L70296:

; 91   : 
; 92   : 		/* Output row header */
; 93   : 		DYNBUF_ADD_STR(html, "<tr>")

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70301
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70300
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70303
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 93		; 0000005dH
	jmp	$eva_err$70241
$L70300:

; 94   : 
; 95   : 		/* Read object data */
; 96   : 		if(cgi_filter_values(cntxt, &cgival, 'D', ~0UL, 
; 97   : 								cgi->IdObj ? ~0UL : cgi->IdForm,
; 98   : 								cgi->IdObj, NULL, "", 0, 0)) STACK_ERROR;

	mov	ecx, DWORD PTR _cgi$70291[ebp]
	cmp	DWORD PTR [ecx+24], 0
	je	SHORT $L70642
	mov	DWORD PTR -1620+[ebp], -1
	jmp	SHORT $L70643
$L70642:
	mov	edx, DWORD PTR _cgi$70291[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	DWORD PTR -1620+[ebp], eax
$L70643:
	push	0
	push	0
	push	OFFSET FLAT:$SG70306
	push	0
	mov	ecx, DWORD PTR _cgi$70291[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	mov	eax, DWORD PTR -1620+[ebp]
	push	eax
	push	-1
	push	68					; 00000044H
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_filter_values
	add	esp, 40					; 00000028H
	test	eax, eax
	je	SHORT $L70305
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 98		; 00000062H
	jmp	$eva_err$70241
$L70305:

; 99   : 		if(cgi->IdObj)

	mov	ecx, DWORD PTR _cgi$70291[ebp]
	cmp	DWORD PTR [ecx+24], 0
	je	$L70315

; 101  : 			unsigned long k;
; 102  : 			if(qry_obj_idfield(cntxt, &data, cgi->IdObj, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _cgi$70291[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70309
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 102		; 00000066H
	jmp	$eva_err$70241
$L70309:

; 103  : 			if(qry_complete_data(cntxt, &cgival, &data, NULL, NULL)) STACK_ERROR;

	push	0
	push	0
	lea	ecx, DWORD PTR _data$[ebp]
	push	ecx
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_complete_data
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70312
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 103		; 00000067H
	jmp	$eva_err$70241
$L70312:

; 104  : 			for(k = cgival.nbrows; k; k--)

	mov	edx, DWORD PTR _cgival$[ebp]
	mov	DWORD PTR _k$70308[ebp], edx
	jmp	SHORT $L70313
$L70314:
	mov	eax, DWORD PTR _k$70308[ebp]
	sub	eax, 1
	mov	DWORD PTR _k$70308[ebp], eax
$L70313:
	cmp	DWORD PTR _k$70308[ebp], 0
	je	SHORT $L70315

; 105  : 				if(!strcmp(dyntab_cell(&cgival, k - 1, 0)->field, "_EVA_FORMSTAMP"))

	push	OFFSET FLAT:$SG70317
	push	0
	mov	ecx, DWORD PTR _k$70308[ebp]
	sub	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70316

; 106  : 					dyntab_del_rows(&cgival, k - 1, 1);

	push	1
	mov	ecx, DWORD PTR _k$70308[ebp]
	sub	ecx, 1
	push	ecx
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_del_rows
	add	esp, 12					; 0000000cH
$L70316:

; 107  : 		}

	jmp	SHORT $L70314
$L70315:

; 108  : 		DYNTAB_ADD_INT(&cgival, cgival.nbrows, 0, cgi->IdForm);

	mov	BYTE PTR __tmp$70318[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70318[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _cgi$70291[ebp]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	push	OFFSET FLAT:$SG70319
	lea	edx, DWORD PTR __tmp$70318[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR __tmp$70318[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70321
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70323
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 108		; 0000006cH
	jmp	$eva_err$70241
$L70321:

; 110  : 			DynTableCell *c = dyntab_cell(&cgival, cgival.nbrows - 1, 0);

	push	0
	mov	edx, DWORD PTR _cgival$[ebp]
	sub	edx, 1
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70324[ebp], eax

; 111  : 			c->field = "_EVA_FORMSTAMP";

	mov	ecx, DWORD PTR _c$70324[ebp]
	mov	DWORD PTR [ecx+8], OFFSET FLAT:$SG70325

; 112  : 			c->b_dontfreefield = 1;

	mov	edx, DWORD PTR _c$70324[ebp]
	mov	BYTE PTR [edx+15], 1

; 113  : 			c->IdObj = cgi->IdObj;

	mov	eax, DWORD PTR _c$70324[ebp]
	mov	ecx, DWORD PTR _cgi$70291[ebp]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR [eax+20], edx

; 115  : 
; 116  : 		/* Output open button */
; 117  : 		if(ctrl_add_symbol_btn(cntxt, NULL, NULL, &cgival, 0, bgcolor, "SYMBOL+NAME+LABEL+OBJNOTES"))

	push	OFFSET FLAT:$SG70329
	mov	eax, DWORD PTR _bgcolor$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_add_symbol_btn
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70328

; 118  : 			CLEAR_ERROR;

	push	118					; 00000076H
	push	OFFSET FLAT:$SG70330
	push	OFFSET FLAT:$SG70331
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70328:

; 119  : 
; 120  : 		/* Output display position radio buttons */
; 121  : 		NAME_VALUE("TOPFRM")

	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	cmp	DWORD PTR _cginame$[ebp], 0
	je	SHORT $L70333
	push	0
	push	0
	mov	edx, DWORD PTR _cginame$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _cginame$[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70333
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70335
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 121		; 00000079H
	jmp	$eva_err$70241
$L70333:
	push	0
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70337
	push	67					; 00000043H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_build_finalname
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70336
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 121		; 00000079H
	jmp	$eva_err$70241
$L70336:

; 122  : 		DYNBUF_ADD3(html, "<td align=center bgcolor=", bgcolor, 6, NO_CONV, ">")

	push	1
	push	OFFSET FLAT:$SG70340
	push	0
	push	0
	push	6
	mov	edx, DWORD PTR _bgcolor$[ebp]
	push	edx
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70341
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70339
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70343
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 122		; 0000007aH
	jmp	$eva_err$70241
$L70339:

; 123  : 		if(put_html_chkbox(cntxt, DYNBUF_VAL_SZ(name),
; 124  : 				objref, snprintf(add_sz_str(objref), "%lu,%lu", cgi->IdObj, cgi->IdForm), 
; 125  : 				2 | (cgi->IdForm == idform0 && cgi->IdObj == idobj0), 0)) STACK_ERROR;

	mov	eax, DWORD PTR _cgi$70291[ebp]
	mov	ecx, DWORD PTR [eax+20]
	cmp	ecx, DWORD PTR _idform0$[ebp]
	jne	SHORT $L70644
	mov	edx, DWORD PTR _cgi$70291[ebp]
	mov	eax, DWORD PTR [edx+24]
	cmp	eax, DWORD PTR _idobj0$[ebp]
	jne	SHORT $L70644
	mov	DWORD PTR -1624+[ebp], 1
	jmp	SHORT $L70645
$L70644:
	mov	DWORD PTR -1624+[ebp], 0
$L70645:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70646
	mov	ecx, DWORD PTR _name$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR -1628+[ebp], edx
	jmp	SHORT $L70647
$L70646:
	mov	DWORD PTR -1628+[ebp], 0
$L70647:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70648
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	mov	DWORD PTR -1632+[ebp], eax
	jmp	SHORT $L70649
$L70648:
	mov	DWORD PTR -1632+[ebp], 0
$L70649:
	push	0
	mov	ecx, DWORD PTR -1624+[ebp]
	or	ecx, 2
	push	ecx
	mov	edx, DWORD PTR _cgi$70291[ebp]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	mov	ecx, DWORD PTR _cgi$70291[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	push	OFFSET FLAT:$SG70346
	push	63					; 0000003fH
	lea	eax, DWORD PTR _objref$70292[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	ecx, DWORD PTR _objref$70292[ebp]
	push	ecx
	mov	edx, DWORD PTR -1628+[ebp]
	push	edx
	mov	eax, DWORD PTR -1632+[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_chkbox
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70345
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 125		; 0000007dH
	jmp	$eva_err$70241
$L70345:

; 126  : 		NAME_VALUE("BOTFRM")

	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	cmp	DWORD PTR _cginame$[ebp], 0
	je	SHORT $L70348
	push	0
	push	0
	mov	ecx, DWORD PTR _cginame$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _cginame$[ebp]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70348
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70350
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 126		; 0000007eH
	jmp	$eva_err$70241
$L70348:
	push	0
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70352
	push	67					; 00000043H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_build_finalname
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70351
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 126		; 0000007eH
	jmp	$eva_err$70241
$L70351:

; 127  : 		DYNBUF_ADD3(html, "</td><td align=center bgcolor=", bgcolor, 6, NO_CONV, ">")

	push	1
	push	OFFSET FLAT:$SG70355
	push	0
	push	0
	push	6
	mov	ecx, DWORD PTR _bgcolor$[ebp]
	push	ecx
	push	30					; 0000001eH
	push	OFFSET FLAT:$SG70356
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70354
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70358
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 127		; 0000007fH
	jmp	$eva_err$70241
$L70354:

; 128  : 		if(put_html_chkbox(cntxt, DYNBUF_VAL_SZ(name),
; 129  : 				objref, snprintf(add_sz_str(objref), "%lu,%lu", cgi->IdObj, cgi->IdForm), 
; 130  : 				2 | (cgi->IdForm == idform1 && cgi->IdObj == idobj1), 0)) STACK_ERROR;

	mov	edx, DWORD PTR _cgi$70291[ebp]
	mov	eax, DWORD PTR [edx+20]
	cmp	eax, DWORD PTR _idform1$[ebp]
	jne	SHORT $L70650
	mov	ecx, DWORD PTR _cgi$70291[ebp]
	mov	edx, DWORD PTR [ecx+24]
	cmp	edx, DWORD PTR _idobj1$[ebp]
	jne	SHORT $L70650
	mov	DWORD PTR -1636+[ebp], 1
	jmp	SHORT $L70651
$L70650:
	mov	DWORD PTR -1636+[ebp], 0
$L70651:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70652
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -1640+[ebp], ecx
	jmp	SHORT $L70653
$L70652:
	mov	DWORD PTR -1640+[ebp], 0
$L70653:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70654
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	mov	DWORD PTR -1644+[ebp], edx
	jmp	SHORT $L70655
$L70654:
	mov	DWORD PTR -1644+[ebp], 0
$L70655:
	push	0
	mov	eax, DWORD PTR -1636+[ebp]
	or	al, 2
	push	eax
	mov	ecx, DWORD PTR _cgi$70291[ebp]
	mov	edx, DWORD PTR [ecx+20]
	push	edx
	mov	eax, DWORD PTR _cgi$70291[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	push	OFFSET FLAT:$SG70361
	push	63					; 0000003fH
	lea	edx, DWORD PTR _objref$70292[ebp]
	push	edx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	eax, DWORD PTR _objref$70292[ebp]
	push	eax
	mov	ecx, DWORD PTR -1640+[ebp]
	push	ecx
	mov	edx, DWORD PTR -1644+[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_chkbox
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70360
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 130		; 00000082H
	jmp	$eva_err$70241
$L70360:

; 131  :  		DYNBUF_ADD_STR(html, "</td>")

	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70364
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70363
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70366
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 131		; 00000083H
	jmp	$eva_err$70241
$L70363:

; 132  : 
; 133  : 		/* Output close button depending on modified status */
; 134  : 		NAME_BUTTON_SZ(objref, snprintf(objref, sizeof(objref), "CLOSE=%lu,%lu", cgi->IdObj, cgi->IdForm));

	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	cmp	DWORD PTR _cginame$[ebp], 0
	je	SHORT $L70368
	push	0
	push	0
	mov	eax, DWORD PTR _cginame$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _cginame$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70368
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70370
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 134		; 00000086H
	jmp	$eva_err$70241
$L70368:
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cgi$70291[ebp]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	mov	edx, DWORD PTR _cgi$70291[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	push	OFFSET FLAT:$SG70372
	push	64					; 00000040H
	lea	ecx, DWORD PTR _objref$70292[ebp]
	push	ecx
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	edx, DWORD PTR _objref$70292[ebp]
	push	edx
	push	66					; 00000042H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_build_finalname
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70371
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 134		; 00000086H
	jmp	$eva_err$70241
$L70371:

; 135  : 		DYNBUF_ADD3(html, "<td align=right bgcolor=", bgcolor, 6, NO_CONV, ">")

	push	1
	push	OFFSET FLAT:$SG70375
	push	0
	push	0
	push	6
	mov	eax, DWORD PTR _bgcolor$[ebp]
	push	eax
	push	24					; 00000018H
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
	mov	DWORD PTR [eax+29900], 135		; 00000087H
	jmp	$eva_err$70241
$L70374:

; 136  : 		if(b_modified)

	cmp	DWORD PTR _b_modified$70293[ebp], 0
	je	SHORT $L70379

; 138  : 			if(put_html_button(cntxt, name->data, "Fermer", "_eva_btn_close1_fr.gif", "_eva_btn_close1_fr_s.gif",
; 139  : 				"Attention : fiche modifiée\n\n"
; 140  : 				"Un dialogue vous demande de confirmer la fermeture\n\n"
; 141  : 				"Décochez la case 'Confirmation' pour ne pas afficher de confirmation", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70382
	push	OFFSET FLAT:$SG70383
	push	OFFSET FLAT:$SG70384
	push	OFFSET FLAT:$SG70385
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70381
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 141		; 0000008dH
	jmp	$eva_err$70241
$L70381:

; 143  : 		else

	jmp	SHORT $L70389
$L70379:

; 145  : 			if(put_html_button(cntxt, name->data, "Fermer", "_eva_btn_close_fr.gif", "_eva_btn_close_fr_s.gif", NULL, 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70390
	push	OFFSET FLAT:$SG70391
	push	OFFSET FLAT:$SG70392
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70389
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 145		; 00000091H
	jmp	$eva_err$70241
$L70389:

; 147  : 		DYNBUF_ADD_STR(html, "</td></tr>")

	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70395
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70394
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70397
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 147		; 00000093H
	jmp	$eva_err$70241
$L70394:

; 149  : 
; 150  : 	switch(j)

	jmp	$L70288
$L70289:

; 151  : 	{

	mov	ecx, DWORD PTR _j$[ebp]
	mov	DWORD PTR -1648+[ebp], ecx
	cmp	DWORD PTR -1648+[ebp], 0
	je	SHORT $L70402
	cmp	DWORD PTR -1648+[ebp], 1
	je	SHORT $L70408
	jmp	$L70422
$L70402:

; 152  : 	case 0:
; 153  : 		DYNBUF_ADD_STR(html, "<tr><td colspan=6 align=center bgcolor=#DDDDDD><b>Aucune fenêtre ouverte</b>");

	push	0
	push	0
	push	76					; 0000004cH
	push	OFFSET FLAT:$SG70405
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70404
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70407
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 153		; 00000099H
	jmp	$eva_err$70241
$L70404:

; 154  : 		break;

	jmp	$L70399
$L70408:

; 155  : 	case 1: 
; 156  : 		/* Output Confirm input */
; 157  : 		NAME_VALUE("CONFIRM");

	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	cmp	DWORD PTR _cginame$[ebp], 0
	je	SHORT $L70410
	push	0
	push	0
	mov	eax, DWORD PTR _cginame$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _cginame$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70410
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70412
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 157		; 0000009dH
	jmp	$eva_err$70241
$L70410:
	push	0
	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70414
	push	67					; 00000043H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_build_finalname
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70413
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 157		; 0000009dH
	jmp	$eva_err$70241
$L70413:

; 158  : 		DYNBUF_ADD3_BUF(html, "<input type=hidden name='", name, NO_CONV, "' value=1>");

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70656
	mov	eax, DWORD PTR _name$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -1652+[ebp], ecx
	jmp	SHORT $L70657
$L70656:
	mov	DWORD PTR -1652+[ebp], 0
$L70657:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70658
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	mov	DWORD PTR -1656+[ebp], edx
	jmp	SHORT $L70659
$L70658:
	mov	DWORD PTR -1656+[ebp], 0
$L70659:
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70418
	push	0
	push	0
	mov	eax, DWORD PTR -1652+[ebp]
	push	eax
	mov	ecx, DWORD PTR -1656+[ebp]
	push	ecx
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70419
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70417
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70421
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 158		; 0000009eH
	jmp	$eva_err$70241
$L70417:

; 159  : 		break;

	jmp	$L70399
$L70422:

; 160  : 	default:
; 161  : 		/* Output close all buttons */
; 162  : 		DYNBUF_ADD_STR(html, "<tr><td colspan=6><table width=100% height=50><tr>");

	push	0
	push	0
	push	50					; 00000032H
	push	OFFSET FLAT:$SG70425
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70424
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70427
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 162		; 000000a2H
	jmp	$eva_err$70241
$L70424:

; 163  : 		if(b_modif)

	cmp	DWORD PTR _b_modif$[ebp], 0
	je	$L70428

; 165  : 			/* Output close no save button */
; 166  : 			char printbuf[512];
; 167  : 			DYNBUF_ADD_STR(html, "<td align=center>");

	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70432
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70431
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70434
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 167		; 000000a7H
	jmp	$eva_err$70241
$L70431:

; 168  : 			NAME_BUTTON("CLOSEALLNOSAVE");

	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	cmp	DWORD PTR _cginame$[ebp], 0
	je	SHORT $L70436
	push	0
	push	0
	mov	eax, DWORD PTR _cginame$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _cginame$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70436
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70438
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 168		; 000000a8H
	jmp	$eva_err$70241
$L70436:
	push	0
	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70440
	push	66					; 00000042H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_build_finalname
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70439
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 168		; 000000a8H
	jmp	$eva_err$70241
$L70439:

; 169  : 			if(put_html_button(cntxt, name->data, NULL, "_eva_btn_closeall1_fr.gif", "_eva_btn_closeall1_fr_s.gif",
; 170  : 				"Ferme tous les formulaires ouverts et retourne à la page d'accueil\n\n"
; 171  : 				"Les fiches modifiées ne sont pas fermées si la case 'Confirmation' est cochée\n\n"
; 172  : 				"Dans le cas contraire, les données modifiées sont perdues", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70444
	push	OFFSET FLAT:$SG70445
	push	OFFSET FLAT:$SG70446
	push	0
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70443
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 172		; 000000acH
	jmp	$eva_err$70241
$L70443:

; 173  : 
; 174  : 			/* Output Confirm checkbox */
; 175  : 			NAME_VALUE("CONFIRM");

	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	cmp	DWORD PTR _cginame$[ebp], 0
	je	SHORT $L70448
	push	0
	push	0
	mov	ecx, DWORD PTR _cginame$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _cginame$[ebp]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70448
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70450
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 175		; 000000afH
	jmp	$eva_err$70241
$L70448:
	push	0
	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70452
	push	67					; 00000043H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_build_finalname
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70451
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 175		; 000000afH
	jmp	$eva_err$70241
$L70451:

; 176  : 			dynbuf_print2(html, "</td><td align=center colspan=2><input type=checkbox name='%s' %s>Confirmation", 
; 177  : 				name->data, b_confirm ? "checked" : "");

	cmp	DWORD PTR _b_confirm$[ebp], 0
	je	SHORT $L70660
	mov	DWORD PTR -1660+[ebp], OFFSET FLAT:$SG70454
	jmp	SHORT $L70661
$L70660:
	mov	DWORD PTR -1660+[ebp], OFFSET FLAT:$SG70455
$L70661:
	push	0
	push	0
	mov	ecx, DWORD PTR -1660+[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	push	OFFSET FLAT:$SG70456
	push	511					; 000001ffH
	lea	eax, DWORD PTR _printbuf$70429[ebp]
	push	eax
	call	__snprintf
	add	esp, 20					; 00000014H
	push	eax
	lea	ecx, DWORD PTR _printbuf$70429[ebp]
	push	ecx
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H

; 178  : 
; 179  : 			/* Output close unmodified forms button */
; 180  : 			DYNBUF_ADD_STR(html, "</td><td align=right>");

	push	0
	push	0
	push	21					; 00000015H
	push	OFFSET FLAT:$SG70459
	mov	eax, DWORD PTR _html$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70458
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70461
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 180		; 000000b4H
	jmp	$eva_err$70241
$L70458:

; 181  : 			NAME_BUTTON("CLOSEALL");

	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	cmp	DWORD PTR _cginame$[ebp], 0
	je	SHORT $L70463
	push	0
	push	0
	mov	ecx, DWORD PTR _cginame$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _cginame$[ebp]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70463
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70465
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 181		; 000000b5H
	jmp	$eva_err$70241
$L70463:
	push	0
	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70467
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_build_finalname
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70466
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 181		; 000000b5H
	jmp	$eva_err$70241
$L70466:

; 182  : 			if(put_html_button(cntxt, name->data, NULL, "_eva_btn_closeall_fr.gif", "_eva_btn_closeall_fr_s.gif",
; 183  : 				"Ferme tous les formulaires non modifiés et affiche le premier formulaire modifié", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70471
	push	OFFSET FLAT:$SG70472
	push	OFFSET FLAT:$SG70473
	push	0
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70470
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 183		; 000000b7H
	jmp	$eva_err$70241
$L70470:

; 184  : 		}else

	jmp	$L70487
$L70428:

; 186  : 			DYNBUF_ADD_STR(html, "<td align=right>");

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70477
	mov	ecx, DWORD PTR _html$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70476
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70479
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 186		; 000000baH
	jmp	$eva_err$70241
$L70476:

; 187  : 			NAME_BUTTON("CLOSEALL");

	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	cmp	DWORD PTR _cginame$[ebp], 0
	je	SHORT $L70481
	push	0
	push	0
	mov	edx, DWORD PTR _cginame$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _cginame$[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70481
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70483
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 187		; 000000bbH
	jmp	$eva_err$70241
$L70481:
	push	0
	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70485
	push	66					; 00000042H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_build_finalname
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70484
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 187		; 000000bbH
	jmp	$eva_err$70241
$L70484:

; 188  : 			if(put_html_button(cntxt, name->data, "Tout fermer", "_eva_btn_closeall_fr.gif", "_eva_btn_closeall_fr_s.gif",
; 189  : 				"Ferme tous les formulaires ouverts et retourne à la page d'accueil", 0, 0)) STACK_ERROR;

	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70488
	push	OFFSET FLAT:$SG70489
	push	OFFSET FLAT:$SG70490
	push	OFFSET FLAT:$SG70491
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70487
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 189		; 000000bdH
	jmp	$eva_err$70241
$L70487:

; 191  : 		DYNBUF_ADD_STR(html, "</td></tr></table>");

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70494
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70493
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70496
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 191		; 000000bfH
	jmp	$eva_err$70241
$L70493:
$L70399:

; 193  : 	DYNBUF_ADD_STR(html, "</td></tr></table></font>");

	push	0
	push	0
	push	25					; 00000019H
	push	OFFSET FLAT:$SG70499
	mov	edx, DWORD PTR _html$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70498
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70501
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 193		; 000000c1H
	jmp	SHORT $eva_err$70241
$L70498:

; 194  : 
; 195  : 	/* Clear displayed forms */
; 196  : 	dyntab_free(&cntxt->id_obj);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 197  : 	dyntab_free(&cntxt->id_form);

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 198  : 	dyntab_free(&cntxt->alt_obj);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 60					; 0000003cH
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 199  : 	dyntab_free(&cntxt->alt_form);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	call	_dyntab_free
	add	esp, 4
$eva_noerr$70502:

; 200  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70503
	push	OFFSET FLAT:$SG70504
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70241:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70505
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70506
	push	OFFSET FLAT:$SG70507
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70505:
	lea	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+80], 0
	lea	eax, DWORD PTR _tbl$[ebp]
	push	eax
	call	_table_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 201  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_dlg_openedforms_output ENDP
_TEXT	ENDS
PUBLIC	_dlg_openedforms
EXTRN	_cgi_get_values:NEAR
EXTRN	_form_close_nosave:NEAR
EXTRN	_form_load:NEAR
EXTRN	_form_save_dialog:NEAR
EXTRN	_strchr:NEAR
EXTRN	_strncmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70526 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70537 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70542 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70544 DB	'TOPFRM', 00H
	ORG $+1
$SG70549 DB	'%lu', 00H
$SG70553 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70555 DB	'%lu', 00H
$SG70559 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70563 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70565 DB	'BOTFRM', 00H
	ORG $+1
$SG70570 DB	'%lu', 00H
$SG70574 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70576 DB	'%lu', 00H
$SG70580 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70582 DB	'VIEW', 00H
	ORG $+3
$SG70587 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70589 DB	'CONFIRM', 00H
$SG70592 DB	'CLOSEALL', 00H
	ORG $+3
$SG70603 DB	'CLOSEALLNOSAVE', 00H
	ORG $+1
$SG70607 DB	'CLOSE', 00H
	ORG $+2
$SG70613 DB	'%lu', 00H
$SG70617 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70620 DB	'%lu', 00H
$SG70624 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70628 DB	'_EVA_CONFIRMCHANGES', 00H
$SG70631 DB	'MENU', 00H
	ORG $+3
$SG70633 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dlg_openedforms.'
	DB	'c', 00H
	ORG $+2
$SG70634 DB	'dlg_openedforms', 00H
$SG70636 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dlg_openedforms.'
	DB	'c', 00H
	ORG $+2
$SG70637 DB	'dlg_openedforms', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -56
_i$ = -40
_cgival$ = -36
_cginame$ = -52
_name$ = -48
_btn$ = -16
_equal$ = -64
_idobj$ = -8
_c$ = -12
_idform$ = -44
_b_confirm$ = -60
__tmp$70548 = -96
__tmp$70554 = -128
__tmp$70569 = -160
__tmp$70575 = -192
_b_exit$70593 = -196
_cgi$70598 = -204
_b_modified$70599 = -200
_b_modified$70608 = -208
__tmp$70612 = -240
__tmp$70619 = -272
_dlg_openedforms PROC NEAR

; 217  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 296				; 00000128H
	push	edi

; 218  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 219  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 220  : 	unsigned long i;
; 221  : 	DynTable cgival = { 0 };

	mov	DWORD PTR _cgival$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cgival$[ebp+4], edx
	mov	DWORD PTR _cgival$[ebp+8], edx
	mov	DWORD PTR _cgival$[ebp+12], edx
	mov	DWORD PTR _cgival$[ebp+16], edx

; 222  : 	DynBuffer *cginame = NULL;

	mov	DWORD PTR _cginame$[ebp], 0

; 223  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 224  : 	char *btn = CGI_CLICK_BTN_SUBFIELD;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29648], 0
	je	SHORT $L70663
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 66					; 00000042H
	jne	SHORT $L70663
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	cmp	DWORD PTR [ecx+edx+32], 0
	je	SHORT $L70663
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+32]
	mov	DWORD PTR -276+[ebp], eax
	jmp	SHORT $L70664
$L70663:
	mov	DWORD PTR -276+[ebp], OFFSET FLAT:$SG70526
$L70664:
	mov	ecx, DWORD PTR -276+[ebp]
	mov	DWORD PTR _btn$[ebp], ecx

; 225  : 	char *equal = strchr(btn, '=');

	push	61					; 0000003dH
	mov	edx, DWORD PTR _btn$[ebp]
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR _equal$[ebp], eax

; 226  : 	unsigned long idobj = equal ? strtoul(equal + 1, NULL, 10) : 0;

	cmp	DWORD PTR _equal$[ebp], 0
	je	SHORT $L70665
	push	10					; 0000000aH
	push	0
	mov	eax, DWORD PTR _equal$[ebp]
	add	eax, 1
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -280+[ebp], eax
	jmp	SHORT $L70666
$L70665:
	mov	DWORD PTR -280+[ebp], 0
$L70666:
	mov	ecx, DWORD PTR -280+[ebp]
	mov	DWORD PTR _idobj$[ebp], ecx

; 227  : 	char *c = equal ? strchr(equal, ',') : NULL;

	cmp	DWORD PTR _equal$[ebp], 0
	je	SHORT $L70667
	push	44					; 0000002cH
	mov	edx, DWORD PTR _equal$[ebp]
	push	edx
	call	_strchr
	add	esp, 8
	mov	DWORD PTR -284+[ebp], eax
	jmp	SHORT $L70668
$L70667:
	mov	DWORD PTR -284+[ebp], 0
$L70668:
	mov	eax, DWORD PTR -284+[ebp]
	mov	DWORD PTR _c$[ebp], eax

; 228  : 	unsigned long idform = c ? strtoul(c + 1, &c, 10) : 0;

	cmp	DWORD PTR _c$[ebp], 0
	je	SHORT $L70669
	push	10					; 0000000aH
	lea	ecx, DWORD PTR _c$[ebp]
	push	ecx
	mov	edx, DWORD PTR _c$[ebp]
	add	edx, 1
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -288+[ebp], eax
	jmp	SHORT $L70670
$L70669:
	mov	DWORD PTR -288+[ebp], 0
$L70670:
	mov	eax, DWORD PTR -288+[ebp]
	mov	DWORD PTR _idform$[ebp], eax

; 229  : 	int b_confirm;
; 230  : 
; 231  : 	/* Memorize calling control cginame */
; 232  : 	DYNBUF_ADD_BUF(&cginame, ctrl->cginame, NO_CONV);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+40], 0
	je	SHORT $L70535
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
	lea	ecx, DWORD PTR _cginame$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70535
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70537
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 232		; 000000e8H
	jmp	$eva_err$70538
$L70535:

; 233  : 
; 234  : 	/* Handle selected main & alt form */
; 235  : 	NAME_VALUE("TOPFRM");

	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	cmp	DWORD PTR _cginame$[ebp], 0
	je	SHORT $L70540
	push	0
	push	0
	mov	edx, DWORD PTR _cginame$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _cginame$[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70540
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70542
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 235		; 000000ebH
	jmp	$eva_err$70538
$L70540:
	push	0
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70544
	push	67					; 00000043H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_build_finalname
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70543
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 235		; 000000ebH
	jmp	$eva_err$70538
$L70543:

; 236  : 	if(cgi_get_values(cntxt, &cgival, name->data, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_get_values
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70545
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 236		; 000000ecH
	jmp	$eva_err$70538
$L70545:

; 237  : 	if(cgival.nbrows)

	cmp	DWORD PTR _cgival$[ebp], 0
	je	$L70557

; 239  : 		i = strtoul(cgival.cell->txt, &c, 10);

	push	10					; 0000000aH
	lea	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgival$[ebp+16]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _i$[ebp], eax

; 240  : 		if(i) DYNTAB_ADD_INT(&cntxt->id_obj, 0, 0, i);

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70551
	mov	BYTE PTR __tmp$70548[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70548[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70549
	lea	ecx, DWORD PTR __tmp$70548[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$70548[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70551
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70553
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 240		; 000000f0H
	jmp	$eva_err$70538
$L70551:

; 241  : 		DYNTAB_ADD_INT(&cntxt->id_form, 0, 0, c ? strtoul(c + 1, &c, 10) : 0);

	mov	BYTE PTR __tmp$70554[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70554[ebp+1]
	rep stosd
	stosw
	stosb
	cmp	DWORD PTR _c$[ebp], 0
	je	SHORT $L70671
	push	10					; 0000000aH
	lea	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$[ebp]
	add	ecx, 1
	push	ecx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -292+[ebp], eax
	jmp	SHORT $L70672
$L70671:
	mov	DWORD PTR -292+[ebp], 0
$L70672:
	mov	edx, DWORD PTR -292+[ebp]
	push	edx
	push	OFFSET FLAT:$SG70555
	lea	eax, DWORD PTR __tmp$70554[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$70554[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70557
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70559
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 241		; 000000f1H
	jmp	$eva_err$70538
$L70557:

; 243  : 	NAME_VALUE("BOTFRM");

	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	cmp	DWORD PTR _cginame$[ebp], 0
	je	SHORT $L70561
	push	0
	push	0
	mov	eax, DWORD PTR _cginame$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _cginame$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70561
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70563
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 243		; 000000f3H
	jmp	$eva_err$70538
$L70561:
	push	0
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70565
	push	67					; 00000043H
	lea	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_build_finalname
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70564
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 243		; 000000f3H
	jmp	$eva_err$70538
$L70564:

; 244  : 	if(cgi_get_values(cntxt, &cgival, name->data, 0)) STACK_ERROR;

	push	0
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
	je	SHORT $L70566
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 244		; 000000f4H
	jmp	$eva_err$70538
$L70566:

; 245  : 	if(cgival.nbrows)

	cmp	DWORD PTR _cgival$[ebp], 0
	je	$L70578

; 247  : 		i = strtoul(cgival.cell->txt, &c, 10);

	push	10					; 0000000aH
	lea	ecx, DWORD PTR _c$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cgival$[ebp+16]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _i$[ebp], eax

; 248  : 		if(i) DYNTAB_ADD_INT(&cntxt->alt_obj, 0, 0, i);

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70572
	mov	BYTE PTR __tmp$70569[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70569[ebp+1]
	rep stosd
	stosw
	stosb
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70570
	lea	edx, DWORD PTR __tmp$70569[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR __tmp$70569[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 60					; 0000003cH
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70572
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70574
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 248		; 000000f8H
	jmp	$eva_err$70538
$L70572:

; 249  : 		DYNTAB_ADD_INT(&cntxt->alt_form, 0, 0, c ? strtoul(c + 1, &c, 10) : 0);

	mov	BYTE PTR __tmp$70575[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70575[ebp+1]
	rep stosd
	stosw
	stosb
	cmp	DWORD PTR _c$[ebp], 0
	je	SHORT $L70673
	push	10					; 0000000aH
	lea	ecx, DWORD PTR _c$[ebp]
	push	ecx
	mov	edx, DWORD PTR _c$[ebp]
	add	edx, 1
	push	edx
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -296+[ebp], eax
	jmp	SHORT $L70674
$L70673:
	mov	DWORD PTR -296+[ebp], 0
$L70674:
	mov	eax, DWORD PTR -296+[ebp]
	push	eax
	push	OFFSET FLAT:$SG70576
	lea	ecx, DWORD PTR __tmp$70575[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$70575[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70578
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70580
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 249		; 000000f9H
	jmp	$eva_err$70538
$L70578:

; 251  : 
; 252  : 	/* Exit if view button clicked */
; 253  : 	if(!strncmp(btn, add_sz_str("VIEW"))) RETURN_OK;

	push	4
	push	OFFSET FLAT:$SG70582
	mov	eax, DWORD PTR _btn$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70581
	jmp	$eva_noerr$70583
$L70581:

; 254  : 
; 255  : 	/* Read Confirm checkbox status */
; 256  : 	NAME_VALUE("CONFIRM");

	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	cmp	DWORD PTR _cginame$[ebp], 0
	je	SHORT $L70585
	push	0
	push	0
	mov	edx, DWORD PTR _cginame$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _cginame$[ebp]
	add	ecx, 8
	push	ecx
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70585
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70587
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 256		; 00000100H
	jmp	$eva_err$70538
$L70585:
	push	0
	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70589
	push	67					; 00000043H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_build_finalname
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70588
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 256		; 00000100H
	jmp	$eva_err$70538
$L70588:

; 257  : 	if(cgi_get_values(cntxt, &cgival, name->data, 0)) STACK_ERROR;

	push	0
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_get_values
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70590
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 257		; 00000101H
	jmp	$eva_err$70538
$L70590:

; 258  : 	b_confirm = cgival.nbrows > 0;

	xor	eax, eax
	cmp	eax, DWORD PTR _cgival$[ebp]
	sbb	ecx, ecx
	neg	ecx
	mov	DWORD PTR _b_confirm$[ebp], ecx

; 259  : 	DYNTAB_FREE(cgival);

	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4

; 260  : 
; 261  : 	/* Handle close buttons */
; 262  : 	if(!strncmp(btn, add_sz_str("CLOSEALL"))) 

	push	8
	push	OFFSET FLAT:$SG70592
	mov	eax, DWORD PTR _btn$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70591

; 264  : 		/* For each form found in CGI data */
; 265  : 		int b_exit = 1;

	mov	DWORD PTR _b_exit$70593[ebp], 1

; 266  : 		for(i = 0; i < cntxt->nb_cgi; i++) if(cntxt->cgi[i].name[0] == 'F')

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70594
$L70595:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70594:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+29652]
	jae	$L70596
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 56					; 00000038H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29648]
	mov	ecx, DWORD PTR [eax+ecx]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 70					; 00000046H
	jne	$L70597

; 268  : 			CGIData *cgi = cntxt->cgi + i;

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	add	edx, eax
	mov	DWORD PTR _cgi$70598[ebp], edx

; 269  : 			int b_modified = cgi_check_form_change(cntxt, cgi->IdForm, cgi->IdObj);

	mov	eax, DWORD PTR _cgi$70598[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	mov	edx, DWORD PTR _cgi$70598[ebp]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_cgi_check_form_change
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _b_modified$70599[ebp], eax

; 270  : 			if(b_modified == 2) continue;

	cmp	DWORD PTR _b_modified$70599[ebp], 2
	jne	SHORT $L70600
	jmp	$L70595
$L70600:

; 271  : 			if(b_modified && (b_confirm || strcmp(btn, "CLOSEALLNOSAVE"))) { b_exit = 0; continue; }

	cmp	DWORD PTR _b_modified$70599[ebp], 0
	je	SHORT $L70601
	cmp	DWORD PTR _b_confirm$[ebp], 0
	jne	SHORT $L70602
	push	OFFSET FLAT:$SG70603
	mov	edx, DWORD PTR _btn$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70601
$L70602:
	mov	DWORD PTR _b_exit$70593[ebp], 0
	jmp	$L70595
$L70601:

; 272  : 			form_close_nosave(cntxt, cgi->IdForm, cgi->IdObj, &cgival);

	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cgi$70598[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	mov	eax, DWORD PTR _cgi$70598[ebp]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_close_nosave
	add	esp, 16					; 00000010H
$L70597:

; 274  : 		if(b_exit) RETURN_OK;

	jmp	$L70595
$L70596:
	cmp	DWORD PTR _b_exit$70593[ebp], 0
	je	SHORT $L70604
	jmp	$eva_noerr$70583
$L70604:

; 276  : 	else if(!strncmp(btn, add_sz_str("CLOSE")) && idform)

	jmp	$L70630
$L70591:
	push	5
	push	OFFSET FLAT:$SG70607
	mov	eax, DWORD PTR _btn$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$L70606
	cmp	DWORD PTR _idform$[ebp], 0
	je	$L70606

; 278  : 		int b_modified = cgi_check_form_change(cntxt, idform, idobj);

	mov	ecx, DWORD PTR _idobj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _idform$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_cgi_check_form_change
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _b_modified$70608[ebp], eax

; 279  : 		if(!b_modified || !b_confirm)

	cmp	DWORD PTR _b_modified$70608[ebp], 0
	je	SHORT $L70610
	cmp	DWORD PTR _b_confirm$[ebp], 0
	jne	SHORT $L70609
$L70610:

; 280  : 			form_close_nosave(cntxt, idform, idobj, &cgival);

	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _idobj$[ebp]
	push	edx
	mov	eax, DWORD PTR _idform$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_close_nosave
	add	esp, 16					; 00000010H

; 281  : 		else

	jmp	$L70611
$L70609:

; 283  : 			DYNTAB_ADD_INT(&cntxt->id_form, 0, 0, idform);

	mov	BYTE PTR __tmp$70612[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70612[ebp+1]
	rep stosd
	stosw
	stosb
	mov	edx, DWORD PTR _idform$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70613
	lea	eax, DWORD PTR __tmp$70612[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR __tmp$70612[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70615
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70617
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 283		; 0000011bH
	jmp	$eva_err$70538
$L70615:

; 284  : 			DYNTAB_FREE(cntxt->id_obj);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 285  : 			if(idobj) DYNTAB_ADD_INT(&cntxt->id_obj, 0, 0, idobj);

	cmp	DWORD PTR _idobj$[ebp], 0
	je	SHORT $L70622
	mov	BYTE PTR __tmp$70619[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR __tmp$70619[ebp+1]
	rep stosd
	stosw
	stosb
	mov	eax, DWORD PTR _idobj$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70620
	lea	ecx, DWORD PTR __tmp$70619[ebp]
	push	ecx
	call	_sprintf
	add	esp, 12					; 0000000cH
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR __tmp$70619[ebp]
	push	edx
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70622
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70624
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 285		; 0000011dH
	jmp	$eva_err$70538
$L70622:

; 286  : 			if(form_load(cntxt, &cntxt->id_form, &cntxt->id_obj, 0) ||
; 287  : 				form_save_dialog(cntxt, 0, "_EVA_CONFIRMCHANGES", BUTN_SAVE_CLOSE | BUTN_CLOSE | BUTN_RESTORE, NULL)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_form_load
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70627
	push	0
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG70628
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_form_save_dialog
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70626
$L70627:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 287		; 0000011fH
	jmp	$eva_err$70538
$L70626:

; 288  : 			RETURN_OK;

	jmp	$eva_noerr$70583
$L70611:

; 291  : 	else if(!strcmp(btn, "MENU"))

	jmp	SHORT $L70630
$L70606:
	push	OFFSET FLAT:$SG70631
	mov	edx, DWORD PTR _btn$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70630

; 293  : 		DYNTAB_FREE(cntxt->id_form);

	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4

; 294  : 		DYNTAB_FREE(cntxt->id_obj);

	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 295  : 		DYNTAB_FREE(cntxt->alt_form);

	mov	edx, DWORD PTR _cntxt$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	call	_dyntab_free
	add	esp, 4

; 296  : 		DYNTAB_FREE(cntxt->alt_obj);

	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 60					; 0000003cH
	push	eax
	call	_dyntab_free
	add	esp, 4

; 297  : 		RETURN_OK;

	jmp	SHORT $eva_noerr$70583
$L70630:

; 299  : 
; 300  : 	/* Output opened forms list */
; 301  : 	if(dlg_openedforms_output(cntxt, cginame, b_confirm)) STACK_ERROR;

	mov	ecx, DWORD PTR _b_confirm$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cginame$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_dlg_openedforms_output
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70632
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 301		; 0000012dH
	jmp	SHORT $eva_err$70538
$L70632:

; 302  : 
; 303  : 	/* Do not display other forms */
; 304  : 	cntxt->b_terminate = 15;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29776], 15		; 0000000fH
$eva_noerr$70583:

; 305  : 
; 306  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70633
	push	OFFSET FLAT:$SG70634
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70538:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70635
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70636
	push	OFFSET FLAT:$SG70637
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70635:
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	mov	eax, DWORD PTR _cginame$[ebp]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _cginame$[ebp], 0
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _name$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 307  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_dlg_openedforms ENDP
_TEXT	ENDS
END
