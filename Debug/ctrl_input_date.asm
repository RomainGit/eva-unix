	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_date.c
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
PUBLIC	_ctrl_read_date
EXTRN	_ctrl_eval_fieldexpr:NEAR
EXTRN	_qsort_ctrlval:NEAR
EXTRN	_datetxt_to_age:NEAR
EXTRN	_input_to_datetxt:NEAR
EXTRN	_datetxt_invalid:NEAR
EXTRN	_delay_to_datetxt:NEAR
EXTRN	_atoi:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_cgi_get_subfield:NEAR
EXTRN	_dyntab_free:NEAR
EXTRN	_dyntab_sz:NEAR
EXTRN	_dyntab_val:NEAR
EXTRN	_dyntab_cell:NEAR
EXTRN	_dyntab_add:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strlen:NEAR
EXTRN	_err_add_context:NEAR
EXTRN	_err_clear:NEAR
EXTRN	_strncpy:NEAR
EXTRN	_dyntab_field_val:NEAR
EXTRN	_dyntab_field_cell:NEAR
EXTRN	_dyntab_sort:NEAR
_BSS	SEGMENT
$SG70222 DB	01H DUP (?)
	ALIGN	4

$SG70225 DB	01H DUP (?)
	ALIGN	4

$SG70228 DB	01H DUP (?)
	ALIGN	4

$SG70231 DB	01H DUP (?)
	ALIGN	4

$SG70233 DB	01H DUP (?)
	ALIGN	4

$SG70320 DB	01H DUP (?)
	ALIGN	4

$SG70323 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG70221 DB	'_EVA_DATE_CHECKTYPE', 00H
$SG70224 DB	'_EVA_DURATION', 00H
	ORG $+2
$SG70227 DB	'_EVA_INPUT_AGE', 00H
	ORG $+1
$SG70230 DB	'_EVA_AGE_UNIT', 00H
	ORG $+2
$SG70236 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70239 DB	'_EVA_DATEREF_FIELD', 00H
	ORG $+1
$SG70244 DB	'_EVA_DateCr', 00H
$SG70246 DB	'MIN(_EVA_FORMSTAMP.DateCr)', 00H
	ORG $+1
$SG70250 DB	'_EVA_FIELD', 00H
	ORG $+1
$SG70251 DB	'_EVA_DateCr', 00H
$SG70252 DB	'_EVA_AGEREF', 00H
$SG70254 DB	'AGE', 00H
$SG70255 DB	'DATEMODE', 00H
	ORG $+3
$SG70256 DB	'AGEMODE', 00H
$SG70275 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70303 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70317 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70319 DB	'_EVA_AGE_LABEL', 00H
	ORG $+1
$SG70322 DB	'_EVA_DURATION', 00H
	ORG $+2
$SG70324 DB	'Dur', 0e9H, 'e', 00H
	ORG $+2
$SG70325 DB	'Age', 00H
$SG70327 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_date.'
	DB	'c', 00H
	ORG $+2
$SG70328 DB	'ctrl_read_date', 00H
	ORG $+1
$SG70330 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_date.'
	DB	'c', 00H
	ORG $+2
$SG70331 DB	'ctrl_read_date', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -64
_age$ = -16
_i$ = -48
_j$ = -56
_cgival$ = -44
_sz$ = -60
_sz1$ = -24
_idobj$ = -8
_date_checktype$ = -72
_b_duration$ = -68
_age_input$ = -52
_age_unit$ = -20
_btn$ = -12
_c$70237 = -76
_c$70260 = -80
_date$70263 = -112
_b_modif$70265 = -132
__n$70267 = -136
_l$70268 = -128
_row$70269 = -120
_col$70270 = -116
__c$70271 = -124
_date$70279 = -172
_c$70280 = -140
_c1$70284 = -176
_b_err$70287 = -192
_agecur$70288 = -188
_val$70289 = -184
_fmt$70290 = -180
_b_modif$70293 = -212
__n$70295 = -216
_l$70296 = -208
_row$70297 = -200
_col$70298 = -196
__c$70299 = -204
_b_modif$70306 = -236
__n$70308 = -240
_l$70309 = -232
_row$70310 = -224
_col$70311 = -220
__c$70312 = -228
_ctrl_read_date PROC NEAR

; 25   : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 308				; 00000134H
	push	esi
	push	edi

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

; 28   : 	int age = 0;

	mov	DWORD PTR _age$[ebp], 0

; 29   : 	unsigned long i, j;
; 30   : 	DynTable cgival = {0};

	mov	DWORD PTR _cgival$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cgival$[ebp+4], edx
	mov	DWORD PTR _cgival$[ebp+8], edx
	mov	DWORD PTR _cgival$[ebp+12], edx
	mov	DWORD PTR _cgival$[ebp+16], edx

; 31   : 	size_t sz, sz1;
; 32   : 	unsigned long idobj = DYNTAB_TOUL(&form->id_obj);

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

; 33   : 	char *date_checktype = CTRL_ATTR_VAL(DATE_CHECKTYPE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70641
	push	0
	push	-1
	push	OFFSET FLAT:$SG70221
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -244+[ebp], eax
	jmp	SHORT $L70642
$L70641:
	mov	DWORD PTR -244+[ebp], OFFSET FLAT:$SG70222
$L70642:
	mov	edx, DWORD PTR -244+[ebp]
	mov	DWORD PTR _date_checktype$[ebp], edx

; 34   : 	int b_duration = *CTRL_ATTR_VAL(DURATION);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70643
	push	0
	push	-1
	push	OFFSET FLAT:$SG70224
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -248+[ebp], eax
	jmp	SHORT $L70644
$L70643:
	mov	DWORD PTR -248+[ebp], OFFSET FLAT:$SG70225
$L70644:
	mov	ecx, DWORD PTR -248+[ebp]
	movsx	edx, BYTE PTR [ecx]
	mov	DWORD PTR _b_duration$[ebp], edx

; 35   : 	char age_input = *CTRL_ATTR_VAL(INPUT_AGE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70645
	push	0
	push	-1
	push	OFFSET FLAT:$SG70227
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -252+[ebp], eax
	jmp	SHORT $L70646
$L70645:
	mov	DWORD PTR -252+[ebp], OFFSET FLAT:$SG70228
$L70646:
	mov	ecx, DWORD PTR -252+[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR _age_input$[ebp], dl

; 36   : 	char age_unit = *CTRL_ATTR_VAL(AGE_UNIT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70647
	push	0
	push	-1
	push	OFFSET FLAT:$SG70230
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -256+[ebp], eax
	jmp	SHORT $L70648
$L70647:
	mov	DWORD PTR -256+[ebp], OFFSET FLAT:$SG70231
$L70648:
	mov	ecx, DWORD PTR -256+[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR _age_unit$[ebp], dl

; 37   : 	char *btn = CGI_CLICK_BTN_SUBFIELD;

	mov	eax, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [eax+29648], 0
	je	SHORT $L70649
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	mov	edx, DWORD PTR [ecx+edx]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 66					; 00000042H
	jne	SHORT $L70649
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29656]
	imul	edx, 56					; 00000038H
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29648]
	cmp	DWORD PTR [ecx+edx+32], 0
	je	SHORT $L70649
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29656]
	imul	eax, 56					; 00000038H
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	edx, DWORD PTR [ecx+29648]
	mov	eax, DWORD PTR [edx+eax+32]
	mov	DWORD PTR -260+[ebp], eax
	jmp	SHORT $L70650
$L70649:
	mov	DWORD PTR -260+[ebp], OFFSET FLAT:$SG70233
$L70650:
	mov	ecx, DWORD PTR -260+[ebp]
	mov	DWORD PTR _btn$[ebp], ecx

; 38   : 	if(!age_unit) age_unit = 'Y';

	movsx	edx, BYTE PTR _age_unit$[ebp]
	test	edx, edx
	jne	SHORT $L70234
	mov	BYTE PTR _age_unit$[ebp], 89		; 00000059H
$L70234:

; 39   : 	sz1 = !age_input ? 14 : age_unit == 'Y'? 4 : 8;

	movsx	eax, BYTE PTR _age_input$[ebp]
	test	eax, eax
	jne	SHORT $L70651
	mov	DWORD PTR -264+[ebp], 14		; 0000000eH
	jmp	SHORT $L70652
$L70651:
	movsx	ecx, BYTE PTR _age_unit$[ebp]
	sub	ecx, 89					; 00000059H
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 4
	add	ecx, 4
	mov	DWORD PTR -264+[ebp], ecx
$L70652:
	mov	edx, DWORD PTR -264+[ebp]
	mov	DWORD PTR _sz1$[ebp], edx

; 40   : 
; 41   : 	/* Handle reference date in age input */
; 42   : 	if(!strcmp(date_checktype, "_EVA_FIELD"))

	push	OFFSET FLAT:$SG70236
	mov	eax, DWORD PTR _date_checktype$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70235

; 44   : 		DynTableCell *c = CTRL_ATTR_CELL(DATEREF_FIELD);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70653
	push	0
	push	-1
	push	OFFSET FLAT:$SG70239
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -268+[ebp], eax
	jmp	SHORT $L70654
$L70653:
	mov	DWORD PTR -268+[ebp], 0
$L70654:
	mov	edx, DWORD PTR -268+[ebp]
	mov	DWORD PTR _c$70237[ebp], edx

; 45   : 		if(c && ctrl_eval_fieldexpr(cntxt, ctrl, &cgival, c->txt)) STACK_ERROR;

	cmp	DWORD PTR _c$70237[ebp], 0
	je	SHORT $L70240
	mov	eax, DWORD PTR _c$70237[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_eval_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70240
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 45		; 0000002dH
	jmp	$eva_err$70241
$L70240:

; 47   : 	else if(!strcmp(date_checktype, "_EVA_DateCr"))

	jmp	SHORT $L70245
$L70235:
	push	OFFSET FLAT:$SG70244
	mov	eax, DWORD PTR _date_checktype$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70245

; 49   : 		if(idobj && ctrl_eval_fieldexpr(cntxt, ctrl, &cgival, "MIN(_EVA_FORMSTAMP.DateCr)")) STACK_ERROR;

	cmp	DWORD PTR _idobj$[ebp], 0
	je	SHORT $L70245
	push	OFFSET FLAT:$SG70246
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_eval_fieldexpr
	add	esp, 16					; 00000010H
	test	eax, eax
	je	SHORT $L70245
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 49		; 00000031H
	jmp	$eva_err$70241
$L70245:

; 51   : 	if(cgival.nbrows) strncpy(ctrl->dateref, dyntab_val(&cgival, 0, 0), 14);

	cmp	DWORD PTR _cgival$[ebp], 0
	je	SHORT $L70247
	push	14					; 0000000eH
	push	0
	push	0
	lea	edx, DWORD PTR _cgival$[ebp]
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 236				; 000000ecH
	push	eax
	call	_strncpy
	add	esp, 12					; 0000000cH
$L70247:

; 52   : 	if(!ctrl->dateref[0]) strncpy(ctrl->dateref, cntxt->timestamp, 14);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	movsx	edx, BYTE PTR [ecx+236]
	test	edx, edx
	jne	SHORT $L70248
	push	14					; 0000000eH
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29704				; 00007408H
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 236				; 000000ecH
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH
$L70248:

; 53   : 	strncpy(ctrl->ageref, ((strcmp(date_checktype, "_EVA_FIELD") &&
; 54   : 							strcmp(date_checktype, "_EVA_DateCr")) ||
; 55   : 							CTRL_ATTR_CELL(AGEREF)) ? cntxt->timestamp : ctrl->dateref, 12);

	push	OFFSET FLAT:$SG70250
	mov	edx, DWORD PTR _date_checktype$[ebp]
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70655
	push	OFFSET FLAT:$SG70251
	mov	eax, DWORD PTR _date_checktype$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L70658
$L70655:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70656
	push	0
	push	-1
	push	OFFSET FLAT:$SG70252
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_cell
	add	esp, 16					; 00000010H
	mov	DWORD PTR -272+[ebp], eax
	jmp	SHORT $L70657
$L70656:
	mov	DWORD PTR -272+[ebp], 0
$L70657:
	cmp	DWORD PTR -272+[ebp], 0
	jne	SHORT $L70658
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 236				; 000000ecH
	mov	DWORD PTR -276+[ebp], edx
	jmp	SHORT $L70659
$L70658:
	mov	eax, DWORD PTR _cntxt$[ebp]
	add	eax, 29704				; 00007408H
	mov	DWORD PTR -276+[ebp], eax
$L70659:
	push	12					; 0000000cH
	mov	ecx, DWORD PTR -276+[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 252				; 000000fcH
	push	edx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 56   : 
; 57   : 	/* Handle age input status */
; 58   : 	CTRL_GET_CGI_SUBFIELD1("AGE");

	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70254
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70253
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 58		; 0000003aH
	jmp	$eva_err$70241
$L70253:

; 59   : 	sz = dyntab_sz(&ctrl->val, 0, 0);

	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _sz$[ebp], eax

; 60   : 	ctrl->status = age_input && (
; 61   : 			(cgival.nbrows ? strcmp(btn, "DATEMODE") : !strcmp(btn, "AGEMODE")) ||
; 62   : 			(!ctrl->cgival.nbrows && (age_input == '1' || (sz && sz < 5) )));

	movsx	edx, BYTE PTR _age_input$[ebp]
	test	edx, edx
	je	SHORT $L70666
	cmp	DWORD PTR _cgival$[ebp], 0
	je	SHORT $L70660
	push	OFFSET FLAT:$SG70255
	mov	eax, DWORD PTR _btn$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	mov	DWORD PTR -280+[ebp], eax
	jmp	SHORT $L70661
$L70660:
	push	OFFSET FLAT:$SG70256
	mov	ecx, DWORD PTR _btn$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR -280+[ebp], eax
$L70661:
	cmp	DWORD PTR -280+[ebp], 0
	jne	SHORT $L70665
	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+104], 0
	jne	SHORT $L70666
	movsx	eax, BYTE PTR _age_input$[ebp]
	cmp	eax, 49					; 00000031H
	je	SHORT $L70665
	cmp	DWORD PTR _sz$[ebp], 0
	je	SHORT $L70666
	cmp	DWORD PTR _sz$[ebp], 5
	jae	SHORT $L70666
$L70665:
	mov	DWORD PTR -284+[ebp], 1
	jmp	SHORT $L70667
$L70666:
	mov	DWORD PTR -284+[ebp], 0
$L70667:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -284+[ebp]
	mov	DWORD PTR [ecx+220], edx

; 63   : 
; 64   : 	/* Format each value from user input */
; 65   : 	for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70257
$L70258:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70257:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+64]
	jae	$L70259

; 67   : 		DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70260[ebp], eax

; 68   : 		if(c->i_cgi || datetxt_invalid(c->txt))

	mov	edx, DWORD PTR _c$70260[ebp]
	cmp	DWORD PTR [edx+48], 0
	jne	SHORT $L70262
	mov	eax, DWORD PTR _c$70260[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_datetxt_invalid
	add	esp, 4
	test	eax, eax
	je	$L70261
$L70262:

; 70   : 			/* Store value if modified */
; 71   : 			char date[32] = {0};

	mov	BYTE PTR _date$70263[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR _date$70263[ebp+1]
	rep stosd
	stosw
	stosb

; 72   : 			input_to_datetxt(c->txt, date);

	lea	edx, DWORD PTR _date$70263[ebp]
	push	edx
	mov	eax, DWORD PTR _c$70260[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_input_to_datetxt
	add	esp, 8

; 73   : 			if(c->txt && c->txt[0] && *date && strcmp(date, c->txt))

	mov	edx, DWORD PTR _c$70260[ebp]
	cmp	DWORD PTR [edx], 0
	je	$L70264
	mov	eax, DWORD PTR _c$70260[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L70264
	movsx	eax, BYTE PTR _date$70263[ebp]
	test	eax, eax
	je	$L70264
	mov	ecx, DWORD PTR _c$70260[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	lea	eax, DWORD PTR _date$70263[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	$L70264

; 74   : 				DYNTAB_ADD_NL(&ctrl->val, i, 0, date, 0, c->Num, c->Line, c->b_modified || !c->i_cgi);

	mov	ecx, DWORD PTR _c$70260[ebp]
	movsx	edx, BYTE PTR [ecx+13]
	test	edx, edx
	jne	SHORT $L70668
	mov	eax, DWORD PTR _c$70260[ebp]
	cmp	DWORD PTR [eax+48], 0
	je	SHORT $L70668
	mov	DWORD PTR -288+[ebp], 0
	jmp	SHORT $L70669
$L70668:
	mov	DWORD PTR -288+[ebp], 1
$L70669:
	mov	cl, BYTE PTR -288+[ebp]
	mov	BYTE PTR _b_modif$70265[ebp], cl
	mov	edx, DWORD PTR _c$70260[ebp]
	mov	eax, DWORD PTR [edx+36]
	mov	DWORD PTR __n$70267[ebp], eax
	mov	ecx, DWORD PTR _c$70260[ebp]
	mov	edx, DWORD PTR [ecx+40]
	mov	DWORD PTR _l$70268[ebp], edx
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _row$70269[ebp], eax
	mov	DWORD PTR _col$70270[ebp], 0
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _date$70263[ebp]
	push	ecx
	mov	edx, DWORD PTR _col$70270[ebp]
	push	edx
	mov	eax, DWORD PTR _row$70269[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70273
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70275
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 74		; 0000004aH
	jmp	$eva_err$70241
$L70273:
	mov	ecx, DWORD PTR _col$70270[ebp]
	push	ecx
	mov	edx, DWORD PTR _row$70269[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$70271[ebp], eax
	mov	ecx, DWORD PTR __c$70271[ebp]
	mov	edx, DWORD PTR __n$70267[ebp]
	mov	DWORD PTR [ecx+36], edx
	mov	eax, DWORD PTR __c$70271[ebp]
	mov	ecx, DWORD PTR _l$70268[ebp]
	mov	DWORD PTR [eax+40], ecx
	mov	edx, DWORD PTR __c$70271[ebp]
	mov	al, BYTE PTR _b_modif$70265[ebp]
	mov	BYTE PTR [edx+13], al
$L70264:

; 75   : 			ctrl->b_modified |= c->b_modified;

	mov	ecx, DWORD PTR _c$70260[ebp]
	movsx	edx, BYTE PTR [ecx+13]
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	or	ecx, edx
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+200], ecx
$L70261:

; 77   : 	}

	jmp	$L70258
$L70259:

; 78   : 
; 79   : 	/* Transform age inputs  */
; 80   : 	for(i = 0; i < cgival.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70276
$L70277:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L70276:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _cgival$[ebp]
	jae	$L70278

; 82   : 		char date[32] = {0};

	mov	BYTE PTR _date$70279[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR _date$70279[ebp+1]
	rep stosd
	stosw
	stosb

; 83   : 		DynTableCell *c = dyntab_cell(&cgival, i, 0);

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70280[ebp], eax

; 84   : 
; 85   : 		/* Retrieve corresponding value in ctrl->val */
; 86   : 		for(j = 0; j < ctrl->val.nbrows; j++)

	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L70281
$L70282:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L70281:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+64]
	jae	SHORT $L70283

; 88   : 			DynTableCell *c1 = dyntab_cell(&ctrl->val, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c1$70284[ebp], eax

; 89   : 			if(c->Num == c1->Num && c->Line == c1->Line) break;

	mov	eax, DWORD PTR _c$70280[ebp]
	mov	ecx, DWORD PTR _c1$70284[ebp]
	mov	edx, DWORD PTR [eax+36]
	cmp	edx, DWORD PTR [ecx+36]
	jne	SHORT $L70285
	mov	eax, DWORD PTR _c$70280[ebp]
	mov	ecx, DWORD PTR _c1$70284[ebp]
	mov	edx, DWORD PTR [eax+40]
	cmp	edx, DWORD PTR [ecx+40]
	jne	SHORT $L70285
	jmp	SHORT $L70283
$L70285:

; 90   : 		}

	jmp	SHORT $L70282
$L70283:

; 91   : 
; 92   : 		/* Transform age to date if applicable */
; 93   : 		if(c->txt)

	mov	eax, DWORD PTR _c$70280[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L70286

; 95   : 			int b_err, agecur;
; 96   : 			char *val = dyntab_val(&ctrl->val, j, 0);

	push	0
	mov	ecx, DWORD PTR _j$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _val$70289[ebp], eax

; 97   : 			char fmt = age_unit;

	mov	al, BYTE PTR _age_unit$[ebp]
	mov	BYTE PTR _fmt$70290[ebp], al

; 98   : 			sz = dyntab_sz(&ctrl->val, 0, 0);

	push	0
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _sz$[ebp], eax

; 99   : 			agecur = (b_duration ? -1 : 1) * datetxt_to_age(val, ctrl->ageref, &fmt);

	mov	esi, DWORD PTR _b_duration$[ebp]
	neg	esi
	sbb	esi, esi
	and	esi, -2					; fffffffeH
	add	esi, 1
	lea	edx, DWORD PTR _fmt$70290[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 252				; 000000fcH
	push	eax
	mov	ecx, DWORD PTR _val$70289[ebp]
	push	ecx
	call	_datetxt_to_age
	add	esp, 12					; 0000000cH
	imul	esi, eax
	mov	DWORD PTR _agecur$70288[ebp], esi

; 100  : 			age = atoi(dyntab_val(&cgival, i, 0));

	push	0
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _age$[ebp], eax

; 101  : 			b_err = delay_to_datetxt(date, ctrl->ageref, (b_duration ? age : -age), age_unit);

	cmp	DWORD PTR _b_duration$[ebp], 0
	je	SHORT $L70670
	mov	ecx, DWORD PTR _age$[ebp]
	mov	DWORD PTR -292+[ebp], ecx
	jmp	SHORT $L70671
$L70670:
	mov	edx, DWORD PTR _age$[ebp]
	neg	edx
	mov	DWORD PTR -292+[ebp], edx
$L70671:
	mov	al, BYTE PTR _age_unit$[ebp]
	push	eax
	mov	ecx, DWORD PTR -292+[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 252				; 000000fcH
	push	edx
	lea	eax, DWORD PTR _date$70279[ebp]
	push	eax
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H
	mov	DWORD PTR _b_err$70287[ebp], eax

; 102  : 
; 103  : 			/* Update date value if age changed */
; 104  : 			if(!b_err && (!*val || fmt != age_unit || age != agecur))

	cmp	DWORD PTR _b_err$70287[ebp], 0
	jne	$L70291
	mov	ecx, DWORD PTR _val$70289[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70292
	movsx	eax, BYTE PTR _fmt$70290[ebp]
	movsx	ecx, BYTE PTR _age_unit$[ebp]
	cmp	eax, ecx
	jne	SHORT $L70292
	mov	edx, DWORD PTR _age$[ebp]
	cmp	edx, DWORD PTR _agecur$70288[ebp]
	je	$L70291
$L70292:

; 106  : 				sz = strlen(date);

	lea	eax, DWORD PTR _date$70279[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _sz$[ebp], eax

; 107  : 				DYNTAB_ADD_NL(&ctrl->val, j, 0, date, sz < sz1 ? sz : sz1, c->Num, c->Line, 1);

	mov	BYTE PTR _b_modif$70293[ebp], 1
	mov	ecx, DWORD PTR _c$70280[ebp]
	mov	edx, DWORD PTR [ecx+36]
	mov	DWORD PTR __n$70295[ebp], edx
	mov	eax, DWORD PTR _c$70280[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	DWORD PTR _l$70296[ebp], ecx
	mov	edx, DWORD PTR _j$[ebp]
	mov	DWORD PTR _row$70297[ebp], edx
	mov	DWORD PTR _col$70298[ebp], 0
	mov	eax, DWORD PTR _sz$[ebp]
	cmp	eax, DWORD PTR _sz1$[ebp]
	jae	SHORT $L70672
	mov	ecx, DWORD PTR _sz$[ebp]
	mov	DWORD PTR -296+[ebp], ecx
	jmp	SHORT $L70673
$L70672:
	mov	edx, DWORD PTR _sz1$[ebp]
	mov	DWORD PTR -296+[ebp], edx
$L70673:
	push	0
	push	0
	mov	eax, DWORD PTR -296+[ebp]
	push	eax
	lea	ecx, DWORD PTR _date$70279[ebp]
	push	ecx
	mov	edx, DWORD PTR _col$70298[ebp]
	push	edx
	mov	eax, DWORD PTR _row$70297[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70301
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70303
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 107		; 0000006bH
	jmp	$eva_err$70241
$L70301:
	mov	ecx, DWORD PTR _col$70298[ebp]
	push	ecx
	mov	edx, DWORD PTR _row$70297[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$70299[ebp], eax
	mov	ecx, DWORD PTR __c$70299[ebp]
	mov	edx, DWORD PTR __n$70295[ebp]
	mov	DWORD PTR [ecx+36], edx
	mov	eax, DWORD PTR __c$70299[ebp]
	mov	ecx, DWORD PTR _l$70296[ebp]
	mov	DWORD PTR [eax+40], ecx
	mov	edx, DWORD PTR __c$70299[ebp]
	mov	al, BYTE PTR _b_modif$70293[ebp]
	mov	BYTE PTR [edx+13], al

; 108  : 				ctrl->b_modified = 1;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+200], 1
$L70291:

; 111  : 		else if(dyntab_sz(&ctrl->val, j, 0))

	jmp	$L70305
$L70286:
	push	0
	mov	edx, DWORD PTR _j$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	$L70305

; 113  : 			/* Clear value if applicable */
; 114  : 			DYNTAB_ADD_NL(&ctrl->val, j, 0, NULL, 0, c->Num, c->Line, 1);

	mov	BYTE PTR _b_modif$70306[ebp], 1
	mov	ecx, DWORD PTR _c$70280[ebp]
	mov	edx, DWORD PTR [ecx+36]
	mov	DWORD PTR __n$70308[ebp], edx
	mov	eax, DWORD PTR _c$70280[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	DWORD PTR _l$70309[ebp], ecx
	mov	edx, DWORD PTR _j$[ebp]
	mov	DWORD PTR _row$70310[ebp], edx
	mov	DWORD PTR _col$70311[ebp], 0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _col$70311[ebp]
	push	eax
	mov	ecx, DWORD PTR _row$70310[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 64					; 00000040H
	push	edx
	call	_dyntab_add
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70315
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70317
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 114		; 00000072H
	jmp	$eva_err$70241
$L70315:
	mov	edx, DWORD PTR _col$70311[ebp]
	push	edx
	mov	eax, DWORD PTR _row$70310[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR __c$70312[ebp], eax
	mov	edx, DWORD PTR __c$70312[ebp]
	mov	eax, DWORD PTR __n$70308[ebp]
	mov	DWORD PTR [edx+36], eax
	mov	ecx, DWORD PTR __c$70312[ebp]
	mov	edx, DWORD PTR _l$70309[ebp]
	mov	DWORD PTR [ecx+40], edx
	mov	eax, DWORD PTR __c$70312[ebp]
	mov	cl, BYTE PTR _b_modif$70306[ebp]
	mov	BYTE PTR [eax+13], cl

; 115  : 			ctrl->b_modified = 1;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+200], 1
$L70305:

; 117  : 	}

	jmp	$L70277
$L70278:

; 118  : 
; 119  : 	/* Handle control label */
; 120  : 	if(ctrl->status)

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+220], 0
	je	$L70321

; 122  : 		ctrl->LABEL = CTRL_ATTR_VAL(AGE_LABEL);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70674
	push	0
	push	-1
	push	OFFSET FLAT:$SG70319
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -300+[ebp], eax
	jmp	SHORT $L70675
$L70674:
	mov	DWORD PTR -300+[ebp], OFFSET FLAT:$SG70320
$L70675:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR -300+[ebp]
	mov	DWORD PTR [edx+284], eax

; 123  : 		if(!ctrl->LABEL[0]) ctrl->LABEL = (*CTRL_ATTR_VAL(DURATION) ? "Durée" : "Age");

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L70321
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70676
	push	0
	push	-1
	push	OFFSET FLAT:$SG70322
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -304+[ebp], eax
	jmp	SHORT $L70677
$L70676:
	mov	DWORD PTR -304+[ebp], OFFSET FLAT:$SG70323
$L70677:
	mov	edx, DWORD PTR -304+[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70678
	mov	DWORD PTR -308+[ebp], OFFSET FLAT:$SG70324
	jmp	SHORT $L70679
$L70678:
	mov	DWORD PTR -308+[ebp], OFFSET FLAT:$SG70325
$L70679:
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR -308+[ebp]
	mov	DWORD PTR [ecx+284], edx
$L70321:

; 125  : 
; 126  : 	/* Sort values on Line / Num */
; 127  : 	dyntab_sort(&ctrl->val, qsort_ctrlval);

	push	OFFSET FLAT:_qsort_ctrlval
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 64					; 00000040H
	push	eax
	call	_dyntab_sort
	add	esp, 8
$eva_noerr$70326:

; 128  : 
; 129  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70327
	push	OFFSET FLAT:$SG70328
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70241:
	mov	edx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [edx+29872], 0
	je	SHORT $L70329
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+29900]
	push	ecx
	push	OFFSET FLAT:$SG70330
	push	OFFSET FLAT:$SG70331
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70329:
	lea	eax, DWORD PTR _cgival$[ebp]
	push	eax
	call	_dyntab_free
	add	esp, 4
	mov	ecx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [ecx+29872], 0
	setne	al

; 130  : }

	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_read_date ENDP
_TEXT	ENDS
PUBLIC	_ctrl_editview_date
EXTRN	_datetxt_to_format:NEAR
EXTRN	_put_html_button_sz:NEAR
EXTRN	_put_html_text_input:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_ctrl_add_text_value:NEAR
EXTRN	_mem_free:NEAR
EXTRN	_plain_to_html:BYTE
EXTRN	_dynbuf_add:NEAR
EXTRN	_ctrl_cgi_name:NEAR
EXTRN	_ctrl_put_hidden:NEAR
EXTRN	_dynbuf_add3:NEAR
EXTRN	_ctrl_format_pos:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_ctrl_put_hidden_old:NEAR
EXTRN	_strstr:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70350 DB	01H DUP (?)
	ALIGN	4

$SG70353 DB	01H DUP (?)
	ALIGN	4

$SG70359 DB	01H DUP (?)
	ALIGN	4

$SG70362 DB	01H DUP (?)
	ALIGN	4

$SG70365 DB	01H DUP (?)
	ALIGN	4

$SG70447 DB	01H DUP (?)
	ALIGN	4

$SG70476 DB	01H DUP (?)
	ALIGN	4

$SG70478 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70349 DB	'_EVA_INPUT_AGE', 00H
	ORG $+1
$SG70352 DB	'_EVA_FORMAT', 00H
$SG70355 DB	'No', 00H
	ORG $+1
$SG70358 DB	'_EVA_AGE_UNIT', 00H
	ORG $+2
$SG70361 DB	'_EVA_AGE_LABEL', 00H
	ORG $+1
$SG70364 DB	'_EVA_DURATION', 00H
	ORG $+2
$SG70368 DB	'Dur', 0e9H, 'e', 00H
	ORG $+2
$SG70369 DB	'Age', 00H
$SG70371 DB	'AGE', 00H
$SG70377 DB	'<table noborder><tr><td>', 00H
	ORG $+3
$SG70379 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70383 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70398 DB	'</td></tr><tr><td>', 00H
	ORG $+1
$SG70400 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70404 DB	'<br>', 00H
	ORG $+3
$SG70406 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70410 DB	'sec', 00H
$SG70411 DB	'min', 00H
$SG70412 DB	'hr', 00H
	ORG $+1
$SG70413 DB	'jour', 00H
	ORG $+3
$SG70414 DB	'mois', 00H
	ORG $+3
$SG70415 DB	'an', 00H
	ORG $+1
$SG70421 DB	'AGE', 00H
$SG70423 DB	'%d', 00H
	ORG $+1
$SG70427 DB	' ', 00H
	ORG $+2
$SG70428 DB	' ', 00H
	ORG $+2
$SG70430 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70432 DB	'_EVA_DATETIME', 00H
	ORG $+2
$SG70436 DB	'</td><td>', 00H
	ORG $+2
$SG70438 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70440 DB	'DATEMODE', 00H
	ORG $+3
$SG70445 DB	'Date correspondante', 0aH, 0aH, 'Cliquez pour saisir une'
	DB	' date', 00H
	ORG $+2
$SG70446 DB	'_EVA_LABEL', 00H
	ORG $+1
$SG70453 DB	')', 00H
	ORG $+2
$SG70454 DB	'(', 00H
	ORG $+2
$SG70456 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70459 DB	'Month', 00H
	ORG $+2
$SG70460 DB	'_EVA_StdMonth', 00H
	ORG $+2
$SG70461 DB	'Year', 00H
	ORG $+3
$SG70462 DB	'_EVA_Year', 00H
	ORG $+2
$SG70463 DB	'_EVA_DATETIME', 00H
	ORG $+2
$SG70475 DB	'_EVA_MAXLENGTH', 00H
	ORG $+1
$SG70477 DB	'_EVA_JSCALENDAR', 00H
$SG70482 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70485 DB	'%d %s', 00H
	ORG $+2
$SG70489 DB	'</td><td>', 00H
	ORG $+2
$SG70491 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70493 DB	'AGEMODE', 00H
$SG70498 DB	'Dur', 0e9H, 'e correspondant ', 0e0H, ' la date', 0aH, 0aH
	DB	'Cliquez pour saisir une dur', 0e9H, 'e', 00H
	ORG $+3
$SG70499 DB	'Age correspondant ', 0e0H, ' la date', 0aH, 0aH, 'Clique'
	DB	'z pour saisir un ', 0e2H, 'ge', 00H
$SG70504 DB	')', 00H
	ORG $+2
$SG70505 DB	' (', 00H
	ORG $+1
$SG70507 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70511 DB	'</td></tr></table>', 00H
	ORG $+1
$SG70513 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70516 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_date.'
	DB	'c', 00H
	ORG $+2
$SG70517 DB	'ctrl_editview_date', 00H
	ORG $+1
$SG70519 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_date.'
	DB	'c', 00H
	ORG $+2
$SG70520 DB	'ctrl_editview_date', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -8
_ctrl$ = -64
_cgival$ = -44
_name$ = -60
_i$ = -24
_k$ = -56
_input_age$ = -52
_fmt$ = -4
_b_multiple$ = -48
_columns$ = -12
_age_unit$ = -20
_age_label$ = -16
_b_duration$ = -68
_date$70388 = -148
_c$70389 = -84
_age$70390 = -152
_unit$70391 = -80
_selunit$70392 = -156
_b_err$70393 = -72
_d$70468 = -220
_ctrl_editview_date PROC NEAR

; 144  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 320				; 00000140H
	push	edi

; 145  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 146  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 147  : 	DynTable cgival = {0};

	mov	DWORD PTR _cgival$[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _cgival$[ebp+4], edx
	mov	DWORD PTR _cgival$[ebp+8], edx
	mov	DWORD PTR _cgival$[ebp+12], edx
	mov	DWORD PTR _cgival$[ebp+16], edx

; 148  : 	DynBuffer *name = NULL;

	mov	DWORD PTR _name$[ebp], 0

; 149  : 	unsigned long i, k;
; 150  : 	char *input_age = CTRL_ATTR_VAL(INPUT_AGE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70681
	push	0
	push	-1
	push	OFFSET FLAT:$SG70349
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -224+[ebp], eax
	jmp	SHORT $L70682
$L70681:
	mov	DWORD PTR -224+[ebp], OFFSET FLAT:$SG70350
$L70682:
	mov	ecx, DWORD PTR -224+[ebp]
	mov	DWORD PTR _input_age$[ebp], ecx

; 151  : 	char *fmt = CTRL_ATTR_VAL(FORMAT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70683
	push	0
	push	-1
	push	OFFSET FLAT:$SG70352
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -228+[ebp], eax
	jmp	SHORT $L70684
$L70683:
	mov	DWORD PTR -228+[ebp], OFFSET FLAT:$SG70353
$L70684:
	mov	eax, DWORD PTR -228+[ebp]
	mov	DWORD PTR _fmt$[ebp], eax

; 152  : 	int b_multiple = ctrl->MULTIPLE[0] != 0 && strcmp("No", ctrl->MULTIPLE);

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+344]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70685
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+344]
	push	edx
	push	OFFSET FLAT:$SG70355
	call	_strcmp
	add	esp, 8
	test	eax, eax
	je	SHORT $L70685
	mov	DWORD PTR -232+[ebp], 1
	jmp	SHORT $L70686
$L70685:
	mov	DWORD PTR -232+[ebp], 0
$L70686:
	mov	eax, DWORD PTR -232+[ebp]
	mov	DWORD PTR _b_multiple$[ebp], eax

; 153  : 	unsigned long columns = ctrl->COLUMNS;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+380]
	mov	DWORD PTR _columns$[ebp], edx

; 154  : 	char age_unit = *CTRL_ATTR_VAL(AGE_UNIT);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70687
	push	0
	push	-1
	push	OFFSET FLAT:$SG70358
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -236+[ebp], eax
	jmp	SHORT $L70688
$L70687:
	mov	DWORD PTR -236+[ebp], OFFSET FLAT:$SG70359
$L70688:
	mov	ecx, DWORD PTR -236+[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR _age_unit$[ebp], dl

; 155  : 	char *age_label = CTRL_ATTR_VAL(AGE_LABEL);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70689
	push	0
	push	-1
	push	OFFSET FLAT:$SG70361
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -240+[ebp], eax
	jmp	SHORT $L70690
$L70689:
	mov	DWORD PTR -240+[ebp], OFFSET FLAT:$SG70362
$L70690:
	mov	ecx, DWORD PTR -240+[ebp]
	mov	DWORD PTR _age_label$[ebp], ecx

; 156  : 	int b_duration = *CTRL_ATTR_VAL(DURATION);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70691
	push	0
	push	-1
	push	OFFSET FLAT:$SG70364
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -244+[ebp], eax
	jmp	SHORT $L70692
$L70691:
	mov	DWORD PTR -244+[ebp], OFFSET FLAT:$SG70365
$L70692:
	mov	eax, DWORD PTR -244+[ebp]
	movsx	ecx, BYTE PTR [eax]
	mov	DWORD PTR _b_duration$[ebp], ecx

; 157  : 	if(!age_unit) age_unit = 'Y';

	movsx	edx, BYTE PTR _age_unit$[ebp]
	test	edx, edx
	jne	SHORT $L70366
	mov	BYTE PTR _age_unit$[ebp], 89		; 00000059H
$L70366:

; 158  : 	if(!*age_label) age_label = b_duration ? "Durée" : "Age";

	mov	eax, DWORD PTR _age_label$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70367
	cmp	DWORD PTR _b_duration$[ebp], 0
	je	SHORT $L70693
	mov	DWORD PTR -248+[ebp], OFFSET FLAT:$SG70368
	jmp	SHORT $L70694
$L70693:
	mov	DWORD PTR -248+[ebp], OFFSET FLAT:$SG70369
$L70694:
	mov	edx, DWORD PTR -248+[ebp]
	mov	DWORD PTR _age_label$[ebp], edx
$L70367:

; 159  : 
; 160  : 	/* Clear existing age inputs */
; 161  : 	CTRL_GET_CGI_SUBFIELD("AGE");

	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70371
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _cgival$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_cgi_get_subfield
	add	esp, 28					; 0000001cH
	test	eax, eax
	je	SHORT $L70370
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 161		; 000000a1H
	jmp	$eva_err$70372
$L70370:

; 162  : 
; 163  : 	/* Add HTML code for control label & position */
; 164  : 	if(ctrl_format_pos(cntxt, ctrl, 1)) STACK_ERROR;

	push	1
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70373
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 164		; 000000a4H
	jmp	$eva_err$70372
$L70373:

; 165  : 	if(*input_age && form->step == HtmlEdit) DYNBUF_ADD_STR(form->html, "<table noborder><tr><td>");

	mov	ecx, DWORD PTR _input_age$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70376
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 4
	jne	SHORT $L70376
	push	0
	push	0
	push	24					; 00000018H
	push	OFFSET FLAT:$SG70377
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70376
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70379
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 165		; 000000a5H
	jmp	$eva_err$70372
$L70376:

; 166  : 
; 167  : 	/* Handle empty value in view mode */
; 168  : 	if(form->step != HtmlEdit && !ctrl->val.nbrows && *ctrl->LABEL_NOSEL) DYNBUF_ADD(form->html, ctrl->LABEL_NOSEL, 0, TO_HTML);

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	je	SHORT $L70381
	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	SHORT $L70381
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+348]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L70381
	push	1
	push	OFFSET FLAT:_plain_to_html
	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR [ecx+348]
	push	edx
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70381
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70383
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 168		; 000000a8H
	jmp	$eva_err$70372
$L70381:

; 169  : 
; 170  : 	/* Add HTML code for each value */
; 171  : 	k = ctrl->val.nbrows + ((form->step == HtmlEdit && b_multiple && dyntab_sz(&ctrl->val, ctrl->val.nbrows - 1, 0)) ? 1 : 0);

	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	jne	SHORT $L70695
	cmp	DWORD PTR _b_multiple$[ebp], 0
	je	SHORT $L70695
	push	0
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+64]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_sz
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70695
	mov	DWORD PTR -252+[ebp], 1
	jmp	SHORT $L70696
$L70695:
	mov	DWORD PTR -252+[ebp], 0
$L70696:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	eax, DWORD PTR [edx+64]
	add	eax, DWORD PTR -252+[ebp]
	mov	DWORD PTR _k$[ebp], eax

; 172  : 	for(i = 0; !i || i < k; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70384
$L70385:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L70384:
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L70387
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _k$[ebp]
	jae	$L70386
$L70387:

; 174  : 		char date[64] = {0};

	mov	BYTE PTR _date$70388[ebp], 0
	mov	ecx, 15					; 0000000fH
	xor	eax, eax
	lea	edi, DWORD PTR _date$70388[ebp+1]
	rep stosd
	stosw
	stosb

; 175  : 		DynTableCell *c = dyntab_cell(&ctrl->val, i, 0);

	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _c$70389[ebp], eax

; 176  : 		int age = 0;

	mov	DWORD PTR _age$70390[ebp], 0

; 177  : 		char unit[8] = {0};

	mov	BYTE PTR _unit$70391[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _unit$70391[ebp+1], edx
	mov	WORD PTR _unit$70391[ebp+5], dx
	mov	BYTE PTR _unit$70391[ebp+7], dl

; 178  : 		char selunit = age_unit;

	mov	al, BYTE PTR _age_unit$[ebp]
	mov	BYTE PTR _selunit$70392[ebp], al

; 179  : 		int b_err = 0;

	mov	DWORD PTR _b_err$70393[ebp], 0

; 180  : 
; 181  : 		/* Separate multiple values with a line break */
; 182  : 		if(i)

	cmp	DWORD PTR _i$[ebp], 0
	je	$L70403

; 184  : 			if(*input_age && form->step == HtmlEdit)

	mov	ecx, DWORD PTR _input_age$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L70395
	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 4
	jne	SHORT $L70395

; 185  : 				DYNBUF_ADD_STR(form->html, "</td></tr><tr><td>")

	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70398
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70397
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70400
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 185		; 000000b9H
	jmp	$eva_err$70372
$L70397:

; 186  : 			else

	jmp	SHORT $L70403
$L70395:

; 187  : 				DYNBUF_ADD_STR(form->html, "<br>");

	push	0
	push	0
	push	4
	push	OFFSET FLAT:$SG70404
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70403
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70406
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 187		; 000000bbH
	jmp	$eva_err$70372
$L70403:

; 189  : 
; 190  : 		/* Calc age if applicable */
; 191  : 		if(*input_age)

	mov	eax, DWORD PTR _input_age$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L70416

; 193  : 			/* Compute age - force input in given unit if edit mode */
; 194  : 			if(c) age = datetxt_to_age(c->txt, ctrl->ageref, &selunit);

	cmp	DWORD PTR _c$70389[ebp], 0
	je	SHORT $L70408
	lea	edx, DWORD PTR _selunit$70392[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 252				; 000000fcH
	push	eax
	mov	ecx, DWORD PTR _c$70389[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_datetxt_to_age
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _age$70390[ebp], eax
$L70408:

; 195  : 			b_err = form->step == HtmlEdit && ctrl->status && selunit != age_unit;

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 4
	jne	SHORT $L70697
	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+220], 0
	je	SHORT $L70697
	movsx	edx, BYTE PTR _selunit$70392[ebp]
	movsx	eax, BYTE PTR _age_unit$[ebp]
	cmp	edx, eax
	je	SHORT $L70697
	mov	DWORD PTR -256+[ebp], 1
	jmp	SHORT $L70698
$L70697:
	mov	DWORD PTR -256+[ebp], 0
$L70698:
	mov	ecx, DWORD PTR -256+[ebp]
	mov	DWORD PTR _b_err$70393[ebp], ecx

; 196  : 			if(b_err) selunit = age_unit;

	cmp	DWORD PTR _b_err$70393[ebp], 0
	je	SHORT $L70409
	mov	dl, BYTE PTR _age_unit$[ebp]
	mov	BYTE PTR _selunit$70392[ebp], dl
$L70409:

; 197  : 			strcpy(unit,
; 198  : 					selunit == 's' ? SECONDE :
; 199  : 					selunit == 'm' ? MINUTE :
; 200  : 					selunit == 'h' ? HOUR :
; 201  : 					selunit == 'D' ? DAY :
; 202  : 					selunit == 'M' ? MONTH : YEAR);

	movsx	eax, BYTE PTR _selunit$70392[ebp]
	cmp	eax, 115				; 00000073H
	jne	SHORT $L70707
	mov	DWORD PTR -260+[ebp], OFFSET FLAT:$SG70410
	jmp	$L70708
$L70707:
	movsx	ecx, BYTE PTR _selunit$70392[ebp]
	cmp	ecx, 109				; 0000006dH
	jne	SHORT $L70705
	mov	DWORD PTR -264+[ebp], OFFSET FLAT:$SG70411
	jmp	SHORT $L70706
$L70705:
	movsx	edx, BYTE PTR _selunit$70392[ebp]
	cmp	edx, 104				; 00000068H
	jne	SHORT $L70703
	mov	DWORD PTR -268+[ebp], OFFSET FLAT:$SG70412
	jmp	SHORT $L70704
$L70703:
	movsx	eax, BYTE PTR _selunit$70392[ebp]
	cmp	eax, 68					; 00000044H
	jne	SHORT $L70701
	mov	DWORD PTR -272+[ebp], OFFSET FLAT:$SG70413
	jmp	SHORT $L70702
$L70701:
	movsx	ecx, BYTE PTR _selunit$70392[ebp]
	cmp	ecx, 77					; 0000004dH
	jne	SHORT $L70699
	mov	DWORD PTR -276+[ebp], OFFSET FLAT:$SG70414
	jmp	SHORT $L70700
$L70699:
	mov	DWORD PTR -276+[ebp], OFFSET FLAT:$SG70415
$L70700:
	mov	edx, DWORD PTR -276+[ebp]
	mov	DWORD PTR -272+[ebp], edx
$L70702:
	mov	eax, DWORD PTR -272+[ebp]
	mov	DWORD PTR -268+[ebp], eax
$L70704:
	mov	ecx, DWORD PTR -268+[ebp]
	mov	DWORD PTR -264+[ebp], ecx
$L70706:
	mov	edx, DWORD PTR -264+[ebp]
	mov	DWORD PTR -260+[ebp], edx
$L70708:
	mov	eax, DWORD PTR -260+[ebp]
	push	eax
	lea	ecx, DWORD PTR _unit$70391[ebp]
	push	ecx
	call	_strcpy
	add	esp, 8

; 203  : 			if(unit[strlen(unit) - 1] != 's' && ((b_err && form->step == HtmlEdit) || age > 1 || age < -1))

	lea	edx, DWORD PTR _unit$70391[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	movsx	eax, BYTE PTR _unit$70391[ebp+eax-1]
	cmp	eax, 115				; 00000073H
	je	SHORT $L70416
	cmp	DWORD PTR _b_err$70393[ebp], 0
	je	SHORT $L70418
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	je	SHORT $L70417
$L70418:
	cmp	DWORD PTR _age$70390[ebp], 1
	jg	SHORT $L70417
	cmp	DWORD PTR _age$70390[ebp], -1
	jge	SHORT $L70416
$L70417:

; 204  : 				unit[strlen(unit)] = 's';

	lea	edx, DWORD PTR _unit$70391[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	mov	BYTE PTR _unit$70391[ebp+eax], 115	; 00000073H
$L70416:

; 206  : 
; 207  : 		/* Handle control input formats */
; 208  : 		if(ctrl->status)

	mov	eax, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [eax+220], 0
	je	$L70419

; 210  : 			/* Age input : add text control with age value */
; 211  : 			ctrl->COLUMNS = 3;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+380], 3

; 212  : 			CTRL_CGINAMESUBFIELD(&name, c, "AGE");

	push	3
	push	OFFSET FLAT:$SG70421
	push	68					; 00000044H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _c$70389[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70420
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 212		; 000000d4H
	jmp	$eva_err$70372
$L70420:

; 213  : 			if(!b_err && c && c->txt) sprintf(date, "%d", (b_duration ? -1 : 1) * age);

	cmp	DWORD PTR _b_err$70393[ebp], 0
	jne	SHORT $L70422
	cmp	DWORD PTR _c$70389[ebp], 0
	je	SHORT $L70422
	mov	ecx, DWORD PTR _c$70389[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70422
	mov	edx, DWORD PTR _b_duration$[ebp]
	neg	edx
	sbb	edx, edx
	and	edx, -2					; fffffffeH
	add	edx, 1
	imul	edx, DWORD PTR _age$70390[ebp]
	push	edx
	push	OFFSET FLAT:$SG70423
	lea	eax, DWORD PTR _date$70388[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
$L70422:

; 214  : 			if(ctrl_add_text_value(cntxt, ctrl, i, date, strlen(date), name)) STACK_ERROR;

	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	lea	edx, DWORD PTR _date$70388[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	push	eax
	lea	eax, DWORD PTR _date$70388[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_add_text_value
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70424
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 214		; 000000d6H
	jmp	$eva_err$70372
$L70424:

; 215  : 
; 216  : 			/* Add age unit & date button or label */
; 217  : 			DYNBUF_ADD3(form->html, " ", unit, 0, NO_CONV, " ");

	push	1
	push	OFFSET FLAT:$SG70427
	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _unit$70391[ebp]
	push	edx
	push	1
	push	OFFSET FLAT:$SG70428
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70426
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70430
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 217		; 000000d9H
	jmp	$eva_err$70372
$L70426:

; 218  : 			*date = 0;

	mov	BYTE PTR _date$70388[ebp], 0

; 219  : 			if(c) datetxt_to_format(cntxt, date, c->txt, "_EVA_DATETIME");

	cmp	DWORD PTR _c$70389[ebp], 0
	je	SHORT $L70431
	push	OFFSET FLAT:$SG70432
	mov	ecx, DWORD PTR _c$70389[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	lea	eax, DWORD PTR _date$70388[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H
$L70431:

; 220  : 			if(form->step == HtmlEdit)

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	jne	$L70433

; 222  : 				DYNBUF_ADD_STR(form->html, "</td><td>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70436
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70435
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70438
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 222		; 000000deH
	jmp	$eva_err$70372
$L70435:

; 223  : 				CTRL_CGINAMEBTN(&name, c, add_sz_str("DATEMODE"));

	push	8
	push	OFFSET FLAT:$SG70440
	push	66					; 00000042H
	lea	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _c$70389[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70439
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 223		; 000000dfH
	jmp	$eva_err$70372
$L70439:

; 224  : 				if(put_html_button(cntxt, name->data,
; 225  : 					*date ? date : CTRL_ATTR_VAL(LABEL), NULL, NULL,
; 226  : 					"Date correspondante\n\nCliquez pour saisir une date", 0, 0)) STACK_ERROR;

	movsx	eax, BYTE PTR _date$70388[ebp]
	test	eax, eax
	je	SHORT $L70711
	lea	ecx, DWORD PTR _date$70388[ebp]
	mov	DWORD PTR -280+[ebp], ecx
	jmp	SHORT $L70712
$L70711:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70709
	push	0
	push	-1
	push	OFFSET FLAT:$SG70446
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -284+[ebp], eax
	jmp	SHORT $L70710
$L70709:
	mov	DWORD PTR -284+[ebp], OFFSET FLAT:$SG70447
$L70710:
	mov	eax, DWORD PTR -284+[ebp]
	mov	DWORD PTR -280+[ebp], eax
$L70712:
	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:$SG70445
	push	0
	push	0
	mov	ecx, DWORD PTR -280+[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, 8
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70444
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 226		; 000000e2H
	jmp	$eva_err$70372
$L70444:

; 227  : 
; 228  : 				/* Add date value as hidden input */
; 229  : 				if(ctrl_put_hidden(cntxt, ctrl, i)) STACK_ERROR;

	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_put_hidden
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70448
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 229		; 000000e5H
	jmp	$eva_err$70372
$L70448:

; 231  : 			else if(*date)

	jmp	SHORT $L70452
$L70433:
	movsx	eax, BYTE PTR _date$70388[ebp]
	test	eax, eax
	je	SHORT $L70452

; 232  : 				DYNBUF_ADD3(form->html, "(", date, 0, NO_CONV, ")");

	push	1
	push	OFFSET FLAT:$SG70453
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _date$70388[ebp]
	push	ecx
	push	1
	push	OFFSET FLAT:$SG70454
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70452
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70456
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 232		; 000000e8H
	jmp	$eva_err$70372
$L70452:

; 234  : 		else

	jmp	$L70503
$L70419:

; 236  : 			/* Standard date input : set appropriate numbers & width if text format in edit mode */
; 237  : 			if(form->step == HtmlEdit)

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 4
	jne	SHORT $L70458

; 239  : 				fmt = strstr(fmt, "Month") ? "_EVA_StdMonth" :
; 240  : 						strstr(fmt, "Year") ? "_EVA_Year" :
; 241  : 						"_EVA_DATETIME";

	push	OFFSET FLAT:$SG70459
	mov	ecx, DWORD PTR _fmt$[ebp]
	push	ecx
	call	_strstr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70715
	mov	DWORD PTR -288+[ebp], OFFSET FLAT:$SG70460
	jmp	SHORT $L70716
$L70715:
	push	OFFSET FLAT:$SG70461
	mov	edx, DWORD PTR _fmt$[ebp]
	push	edx
	call	_strstr
	add	esp, 8
	test	eax, eax
	je	SHORT $L70713
	mov	DWORD PTR -292+[ebp], OFFSET FLAT:$SG70462
	jmp	SHORT $L70714
$L70713:
	mov	DWORD PTR -292+[ebp], OFFSET FLAT:$SG70463
$L70714:
	mov	eax, DWORD PTR -292+[ebp]
	mov	DWORD PTR -288+[ebp], eax
$L70716:
	mov	ecx, DWORD PTR -288+[ebp]
	mov	DWORD PTR _fmt$[ebp], ecx
$L70458:

; 243  : 			if(c && !datetxt_to_format(cntxt, date, c->txt, fmt))

	cmp	DWORD PTR _c$70389[ebp], 0
	je	SHORT $L70464
	mov	edx, DWORD PTR _fmt$[ebp]
	push	edx
	mov	eax, DWORD PTR _c$70389[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	lea	edx, DWORD PTR _date$70388[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_datetxt_to_format
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L70464

; 244  : 				ctrl->COLUMNS = strlen(date);

	lea	ecx, DWORD PTR _date$70388[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+380], eax

; 245  : 			else if(!*fmt)

	jmp	SHORT $L70467
$L70464:
	mov	eax, DWORD PTR _fmt$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L70466

; 246  : 				ctrl->COLUMNS = 10;

	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+380], 10			; 0000000aH

; 247  : 			else

	jmp	SHORT $L70467
$L70466:

; 249  : 				char d[64];
; 250  : 				datetxt_to_format(cntxt, d, cntxt->timestamp, fmt);

	mov	eax, DWORD PTR _fmt$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	add	ecx, 29704				; 00007408H
	push	ecx
	lea	edx, DWORD PTR _d$70468[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 251  : 				ctrl->COLUMNS = strlen(d);

	lea	ecx, DWORD PTR _d$70468[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+380], eax
$L70467:

; 253  : 
; 254  : 			/* Add date input or value */
; 255  : 			if(cntxt->form->step == HtmlEdit)

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	cmp	DWORD PTR [ecx+176], 4
	jne	$L70469

; 257  : 				CTRL_CGINAMEVAL(&name, i);

	push	0
	push	0
	push	0
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_cell
	add	esp, 12					; 0000000cH
	push	eax
	mov	edx, DWORD PTR _ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70471
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 257		; 00000101H
	jmp	$eva_err$70372
$L70471:
	mov	edx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [edx+196], 1

; 258  : 				if(put_html_text_input(cntxt,
; 259  : 						DYNBUF_VAL_SZ(name),
; 260  : 						date, strlen(date),
; 261  : 						0, *CTRL_ATTR_VAL(JSCALENDAR) ? 4 : 0, 1,
; 262  : 						ctrl->COLUMNS,
; 263  : 						atoi(CTRL_ATTR_VAL(MAXLENGTH))) ||
; 264  : 					ctrl_put_hidden_old(cntxt, ctrl, i, name, date, strlen(date)))

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70717
	push	0
	push	-1
	push	OFFSET FLAT:$SG70475
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -296+[ebp], eax
	jmp	SHORT $L70718
$L70717:
	mov	DWORD PTR -296+[ebp], OFFSET FLAT:$SG70476
$L70718:
	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70719
	push	0
	push	-1
	push	OFFSET FLAT:$SG70477
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -300+[ebp], eax
	jmp	SHORT $L70720
$L70719:
	mov	DWORD PTR -300+[ebp], OFFSET FLAT:$SG70478
$L70720:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70721
	mov	edx, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR -304+[ebp], eax
	jmp	SHORT $L70722
$L70721:
	mov	DWORD PTR -304+[ebp], 0
$L70722:
	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $L70723
	mov	ecx, DWORD PTR _name$[ebp]
	add	ecx, 8
	mov	DWORD PTR -308+[ebp], ecx
	jmp	SHORT $L70724
$L70723:
	mov	DWORD PTR -308+[ebp], 0
$L70724:
	mov	edx, DWORD PTR -296+[ebp]
	push	edx
	call	_atoi
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR [eax+380]
	push	ecx
	push	1
	mov	edx, DWORD PTR -300+[ebp]
	movsx	eax, BYTE PTR [edx]
	neg	eax
	sbb	eax, eax
	and	eax, 4
	push	eax
	push	0
	lea	ecx, DWORD PTR _date$70388[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	push	eax
	lea	edx, DWORD PTR _date$70388[ebp]
	push	edx
	mov	eax, DWORD PTR -304+[ebp]
	push	eax
	mov	ecx, DWORD PTR -308+[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_put_html_text_input
	add	esp, 40					; 00000028H
	test	eax, eax
	jne	SHORT $L70474
	lea	eax, DWORD PTR _date$70388[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	lea	ecx, DWORD PTR _date$70388[ebp]
	push	ecx
	mov	edx, DWORD PTR _name$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_put_hidden_old
	add	esp, 24					; 00000018H
	test	eax, eax
	je	SHORT $L70473
$L70474:

; 265  : 				STACK_ERROR;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 265		; 00000109H
	jmp	$eva_err$70372
$L70473:

; 267  : 			else

	jmp	SHORT $L70480
$L70469:

; 268  : 				DYNBUF_ADD(cntxt->form->html, date, strlen(date), TO_HTML)

	push	1
	push	OFFSET FLAT:_plain_to_html
	lea	ecx, DWORD PTR _date$70388[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	push	eax
	lea	edx, DWORD PTR _date$70388[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70480
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70482
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 268		; 0000010cH
	jmp	$eva_err$70372
$L70480:

; 269  : 
; 270  : 			/* Add age button / text as applicable */
; 271  : 			if(*input_age && (form->step == HtmlEdit || !*fmt))

	mov	edx, DWORD PTR _input_age$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L70503
	mov	ecx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [ecx+176], 4
	je	SHORT $L70484
	mov	edx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	$L70503
$L70484:

; 273  : 				sprintf(date, "%d %s", (b_duration ? -age : age), unit);

	cmp	DWORD PTR _b_duration$[ebp], 0
	je	SHORT $L70725
	mov	ecx, DWORD PTR _age$70390[ebp]
	neg	ecx
	mov	DWORD PTR -312+[ebp], ecx
	jmp	SHORT $L70726
$L70725:
	mov	edx, DWORD PTR _age$70390[ebp]
	mov	DWORD PTR -312+[ebp], edx
$L70726:
	lea	eax, DWORD PTR _unit$70391[ebp]
	push	eax
	mov	ecx, DWORD PTR -312+[ebp]
	push	ecx
	push	OFFSET FLAT:$SG70485
	lea	edx, DWORD PTR _date$70388[ebp]
	push	edx
	call	_sprintf
	add	esp, 16					; 00000010H

; 274  : 				if(form->step == HtmlEdit)

	mov	eax, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [eax+176], 4
	jne	$L70486

; 276  : 					DYNBUF_ADD_STR(form->html, "</td><td>");

	push	0
	push	0
	push	9
	push	OFFSET FLAT:$SG70489
	mov	ecx, DWORD PTR _form$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70488
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70491
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 276		; 00000114H
	jmp	$eva_err$70372
$L70488:

; 277  : 					CTRL_CGINAMEBTN(&name, c, add_sz_str("AGEMODE"));

	push	7
	push	OFFSET FLAT:$SG70493
	push	66					; 00000042H
	lea	edx, DWORD PTR _name$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _c$70389[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_cgi_name
	add	esp, 32					; 00000020H
	test	eax, eax
	je	SHORT $L70492
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 277		; 00000115H
	jmp	$eva_err$70372
$L70492:

; 278  : 					if(put_html_button(cntxt, name->data,
; 279  : 						(c && c->txt) ? date : age_label, NULL, NULL,
; 280  : 						b_duration ? "Durée correspondant à la date\n\nCliquez pour saisir une durée" :
; 281  : 								"Age correspondant à la date\n\nCliquez pour saisir un âge", 0, 0)) STACK_ERROR;

	cmp	DWORD PTR _b_duration$[ebp], 0
	je	SHORT $L70727
	mov	DWORD PTR -316+[ebp], OFFSET FLAT:$SG70498
	jmp	SHORT $L70728
$L70727:
	mov	DWORD PTR -316+[ebp], OFFSET FLAT:$SG70499
$L70728:
	cmp	DWORD PTR _c$70389[ebp], 0
	je	SHORT $L70729
	mov	ecx, DWORD PTR _c$70389[ebp]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L70729
	lea	edx, DWORD PTR _date$70388[ebp]
	mov	DWORD PTR -320+[ebp], edx
	jmp	SHORT $L70730
$L70729:
	mov	eax, DWORD PTR _age_label$[ebp]
	mov	DWORD PTR -320+[ebp], eax
$L70730:
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR -316+[ebp]
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR -320+[ebp]
	push	edx
	mov	eax, DWORD PTR _name$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_put_html_button_sz
	add	esp, 44					; 0000002cH
	test	eax, eax
	je	SHORT $L70497
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 281		; 00000119H
	jmp	$eva_err$70372
$L70497:

; 283  : 				else if(c && c->txt)

	jmp	SHORT $L70503
$L70486:
	cmp	DWORD PTR _c$70389[ebp], 0
	je	SHORT $L70503
	mov	eax, DWORD PTR _c$70389[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L70503

; 284  : 					DYNBUF_ADD3(form->html, " (", date, 0, NO_CONV, ")");

	push	1
	push	OFFSET FLAT:$SG70504
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _date$70388[ebp]
	push	ecx
	push	2
	push	OFFSET FLAT:$SG70505
	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70503
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70507
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 284		; 0000011cH
	jmp	$eva_err$70372
$L70503:

; 287  : 	}

	jmp	$L70385
$L70386:

; 288  : 
; 289  : 	/* Add HTML code for the control footer */
; 290  : 	if(*input_age && form->step == HtmlEdit) DYNBUF_ADD_STR(form->html, "</td></tr></table>");

	mov	eax, DWORD PTR _input_age$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70510
	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+176], 4
	jne	SHORT $L70510
	push	0
	push	0
	push	18					; 00000012H
	push	OFFSET FLAT:$SG70511
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70510
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70513
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 290		; 00000122H
	jmp	SHORT $eva_err$70372
$L70510:

; 291  : 	if(ctrl_format_pos(cntxt, ctrl, 0)) STACK_ERROR;

	push	0
	mov	ecx, DWORD PTR _ctrl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_ctrl_format_pos
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L70514
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 291		; 00000123H
	jmp	SHORT $eva_err$70372
$L70514:

; 292  : 
; 293  : 	ctrl->COLUMNS = columns;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	edx, DWORD PTR _columns$[ebp]
	mov	DWORD PTR [ecx+380], edx
$eva_noerr$70515:

; 294  : 
; 295  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70516
	push	OFFSET FLAT:$SG70517
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70372:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70518
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70519
	push	OFFSET FLAT:$SG70520
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70518:
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

; 296  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_ctrl_editview_date ENDP
_TEXT	ENDS
PUBLIC	_ctrl_add_date
EXTRN	_full_datetxt:NEAR
EXTRN	_strncmp:NEAR
_BSS	SEGMENT
	ALIGN	4

$SG70551 DB	01H DUP (?)
	ALIGN	4

$SG70569 DB	01H DUP (?)
	ALIGN	4

$SG70571 DB	01H DUP (?)
	ALIGN	4

$SG70575 DB	01H DUP (?)
	ALIGN	4

$SG70577 DB	01H DUP (?)
	ALIGN	4

$SG70595 DB	01H DUP (?)
	ALIGN	4

$SG70603 DB	01H DUP (?)
	ALIGN	4

$SG70611 DB	01H DUP (?)
	ALIGN	4

$SG70614 DB	01H DUP (?)
	ALIGN	4

$SG70620 DB	01H DUP (?)
	ALIGN	4

$SG70623 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG70550 DB	'_EVA_DATE_CHECKTYPE', 00H
$SG70557 DB	0aH, 00H
	ORG $+2
$SG70559 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70562 DB	'] n''est pas correcte', 00H
	ORG $+3
$SG70563 DB	'La date [', 00H
	ORG $+2
$SG70565 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70567 DB	'_EVA_FIXED_DATES', 00H
	ORG $+3
$SG70568 DB	'_EVA_MIN_DATE', 00H
	ORG $+2
$SG70570 DB	'_EVA_MAX_DATE', 00H
	ORG $+2
$SG70574 DB	'_EVA_MAX_DATEDIFF', 00H
	ORG $+2
$SG70576 DB	'_EVA_MIN_DATEDIFF', 00H
	ORG $+2
$SG70581 DB	'0100', 00H
	ORG $+3
$SG70583 DB	'99991231', 00H
	ORG $+3
$SG70590 DB	0aH, 00H
	ORG $+2
$SG70592 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70594 DB	'_EVA_FORMAT', 00H
$SG70598 DB	' et avant le ', 00H
	ORG $+2
$SG70599 DB	'La date doit ', 0eaH, 'tre apr', 0e8H, 's le ', 00H
$SG70601 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70602 DB	'_EVA_FORMAT', 00H
$SG70607 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70610 DB	'_EVA_FORMAT', 00H
$SG70615 DB	'La date doit ', 0eaH, 'tre apr', 0e8H, 's le ', 00H
$SG70617 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70619 DB	'_EVA_FORMAT', 00H
$SG70624 DB	'La date doit ', 0eaH, 'tre avant le ', 00H
$SG70626 DB	'M', 0e9H, 'moire serveur satur', 0e9H, 'e', 00H
$SG70632 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_date.'
	DB	'c', 00H
	ORG $+2
$SG70633 DB	'ctrl_add_date', 00H
	ORG $+2
$SG70635 DB	'D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\ctrl_input_date.'
	DB	'c', 00H
	ORG $+2
$SG70636 DB	'ctrl_add_date', 00H
_DATA	ENDS
_TEXT	SEGMENT
_cntxt$ = 8
_i_ctrl$ = 12
_form$ = -4
_ctrl$ = -12
_i$ = -8
_val$70543 = -28
_datemin$70544 = -80
_datemax$70545 = -60
_daymin$70546 = -116
_daymax$70547 = -64
_datebuf$70548 = -112
_date_checktype$70549 = -120
_fmt$70573 = -124
_ctrl_add_date PROC NEAR

; 309  : ){

	push	ebp
	mov	ebp, esp
	sub	esp, 164				; 000000a4H
	push	edi

; 310  : 	EVA_form *form = cntxt->form;

	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR _form$[ebp], ecx

; 311  : 	EVA_ctrl *ctrl = form->ctrl + i_ctrl;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	imul	edx, 480				; 000001e0H
	mov	eax, DWORD PTR _form$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, edx
	mov	DWORD PTR _ctrl$[ebp], ecx

; 312  : 	unsigned long i;
; 313  : 
; 314  : 	switch(form->step)
; 315  : 	{

	mov	edx, DWORD PTR _form$[ebp]
	mov	eax, DWORD PTR [edx+176]
	mov	DWORD PTR -128+[ebp], eax
	cmp	DWORD PTR -128+[ebp], 7
	ja	$L70630
	mov	ecx, DWORD PTR -128+[ebp]
	jmp	DWORD PTR $L70750[ecx*4]
$L70536:

; 316  : 	case CtrlRead:
; 317  : 		if(ctrl_read_date(cntxt, i_ctrl)) STACK_ERROR;

	mov	edx, DWORD PTR _i_ctrl$[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_ctrl_read_date
	add	esp, 8
	test	eax, eax
	je	SHORT $L70537
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 317		; 0000013dH
	jmp	$eva_err$70538
$L70537:

; 318  : 		break;

	jmp	$eva_noerr$70631
$L70539:

; 319  : 
; 320  : 	case InputCheck:
; 321  : 		/* Check each value */
; 322  : 		for(i = 0; i < ctrl->val.nbrows; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L70540
$L70541:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L70540:
	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+64]
	jae	$L70542

; 324  : 			/* Get min & max alowed date values */
; 325  : 			char val[16] = {0};

	mov	BYTE PTR _val$70543[ebp], 0
	xor	edx, edx
	mov	DWORD PTR _val$70543[ebp+1], edx
	mov	DWORD PTR _val$70543[ebp+5], edx
	mov	DWORD PTR _val$70543[ebp+9], edx
	mov	WORD PTR _val$70543[ebp+13], dx
	mov	BYTE PTR _val$70543[ebp+15], dl

; 326  : 			char datemin[16] = {0}, datemax[32] = {0}, *daymin, *daymax;

	mov	BYTE PTR _datemin$70544[ebp], 0
	xor	eax, eax
	mov	DWORD PTR _datemin$70544[ebp+1], eax
	mov	DWORD PTR _datemin$70544[ebp+5], eax
	mov	DWORD PTR _datemin$70544[ebp+9], eax
	mov	WORD PTR _datemin$70544[ebp+13], ax
	mov	BYTE PTR _datemin$70544[ebp+15], al
	mov	BYTE PTR _datemax$70545[ebp], 0
	mov	ecx, 7
	xor	eax, eax
	lea	edi, DWORD PTR _datemax$70545[ebp+1]
	rep stosd
	stosw
	stosb

; 327  : 			char datebuf[32];
; 328  : 			char *date_checktype = CTRL_ATTR_VAL(DATE_CHECKTYPE);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70732
	push	0
	push	-1
	push	OFFSET FLAT:$SG70550
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -132+[ebp], eax
	jmp	SHORT $L70733
$L70732:
	mov	DWORD PTR -132+[ebp], OFFSET FLAT:$SG70551
$L70733:
	mov	edx, DWORD PTR -132+[ebp]
	mov	DWORD PTR _date_checktype$70549[ebp], edx

; 329  : 			strncpy(val, dyntab_val(&ctrl->val, i, 0), sizeof(val)-1);

	push	15					; 0000000fH
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 64					; 00000040H
	push	ecx
	call	_dyntab_val
	add	esp, 12					; 0000000cH
	push	eax
	lea	edx, DWORD PTR _val$70543[ebp]
	push	edx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 330  : 			if(!*val) continue;

	movsx	eax, BYTE PTR _val$70543[ebp]
	test	eax, eax
	jne	SHORT $L70552
	jmp	$L70541
$L70552:

; 331  : 			full_datetxt(val);

	lea	ecx, DWORD PTR _val$70543[ebp]
	push	ecx
	call	_full_datetxt
	add	esp, 4

; 332  : 
; 333  : 			/* Check date is valid */
; 334  : 			if(*val && datetxt_invalid(val))

	movsx	edx, BYTE PTR _val$70543[ebp]
	test	edx, edx
	je	$L70553
	lea	eax, DWORD PTR _val$70543[ebp]
	push	eax
	call	_datetxt_invalid
	add	esp, 4
	test	eax, eax
	je	$L70553

; 336  : 				ctrl->error = 2;

	mov	ecx, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [ecx+212], 2

; 337  : 				if(ctrl->errmsg) DYNBUF_ADD_STR(&ctrl->errmsg, "\n");

	mov	edx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [edx+216], 0
	je	SHORT $L70556
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70557
	mov	eax, DWORD PTR _ctrl$[ebp]
	add	eax, 216				; 000000d8H
	push	eax
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70556
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29872], OFFSET FLAT:$SG70559
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 337		; 00000151H
	jmp	$eva_err$70538
$L70556:

; 338  : 				DYNBUF_ADD3_CELL(&ctrl->errmsg, "La date [", &ctrl->val, i, 0, NO_CONV, "] n'est pas correcte");

	push	20					; 00000014H
	push	OFFSET FLAT:$SG70562
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
	push	OFFSET FLAT:$SG70563
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 216				; 000000d8H
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70561
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70565
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 338		; 00000152H
	jmp	$eva_err$70538
$L70561:

; 339  : 				continue;

	jmp	$L70541
$L70553:

; 341  : 
; 342  : 			if(!strcmp(date_checktype, "_EVA_FIXED_DATES"))

	push	OFFSET FLAT:$SG70567
	mov	ecx, DWORD PTR _date_checktype$70549[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L70566

; 344  : 				/* Fixed dates : simply read values */
; 345  : 				strncpy(datemin, CTRL_ATTR_VAL(MIN_DATE), sizeof(datemin) - 1);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70734
	push	0
	push	-1
	push	OFFSET FLAT:$SG70568
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -136+[ebp], eax
	jmp	SHORT $L70735
$L70734:
	mov	DWORD PTR -136+[ebp], OFFSET FLAT:$SG70569
$L70735:
	push	15					; 0000000fH
	mov	eax, DWORD PTR -136+[ebp]
	push	eax
	lea	ecx, DWORD PTR _datemin$70544[ebp]
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 346  : 				strncpy(datemax, CTRL_ATTR_VAL(MAX_DATE), sizeof(datemax) - 1);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70736
	push	0
	push	-1
	push	OFFSET FLAT:$SG70570
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -140+[ebp], eax
	jmp	SHORT $L70737
$L70736:
	mov	DWORD PTR -140+[ebp], OFFSET FLAT:$SG70571
$L70737:
	push	31					; 0000001fH
	mov	eax, DWORD PTR -140+[ebp]
	push	eax
	lea	ecx, DWORD PTR _datemax$70545[ebp]
	push	ecx
	call	_strncpy
	add	esp, 12					; 0000000cH

; 348  : 			else

	jmp	$L70572
$L70566:

; 350  : 				/* Dates relative to variable day : get day limits  */
; 351  : 				char fmt = 'D';

	mov	BYTE PTR _fmt$70573[ebp], 68		; 00000044H

; 352  : 				daymax = CTRL_ATTR_VAL(MAX_DATEDIFF);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70738
	push	0
	push	-1
	push	OFFSET FLAT:$SG70574
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -144+[ebp], eax
	jmp	SHORT $L70739
$L70738:
	mov	DWORD PTR -144+[ebp], OFFSET FLAT:$SG70575
$L70739:
	mov	eax, DWORD PTR -144+[ebp]
	mov	DWORD PTR _daymax$70547[ebp], eax

; 353  : 				daymin = CTRL_ATTR_VAL(MIN_DATEDIFF);

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70740
	push	0
	push	-1
	push	OFFSET FLAT:$SG70576
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -148+[ebp], eax
	jmp	SHORT $L70741
$L70740:
	mov	DWORD PTR -148+[ebp], OFFSET FLAT:$SG70577
$L70741:
	mov	edx, DWORD PTR -148+[ebp]
	mov	DWORD PTR _daymin$70546[ebp], edx

; 354  : 
; 355  : 				/* Add given days to reference date */
; 356  : 				if(*daymin) delay_to_datetxt(datemin, ctrl->dateref, atoi(daymin), fmt);

	mov	eax, DWORD PTR _daymin$70546[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70578
	mov	dl, BYTE PTR _fmt$70573[ebp]
	push	edx
	mov	eax, DWORD PTR _daymin$70546[ebp]
	push	eax
	call	_atoi
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 236				; 000000ecH
	push	ecx
	lea	edx, DWORD PTR _datemin$70544[ebp]
	push	edx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H
$L70578:

; 357  : 				if(*daymax) delay_to_datetxt(datemax, ctrl->dateref, atoi(daymax), fmt);

	mov	eax, DWORD PTR _daymax$70547[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L70579
	mov	dl, BYTE PTR _fmt$70573[ebp]
	push	edx
	mov	eax, DWORD PTR _daymax$70547[ebp]
	push	eax
	call	_atoi
	add	esp, 4
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 236				; 000000ecH
	push	ecx
	lea	edx, DWORD PTR _datemax$70545[ebp]
	push	edx
	call	_delay_to_datetxt
	add	esp, 16					; 00000010H
$L70579:

; 358  : 				datemin[8] = 0;

	mov	BYTE PTR _datemin$70544[ebp+8], 0

; 359  : 				datemax[8] = 0;

	mov	BYTE PTR _datemax$70545[ebp+8], 0
$L70572:

; 361  : 
; 362  : 			/* Set min / max default values */
; 363  : 			if(!*datemin) strcpy(datemin, "0100");

	movsx	eax, BYTE PTR _datemin$70544[ebp]
	test	eax, eax
	jne	SHORT $L70580
	push	OFFSET FLAT:$SG70581
	lea	ecx, DWORD PTR _datemin$70544[ebp]
	push	ecx
	call	_strcpy
	add	esp, 8
$L70580:

; 364  : 			if(!*datemax) strcpy(datemax, "99991231");

	movsx	edx, BYTE PTR _datemax$70545[ebp]
	test	edx, edx
	jne	SHORT $L70582
	push	OFFSET FLAT:$SG70583
	lea	eax, DWORD PTR _datemax$70545[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
$L70582:

; 365  : 
; 366  : 			/* Check input value validity & min / max */
; 367  : 			if((*datemin && strncmp(datemin, val, strlen(datemin)) > 0) || (*datemax && strncmp(datemax, val, strlen(datemax)) < 0))

	movsx	ecx, BYTE PTR _datemin$70544[ebp]
	test	ecx, ecx
	je	SHORT $L70586
	lea	edx, DWORD PTR _datemin$70544[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	push	eax
	lea	eax, DWORD PTR _val$70543[ebp]
	push	eax
	lea	ecx, DWORD PTR _datemin$70544[ebp]
	push	ecx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jg	SHORT $L70585
$L70586:
	movsx	edx, BYTE PTR _datemax$70545[ebp]
	test	edx, edx
	je	$L70622
	lea	eax, DWORD PTR _datemax$70545[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	lea	ecx, DWORD PTR _val$70543[ebp]
	push	ecx
	lea	edx, DWORD PTR _datemax$70545[ebp]
	push	edx
	call	_strncmp
	add	esp, 12					; 0000000cH
	test	eax, eax
	jge	$L70622
$L70585:

; 369  : 				ctrl->error = 2;

	mov	eax, DWORD PTR _ctrl$[ebp]
	mov	DWORD PTR [eax+212], 2

; 370  : 				if(ctrl->errmsg) DYNBUF_ADD_STR(&ctrl->errmsg, "\n");

	mov	ecx, DWORD PTR _ctrl$[ebp]
	cmp	DWORD PTR [ecx+216], 0
	je	SHORT $L70589
	push	0
	push	0
	push	1
	push	OFFSET FLAT:$SG70590
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 216				; 000000d8H
	push	edx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70589
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70592
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 370		; 00000172H
	jmp	$eva_err$70538
$L70589:

; 371  : 				if(*datemin && *datemax)

	movsx	edx, BYTE PTR _datemin$70544[ebp]
	test	edx, edx
	je	$L70593
	movsx	eax, BYTE PTR _datemax$70545[ebp]
	test	eax, eax
	je	$L70593

; 373  : 					datetxt_to_format(cntxt, datebuf, datemin, CTRL_ATTR_VAL(FORMAT));

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70742
	push	0
	push	-1
	push	OFFSET FLAT:$SG70594
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -152+[ebp], eax
	jmp	SHORT $L70743
$L70742:
	mov	DWORD PTR -152+[ebp], OFFSET FLAT:$SG70595
$L70743:
	mov	edx, DWORD PTR -152+[ebp]
	push	edx
	lea	eax, DWORD PTR _datemin$70544[ebp]
	push	eax
	lea	ecx, DWORD PTR _datebuf$70548[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 374  : 					DYNBUF_ADD3(&ctrl->errmsg, "La date doit être après le ", datebuf, 0, NO_CONV, " et avant le ");

	push	13					; 0000000dH
	push	OFFSET FLAT:$SG70598
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _datebuf$70548[ebp]
	push	eax
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG70599
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 216				; 000000d8H
	push	ecx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70597
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70601
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 374		; 00000176H
	jmp	$eva_err$70538
$L70597:

; 375  : 					datetxt_to_format(cntxt, datebuf, datemax, CTRL_ATTR_VAL(FORMAT));

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70744
	push	0
	push	-1
	push	OFFSET FLAT:$SG70602
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 44					; 0000002cH
	push	ecx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -156+[ebp], eax
	jmp	SHORT $L70745
$L70744:
	mov	DWORD PTR -156+[ebp], OFFSET FLAT:$SG70603
$L70745:
	mov	edx, DWORD PTR -156+[ebp]
	push	edx
	lea	eax, DWORD PTR _datemax$70545[ebp]
	push	eax
	lea	ecx, DWORD PTR _datebuf$70548[ebp]
	push	ecx
	mov	edx, DWORD PTR _cntxt$[ebp]
	push	edx
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 376  : 					DYNBUF_ADD(&ctrl->errmsg, datebuf, 0, NO_CONV);

	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _datebuf$70548[ebp]
	push	eax
	mov	ecx, DWORD PTR _ctrl$[ebp]
	add	ecx, 216				; 000000d8H
	push	ecx
	call	_dynbuf_add
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L70605
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29872], OFFSET FLAT:$SG70607
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29900], 376		; 00000178H
	jmp	$eva_err$70538
$L70605:

; 378  : 				else if(*datemin)

	jmp	$L70622
$L70593:
	movsx	ecx, BYTE PTR _datemin$70544[ebp]
	test	ecx, ecx
	je	$L70609

; 380  : 					datetxt_to_format(cntxt, datebuf, datemin, CTRL_ATTR_VAL(FORMAT));

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70746
	push	0
	push	-1
	push	OFFSET FLAT:$SG70610
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -160+[ebp], eax
	jmp	SHORT $L70747
$L70746:
	mov	DWORD PTR -160+[ebp], OFFSET FLAT:$SG70611
$L70747:
	mov	eax, DWORD PTR -160+[ebp]
	push	eax
	lea	ecx, DWORD PTR _datemin$70544[ebp]
	push	ecx
	lea	edx, DWORD PTR _datebuf$70548[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 381  : 					DYNBUF_ADD3(&ctrl->errmsg, "La date doit être après le ", datebuf, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70614
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _datebuf$70548[ebp]
	push	ecx
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG70615
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 216				; 000000d8H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70613
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70617
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 381		; 0000017dH
	jmp	$eva_err$70538
$L70613:

; 383  : 				else

	jmp	$L70622
$L70609:

; 385  : 					datetxt_to_format(cntxt, datebuf, datemax, CTRL_ATTR_VAL(FORMAT));

	cmp	DWORD PTR _ctrl$[ebp], 0
	je	SHORT $L70748
	push	0
	push	-1
	push	OFFSET FLAT:$SG70619
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 44					; 0000002cH
	push	edx
	call	_dyntab_field_val
	add	esp, 16					; 00000010H
	mov	DWORD PTR -164+[ebp], eax
	jmp	SHORT $L70749
$L70748:
	mov	DWORD PTR -164+[ebp], OFFSET FLAT:$SG70620
$L70749:
	mov	eax, DWORD PTR -164+[ebp]
	push	eax
	lea	ecx, DWORD PTR _datemax$70545[ebp]
	push	ecx
	lea	edx, DWORD PTR _datebuf$70548[ebp]
	push	edx
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_datetxt_to_format
	add	esp, 16					; 00000010H

; 386  : 					DYNBUF_ADD3(&ctrl->errmsg, "La date doit être avant le ", datebuf, 0, NO_CONV, "");

	push	0
	push	OFFSET FLAT:$SG70623
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _datebuf$70548[ebp]
	push	ecx
	push	27					; 0000001bH
	push	OFFSET FLAT:$SG70624
	mov	edx, DWORD PTR _ctrl$[ebp]
	add	edx, 216				; 000000d8H
	push	edx
	call	_dynbuf_add3
	add	esp, 36					; 00000024H
	test	eax, eax
	je	SHORT $L70622
	mov	eax, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [eax+29872], OFFSET FLAT:$SG70626
	mov	ecx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [ecx+29900], 386		; 00000182H
	jmp	SHORT $eva_err$70538
$L70622:

; 389  : 		}

	jmp	$L70541
$L70542:

; 390  : 		break;

	jmp	SHORT $eva_noerr$70631
$L70627:

; 391  : 
; 392  : 	case HtmlEdit:
; 393  : 	case HtmlPrint:
; 394  : 	case HtmlView:
; 395  : 		if(!form->html) break;

	mov	edx, DWORD PTR _form$[ebp]
	cmp	DWORD PTR [edx+232], 0
	jne	SHORT $L70628
	jmp	SHORT $eva_noerr$70631
$L70628:

; 396  : 		/* Add HTML code for control */
; 397  : 		if(ctrl_editview_date(cntxt, i_ctrl)) STACK_ERROR;

	mov	eax, DWORD PTR _i_ctrl$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_ctrl_editview_date
	add	esp, 8
	test	eax, eax
	je	SHORT $L70630
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	DWORD PTR [edx+29900], 397		; 0000018dH
	jmp	SHORT $eva_err$70538
$L70630:
$eva_noerr$70631:

; 402  : 
; 403  : 	RETURN_OK_CLEANUP;

	push	0
	push	OFFSET FLAT:$SG70632
	push	OFFSET FLAT:$SG70633
	mov	eax, DWORD PTR _cntxt$[ebp]
	push	eax
	call	_err_clear
	add	esp, 16					; 00000010H
$eva_err$70538:
	mov	ecx, DWORD PTR _cntxt$[ebp]
	cmp	DWORD PTR [ecx+29872], 0
	je	SHORT $L70634
	mov	edx, DWORD PTR _cntxt$[ebp]
	mov	eax, DWORD PTR [edx+29900]
	push	eax
	push	OFFSET FLAT:$SG70635
	push	OFFSET FLAT:$SG70636
	mov	ecx, DWORD PTR _cntxt$[ebp]
	push	ecx
	call	_err_add_context
	add	esp, 16					; 00000010H
$L70634:
	mov	edx, DWORD PTR _cntxt$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+29872], 0
	setne	al

; 404  : }

	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
$L70750:
	DD	$L70536
	DD	$L70630
	DD	$L70539
	DD	$L70630
	DD	$L70627
	DD	$L70630
	DD	$L70627
	DD	$L70627
_ctrl_add_date ENDP
_TEXT	ENDS
END
