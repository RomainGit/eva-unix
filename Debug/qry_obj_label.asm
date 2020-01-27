	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_obj_label.c
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
PUBLIC	_ctrl_get_label_img
EXTRN	_atoi:NEAR
EXTRN	_dynbuf_add:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
_BSS	SEGMENT
$SG70753 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70221 DB	'_EVA_CONTROL', 00H
	ORG $+3
$SG70223 DB	'_EVA_TYPE', 00H
	ORG $+2
$SG70225 DB	'_EVA_NOTES', 00H
	ORG $+1
$SG70227 DB	'_EVA_TECHNOTES', 00H
	ORG $+1
$SG70229 DB	'_EVA_MULTIPLE', 00H
	ORG $+2
$SG70231 DB	'No', 00H
	ORG $+1
$SG70233 DB	'_EVA_LINES', 00H
	ORG $+1
$SG70242 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70247 DB	0aH, 00H
	ORG $+2
$SG70249 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70255 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70258 DB	'_EVA_INPUT', 00H
	ORG $+1
$SG70260 DB	'_EVA_LIST', 00H
	ORG $+2
$SG70265 DB	'Choix dans une liste', 00H
	ORG $+3
$SG70267 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70270 DB	'_eva_ctrl_list', 00H
	ORG $+1
$SG70272 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70276 DB	'Liste d', 0e9H, 'roulante', 00H
	ORG $+3
$SG70278 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70281 DB	'_eva_ctrl_combo', 00H
$SG70283 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70286 DB	'_EVA_TEXT', 00H
	ORG $+2
$SG70289 DB	'Saisie texte libre', 00H
	ORG $+1
$SG70291 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70294 DB	'_eva_ctrl_input_txt', 00H
$SG70296 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70299 DB	'_EVA_EMAIL', 00H
	ORG $+1
$SG70302 DB	'Saisie email', 00H
	ORG $+3
$SG70304 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70307 DB	'_eva_ctrl_input_txt', 00H
$SG70309 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70312 DB	'_EVA_HTTPLINK', 00H
	ORG $+2
$SG70315 DB	'Saisie adresse internet', 00H
$SG70317 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70320 DB	'_eva_ctrl_input_txt', 00H
$SG70322 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70325 DB	'_EVA_COLOR', 00H
	ORG $+1
$SG70328 DB	'Saisie couleur', 00H
	ORG $+1
$SG70330 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70333 DB	'_eva_ctrl_input_color', 00H
	ORG $+2
$SG70335 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70338 DB	'_EVA_FILEUPLOAD', 00H
$SG70341 DB	'Fichier t', 0e9H, 'l', 0e9H, 'charg', 0e9H, 00H
	ORG $+1
$SG70343 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70346 DB	'_eva_ctrl_input_fileupload', 00H
	ORG $+1
$SG70348 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70351 DB	'_EVA_DATE', 00H
	ORG $+2
$SG70354 DB	'Saisie date', 00H
$SG70356 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70359 DB	'_eva_ctrl_input_date', 00H
	ORG $+3
$SG70361 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70364 DB	'_EVA_HOUR', 00H
	ORG $+2
$SG70367 DB	'Saisie heure', 00H
	ORG $+3
$SG70369 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70372 DB	'_eva_ctrl_input_nb', 00H
	ORG $+1
$SG70374 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70377 DB	'_EVA_NUMBER', 00H
$SG70380 DB	'Saisie nombre', 00H
	ORG $+2
$SG70382 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70385 DB	'_eva_ctrl_input_nb', 00H
	ORG $+1
$SG70387 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70390 DB	'_EVA_TELEPHONE', 00H
	ORG $+1
$SG70393 DB	'Saisie t', 0e9H, 'l', 0e9H, 'phone', 00H
	ORG $+3
$SG70395 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70398 DB	'_eva_ctrl_input_nb', 00H
	ORG $+1
$SG70400 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70403 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70406 DB	'Saisie champ de stockage', 00H
	ORG $+3
$SG70408 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70411 DB	'_eva_ctrl_field', 00H
$SG70413 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70416 DB	'_EVA_CHECKBOX', 00H
	ORG $+2
$SG70419 DB	'Case ', 0e0H, ' cocher', 00H
	ORG $+2
$SG70421 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70424 DB	'_eva_ctrl_checkbox', 00H
	ORG $+1
$SG70426 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70429 DB	'_EVA_IMAGE', 00H
	ORG $+1
$SG70432 DB	'Saisie image', 00H
	ORG $+3
$SG70434 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70437 DB	'_eva_ctrl_input_image', 00H
	ORG $+2
$SG70439 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70442 DB	'_EVA_RELATION', 00H
	ORG $+2
$SG70445 DB	'Saisie relation', 00H
$SG70447 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70450 DB	'_eva_ctrl_rel', 00H
	ORG $+2
$SG70452 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70456 DB	'Champ de saisie', 00H
$SG70458 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70461 DB	'_eva_ctrl_unknown', 00H
	ORG $+2
$SG70463 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70466 DB	'_EVA_CONTAINER', 00H
	ORG $+1
$SG70468 DB	'_EVA_GROUP', 00H
	ORG $+1
$SG70471 DB	'Cadre de groupe', 00H
$SG70473 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70476 DB	'_eva_ctrl_group', 00H
$SG70478 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70481 DB	'_EVA_TAB', 00H
	ORG $+3
$SG70484 DB	'Onglet', 00H
	ORG $+1
$SG70486 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70489 DB	'_eva_ctrl_tab', 00H
	ORG $+2
$SG70491 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70494 DB	'_EVA_TABLE', 00H
	ORG $+1
$SG70497 DB	'Tableau', 00H
$SG70499 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70502 DB	'_eva_ctrl_table', 00H
$SG70504 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70507 DB	'_EVA_PACKAGE', 00H
	ORG $+3
$SG70510 DB	'Groupe ', 0e0H, ' r', 0e9H, 'utiliser', 00H
$SG70512 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70515 DB	'_eva_ctrl_packg', 00H
$SG70517 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70520 DB	'_EVA_TITLE', 00H
	ORG $+1
$SG70523 DB	'Titre', 00H
	ORG $+2
$SG70525 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70528 DB	'_eva_ctrl_title', 00H
$SG70530 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70533 DB	'_EVA_MENUBAR', 00H
	ORG $+3
$SG70536 DB	'Menu', 00H
	ORG $+3
$SG70538 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70541 DB	'_eva_ctrl_menu', 00H
	ORG $+1
$SG70543 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70547 DB	'Conteneur', 00H
	ORG $+2
$SG70549 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70552 DB	'_eva_ctrl_unknown', 00H
	ORG $+2
$SG70554 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70557 DB	'_EVA_BUTTON', 00H
$SG70560 DB	'Bouton', 00H
	ORG $+1
$SG70562 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70565 DB	'_eva_ctrl_butn', 00H
	ORG $+1
$SG70567 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70570 DB	'_EVA_OPTION', 00H
$SG70573 DB	'Option', 00H
	ORG $+1
$SG70575 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70578 DB	'_eva_ctrl_list_option', 00H
	ORG $+2
$SG70580 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70583 DB	'_EVA_OUTPUT', 00H
$SG70585 DB	'_EVA_LIST_SIMPLE', 00H
	ORG $+3
$SG70588 DB	'Liste de fiches', 00H
$SG70590 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70593 DB	'_eva_ctrl_srchlist', 00H
	ORG $+1
$SG70595 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70598 DB	'_EVA_STATLIST', 00H
	ORG $+2
$SG70601 DB	'Tableau de statistiques', 00H
$SG70603 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70606 DB	'_eva_ctrl_pvtbl', 00H
$SG70608 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70611 DB	'_EVA_RELTREE', 00H
	ORG $+3
$SG70614 DB	'Arbre de relations', 00H
	ORG $+1
$SG70616 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70619 DB	'_eva_ctrl_tree', 00H
	ORG $+1
$SG70621 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70624 DB	'_EVA_CATALOG', 00H
	ORG $+3
$SG70627 DB	'Catalogue', 00H
	ORG $+2
$SG70629 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70632 DB	'_eva_ctrl_tree', 00H
	ORG $+1
$SG70634 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70637 DB	'_EVA_CALENDAR', 00H
	ORG $+2
$SG70640 DB	'Calendrier', 00H
	ORG $+1
$SG70642 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70645 DB	'_eva_ctrl_calendar', 00H
	ORG $+1
$SG70647 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70650 DB	'_EVA_PLANNING', 00H
	ORG $+2
$SG70653 DB	'Planning', 00H
	ORG $+3
$SG70655 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70658 DB	'_eva_ctrl_calendar', 00H
	ORG $+1
$SG70660 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70664 DB	'Liste/tableau', 00H
	ORG $+2
$SG70666 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70669 DB	'_eva_ctrl_unknown', 00H
	ORG $+2
$SG70671 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70674 DB	'_EVA_STATICTEXT', 00H
$SG70677 DB	'Texte fixe', 00H
	ORG $+1
$SG70679 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70682 DB	'_eva_ctrl_txt', 00H
	ORG $+2
$SG70684 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70687 DB	'_EVA_CALC', 00H
	ORG $+2
$SG70690 DB	'Valeur calcul', 0e9H, 'e', 00H
$SG70692 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70695 DB	'_eva_ctrl_calc', 00H
	ORG $+1
$SG70697 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70700 DB	'_EVA_IMAGE', 00H
	ORG $+1
$SG70703 DB	'Image', 00H
	ORG $+2
$SG70705 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70708 DB	'_eva_ctrl_image', 00H
$SG70710 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70713 DB	'_EVA_ANCHOR', 00H
$SG70716 DB	'Adresse internet', 00H
	ORG $+3
$SG70718 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70721 DB	'_eva_ctrl_anchor', 00H
	ORG $+3
$SG70723 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70726 DB	'_EVA_FORM', 00H
	ORG $+2
$SG70729 DB	'Formulaire', 00H
	ORG $+1
$SG70731 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70734 DB	'_eva_ctrl_form', 00H
	ORG $+1
$SG70736 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70740 DB	'Contr', 0f4H, 'le inconnu', 00H
	ORG $+3
$SG70742 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70745 DB	'_eva_ctrl_unknown', 00H
	ORG $+2
$SG70747 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70752 DB	'_s.gif', 00H
	ORG $+1
$SG70755 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70758 DB	'.gif', 00H
	ORG $+3
$SG70760 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70761 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_obj_label.c', 00H
$SG70762 DB	'ctrl_get_label_img', 00H
	ORG $+1
$SG70764 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_obj_label.c', 00H
$SG70765 DB	'ctrl_get_label_img', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_img$ = 12
_imgsel$ = 16
_label$ = 20
_notes$ = 24
_data$ = 28
_beg$ = 32
_t_control$ = -8
_t_type$ = -24
_t_notes$ = -12
_t_tnotes$ = -16
_mult$ = -4
_b_mult$ = -20
_lines$ = -28
__c$70238 = -32
__c$70251 = -36
_ctrl_get_label_img PROC NEAR

; 31   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H

; 32   : 	char *t_control = dyntab_field_val(data, "_EVA_CONTROL", ~0UL, beg);

	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	push	-1
	push	OFFSET FLAT:$SG70221
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _t_control$[ebp], eax

; 33   : 	char *t_type = dyntab_field_val(data, "_EVA_TYPE", ~0UL, beg);

	mov	edx, DWORD PTR _beg$[ebp]
	push	edx
	push	-1
	push	OFFSET FLAT:$SG70223
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _t_type$[ebp], eax

; 34   : 	DynTableCell *t_notes = dyntab_field_cell(data, "_EVA_NOTES", ~0UL, beg);

	mov	ecx, DWORD PTR _beg$[ebp]
	push	ecx
	push	-1
	push	OFFSET FLAT:$SG70225
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _t_notes$[ebp], eax

; 35   : 	DynTableCell *t_tnotes = dyntab_field_cell(data, "_EVA_TECHNOTES", ~0UL, beg);

	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	push	-1
	push	OFFSET FLAT:$SG70227
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR _t_tnotes$[ebp], eax

; 36   : 	char *mult = dyntab_field_val(data, "_EVA_MULTIPLE", ~0UL, beg);

	mov	edx, DWORD PTR _beg$[ebp]
	push	edx
	push	-1
	push	OFFSET FLAT:$SG70229
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR _mult$[ebp], eax

; 37   : 	int b_mult = strcmp("No", mult) && *mult;

	mov	ecx, DWORD PTR _mult$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70231
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71236
	mov	edx, DWORD PTR _mult$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L71236
	mov	DWORD PTR -40+[ebp], 1
	jmp	SHORT $L71237
$L71236:
	mov	DWORD PTR -40+[ebp], 0
$L71237:
	mov	ecx, DWORD PTR -40+[ebp]
	mov	DWORD PTR _b_mult$[ebp], ecx

; 38   : 	unsigned long lines = atoi(dyntab_field_val(data, "_EVA_LINES", ~0UL, beg));

	mov	edx, DWORD PTR _beg$[ebp]
	push	edx
	push	-1
	push	OFFSET FLAT:$SG70233
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _lines$[ebp], eax

; 39   : 
; 40   : 	/* Check params */
; 41   : 	if(!data || !data->nbrows) RETURN_OK;

	cmp	DWORD PTR _data$[ebp], 0
	je	SHORT $L70235
	mov	ecx, DWORD PTR _data$[ebp]
	cmp	DWORD PTR [ecx], 0
	jne	SHORT $L70234
$L70235:
	jmp	$eva_noerr$70236
$L70234:

; 42   : 
; 43   : 	/* Store notes */
; 44   : 	if(t_notes) DYNBUF_ADD_CELLP(notes, t_notes, NO_CONV);

	cmp	DWORD PTR _t_notes$[ebp], 0
	je	SHORT $L70240
	mov	edx, DWORD PTR _t_notes$[ebp]
	mov	DWORD PTR __c$70238[ebp], edx
	cmp	DWORD PTR __c$70238[ebp], 0
	je	SHORT $L70240
	push	0
	push	0
	mov	eax, DWORD PTR __c$70238[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR __c$70238[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _notes$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70240
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70242
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 44		; 0000002cH
	jmp	$eva_err$70243
$L70240:

; 45   : 	if(t_notes && t_tnotes) DYNBUF_ADD_STR(notes, "\n");

	cmp	DWORD PTR _t_notes$[ebp], 0
	je	SHORT $L70246
	cmp	DWORD PTR _t_tnotes$[ebp], 0
	je	SHORT $L70246
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70247
	mov	ecx, DWORD PTR _notes$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70246
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70249
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 45		; 0000002dH
	jmp	$eva_err$70243
$L70246:

; 46   : 	if(t_tnotes) DYNBUF_ADD_CELLP(notes, t_tnotes, NO_CONV);

	cmp	DWORD PTR _t_tnotes$[ebp], 0
	je	SHORT $L70253
	mov	ecx, DWORD PTR _t_tnotes$[ebp]
	mov	DWORD PTR __c$70251[ebp], ecx
	cmp	DWORD PTR __c$70251[ebp], 0
	je	SHORT $L70253
	push	0
	push	0
	mov	edx, DWORD PTR __c$70251[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR __c$70251[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _notes$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70253
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70255
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 46		; 0000002eH
	jmp	$eva_err$70243
$L70253:

; 47   : 
; 48   : #define LABEL_IMAGE(l, i) { DYNBUF_ADD_STR(label, l) DYNBUF_ADD_STR(img, i) }
; 49   : 	/* Switch on type of object */
; 50   : 	if(!strcmp("_EVA_INPUT", t_control))

	mov	eax, DWORD PTR _t_control$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70258
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70257

; 52   : 		if(!strcmp("_EVA_LIST", t_type))

	mov	ecx, DWORD PTR _t_type$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70260
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70259

; 54   : 			if(b_mult || lines > 1) LABEL_IMAGE("Choix dans une liste", "_eva_ctrl_list")

	cmp	DWORD PTR _b_mult$[ebp], 0
	jne	SHORT $L70262
	cmp	DWORD PTR _lines$[ebp], 1
	jbe	SHORT $L70261
$L70262:
	push	0
	push	0
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70265
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70264
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70267
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 54		; 00000036H
	jmp	$eva_err$70243
$L70264:
	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70270
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70269
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70272
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 54		; 00000036H
	jmp	$eva_err$70243
$L70269:

; 55   : 			else LABEL_IMAGE("Liste déroulante", "_eva_ctrl_combo")

	jmp	SHORT $L70280
$L70261:
	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70276
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70275
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70278
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 55		; 00000037H
	jmp	$eva_err$70243
$L70275:
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70281
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70280
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70283
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 55		; 00000037H
	jmp	$eva_err$70243
$L70280:

; 57   : 		else if(!strcmp("_EVA_TEXT", t_type)) LABEL_IMAGE("Saisie texte libre", "_eva_ctrl_input_txt")

	jmp	$L70460
$L70259:
	mov	edx, DWORD PTR _t_type$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70286
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70285
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70289
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70288
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70291
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 57		; 00000039H
	jmp	$eva_err$70243
$L70288:
	push	0
	push	0
	push	19					; 00000013H
	push	OFFSET FLAT:$SG70294
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70293
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70296
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 57		; 00000039H
	jmp	$eva_err$70243
$L70293:

; 58   : 		else if(!strcmp("_EVA_EMAIL", t_type)) LABEL_IMAGE("Saisie email", "_eva_ctrl_input_txt")

	jmp	$L70460
$L70285:
	mov	eax, DWORD PTR _t_type$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70299
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70298
	push	0
	push	0
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70302
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70301
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70304
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 58		; 0000003aH
	jmp	$eva_err$70243
$L70301:
	push	0
	push	0
	push	19					; 00000013H
	push	OFFSET FLAT:$SG70307
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70306
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70309
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 58		; 0000003aH
	jmp	$eva_err$70243
$L70306:

; 59   : 		else if(!strcmp("_EVA_HTTPLINK", t_type)) LABEL_IMAGE("Saisie adresse internet", "_eva_ctrl_input_txt")

	jmp	$L70460
$L70298:
	mov	ecx, DWORD PTR _t_type$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70312
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70311
	push	0
	push	0
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70315
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70314
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70317
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 59		; 0000003bH
	jmp	$eva_err$70243
$L70314:
	push	0
	push	0
	push	19					; 00000013H
	push	OFFSET FLAT:$SG70320
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70319
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70322
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 59		; 0000003bH
	jmp	$eva_err$70243
$L70319:

; 60   : 		else if(!strcmp("_EVA_COLOR", t_type)) LABEL_IMAGE("Saisie couleur", "_eva_ctrl_input_color")

	jmp	$L70460
$L70311:
	mov	edx, DWORD PTR _t_type$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70325
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70324
	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70328
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70327
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70330
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 60		; 0000003cH
	jmp	$eva_err$70243
$L70327:
	push	0
	push	0
	push	21					; 00000015H
	push	OFFSET FLAT:$SG70333
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70332
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70335
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 60		; 0000003cH
	jmp	$eva_err$70243
$L70332:

; 61   : 		else if(!strcmp("_EVA_FILEUPLOAD", t_type)) LABEL_IMAGE("Fichier téléchargé", "_eva_ctrl_input_fileupload")

	jmp	$L70460
$L70324:
	mov	eax, DWORD PTR _t_type$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70338
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70337
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70341
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70340
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70343
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 61		; 0000003dH
	jmp	$eva_err$70243
$L70340:
	push	0
	push	0
	push	26					; 0000001aH
	push	OFFSET FLAT:$SG70346
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70345
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70348
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 61		; 0000003dH
	jmp	$eva_err$70243
$L70345:

; 62   : 		else if(!strcmp("_EVA_DATE", t_type)) LABEL_IMAGE("Saisie date", "_eva_ctrl_input_date")

	jmp	$L70460
$L70337:
	mov	ecx, DWORD PTR _t_type$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70351
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70350
	push	0
	push	0
	push	11					; 0000000bH
	push	OFFSET FLAT:$SG70354
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70353
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70356
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 62		; 0000003eH
	jmp	$eva_err$70243
$L70353:
	push	0
	push	0
	push	20					; 00000014H
	push	OFFSET FLAT:$SG70359
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70358
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70361
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 62		; 0000003eH
	jmp	$eva_err$70243
$L70358:

; 63   : 		else if(!strcmp("_EVA_HOUR", t_type)) LABEL_IMAGE("Saisie heure", "_eva_ctrl_input_nb")

	jmp	$L70460
$L70350:
	mov	edx, DWORD PTR _t_type$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70364
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70363
	push	0
	push	0
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70367
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70366
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70369
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 63		; 0000003fH
	jmp	$eva_err$70243
$L70366:
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70372
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70371
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70374
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 63		; 0000003fH
	jmp	$eva_err$70243
$L70371:

; 64   : 		else if(!strcmp("_EVA_NUMBER", t_type)) LABEL_IMAGE("Saisie nombre", "_eva_ctrl_input_nb")

	jmp	$L70460
$L70363:
	mov	eax, DWORD PTR _t_type$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70377
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70376
	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70380
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70379
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70382
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 64		; 00000040H
	jmp	$eva_err$70243
$L70379:
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70385
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70384
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70387
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 64		; 00000040H
	jmp	$eva_err$70243
$L70384:

; 65   : 		else if(!strcmp("_EVA_TELEPHONE", t_type)) LABEL_IMAGE("Saisie téléphone", "_eva_ctrl_input_nb")

	jmp	$L70460
$L70376:
	mov	ecx, DWORD PTR _t_type$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70390
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70389
	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70393
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70392
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70395
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 65		; 00000041H
	jmp	$eva_err$70243
$L70392:
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70398
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70397
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70400
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 65		; 00000041H
	jmp	$eva_err$70243
$L70397:

; 66   : 		else if(!strcmp("_EVA_FIELD", t_type)) LABEL_IMAGE("Saisie champ de stockage", "_eva_ctrl_field")

	jmp	$L70460
$L70389:
	mov	edx, DWORD PTR _t_type$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70403
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70402
	push	0
	push	0
	push	24					; 00000018H
	push	OFFSET FLAT:$SG70406
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70405
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70408
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 66		; 00000042H
	jmp	$eva_err$70243
$L70405:
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70411
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70410
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70413
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 66		; 00000042H
	jmp	$eva_err$70243
$L70410:

; 67   : 		else if(!strcmp("_EVA_CHECKBOX", t_type)) LABEL_IMAGE("Case à cocher", "_eva_ctrl_checkbox")

	jmp	$L70460
$L70402:
	mov	eax, DWORD PTR _t_type$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70416
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70415
	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70419
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70418
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70421
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 67		; 00000043H
	jmp	$eva_err$70243
$L70418:
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70424
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70423
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70426
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 67		; 00000043H
	jmp	$eva_err$70243
$L70423:

; 68   : 		else if(!strcmp("_EVA_IMAGE", t_type)) LABEL_IMAGE("Saisie image", "_eva_ctrl_input_image")

	jmp	$L70460
$L70415:
	mov	ecx, DWORD PTR _t_type$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70429
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70428
	push	0
	push	0
	push	12					; 0000000cH
	push	OFFSET FLAT:$SG70432
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70431
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70434
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 68		; 00000044H
	jmp	$eva_err$70243
$L70431:
	push	0
	push	0
	push	21					; 00000015H
	push	OFFSET FLAT:$SG70437
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70436
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70439
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 68		; 00000044H
	jmp	$eva_err$70243
$L70436:

; 69   : 		else if(!strcmp("_EVA_RELATION", t_type)) LABEL_IMAGE("Saisie relation", "_eva_ctrl_rel")

	jmp	$L70460
$L70428:
	mov	edx, DWORD PTR _t_type$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70442
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70441
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70445
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70444
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70447
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 69		; 00000045H
	jmp	$eva_err$70243
$L70444:
	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70450
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70449
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70452
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 69		; 00000045H
	jmp	$eva_err$70243
$L70449:

; 70   : 		else LABEL_IMAGE("Champ de saisie", "_eva_ctrl_unknown")

	jmp	SHORT $L70460
$L70441:
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70456
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70455
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70458
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 70		; 00000046H
	jmp	$eva_err$70243
$L70455:
	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70461
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70460
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70463
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 70		; 00000046H
	jmp	$eva_err$70243
$L70460:

; 72   : 	else if(!strcmp("_EVA_CONTAINER", t_control))

	jmp	$L70733
$L70257:
	mov	eax, DWORD PTR _t_control$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70466
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70465

; 74   : 		if(!strcmp("_EVA_GROUP", t_type)) LABEL_IMAGE("Cadre de groupe", "_eva_ctrl_group")

	mov	ecx, DWORD PTR _t_type$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70468
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70467
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70471
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70470
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70473
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 74		; 0000004aH
	jmp	$eva_err$70243
$L70470:
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70476
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70475
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70478
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 74		; 0000004aH
	jmp	$eva_err$70243
$L70475:

; 75   : 		else if(!strcmp("_EVA_TAB", t_type)) LABEL_IMAGE("Onglet", "_eva_ctrl_tab")

	jmp	$L70551
$L70467:
	mov	edx, DWORD PTR _t_type$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70481
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70480
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70484
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70483
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70486
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 75		; 0000004bH
	jmp	$eva_err$70243
$L70483:
	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70489
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70488
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70491
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 75		; 0000004bH
	jmp	$eva_err$70243
$L70488:

; 76   : 		else if(!strcmp("_EVA_TABLE", t_type)) LABEL_IMAGE("Tableau", "_eva_ctrl_table")

	jmp	$L70551
$L70480:
	mov	eax, DWORD PTR _t_type$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70494
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70493
	push	0
	push	0
	push	7
	push	OFFSET FLAT:$SG70497
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70496
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70499
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 76		; 0000004cH
	jmp	$eva_err$70243
$L70496:
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70502
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70501
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70504
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 76		; 0000004cH
	jmp	$eva_err$70243
$L70501:

; 77   : 		else if(!strcmp("_EVA_PACKAGE", t_type)) LABEL_IMAGE("Groupe à réutiliser", "_eva_ctrl_packg")

	jmp	$L70551
$L70493:
	mov	ecx, DWORD PTR _t_type$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70507
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70506
	push	0
	push	0
	push	19					; 00000013H
	push	OFFSET FLAT:$SG70510
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70509
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70512
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 77		; 0000004dH
	jmp	$eva_err$70243
$L70509:
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70515
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70514
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70517
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 77		; 0000004dH
	jmp	$eva_err$70243
$L70514:

; 78   : 		else if(!strcmp("_EVA_TITLE", t_type)) LABEL_IMAGE("Titre", "_eva_ctrl_title")

	jmp	$L70551
$L70506:
	mov	edx, DWORD PTR _t_type$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70520
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70519
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70523
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70522
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70525
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 78		; 0000004eH
	jmp	$eva_err$70243
$L70522:
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70528
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70527
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70530
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 78		; 0000004eH
	jmp	$eva_err$70243
$L70527:

; 79   : 		else if(!strcmp("_EVA_MENUBAR", t_type)) LABEL_IMAGE("Menu", "_eva_ctrl_menu")

	jmp	$L70551
$L70519:
	mov	eax, DWORD PTR _t_type$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70533
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70532
	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70536
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70535
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70538
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 79		; 0000004fH
	jmp	$eva_err$70243
$L70535:
	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70541
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70540
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70543
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 79		; 0000004fH
	jmp	$eva_err$70243
$L70540:

; 80   : 		else LABEL_IMAGE("Conteneur", "_eva_ctrl_unknown")

	jmp	SHORT $L70551
$L70532:
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70547
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70546
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70549
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 80		; 00000050H
	jmp	$eva_err$70243
$L70546:
	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70552
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70551
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70554
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 80		; 00000050H
	jmp	$eva_err$70243
$L70551:

; 82   : 	else if(!strcmp("_EVA_BUTTON", t_control)) LABEL_IMAGE("Bouton", "_eva_ctrl_butn")

	jmp	$L70733
$L70465:
	mov	ecx, DWORD PTR _t_control$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70557
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70556
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70560
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70559
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70562
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 82		; 00000052H
	jmp	$eva_err$70243
$L70559:
	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70565
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70564
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70567
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 82		; 00000052H
	jmp	$eva_err$70243
$L70564:

; 83   : 	else if(!strcmp("_EVA_OPTION", t_control)) LABEL_IMAGE("Option", "_eva_ctrl_list_option")

	jmp	$L70733
$L70556:
	mov	edx, DWORD PTR _t_control$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70570
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70569
	push	0
	push	0
	push	6
	push	OFFSET FLAT:$SG70573
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70572
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70575
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 83		; 00000053H
	jmp	$eva_err$70243
$L70572:
	push	0
	push	0
	push	21					; 00000015H
	push	OFFSET FLAT:$SG70578
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70577
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70580
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 83		; 00000053H
	jmp	$eva_err$70243
$L70577:

; 84   : 	else if(!strcmp("_EVA_OUTPUT", t_control))

	jmp	$L70733
$L70569:
	mov	eax, DWORD PTR _t_control$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70583
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70582

; 86   : 		if(!strcmp("_EVA_LIST_SIMPLE", t_type)) LABEL_IMAGE("Liste de fiches", "_eva_ctrl_srchlist")

	mov	ecx, DWORD PTR _t_type$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70585
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70584
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70588
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70587
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70590
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 86		; 00000056H
	jmp	$eva_err$70243
$L70587:
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70593
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70592
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70595
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 86		; 00000056H
	jmp	$eva_err$70243
$L70592:

; 87   : 		else if(!strcmp("_EVA_STATLIST", t_type)) LABEL_IMAGE("Tableau de statistiques", "_eva_ctrl_pvtbl")

	jmp	$L70668
$L70584:
	mov	edx, DWORD PTR _t_type$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70598
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70597
	push	0
	push	0
	push	23					; 00000017H
	push	OFFSET FLAT:$SG70601
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70600
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70603
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 87		; 00000057H
	jmp	$eva_err$70243
$L70600:
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70606
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70605
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70608
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 87		; 00000057H
	jmp	$eva_err$70243
$L70605:

; 88   : 		else if(!strcmp("_EVA_RELTREE", t_type)) LABEL_IMAGE("Arbre de relations", "_eva_ctrl_tree")

	jmp	$L70668
$L70597:
	mov	eax, DWORD PTR _t_type$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70611
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70610
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70614
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70613
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70616
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 88		; 00000058H
	jmp	$eva_err$70243
$L70613:
	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70619
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70618
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70621
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 88		; 00000058H
	jmp	$eva_err$70243
$L70618:

; 89   : 		else if(!strcmp("_EVA_CATALOG", t_type)) LABEL_IMAGE("Catalogue", "_eva_ctrl_tree")

	jmp	$L70668
$L70610:
	mov	ecx, DWORD PTR _t_type$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70624
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70623
	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70627
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70626
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70629
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 89		; 00000059H
	jmp	$eva_err$70243
$L70626:
	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70632
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70631
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70634
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 89		; 00000059H
	jmp	$eva_err$70243
$L70631:

; 90   : 		else if(!strcmp("_EVA_CALENDAR", t_type)) LABEL_IMAGE("Calendrier", "_eva_ctrl_calendar")

	jmp	$L70668
$L70623:
	mov	edx, DWORD PTR _t_type$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70637
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70636
	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70640
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70639
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70642
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 90		; 0000005aH
	jmp	$eva_err$70243
$L70639:
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70645
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70644
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70647
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 90		; 0000005aH
	jmp	$eva_err$70243
$L70644:

; 91   : 		else if(!strcmp("_EVA_PLANNING", t_type)) LABEL_IMAGE("Planning", "_eva_ctrl_calendar")

	jmp	$L70668
$L70636:
	mov	eax, DWORD PTR _t_type$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70650
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70649
	push	0
	push	0
	push	8
	push	OFFSET FLAT:$SG70653
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70652
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70655
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 91		; 0000005bH
	jmp	$eva_err$70243
$L70652:
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70658
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70657
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70660
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 91		; 0000005bH
	jmp	$eva_err$70243
$L70657:

; 92   : 		else LABEL_IMAGE("Liste/tableau", "_eva_ctrl_unknown")

	jmp	SHORT $L70668
$L70649:
	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70664
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70663
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70666
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 92		; 0000005cH
	jmp	$eva_err$70243
$L70663:
	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70669
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70668
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70671
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 92		; 0000005cH
	jmp	$eva_err$70243
$L70668:

; 94   : 	else if(!strcmp("_EVA_STATICTEXT", t_control)) LABEL_IMAGE("Texte fixe", "_eva_ctrl_txt")

	jmp	$L70733
$L70582:
	mov	ecx, DWORD PTR _t_control$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70674
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70673
	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70677
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70676
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70679
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 94		; 0000005eH
	jmp	$eva_err$70243
$L70676:
	push	0
	push	0
	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70682
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70681
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70684
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 94		; 0000005eH
	jmp	$eva_err$70243
$L70681:

; 95   : 	else if(!strcmp("_EVA_CALC", t_control)) LABEL_IMAGE("Valeur calculée", "_eva_ctrl_calc")

	jmp	$L70733
$L70673:
	mov	edx, DWORD PTR _t_control$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70687
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70686
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70690
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70689
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70692
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 95		; 0000005fH
	jmp	$eva_err$70243
$L70689:
	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70695
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70694
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70697
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 95		; 0000005fH
	jmp	$eva_err$70243
$L70694:

; 96   : 	else if(!strcmp("_EVA_IMAGE", t_control)) LABEL_IMAGE("Image", "_eva_ctrl_image")

	jmp	$L70733
$L70686:
	mov	eax, DWORD PTR _t_control$[ebp]
	push	eax
	push	OFFSET FLAT:$SG70700
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70699
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG70703
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70702
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70705
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 96		; 00000060H
	jmp	$eva_err$70243
$L70702:
	push	0
	push	0
	push	15					; 0000000fH
	push	OFFSET FLAT:$SG70708
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70707
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70710
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 96		; 00000060H
	jmp	$eva_err$70243
$L70707:

; 97   : 	else if(!strcmp("_EVA_ANCHOR", t_control)) LABEL_IMAGE("Adresse internet", "_eva_ctrl_anchor")

	jmp	$L70733
$L70699:
	mov	ecx, DWORD PTR _t_control$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70713
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70712
	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70716
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70715
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70718
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 97		; 00000061H
	jmp	$eva_err$70243
$L70715:
	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70721
	mov	edx, DWORD PTR _img$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70720
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70723
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 97		; 00000061H
	jmp	$eva_err$70243
$L70720:

; 98   : 	else if(!strcmp("_EVA_FORM", t_control)) LABEL_IMAGE("Formulaire", "_eva_ctrl_form");

	jmp	$L70733
$L70712:
	mov	edx, DWORD PTR _t_control$[ebp]
	push	edx
	push	OFFSET FLAT:$SG70726
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70733
	push	0
	push	0
	push	10					; 0000000aH
	push	OFFSET FLAT:$SG70729
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70728
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70731
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 98		; 00000062H
	jmp	$eva_err$70243
$L70728:
	push	0
	push	0
	push	14					; 0000000eH
	push	OFFSET FLAT:$SG70734
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70733
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70736
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 98		; 00000062H
	jmp	$eva_err$70243
$L70733:

; 99   : #undef LABEL_IMAGE
; 100  : 	
; 101  : 	if(label && !*label)

	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L70744
	mov	eax, DWORD PTR _label$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L70744

; 103  : 		DYNBUF_ADD_STR(label, "Contrôle inconnu")

	push	0
	push	0
	push	16					; 00000010H
	push	OFFSET FLAT:$SG70740
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70739
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70742
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 103		; 00000067H
	jmp	$eva_err$70243
$L70739:

; 104  : 		DYNBUF_ADD_STR(img, "_eva_ctrl_unknown")

	push	0
	push	0
	push	17					; 00000011H
	push	OFFSET FLAT:$SG70745
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70744
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70747
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 104		; 00000068H
	jmp	$eva_err$70243
$L70744:

; 106  : 
; 107  : 	if(img) DYNBUF_ADD3_BUF(imgsel, "", *img, NO_CONV, "_s.gif")

	cmp	DWORD PTR _img$[ebp], 0
	je	SHORT $L70751
	mov	ecx, DWORD PTR _img$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71238
	mov	edx, DWORD PTR _img$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -44+[ebp], ecx
	jmp	SHORT $L71239
$L71238:
	mov	DWORD PTR -44+[ebp], 0
$L71239:
	mov	edx, DWORD PTR _img$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L71240
	mov	eax, DWORD PTR _img$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 8
	mov	DWORD PTR -48+[ebp], ecx
	jmp	SHORT $L71241
$L71240:
	mov	DWORD PTR -48+[ebp], 0
$L71241:
	push	6
	push	OFFSET FLAT:$SG70752
	push	0
	push	0
	mov	edx, DWORD PTR -44+[ebp]
	push	edx
	mov	eax, DWORD PTR -48+[ebp]
	push	eax
	push	0
	push	OFFSET FLAT:$SG70753
	mov	ecx, DWORD PTR _imgsel$[ebp]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70751
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70755
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 107		; 0000006bH
	jmp	SHORT $eva_err$70243
$L70751:

; 108  : 	DYNBUF_ADD_STR(img, ".gif")

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70758
	mov	ecx, DWORD PTR _img$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70757
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70760
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 108		; 0000006cH
	jmp	SHORT $eva_err$70243
$L70757:
$eva_noerr$70236:

; 109  : 
; 110  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70761
	push	OFFSET FLAT:$SG70762
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70243:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70763
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70764
	push	OFFSET FLAT:$SG70765
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70763:
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 111  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_get_label_img ENDP
_TEXT	ENDS
PUBLIC	_qry_build_obj_label
EXTRN	_form_eval_fieldexpr:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_put_value_fmt:NEAR
EXTRN	_dynbuf_strip:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_copy:NEAR
EXTRN	_qry_eval_sqlexpr_var:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70878 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70819 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_obj_label.c', 00H
$SG70820 DB	'qry_build_obj_label', 00H
$SG70826 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70835 DB	' ', 00H
	ORG $+2
$SG70837 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70841 DB	', ', 00H
	ORG $+1
$SG70843 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70849 DB	0aH, 00H
	ORG $+2
$SG70851 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70855 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70858 DB	' ', 00H
	ORG $+2
$SG70860 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70867 DB	'+', 00H
	ORG $+2
$SG70869 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70873 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_obj_label.c', 00H
$SG70874 DB	'qry_build_obj_label', 00H
$SG70879 DB	' ', 00H
	ORG $+2
$SG70881 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70882 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_obj_label.c', 00H
$SG70883 DB	'qry_build_obj_label', 00H
$SG70885 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_obj_label.c', 00H
$SG70886 DB	'qry_build_obj_label', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_label$ = 12
_values$ = 16
_fc$ = 20
_dispselect$ = 24
_id_obj$ = 28
_data$ = 32
_beg$ = 36
_strip$ = 40
_res$ = -24
_expr$ = -4
_cnt0$ = -32
_i$ = -28
_j$ = -36
_b_select$ = -40
_c$70810 = -44
_b_strip$70811 = -56
_cnt$70812 = -48
_b_compute$70813 = -52
__cnt0$70871 = -60
_qry_build_obj_label PROC NEAR

; 134  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 84					; 00000054H

; 135  : 	DynTable res = {0};		    

	mov	DWORD PTR _res$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _res$[ebp+4], eax
	mov	DWORD PTR _res$[ebp+8], eax
	mov	DWORD PTR _res$[ebp+12], eax
	mov	DWORD PTR _res$[ebp+16], eax

; 136  : 	DynBuffer *expr = NULL;

	mov	DWORD PTR _expr$[ebp], 0

; 137  : 	size_t cnt0 = (label && *label) ? (*label)->cnt : 0;

	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L71243
	mov	ecx, DWORD PTR _label$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71243
	mov	edx, DWORD PTR _label$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR -64+[ebp], ecx
	jmp	SHORT $L71244
$L71243:
	mov	DWORD PTR -64+[ebp], 0
$L71244:
	mov	edx, DWORD PTR -64+[ebp]
	mov	DWORD PTR _cnt0$[ebp], edx

; 138  : 	unsigned long i, j;
; 139  : 	int b_select = dispselect != NULL;

	xor	eax, eax
	cmp	DWORD PTR _dispselect$[ebp], 0
	setne	al
	mov	DWORD PTR _b_select$[ebp], eax

; 140  : 
; 141  : 	/* Check params */
; 142  : 	if(!label || !values) RETURN_OK;

	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L70798
	cmp	DWORD PTR _values$[ebp], 0
	jne	SHORT $L70797
$L70798:
	jmp	$eva_noerr$70799
$L70797:

; 143  : 	if(b_select)

	cmp	DWORD PTR _b_select$[ebp], 0
	je	SHORT $L70800

; 145  : 		for(i = 0; i < dispselect->nbrows && !dyntab_sz(dispselect, i, 0); i++);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70801
$L70802:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70801:
	mov	edx, DWORD PTR _dispselect$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jae	SHORT $L70803
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _dispselect$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70803
	jmp	SHORT $L70802
$L70803:

; 146  : 		b_select =  i < dispselect->nbrows;

	mov	eax, DWORD PTR _dispselect$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax]
	sbb	edx, edx
	neg	edx
	mov	DWORD PTR _b_select$[ebp], edx
$L70800:

; 148  : 
; 149  : 	/* Get fields data for object label */
; 150  : 	for(i = 0; i < fc->fields.nbrows && (!*label || (*label)->cnt < cnt0 + (strip * 10)); i++)	if(!b_select || dyntab_sz(dispselect, i, 0))

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70804
$L70805:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70804:
	mov	ecx, DWORD PTR _fc$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+52]
	jae	$eva_noerr$70799
	mov	eax, DWORD PTR _label$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70807
	mov	ecx, DWORD PTR _label$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _strip$[ebp]
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _cnt0$[ebp]
	add	ecx, eax
	cmp	DWORD PTR [edx+4], ecx
	jae	$eva_noerr$70799
$L70807:
	cmp	DWORD PTR _b_select$[ebp], 0
	je	SHORT $L70809
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _dispselect$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70877
$L70809:

; 152  : 		/* If values not already computed for this field */
; 153  : 		DynTableCell *c = dyntab_cell(values, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70810[ebp], eax

; 154  : 		int b_strip = 0;

	mov	DWORD PTR _b_strip$70811[ebp], 0

; 155  : 		size_t cnt = 0;

	mov	DWORD PTR _cnt$70812[ebp], 0

; 156  : 		int b_compute = !c || !c->col;

	cmp	DWORD PTR _c$70810[ebp], 0
	je	SHORT $L71245
	mov	eax, DWORD PTR _c$70810[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	SHORT $L71245
	mov	DWORD PTR -68+[ebp], 0
	jmp	SHORT $L71246
$L71245:
	mov	DWORD PTR -68+[ebp], 1
$L71246:
	mov	ecx, DWORD PTR -68+[ebp]
	mov	DWORD PTR _b_compute$70813[ebp], ecx

; 157  : 		if(b_compute)

	cmp	DWORD PTR _b_compute$70813[ebp], 0
	je	$L70814

; 159  : 			/* Evaluate field expression - continue on error */
; 160  : 			M_FREE(expr);

	mov	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0

; 161  : 			if(qry_eval_sqlexpr_var(cntxt, &expr, dyntab_val(&fc->fields, i, 0), &fc->data, NULL) ||
; 162  : 				form_eval_fieldexpr(cntxt, &res, fc->idform, id_obj, DYNBUF_VAL_SZ(expr), data, beg))

	push	0
	mov	eax, DWORD PTR _fc$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _fc$[ebp]
	add	edx, 52					; 00000034H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	eax, DWORD PTR _expr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_eval_sqlexpr_var
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70818
	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L71247
	mov	edx, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L71248
$L71247:
	mov	DWORD PTR -72+[ebp], 0
$L71248:
	cmp	DWORD PTR _expr$[ebp], 0
	je	SHORT $L71249
	mov	ecx, DWORD PTR _expr$[ebp]
	add	ecx, 8
	mov	DWORD PTR -76+[ebp], ecx
	jmp	SHORT $L71250
$L71249:
	mov	DWORD PTR -76+[ebp], 0
$L71250:
	mov	edx, DWORD PTR _beg$[ebp]
	push	edx
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR -72+[ebp]
	push	ecx
	mov	edx, DWORD PTR -76+[ebp]
	push	edx
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fc$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	lea	eax, DWORD PTR _res$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70817
$L70818:

; 163  : 				CLEAR_ERROR_CONT;

	push	163					; 000000a3H
	push	OFFSET FLAT:$SG70819
	push	OFFSET FLAT:$SG70820
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
	jmp	$L70805
$L70817:

; 164  : 
; 165  : 			/* Store values in corresponding row */
; 166  : 			for(j = 0; j < (res.nbrows ? res.nbrows : 1); j++) DYNTAB_ADD_CELL(values, i, j, &res, j, 0);

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70821
$L70822:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70821:
	cmp	DWORD PTR _res$[ebp], 0
	je	SHORT $L71251
	mov	ecx, DWORD PTR _res$[ebp]
	mov	DWORD PTR -80+[ebp], ecx
	jmp	SHORT $L71252
$L71251:
	mov	DWORD PTR -80+[ebp], 1
$L71252:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR -80+[ebp]
	jae	SHORT $L70823
	push	1
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _values$[ebp]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70824
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70826
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 166		; 000000a6H
	jmp	$eva_err$70827
$L70824:
	jmp	SHORT $L70822
$L70823:

; 167  : 			c = dyntab_cell(values, i, 0);

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70810[ebp], eax

; 168  : 			c->col = 1;

	mov	eax, DWORD PTR _c$70810[ebp]
	mov	DWORD PTR [eax+56], 1

; 170  : 		else if(!dispselect) continue;

	jmp	SHORT $L70829
$L70814:
	cmp	DWORD PTR _dispselect$[ebp], 0
	jne	SHORT $L70829
	jmp	$L70805
$L70829:

; 171  : 		
; 172  : 		/* Skip if no value */
; 173  : 		if(!dyntab_sz(values, i, 0)) continue;

	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L70830
	jmp	$L70805
$L70830:

; 174  : 
; 175  : 		/* Add fields separator */
; 176  : 		if(dispselect && *label && (*label)->cnt > cnt0)

	cmp	DWORD PTR _dispselect$[ebp], 0
	je	$L70840
	mov	eax, DWORD PTR _label$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L70840
	mov	ecx, DWORD PTR _label$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+4]
	cmp	eax, DWORD PTR _cnt0$[ebp]
	jbe	$L70840

; 178  : 			if(i && dyntab_sz(&fc->separ, i - 1, 0)) DYNBUF_ADD_STR(label, " ")

	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70832
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	sub	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _fc$[ebp]
	add	edx, 172				; 000000acH
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70832
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70835
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70834
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70837
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 178		; 000000b2H
	jmp	$eva_err$70827
$L70834:

; 179  : 			else DYNBUF_ADD_STR(label, ", ");

	jmp	SHORT $L70840
$L70832:
	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG70841
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70840
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70843
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 179		; 000000b3H
	jmp	$eva_err$70827
$L70840:

; 181  : 
; 182  : 		/* Add prefix with label if applicable */
; 183  : 		if((!dispselect || dyntab_sz(&fc->pfx, i, 0)) && dyntab_sz(&fc->labels, i, 0))

	cmp	DWORD PTR _dispselect$[ebp], 0
	je	SHORT $L70845
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fc$[ebp]
	add	ecx, 152				; 00000098H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70857
$L70845:
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _fc$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70857

; 185  : 			if(!dispselect && label && *label) DYNBUF_ADD_STR(label, "\n");

	cmp	DWORD PTR _dispselect$[ebp], 0
	jne	SHORT $L70848
	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L70848
	mov	ecx, DWORD PTR _label$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70848
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70849
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70848
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70851
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 185		; 000000b9H
	jmp	$eva_err$70827
$L70848:

; 186  : 			DYNBUF_ADD_CELL(label, &fc->labels, i, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _fc$[ebp]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _fc$[ebp]
	add	edx, 32					; 00000020H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70853
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70855
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 186		; 000000baH
	jmp	$eva_err$70827
$L70853:

; 187  : 			DYNBUF_ADD_STR(label, " ")

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70858
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70857
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70860
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 187		; 000000bbH
	jmp	$eva_err$70827
$L70857:

; 189  : 
; 190  : 		/* Add formated values to object label */
; 191  : 		for(j = 0; j < values->nbcols && dyntab_sz(values, i, j) && !b_strip; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70861
$L70862:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L70861:
	mov	ecx, DWORD PTR _values$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+8]
	jae	$L70863
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70863
	cmp	DWORD PTR _b_strip$70811[ebp], 0
	jne	$L70863

; 193  : 			if(j) DYNBUF_ADD_STR(label, "+");

	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L70866
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70867
	mov	eax, DWORD PTR _label$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70866
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70869
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 193		; 000000c1H
	jmp	$eva_err$70827
$L70866:

; 194  : 			DYNBUF_HANDLE_STRIP(label, strip, cnt, b_strip,
; 195  : 				if(put_value_fmt(cntxt, label, DYNTAB_VAL_SZ(values, i, j), dyntab_val(&fc->format, i, 0))) CLEAR_ERROR);

	cmp	DWORD PTR _label$[ebp], 0
	je	$L70870
	mov	eax, DWORD PTR _label$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71253
	mov	ecx, DWORD PTR _label$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -84+[ebp], eax
	jmp	SHORT $L71254
$L71253:
	mov	DWORD PTR -84+[ebp], 0
$L71254:
	mov	ecx, DWORD PTR -84+[ebp]
	mov	DWORD PTR __cnt0$70871[ebp], ecx
	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _fc$[ebp]
	add	eax, 72					; 00000048H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _values$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_value_fmt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70872
	push	195					; 000000c3H
	push	OFFSET FLAT:$SG70873
	push	OFFSET FLAT:$SG70874
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$L70872:
	lea	ecx, DWORD PTR _cnt$70812[ebp]
	push	ecx
	mov	edx, DWORD PTR _strip$[ebp]
	push	edx
	mov	eax, DWORD PTR __cnt0$70871[ebp]
	push	eax
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dynbuf_strip
	add	esp, 16					; 00000010H
	mov	DWORD PTR _b_strip$70811[ebp], eax
$L70870:

; 196  : 		}

	jmp	$L70862
$L70863:

; 197  : 
; 198  : 		/* Add display notes if applicable */
; 199  : 		if(dyntab_sz(&fc->dnotes, i, 0))

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _fc$[ebp]
	add	eax, 192				; 000000c0H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70877

; 201  : 			DYNBUF_ADD3_CELL(label, " ", &fc->dnotes, i, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70878
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _fc$[ebp]
	add	edx, 192				; 000000c0H
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fc$[ebp]
	add	ecx, 192				; 000000c0H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	1
	push	OFFSET FLAT:$SG70879
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70877
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70881
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 201		; 000000c9H
	jmp	SHORT $eva_err$70827
$L70877:

; 204  : 
; 205  : 	RETURN_OK_CLEANUP;

	jmp	$L70805
$eva_noerr$70799:
	push	0
	push	OFFSET FLAT:$SG70882
	push	OFFSET FLAT:$SG70883
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70827:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L70884
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG70885
	push	OFFSET FLAT:$SG70886
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70884:
	lea	ecx, DWORD PTR _res$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	mov	edx, DWORD PTR _expr$[ebp]
	push	edx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _expr$[ebp], 0
	mov	eax, DWORD PTR _cntxt$[ebp]
	xor	ecx, ecx
	cmp	DWORD PTR [eax+29872], 0
	setne	cl
	mov	eax, ecx

; 206  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_build_obj_label ENDP
_TEXT	ENDS
PUBLIC	_qry_obj_label
EXTRN	_sql_exec_query:NEAR
EXTRN	_qry_values_list:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_qry_obj_idfield:NEAR
EXTRN	_qry_obj_data:NEAR
EXTRN	_ctrl_read_baseobj:NEAR
EXTRN	_sql_get_table:NEAR
EXTRN	_qry_cache_idobj_field:NEAR
EXTRN	_dyntab_set_txt:NEAR
EXTRN	_dyntab_cmp:NEAR
EXTRN	_dyntab_filter_field:NEAR
EXTRN	_dyntab_order_lines:NEAR
_DATA	SEGMENT
$SG70950 DB	'_EVA_FORMSTAMP', 00H
	ORG $+1
$SG70961 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG70965 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70967 DB	'_EVA_NOTES', 00H
	ORG $+1
$SG70971 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70975 DB	'_EVA_IMAGE', 00H
	ORG $+1
$SG70977 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70981 DB	'_EVA_IMAGESEL', 00H
	ORG $+2
$SG70983 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70987 DB	'_EVA_IMAGE_FILTER', 00H
	ORG $+2
$SG70989 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70993 DB	'_EVA_IMAGE_LABEL', 00H
	ORG $+3
$SG70995 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70998 DB	'_EVA_CTRLTREE', 00H
	ORG $+2
$SG71000 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71004 DB	'-- Forms label cache : Search for title control in CTRLT'
	DB	'REE ', 0aH, 'SELECT TLink.IdObj FROM TLink ', 0aH, 'INNER JOI'
	DB	'N TVal AS TField ON TField.IdValue=TLink.IdField ', 0aH, 'INN'
	DB	'ER JOIN TVal AS TVal ON TVal.IdValue=TLink.IdValue ', 0aH, 'W'
	DB	'HERE TLink.IdObj IN(', 00H
$SG71006 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71010 DB	') ', 0aH, 'AND TLink.DateDel IS NULL ', 0aH, 'AND TField'
	DB	'.TxtValue=''_EVA_TYPE'' ', 0aH, 'AND TVal.TxtValue=''_EVA_TIT'
	DB	'LE'' ', 0aH, 'GROUP BY TLink.IdObj ', 0aH, 'ORDER BY TLink.Li'
	DB	'ne, TLink.Num', 00H
$SG71012 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71019 DB	'_EVA_DISPLAYFIELDS', 00H
	ORG $+1
$SG71021 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71025 DB	'_EVA_DISPLAYFORMAT', 00H
	ORG $+1
$SG71027 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71031 DB	'_EVA_DISPLAYLABELS', 00H
	ORG $+1
$SG71033 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71037 DB	'_EVA_DISPLAYLBLPFX', 00H
	ORG $+1
$SG71039 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71044 DB	'1', 00H
	ORG $+2
$SG71046 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71050 DB	'_EVA_DISPLAYFIELDS', 00H
	ORG $+1
$SG71052 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71056 DB	'_EVA_DISPLAYLABELS', 00H
	ORG $+1
$SG71058 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71062 DB	'_EVA_DISPLAYFORMAT', 00H
	ORG $+1
$SG71064 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71068 DB	'_EVA_DISPLAYINTITLE', 00H
$SG71070 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71074 DB	'_EVA_DISPLAYINLABEL', 00H
$SG71076 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71080 DB	'_EVA_DISPLAYLBLPFX', 00H
	ORG $+1
$SG71082 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71086 DB	'_EVA_SEPARATOR', 00H
	ORG $+1
$SG71088 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71092 DB	'_EVA_DISPLAYNOTES', 00H
	ORG $+2
$SG71094 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71104 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71107 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71111 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71115 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71119 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71123 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71127 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71133 DB	'1', 00H
	ORG $+2
$SG71135 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71142 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG71146 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71149 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG71153 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71163 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_obj_label.c', 00H
$SG71164 DB	'qry_obj_label', 00H
	ORG $+2
$SG71168 DB	'0', 00H
	ORG $+2
$SG71173 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71177 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71182 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71188 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71192 DB	'Fiche', 00H
	ORG $+2
$SG71194 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71198 DB	' : ', 00H
$SG71200 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71205 DB	' - ', 00H
$SG71207 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71212 DB	0aH, 0aH, 00H
	ORG $+1
$SG71214 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71220 DB	0aH, 0aH, 00H
	ORG $+1
$SG71222 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71226 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG71227 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_obj_label.c', 00H
$SG71228 DB	'qry_obj_label', 00H
	ORG $+2
$SG71230 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\qry_obj_label.c', 00H
$SG71231 DB	'qry_obj_label', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_label$ = 12
_fnotes$ = 16
_objname$ = 20
_objtitle$ = 24
_notes$ = 28
_img$ = 32
_imgsel$ = 36
_i_formcache$ = 40
_id_form$ = 44
_data$ = 48
_beg$ = 52
_fields$ = -68
_format$ = -92
_labels$ = -48
_intitle$ = -28
_inlabel$ = -168
_pfx$ = -208
_separ$ = -188
_values$ = -144
__data$ = -116
_formdata$ = -8
_sql$ = -4
_i$ = -96
_j$ = -124
_k$ = -148
_objdata$ = -120
_id_obj$ = -72
__c$70960 = -212
__c$70966 = -216
__c$71141 = -220
__c$71148 = -224
_c$71159 = -228
_b_match$71160 = -232
_qry_obj_label PROC NEAR

; 238  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 248				; 000000f8H

; 239  : 	DynTable fields = {0};

	mov	DWORD PTR _fields$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _fields$[ebp+4], eax
	mov	DWORD PTR _fields$[ebp+8], eax
	mov	DWORD PTR _fields$[ebp+12], eax
	mov	DWORD PTR _fields$[ebp+16], eax

; 240  : 	DynTable format = {0};

	mov	DWORD PTR _format$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _format$[ebp+4], ecx
	mov	DWORD PTR _format$[ebp+8], ecx
	mov	DWORD PTR _format$[ebp+12], ecx
	mov	DWORD PTR _format$[ebp+16], ecx

; 241  : 	DynTable labels = {0};

	mov	DWORD PTR _labels$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _labels$[ebp+4], edx
	mov	DWORD PTR _labels$[ebp+8], edx
	mov	DWORD PTR _labels$[ebp+12], edx
	mov	DWORD PTR _labels$[ebp+16], edx

; 242  : 	DynTable intitle = {0};

	mov	DWORD PTR _intitle$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _intitle$[ebp+4], eax
	mov	DWORD PTR _intitle$[ebp+8], eax
	mov	DWORD PTR _intitle$[ebp+12], eax
	mov	DWORD PTR _intitle$[ebp+16], eax

; 243  : 	DynTable inlabel = {0};

	mov	DWORD PTR _inlabel$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _inlabel$[ebp+4], ecx
	mov	DWORD PTR _inlabel$[ebp+8], ecx
	mov	DWORD PTR _inlabel$[ebp+12], ecx
	mov	DWORD PTR _inlabel$[ebp+16], ecx

; 244  : 	DynTable pfx = {0};

	mov	DWORD PTR _pfx$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _pfx$[ebp+4], edx
	mov	DWORD PTR _pfx$[ebp+8], edx
	mov	DWORD PTR _pfx$[ebp+12], edx
	mov	DWORD PTR _pfx$[ebp+16], edx

; 245  : 	DynTable separ = {0};

	mov	DWORD PTR _separ$[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _separ$[ebp+4], eax
	mov	DWORD PTR _separ$[ebp+8], eax
	mov	DWORD PTR _separ$[ebp+12], eax
	mov	DWORD PTR _separ$[ebp+16], eax

; 246  : 	DynTable values = {0};

	mov	DWORD PTR _values$[ebp], 0
	xor	ecx, ecx
	mov	DWORD PTR _values$[ebp+4], ecx
	mov	DWORD PTR _values$[ebp+8], ecx
	mov	DWORD PTR _values$[ebp+12], ecx
	mov	DWORD PTR _values$[ebp+16], ecx

; 247  : 	DynTable _data = {0};

	mov	DWORD PTR __data$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR __data$[ebp+4], edx
	mov	DWORD PTR __data$[ebp+8], edx
	mov	DWORD PTR __data$[ebp+12], edx
	mov	DWORD PTR __data$[ebp+16], edx

; 248  : 	DynTable *formdata = NULL;

	mov	DWORD PTR _formdata$[ebp], 0

; 249  : 	DynBuffer *sql = NULL;

	mov	DWORD PTR _sql$[ebp], 0

; 250  : 	unsigned long i, j, k;
; 251  : 	DynTableCell *objdata = dyntab_cell(data, beg, 0);

	push	0
	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _objdata$[ebp], eax

; 252  : 	unsigned long id_obj = objdata ? objdata->IdObj : cntxt->form ? DYNTAB_TOUL(&cntxt->form->id_obj) : 0;

	cmp	DWORD PTR _objdata$[ebp], 0
	je	SHORT $L71258
	mov	edx, DWORD PTR _objdata$[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	DWORD PTR -236+[ebp], eax
	jmp	SHORT $L71259
$L71258:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L71256
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	add	eax, 32					; 00000020H
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR -240+[ebp], eax
	jmp	SHORT $L71257
$L71256:
	mov	DWORD PTR -240+[ebp], 0
$L71257:
	mov	ecx, DWORD PTR -240+[ebp]
	mov	DWORD PTR -236+[ebp], ecx
$L71259:
	mov	edx, DWORD PTR -236+[ebp]
	mov	DWORD PTR _id_obj$[ebp], edx

; 253  : 	if(i_formcache) *i_formcache = 0;

	cmp	DWORD PTR _i_formcache$[ebp], 0
	je	SHORT $L70934
	mov	eax, DWORD PTR _i_formcache$[ebp]
	mov	DWORD PTR [eax], 0
$L70934:

; 254  : 
; 255  : 	/* Read object data if not given */
; 256  : 	if(!data && beg)

	cmp	DWORD PTR _data$[ebp], 0
	jne	SHORT $L70935
	cmp	DWORD PTR _beg$[ebp], 0
	je	SHORT $L70935

; 258  : 		id_obj = beg;

	mov	ecx, DWORD PTR _beg$[ebp]
	mov	DWORD PTR _id_obj$[ebp], ecx

; 259  : 		beg = 0;

	mov	DWORD PTR _beg$[ebp], 0

; 260  : 		data = &_data;

	lea	edx, DWORD PTR __data$[ebp]
	mov	DWORD PTR _data$[ebp], edx

; 261  : 		if(qry_obj_idfield(cntxt, data, id_obj, 0)) STACK_ERROR;

	push	0
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_idfield
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70936
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 261		; 00000105H
	jmp	$eva_err$70937
$L70936:

; 262  : 		objdata = dyntab_cell(data, 0, 0);

	push	0
	push	0
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _objdata$[ebp], eax
$L70935:

; 264  : 
; 265  : 	/* Initialize output buffers */
; 266  : 	if(label) M_FREE(*label);

	cmp	DWORD PTR _label$[ebp], 0
	je	SHORT $L70938
	mov	edx, DWORD PTR _label$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _label$[ebp]
	mov	DWORD PTR [ecx], 0
$L70938:

; 267  : 	if(objname) M_FREE(*objname);

	cmp	DWORD PTR _objname$[ebp], 0
	je	SHORT $L70939
	mov	edx, DWORD PTR _objname$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _objname$[ebp]
	mov	DWORD PTR [ecx], 0
$L70939:

; 268  : 	if(objtitle) M_FREE(*objtitle);

	cmp	DWORD PTR _objtitle$[ebp], 0
	je	SHORT $L70940
	mov	edx, DWORD PTR _objtitle$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _objtitle$[ebp]
	mov	DWORD PTR [ecx], 0
$L70940:

; 269  : 	if(fnotes) M_FREE(*fnotes);

	cmp	DWORD PTR _fnotes$[ebp], 0
	je	SHORT $L70941
	mov	edx, DWORD PTR _fnotes$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _fnotes$[ebp]
	mov	DWORD PTR [ecx], 0
$L70941:

; 270  : 	if(notes) M_FREE(*notes);

	cmp	DWORD PTR _notes$[ebp], 0
	je	SHORT $L70942
	mov	edx, DWORD PTR _notes$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _notes$[ebp]
	mov	DWORD PTR [ecx], 0
$L70942:

; 271  : 	if(img) M_FREE(*img);

	cmp	DWORD PTR _img$[ebp], 0
	je	SHORT $L70943
	mov	edx, DWORD PTR _img$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _img$[ebp]
	mov	DWORD PTR [ecx], 0
$L70943:

; 272  : 	if(imgsel) M_FREE(*imgsel);

	cmp	DWORD PTR _imgsel$[ebp], 0
	je	SHORT $L70944
	mov	edx, DWORD PTR _imgsel$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_mem_free
	add	esp, 4
	mov	ecx, DWORD PTR _imgsel$[ebp]
	mov	DWORD PTR [ecx], 0
$L70944:

; 273  : 
; 274  : 	/* Use current form & object if no data given */
; 275  : 	if(!objdata && cntxt->form) id_form = DYNTAB_TOUL(&cntxt->form->id_form);

	cmp	DWORD PTR _objdata$[ebp], 0
	jne	SHORT $L70945
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+80], 0
	je	SHORT $L70945
	push	10					; 0000000aH
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	add	ecx, 12					; 0000000cH
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id_form$[ebp], eax

; 276  : 
; 277  : 	/* Check for form in data if none given - return if not found */
; 278  : 	else if(!id_form) id_form = strtoul(dyntab_field_val(data, "_EVA_FORMSTAMP", ~0UL, beg), NULL, 10);

	jmp	SHORT $L70948
$L70945:
	cmp	DWORD PTR _id_form$[ebp], 0
	jne	SHORT $L70948
	push	10					; 0000000aH
	push	0
	mov	edx, DWORD PTR _beg$[ebp]
	push	edx
	push	-1
	push	OFFSET FLAT:$SG70950
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	push	eax
	call	_strtoul
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _id_form$[ebp], eax
$L70948:

; 279  : 	if(!id_form) RETURN_OK;

	cmp	DWORD PTR _id_form$[ebp], 0
	jne	SHORT $L70951
	jmp	$eva_noerr$70952
$L70951:

; 280  : 
; 281  : 	/* Search for form in cache */
; 282  : 	for(i = 0; i < cntxt->nbfc && cntxt->fc[i].idform && cntxt->fc[i].idform != id_form; i++);

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70953
$L70954:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70953:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+29296]
	jae	SHORT $L70955
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+ecx+96], 0
	je	SHORT $L70955
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+eax+96]
	cmp	edx, DWORD PTR _id_form$[ebp]
	je	SHORT $L70955
	jmp	SHORT $L70954
$L70955:

; 283  : 	if(i == cntxt->nbfc && i < FORM_CACHE_SIZE)

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+29296]
	jne	$L70956
	cmp	DWORD PTR _i$[ebp], 100			; 00000064H
	jae	$L70956

; 285  : 		/* Form not found in cache : read form data & set cache values */
; 286  : 		formdata = &cntxt->fc[i].data;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+108]
	mov	DWORD PTR _formdata$[ebp], ecx

; 287  : 		if(qry_cache_idobj(formdata, id_form) || ctrl_read_baseobj(cntxt, formdata)) STACK_ERROR;

	push	3
	push	0
	mov	edx, DWORD PTR _id_form$[ebp]
	push	edx
	mov	eax, DWORD PTR _formdata$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_cache_idobj_field
	add	esp, 20					; 00000014H
	test	eax, eax
	jne	SHORT $L70959
	mov	edx, DWORD PTR _formdata$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_read_baseobj
	add	esp, 8
	test	eax, eax
	je	SHORT $L70958
$L70959:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 287		; 0000011fH
	jmp	$eva_err$70937
$L70958:

; 288  : 
; 289  : 		/* Store form data in cache */
; 290  : 		cntxt->fc[i].idform = id_form;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _id_form$[ebp]
	mov	DWORD PTR [eax+edx+96], ecx

; 291  : 		DYNBUF_ADD_CELLP(&cntxt->fc[i].label, DYNTAB_FIELD_CELL(formdata, LABEL), NO_CONV);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70961
	mov	edx, DWORD PTR _formdata$[ebp]
	push	edx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR __c$70960[ebp], eax
	cmp	DWORD PTR __c$70960[ebp], 0
	je	SHORT $L70963
	push	0
	push	0
	mov	eax, DWORD PTR __c$70960[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR __c$70960[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+100]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70963
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70965
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 291		; 00000123H
	jmp	$eva_err$70937
$L70963:

; 292  : 		DYNBUF_ADD_CELLP(&cntxt->fc[i].notes, DYNTAB_FIELD_CELL(formdata, NOTES), NO_CONV);

	push	0
	push	-1
	push	OFFSET FLAT:$SG70967
	mov	eax, DWORD PTR _formdata$[ebp]
	push	eax
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR __c$70966[ebp], eax
	cmp	DWORD PTR __c$70966[ebp], 0
	je	SHORT $L70969
	push	0
	push	0
	mov	ecx, DWORD PTR __c$70966[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR __c$70966[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+104]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70969
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70971
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 292		; 00000124H
	jmp	$eva_err$70937
$L70969:

; 293  : 		DYNTAB_FIELD_TAB1(&cntxt->fc[i].img, formdata, IMAGE);

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+308]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70975
	mov	ecx, DWORD PTR _formdata$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+308]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70974
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+308]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70973
$L70974:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70977
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 293		; 00000125H
	jmp	$eva_err$70937
$L70973:

; 294  : 		DYNTAB_FIELD_TAB1(&cntxt->fc[i].imgsel, formdata,IMAGESEL);

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+328]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70981
	mov	ecx, DWORD PTR _formdata$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+328]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70980
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+328]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70979
$L70980:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70983
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 294		; 00000126H
	jmp	$eva_err$70937
$L70979:

; 295  : 		DYNTAB_FIELD_TAB1(&cntxt->fc[i].cond, formdata, IMAGE_FILTER);

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+348]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70987
	mov	ecx, DWORD PTR _formdata$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+348]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70986
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+348]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70985
$L70986:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70989
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 295		; 00000127H
	jmp	$eva_err$70937
$L70985:

; 296  : 		DYNTAB_FIELD_TAB1(&cntxt->fc[i].condlbl, formdata, IMAGE_LABEL);

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+368]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70993
	mov	ecx, DWORD PTR _formdata$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+368]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L70992
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+368]
	push	ecx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L70991
$L70992:
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70995
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 296		; 00000128H
	jmp	$eva_err$70937
$L70991:

; 297  : 
; 298  : 		/* Search for title control in CTRLTREE */
; 299  : 		DYNTAB_FREE(fields);

	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4

; 300  : 		DYNTAB_FIELD(&fields, formdata, CTRLTREE);

	lea	edx, DWORD PTR _fields$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG70998
	mov	eax, DWORD PTR _formdata$[ebp]
	push	eax
	push	0
	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70997
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71000
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 300		; 0000012cH
	jmp	$eva_err$70937
$L70997:

; 301  : 		if(fields.nbrows)

	cmp	DWORD PTR _fields$[ebp], 0
	je	$L71001

; 304  : 				"-- Forms label cache : Search for title control in CTRLTREE \n"
; 305  : 				"SELECT TLink.IdObj FROM TLink \n"
; 306  : 				"INNER JOIN TVal AS TField ON TField.IdValue=TLink.IdField \n"
; 307  : 				"INNER JOIN TVal AS TVal ON TVal.IdValue=TLink.IdValue \n"
; 308  : 				"WHERE TLink.IdObj IN(");

	push	0
	push	0
	push	227					; 000000e3H
	push	OFFSET FLAT:$SG71004
	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71003
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71006
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 308		; 00000134H
	jmp	$eva_err$70937
$L71003:

; 309  : 			if(qry_values_list(cntxt, &fields, 0, &sql)) STACK_ERROR

	lea	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _fields$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_values_list
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71007
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 309		; 00000135H
	jmp	$eva_err$70937
$L71007:

; 311  : 					"AND TLink.DateDel IS NULL \n"
; 312  : 					"AND TField.TxtValue='_EVA_TYPE' \n"
; 313  : 					"AND TVal.TxtValue='_EVA_TITLE' \n"
; 314  : 				"GROUP BY TLink.IdObj \n"
; 315  : 				"ORDER BY TLink.Line, TLink.Num");

	push	0
	push	0
	push	147					; 00000093H
	push	OFFSET FLAT:$SG71010
	lea	edx, DWORD PTR _sql$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71009
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71012
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 315		; 0000013bH
	jmp	$eva_err$70937
$L71009:

; 316  : 
; 317  : 			/* Exec query & read title data */
; 318  : 			if(sql_exec_query(cntxt, sql->data) ||
; 319  : 				sql_get_table(cntxt, &fields, 2) ||
; 320  : 				qry_obj_data(cntxt, &values, &fields, NULL)) STACK_ERROR;

	mov	edx, DWORD PTR _sql$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_sql_exec_query
	add	esp, 8
	test	eax, eax
	jne	SHORT $L71015
	push	2
	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_sql_get_table
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71015
	push	0
	lea	eax, DWORD PTR _fields$[ebp]
	push	eax
	lea	ecx, DWORD PTR _values$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_obj_data
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L71014
$L71015:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 320		; 00000140H
	jmp	$eva_err$70937
$L71014:

; 321  : 			M_FREE(sql);

	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
$L71001:

; 323  : 		/* Set list of displayed fields from title */
; 324  : 		DYNTAB_FIELD_TAB1(&cntxt->fc[i].fields, &values, DISPLAYFIELDS);

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+148]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71019
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+148]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71018
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+148]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71017
$L71018:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71021
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 324		; 00000144H
	jmp	$eva_err$70937
$L71017:

; 325  : 		DYNTAB_FIELD_TAB1(&cntxt->fc[i].format, &values, DISPLAYFORMAT);

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+168]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71025
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+168]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71024
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+168]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71023
$L71024:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71027
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 325		; 00000145H
	jmp	$eva_err$70937
$L71023:

; 326  : 		DYNTAB_FIELD_TAB1(&cntxt->fc[i].labels, &values, DISPLAYLABELS);

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+128]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71031
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+128]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71030
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+128]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71029
$L71030:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71033
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 326		; 00000146H
	jmp	$eva_err$70937
$L71029:

; 327  : 		DYNTAB_FIELD_TAB1(&cntxt->fc[i].pfx, &values, DISPLAYLBLPFX);

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+248]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71037
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+248]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71036
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+248]
	push	edx
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71035
$L71036:
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71039
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 327		; 00000147H
	jmp	$eva_err$70937
$L71035:

; 328  : 		for(j = 0; j < cntxt->fc[i].fields.nbrows; j++) DYNTAB_SET(&cntxt->fc[i].intitle, j, 0, "1");

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71040
$L71041:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L71040:
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+eax+148]
	jae	SHORT $L71042
	push	1
	push	OFFSET FLAT:$SG71044
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+208]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71043
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71046
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 328		; 00000148H
	jmp	$eva_err$70937
$L71043:
	jmp	SHORT $L71041
$L71042:

; 329  : 
; 330  : 		/* Read displayed fields from form data */
; 331  : 		DYNTAB_FIELD_TAB(&fields, formdata, DISPLAYFIELDS);

	lea	eax, DWORD PTR _fields$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71050
	mov	ecx, DWORD PTR _formdata$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _fields$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71049
	lea	eax, DWORD PTR _fields$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71048
$L71049:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71052
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 331		; 0000014bH
	jmp	$eva_err$70937
$L71048:

; 332  : 		DYNTAB_FIELD_TAB(&labels, formdata, DISPLAYLABELS);

	lea	eax, DWORD PTR _labels$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71056
	mov	ecx, DWORD PTR _formdata$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _labels$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71055
	lea	eax, DWORD PTR _labels$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71054
$L71055:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71058
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 332		; 0000014cH
	jmp	$eva_err$70937
$L71054:

; 333  : 		DYNTAB_FIELD_TAB(&format, formdata, DISPLAYFORMAT);

	lea	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71062
	mov	ecx, DWORD PTR _formdata$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71061
	lea	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71060
$L71061:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71064
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 333		; 0000014dH
	jmp	$eva_err$70937
$L71060:

; 334  : 		DYNTAB_FIELD_TAB(&intitle, formdata, DISPLAYINTITLE);

	lea	eax, DWORD PTR _intitle$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71068
	mov	ecx, DWORD PTR _formdata$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _intitle$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71067
	lea	eax, DWORD PTR _intitle$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71066
$L71067:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71070
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 334		; 0000014eH
	jmp	$eva_err$70937
$L71066:

; 335  : 		DYNTAB_FIELD_TAB(&inlabel, formdata, DISPLAYINLABEL);

	lea	eax, DWORD PTR _inlabel$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71074
	mov	ecx, DWORD PTR _formdata$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _inlabel$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71073
	lea	eax, DWORD PTR _inlabel$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71072
$L71073:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71076
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 335		; 0000014fH
	jmp	$eva_err$70937
$L71072:

; 336  : 		DYNTAB_FIELD_TAB(&pfx, formdata, DISPLAYLBLPFX);

	lea	eax, DWORD PTR _pfx$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71080
	mov	ecx, DWORD PTR _formdata$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _pfx$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71079
	lea	eax, DWORD PTR _pfx$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71078
$L71079:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71082
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 336		; 00000150H
	jmp	$eva_err$70937
$L71078:

; 337  : 		DYNTAB_FIELD_TAB(&separ, formdata, SEPARATOR);

	lea	eax, DWORD PTR _separ$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71086
	mov	ecx, DWORD PTR _formdata$[ebp]
	push	ecx
	push	0
	lea	edx, DWORD PTR _separ$[ebp]
	push	edx
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71085
	lea	eax, DWORD PTR _separ$[ebp]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71084
$L71085:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71088
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 337		; 00000151H
	jmp	$eva_err$70937
$L71084:

; 338  : 		DYNTAB_FIELD_TAB1(&cntxt->fc[i].dnotes, formdata, DISPLAYNOTES);

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+288]
	push	edx
	call	_dyntab_free
	add	esp, 4
	push	0
	push	-1
	push	OFFSET FLAT:$SG71092
	mov	eax, DWORD PTR _formdata$[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+288]
	push	eax
	call	_dyntab_filter_field
	add	esp, 24					; 00000018H
	test	eax, eax
	jne	SHORT $L71091
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+288]
	push	eax
	call	_dyntab_order_lines
	add	esp, 4
	test	eax, eax
	je	SHORT $L71090
$L71091:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71094
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 338		; 00000152H
	jmp	$eva_err$70937
$L71090:

; 339  : 
; 340  : 		/* Merge form & title display fields */
; 341  : 		for(j = 0; j < fields.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71095
$L71096:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L71095:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _fields$[ebp]
	jae	$L71097

; 343  : 			for(k = 0; k < cntxt->fc[i].fields.nbrows && dyntab_cmp(&fields, j, 0, &cntxt->fc[i].fields, k , 0); k++);

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L71098
$L71099:
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$L71098:
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR [ecx+eax+148]
	jae	SHORT $L71100
	push	0
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+148]
	push	eax
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _fields$[ebp]
	push	edx
	call	_dyntab_cmp
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L71100
	jmp	SHORT $L71099
$L71100:

; 344  : 			if(k == cntxt->fc[i].fields.nbrows)

	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR [ecx+eax+148]
	jne	$L71109

; 346  : 				DYNTAB_ADD_CELL(&cntxt->fc[i].fields, k, 0, &fields, j, 0);

	push	1
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+148]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71102
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71104
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 346		; 0000015aH
	jmp	$eva_err$70937
$L71102:

; 347  : 				DYNTAB_ADD_CELL(&cntxt->fc[i].format, k, 0, &format, j, 0);

	push	1
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _format$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+168]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71105
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71107
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 347		; 0000015bH
	jmp	$eva_err$70937
$L71105:

; 348  : 				if(dyntab_sz(&intitle, j, 0)) DYNTAB_ADD_CELL(&cntxt->fc[i].intitle, k, 0, &intitle, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _intitle$[ebp]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71109
	push	1
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _intitle$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+208]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71109
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71111
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 348		; 0000015cH
	jmp	$eva_err$70937
$L71109:

; 350  : 			if(dyntab_sz(&inlabel, j, 0)) DYNTAB_ADD_CELL(&cntxt->fc[i].inlabel, k, 0, &inlabel, j, 0);

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _inlabel$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71113
	push	1
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _inlabel$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+228]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71113
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71115
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 350		; 0000015eH
	jmp	$eva_err$70937
$L71113:

; 351  : 			if(dyntab_sz(&labels, j, 0) && !dyntab_sz(&cntxt->fc[i].labels, k, 0)) DYNTAB_ADD_CELL(&cntxt->fc[i].labels, k, 0, &labels, j, 0);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _labels$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L71117
	push	0
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+128]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $L71117
	push	1
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _labels$[ebp]
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+128]
	push	edx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71117
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71119
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 351		; 0000015fH
	jmp	$eva_err$70937
$L71117:

; 352  : 			if(dyntab_sz(&pfx, j, 0)) DYNTAB_ADD_CELL(&cntxt->fc[i].pfx, k, 0, &pfx, j, 0);

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _pfx$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71121
	push	1
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	lea	edx, DWORD PTR _pfx$[ebp]
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+248]
	push	eax
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71121
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71123
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 352		; 00000160H
	jmp	$eva_err$70937
$L71121:

; 353  : 			if(dyntab_sz(&separ, j, 0)) DYNTAB_ADD_CELL(&cntxt->fc[i].separ, k, 0, &separ, j, 0);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _separ$[ebp]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71125
	push	1
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	lea	eax, DWORD PTR _separ$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+268]
	push	ecx
	call	_dyntab_copy
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71125
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71127
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 353		; 00000161H
	jmp	$eva_err$70937
$L71125:

; 354  : 		}

	jmp	$L71096
$L71097:

; 355  : 		for(j = 0; j < cntxt->fc[i].fields.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71128
$L71129:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L71128:
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+edx+148]
	jae	SHORT $L71130

; 356  : 			if(dyntab_sz(&cntxt->fc[i].intitle, j, 0))

	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+208]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71132

; 357  : 				DYNTAB_SET(&cntxt->fc[i].inlabel, j, 0, "1");

	push	1
	push	OFFSET FLAT:$SG71133
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+228]
	push	eax
	call	_dyntab_set_txt
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71132
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71135
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 357		; 00000165H
	jmp	$eva_err$70937
$L71132:
	jmp	$L71129
$L71130:

; 358  : 		cntxt->nbfc++;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29296]
	add	ecx, 1
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29296], ecx
$L70956:

; 360  : 	if(i_formcache) *i_formcache = i;

	cmp	DWORD PTR _i_formcache$[ebp], 0
	je	SHORT $L71136
	mov	eax, DWORD PTR _i_formcache$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [eax], ecx
$L71136:

; 361  : 
; 362  : 	/* If object is a control : use special naming & imaging function */
; 363  : 	if(id_form == OBJ_FORM_CONTROL)

	cmp	DWORD PTR _id_form$[ebp], 10		; 0000000aH
	jne	$L71137

; 365  : 		if(!objdata) { data = &cntxt->form->objdata; beg = 0; }

	cmp	DWORD PTR _objdata$[ebp], 0
	jne	SHORT $L71138
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+80]
	add	eax, 52					; 00000034H
	mov	DWORD PTR _data$[ebp], eax
	mov	DWORD PTR _beg$[ebp], 0
$L71138:

; 366  : 		if(ctrl_get_label_img(cntxt, img, imgsel, label, notes, data, beg)) STACK_ERROR;

	mov	ecx, DWORD PTR _beg$[ebp]
	push	ecx
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _notes$[ebp]
	push	eax
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	mov	edx, DWORD PTR _imgsel$[ebp]
	push	edx
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_get_label_img
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L71139
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 366		; 0000016eH
	jmp	$eva_err$70937
$L71139:

; 367  : 		if(objname) DYNBUF_ADD_CELLP(objname, dyntab_field_cell(data, "_EVA_LABEL", ~0UL, beg), NO_CONV);

	cmp	DWORD PTR _objname$[ebp], 0
	je	SHORT $L71144
	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	push	-1
	push	OFFSET FLAT:$SG71142
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR __c$71141[ebp], eax
	cmp	DWORD PTR __c$71141[ebp], 0
	je	SHORT $L71144
	push	0
	push	0
	mov	edx, DWORD PTR __c$71141[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR __c$71141[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _objname$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71144
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71146
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 367		; 0000016fH
	jmp	$eva_err$70937
$L71144:

; 368  : 		if(objtitle) DYNBUF_ADD_CELLP(objtitle, dyntab_field_cell(data, "_EVA_LABEL", ~0UL, beg), NO_CONV);

	cmp	DWORD PTR _objtitle$[ebp], 0
	je	SHORT $L71151
	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	push	-1
	push	OFFSET FLAT:$SG71149
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR __c$71148[ebp], eax
	cmp	DWORD PTR __c$71148[ebp], 0
	je	SHORT $L71151
	push	0
	push	0
	mov	edx, DWORD PTR __c$71148[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR __c$71148[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _objtitle$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71151
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71153
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 368		; 00000170H
	jmp	$eva_err$70937
$L71151:

; 369  : 		RETURN_OK;

	jmp	$eva_noerr$70952
$L71137:

; 371  : 	
; 372  : 	/* Return if no form found */
; 373  : 	if(i == cntxt->nbfc) RETURN_OK;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+29296]
	jne	SHORT $L71154
	jmp	$eva_noerr$70952
$L71154:

; 374  : 		
; 375  : 	/* Set images : look for first matched condition */
; 376  : 	j = cntxt->fc[i].img.nbrows;

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+edx+308]
	mov	DWORD PTR _j$[ebp], ecx

; 377  : 	if(img) for(j = 0; j < cntxt->fc[i].img.nbrows; j++)

	cmp	DWORD PTR _img$[ebp], 0
	je	$L71158
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L71156
$L71157:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L71156:
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+eax+308]
	jae	$L71158

; 379  : 		DynTableCell *c = dyntab_cell(&cntxt->fc[i].cond, j, 0);

	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+348]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$71159[ebp], eax

; 380  : 		int b_match = !(c && c->txt && c->len);

	cmp	DWORD PTR _c$71159[ebp], 0
	je	SHORT $L71260
	mov	ecx, DWORD PTR _c$71159[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71260
	mov	edx, DWORD PTR _c$71159[ebp]
	cmp	DWORD PTR [edx+4], 0
	je	SHORT $L71260
	mov	DWORD PTR -244+[ebp], 0
	jmp	SHORT $L71261
$L71260:
	mov	DWORD PTR -244+[ebp], 1
$L71261:
	mov	eax, DWORD PTR -244+[ebp]
	mov	DWORD PTR _b_match$71160[ebp], eax

; 381  : 		if(!b_match)

	cmp	DWORD PTR _b_match$71160[ebp], 0
	jne	$L71167

; 383  : 			if(form_eval_fieldexpr(cntxt, &fields, id_form, id_obj, c->txt, c->len, data, beg))

	mov	ecx, DWORD PTR _beg$[ebp]
	push	ecx
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _c$71159[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _c$71159[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _id_form$[ebp]
	push	edx
	lea	eax, DWORD PTR _fields$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_form_eval_fieldexpr
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L71162

; 384  : 				CLEAR_ERROR;

	push	384					; 00000180H
	push	OFFSET FLAT:$SG71163
	push	OFFSET FLAT:$SG71164
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$L71162:

; 385  : 			for(k = 0; k < fields.nbrows && !b_match; k++)

	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L71165
$L71166:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L71165:
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR _fields$[ebp]
	jae	SHORT $L71167
	cmp	DWORD PTR _b_match$71160[ebp], 0
	jne	SHORT $L71167

; 386  : 				b_match = dyntab_sz(&fields, k, 0) && strcmp("0", dyntab_val(&fields, k, 0));

	push	0
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	lea	eax, DWORD PTR _fields$[ebp]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71262
	push	0
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	lea	edx, DWORD PTR _fields$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	push	OFFSET FLAT:$SG71168
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L71262
	mov	DWORD PTR -248+[ebp], 1
	jmp	SHORT $L71263
$L71262:
	mov	DWORD PTR -248+[ebp], 0
$L71263:
	mov	eax, DWORD PTR -248+[ebp]
	mov	DWORD PTR _b_match$71160[ebp], eax
	jmp	$L71166
$L71167:

; 388  : 		if(b_match)

	cmp	DWORD PTR _b_match$71160[ebp], 0
	je	$L71169

; 390  : 			/* Matched condition : set images */
; 391  : 			DYNBUF_ADD_CELL(img, &cntxt->fc[i].img, j, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+308]
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+308]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _img$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71171
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71173
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 391		; 00000187H
	jmp	$eva_err$70937
$L71171:

; 392  : 			DYNBUF_ADD_CELL(imgsel, &cntxt->fc[i].imgsel, j, 0, NO_CONV);

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+328]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+328]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _imgsel$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71175
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71177
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 392		; 00000188H
	jmp	$eva_err$70937
$L71175:

; 393  : 			break;

	jmp	SHORT $L71158
$L71169:

; 395  : 	}

	jmp	$L71157
$L71158:

; 396  : 
; 397  : 	/* Set form label */
; 398  : 	if(j < cntxt->fc[i].img.nbrows && dyntab_sz(&cntxt->fc[i].condlbl, j, 0))

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+edx+308]
	jae	$L71178
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+368]
	push	edx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L71178

; 399  : 		DYNBUF_ADD_CELL(label, &cntxt->fc[i].condlbl, j, 0, NO_CONV)

	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+368]
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+368]
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _label$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71180
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71182
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 399		; 0000018fH
	jmp	$eva_err$70937
$L71180:

; 400  : 	else if(cntxt->fc[i].label)

	jmp	$L71191
$L71178:
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+edx+100], 0
	je	SHORT $L71184

; 401  : 		DYNBUF_ADD_BUF(label, cntxt->fc[i].label, NO_CONV)

	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+ecx+100], 0
	je	SHORT $L71186
	push	0
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+eax+100]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+ecx+100]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71186
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71188
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 401		; 00000191H
	jmp	$eva_err$70937
$L71186:

; 402  : 	else DYNBUF_ADD_STR(label, "Fiche");

	jmp	SHORT $L71191
$L71184:
	push	0
	push	0
	push	5
	push	OFFSET FLAT:$SG71192
	mov	ecx, DWORD PTR _label$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71191
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71194
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 402		; 00000192H
	jmp	$eva_err$70937
$L71191:

; 403  : 
; 404  : 	/* Set object label & notes */
; 405  : 	if(objtitle && *objtitle) DYNBUF_ADD_STR(objtitle, " : ");

	cmp	DWORD PTR _objtitle$[ebp], 0
	je	SHORT $L71197
	mov	ecx, DWORD PTR _objtitle$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71197
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG71198
	mov	edx, DWORD PTR _objtitle$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71197
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71200
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 405		; 00000195H
	jmp	$eva_err$70937
$L71197:

; 406  : 	if(objtitle && qry_build_obj_label(cntxt, objtitle, &values, cntxt->fc + i, &cntxt->fc[i].intitle, id_obj, data, beg, 100))

	cmp	DWORD PTR _objtitle$[ebp], 0
	je	SHORT $L71201
	push	100					; 00000064H
	mov	edx, DWORD PTR _beg$[ebp]
	push	edx
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _id_obj$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+208]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	lea	ecx, DWORD PTR [eax+edx+96]
	push	ecx
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	mov	eax, DWORD PTR _objtitle$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_qry_build_obj_label
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71201

; 407  : 		STACK_ERROR;

	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 407		; 00000197H
	jmp	$eva_err$70937
$L71201:

; 408  : 	if(objname && *objname) DYNBUF_ADD_STR(objname, " - ");

	cmp	DWORD PTR _objname$[ebp], 0
	je	SHORT $L71204
	mov	eax, DWORD PTR _objname$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L71204
	push	0
	push	0
	push	3
	push	OFFSET FLAT:$SG71205
	mov	ecx, DWORD PTR _objname$[ebp]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71204
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG71207
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 408		; 00000198H
	jmp	$eva_err$70937
$L71204:

; 409  : 	if(objname && qry_build_obj_label(cntxt, objname, &values, cntxt->fc + i, &cntxt->fc[i].inlabel, id_obj, data, beg, 100))

	cmp	DWORD PTR _objname$[ebp], 0
	je	SHORT $L71208
	push	100					; 00000064H
	mov	ecx, DWORD PTR _beg$[ebp]
	push	ecx
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	eax, DWORD PTR _id_obj$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+228]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	lea	eax, DWORD PTR [edx+ecx+96]
	push	eax
	lea	ecx, DWORD PTR _values$[ebp]
	push	ecx
	mov	edx, DWORD PTR _objname$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_qry_build_obj_label
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71208

; 410  : 		STACK_ERROR;

	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 410		; 0000019aH
	jmp	$eva_err$70937
$L71208:

; 411  : 	if(notes && *notes) DYNBUF_ADD_STR(notes, "\n\n");

	cmp	DWORD PTR _notes$[ebp], 0
	je	SHORT $L71211
	mov	edx, DWORD PTR _notes$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L71211
	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG71212
	mov	eax, DWORD PTR _notes$[ebp]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71211
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG71214
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 411		; 0000019bH
	jmp	$eva_err$70937
$L71211:

; 412  : 	if(notes && qry_build_obj_label(cntxt, notes, &values, cntxt->fc + i, NULL, id_obj, data, beg, 10000))

	cmp	DWORD PTR _notes$[ebp], 0
	je	SHORT $L71216
	push	10000					; 00002710H
	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	edx, DWORD PTR _id_obj$[ebp]
	push	edx
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 292				; 00000124H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	lea	edx, DWORD PTR [ecx+eax+96]
	push	edx
	lea	eax, DWORD PTR _values$[ebp]
	push	eax
	mov	ecx, DWORD PTR _notes$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_qry_build_obj_label
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L71216

; 413  : 		STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 413		; 0000019dH
	jmp	$eva_err$70937
$L71216:

; 414  : 
; 415  : 	/* Set form notes */
; 416  : 	if(fnotes && *fnotes) DYNBUF_ADD_STR(fnotes, "\n\n");

	cmp	DWORD PTR _fnotes$[ebp], 0
	je	SHORT $L71219
	mov	ecx, DWORD PTR _fnotes$[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L71219
	push	0
	push	0
	push	2
	push	OFFSET FLAT:$SG71220
	mov	edx, DWORD PTR _fnotes$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71219
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71222
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 416		; 000001a0H
	jmp	$eva_err$70937
$L71219:

; 417  : 	DYNBUF_ADD_BUF(fnotes, cntxt->fc[i].notes, NO_CONV);

	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+edx+104], 0
	je	SHORT $L71224
	push	0
	push	0
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 292				; 00000124H
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+ecx+104]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 292				; 00000124H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+edx+104]
	add	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _fnotes$[ebp]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L71224
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG71226
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 417		; 000001a1H
	jmp	SHORT $eva_err$70937
$L71224:
$eva_noerr$70952:

; 418  : 
; 419  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG71227
	push	OFFSET FLAT:$SG71228
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70937:
	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29872], 0
	je	SHORT $L71229
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29900]
	push	edx
	push	OFFSET FLAT:$SG71230
	push	OFFSET FLAT:$SG71231
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_add_context
	add	esp, 16					; 00000010H
$L71229:
	lea	ecx, DWORD PTR _fields$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _format$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _labels$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _intitle$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _inlabel$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR _pfx$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	lea	ecx, DWORD PTR _separ$[ebp]
	push	ecx
	call	_dyntab_free
	add	esp, 4
	lea	edx, DWORD PTR _values$[ebp]
	push	edx
	call	_dyntab_free
	add	esp, 4
	lea	eax, DWORD PTR __data$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _sql$[ebp]
	push	ecx
	call	_mem_free
	add	esp, 4
	mov	DWORD PTR _sql$[ebp], 0
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 420  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_qry_obj_label ENDP
_TEXT	ENDS
END
