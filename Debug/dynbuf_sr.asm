	TITLE	D:\Travail\ABI\EVA\V4.0\CGI\Brunix-2016\dynbuf_sr.c
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
PUBLIC	_plain_to_html
PUBLIC	_plain_to_xml
PUBLIC	_no_tab_cr
PUBLIC	_html_tooltip
PUBLIC	_no_quote
PUBLIC	_no_par
PUBLIC	_javascript_string
PUBLIC	_syscmd_string
PUBLIC	_sql_no_quote
PUBLIC	_sql_no_like_ops
PUBLIC	_export_tabrc
PUBLIC	_crlf_to_lf
_DATA	SEGMENT
_plain_to_html DD FLAT:$SG70206
	DD	01H
	DD	FLAT:$SG70207
	DD	04H
	DD	FLAT:$SG70208
	DD	01H
	DD	FLAT:$SG70209
	DD	04H
	DD	FLAT:$SG70210
	DD	01H
	DD	FLAT:$SG70211
	DD	05H
	DD	FLAT:$SG70212
	DD	02H
	DD	FLAT:$SG70213
	DD	04H
	DD	FLAT:$SG70214
	DD	01H
	DD	FLAT:$SG70215
	DD	04H
	DD	FLAT:$SG70216
	DD	01H
	DD	FLAT:$SG70217
	DD	04H
	DD	FLAT:$SG70218
	DD	01H
	DD	FLAT:$SG70219
	DD	018H
	DD	FLAT:$SG70220
	DD	02H
	DD	FLAT:$SG70221
	DD	01dH
	DD	FLAT:$SG70222
	DD	02H
	DD	FLAT:$SG70223
	DD	01dH
	DD	FLAT:$SG70224
	DD	02H
	DD	FLAT:$SG70225
	DD	01dH
	DD	FLAT:$SG70226
	DD	02H
	DD	FLAT:$SG70227
	DD	01dH
	DD	FLAT:$SG70228
	DD	03H
	DD	FLAT:$SG70229
	DD	01dH
	DD	00H
	ORG $+12
_no_tab_cr DD	FLAT:$SG70231
	DD	01H
	DD	FLAT:$SG70232
	DD	01H
	DD	FLAT:$SG70233
	DD	01H
	DD	FLAT:$SG70234
	DD	01H
	DD	00H
	ORG $+12
_plain_to_xml DD FLAT:$SG70236
	DD	01H
	DD	FLAT:$SG70237
	DD	04H
	DD	FLAT:$SG70238
	DD	01H
	DD	FLAT:$SG70239
	DD	04H
	DD	FLAT:$SG70240
	DD	01H
	DD	FLAT:$SG70241
	DD	05H
	DD	00H
	ORG $+12
_html_tooltip DD FLAT:$SG70243
	DD	01H
	DD	FLAT:$SG70244
	DD	05H
	DD	FLAT:$SG70245
	DD	02H
	DD	FLAT:$SG70246
	DD	01dH
	DD	FLAT:$SG70247
	DD	02H
	DD	FLAT:$SG70248
	DD	01dH
	DD	FLAT:$SG70249
	DD	02H
	DD	FLAT:$SG70250
	DD	01dH
	DD	FLAT:$SG70251
	DD	02H
	DD	FLAT:$SG70252
	DD	01dH
	DD	FLAT:$SG70253
	DD	03H
	DD	FLAT:$SG70254
	DD	01dH
	DD	00H
	ORG $+12
_no_quote DD	FLAT:$SG70256
	DD	01H
	DD	FLAT:$SG70257
	DD	05H
	DD	00H
	ORG $+12
_no_par	DD	FLAT:$SG70259
	DD	01H
	DD	FLAT:$SG70260
	DD	04H
	DD	FLAT:$SG70261
	DD	01H
	DD	FLAT:$SG70262
	DD	04H
	DD	FLAT:$SG70263
	DD	01H
	DD	FLAT:$SG70264
	DD	05H
	DD	FLAT:$SG70265
	DD	01H
	DD	FLAT:$SG70266
	DD	05H
	DD	FLAT:$SG70267
	DD	01H
	DD	FLAT:$SG70268
	DD	01H
	DD	00H
	ORG $+12
_javascript_string DD FLAT:$SG70270
	DD	01H
	DD	FLAT:$SG70271
	DD	02H
	DD	FLAT:$SG70272
	DD	01H
	DD	FLAT:$SG70273
	DD	02H
	DD	FLAT:$SG70274
	DD	01H
	DD	FLAT:$SG70275
	DD	02H
	DD	FLAT:$SG70276
	DD	01H
	DD	FLAT:$SG70277
	DD	04H
	DD	FLAT:$SG70278
	DD	01H
	DD	FLAT:$SG70279
	DD	02H
	DD	FLAT:$SG70280
	DD	02H
	DD	FLAT:$SG70281
	DD	01dH
	DD	FLAT:$SG70282
	DD	02H
	DD	FLAT:$SG70283
	DD	01dH
	DD	FLAT:$SG70284
	DD	02H
	DD	FLAT:$SG70285
	DD	01dH
	DD	FLAT:$SG70286
	DD	02H
	DD	FLAT:$SG70287
	DD	01dH
	DD	FLAT:$SG70288
	DD	03H
	DD	FLAT:$SG70289
	DD	01dH
	DD	00H
	ORG $+12
_syscmd_string DD FLAT:$SG70291
	DD	01H
	DD	FLAT:$SG70292
	DD	01H
	DD	FLAT:$SG70293
	DD	01H
	DD	FLAT:$SG70294
	DD	01H
	DD	FLAT:$SG70295
	DD	01H
	DD	FLAT:$SG70296
	DD	01H
	DD	FLAT:$SG70297
	DD	01H
	DD	FLAT:$SG70298
	DD	01H
	DD	00H
	ORG $+12
_sql_no_quote DD FLAT:$SG70302
	DD	01H
	DD	FLAT:$SG70303
	DD	02H
	DD	FLAT:$SG70304
	DD	01H
	DD	FLAT:$SG70305
	DD	02H
	DD	00H
	ORG $+12
_sql_no_like_ops DD FLAT:$SG70307
	DD	01H
	DD	FLAT:$SG70308
	DD	02H
	DD	FLAT:$SG70309
	DD	01H
	DD	FLAT:$SG70310
	DD	02H
	DD	FLAT:$SG70311
	DD	01H
	DD	FLAT:$SG70312
	DD	02H
	DD	FLAT:$SG70313
	DD	01H
	DD	FLAT:$SG70314
	DD	02H
	DD	00H
	ORG $+12
_export_tabrc DD FLAT:$SG70316
	DD	01H
	DD	FLAT:$SG70317
	DD	04H
	DD	FLAT:$SG70318
	DD	01H
	DD	FLAT:$SG70319
	DD	04H
	DD	FLAT:$SG70320
	DD	01H
	DD	FLAT:$SG70321
	DD	05H
	DD	00H
	ORG $+12
_crlf_to_lf DD	FLAT:$SG70323
	DD	02H
	DD	FLAT:$SG70324
	DD	01H
	DD	00H
	ORG $+12
$SG70206 DB	'<', 00H
	ORG $+2
$SG70207 DB	'&lt;', 00H
	ORG $+3
$SG70208 DB	'>', 00H
	ORG $+2
$SG70209 DB	'&gt;', 00H
	ORG $+3
$SG70210 DB	'&', 00H
	ORG $+2
$SG70211 DB	'&amp;', 00H
	ORG $+2
$SG70212 DB	0dH, 0aH, 00H
	ORG $+1
$SG70213 DB	'<br>', 00H
	ORG $+3
$SG70214 DB	0dH, 00H
	ORG $+2
$SG70215 DB	'<br>', 00H
	ORG $+3
$SG70216 DB	0aH, 00H
	ORG $+2
$SG70217 DB	'<br>', 00H
	ORG $+3
$SG70218 DB	09H, 00H
	ORG $+2
$SG70219 DB	'&nbsp;&nbsp;&nbsp;&nbsp;', 00H
	ORG $+3
$SG70220 DB	'.;', 00H
	ORG $+1
$SG70221 DB	'<small><b>&#8756;</b></small>', 00H
	ORG $+2
$SG70222 DB	'.:', 00H
	ORG $+1
$SG70223 DB	'<small><b>&#8756;</b></small>', 00H
	ORG $+2
$SG70224 DB	';.', 00H
	ORG $+1
$SG70225 DB	'<small><b>&#8756;</b></small>', 00H
	ORG $+2
$SG70226 DB	':.', 00H
	ORG $+1
$SG70227 DB	'<small><b>&#8756;</b></small>', 00H
	ORG $+2
$SG70228 DB	'.', 0b0H, '.', 00H
$SG70229 DB	'<small><b>&#8756;</b></small>', 00H
	ORG $+2
$SG70231 DB	0aH, 00H
	ORG $+2
$SG70232 DB	' ', 00H
	ORG $+2
$SG70233 DB	09H, 00H
	ORG $+2
$SG70234 DB	' ', 00H
	ORG $+2
$SG70236 DB	'<', 00H
	ORG $+2
$SG70237 DB	'&lt;', 00H
	ORG $+3
$SG70238 DB	'>', 00H
	ORG $+2
$SG70239 DB	'&gt;', 00H
	ORG $+3
$SG70240 DB	'&', 00H
	ORG $+2
$SG70241 DB	'&amp;', 00H
	ORG $+2
$SG70243 DB	'''', 00H
	ORG $+2
$SG70244 DB	'&#39;', 00H
	ORG $+2
$SG70245 DB	'.;', 00H
	ORG $+1
$SG70246 DB	'<small><b>&#8756;</b></small>', 00H
	ORG $+2
$SG70247 DB	'.:', 00H
	ORG $+1
$SG70248 DB	'<small><b>&#8756;</b></small>', 00H
	ORG $+2
$SG70249 DB	';.', 00H
	ORG $+1
$SG70250 DB	'<small><b>&#8756;</b></small>', 00H
	ORG $+2
$SG70251 DB	':.', 00H
	ORG $+1
$SG70252 DB	'<small><b>&#8756;</b></small>', 00H
	ORG $+2
$SG70253 DB	'.', 0b0H, '.', 00H
$SG70254 DB	'<small><b>&#8756;</b></small>', 00H
	ORG $+2
$SG70256 DB	'''', 00H
	ORG $+2
$SG70257 DB	'&#39;', 00H
	ORG $+2
$SG70259 DB	'<', 00H
	ORG $+2
$SG70260 DB	'&lt;', 00H
	ORG $+3
$SG70261 DB	'>', 00H
	ORG $+2
$SG70262 DB	'&gt;', 00H
	ORG $+3
$SG70263 DB	'&', 00H
	ORG $+2
$SG70264 DB	'&amp;', 00H
	ORG $+2
$SG70265 DB	'''', 00H
	ORG $+2
$SG70266 DB	'&#39;', 00H
	ORG $+2
$SG70267 DB	0a7H, 00H
	ORG $+2
$SG70268 DB	'?', 00H
	ORG $+2
$SG70270 DB	0dH, 00H
	ORG $+2
$SG70271 DB	'\r', 00H
	ORG $+1
$SG70272 DB	0aH, 00H
	ORG $+2
$SG70273 DB	'\n', 00H
	ORG $+1
$SG70274 DB	09H, 00H
	ORG $+2
$SG70275 DB	'\t', 00H
	ORG $+1
$SG70276 DB	'"', 00H
	ORG $+2
$SG70277 DB	'\''\''', 00H
	ORG $+3
$SG70278 DB	'''', 00H
	ORG $+2
$SG70279 DB	'\''', 00H
	ORG $+1
$SG70280 DB	'.;', 00H
	ORG $+1
$SG70281 DB	'<small><b>&#8756;</b></small>', 00H
	ORG $+2
$SG70282 DB	'.:', 00H
	ORG $+1
$SG70283 DB	'<small><b>&#8756;</b></small>', 00H
	ORG $+2
$SG70284 DB	';.', 00H
	ORG $+1
$SG70285 DB	'<small><b>&#8756;</b></small>', 00H
	ORG $+2
$SG70286 DB	':.', 00H
	ORG $+1
$SG70287 DB	'<small><b>&#8756;</b></small>', 00H
	ORG $+2
$SG70288 DB	'.', 0b0H, '.', 00H
$SG70289 DB	'<small><b>&#8756;</b></small>', 00H
	ORG $+2
$SG70291 DB	0dH, 00H
	ORG $+2
$SG70292 DB	' ', 00H
	ORG $+2
$SG70293 DB	0aH, 00H
	ORG $+2
$SG70294 DB	' ', 00H
	ORG $+2
$SG70295 DB	09H, 00H
	ORG $+2
$SG70296 DB	' ', 00H
	ORG $+2
$SG70297 DB	'"', 00H
	ORG $+2
$SG70298 DB	'''', 00H
	ORG $+2
$SG70302 DB	'''', 00H
	ORG $+2
$SG70303 DB	'\''', 00H
	ORG $+1
$SG70304 DB	'\', 00H
	ORG $+2
$SG70305 DB	'\\', 00H
	ORG $+1
$SG70307 DB	'''', 00H
	ORG $+2
$SG70308 DB	'\''', 00H
	ORG $+1
$SG70309 DB	'\', 00H
	ORG $+2
$SG70310 DB	'\\', 00H
	ORG $+1
$SG70311 DB	'_', 00H
	ORG $+2
$SG70312 DB	'\_', 00H
	ORG $+1
$SG70313 DB	'%', 00H
	ORG $+2
$SG70314 DB	'\%', 00H
	ORG $+1
$SG70316 DB	0aH, 00H
	ORG $+2
$SG70317 DB	'<RC>', 00H
	ORG $+3
$SG70318 DB	0dH, 00H
	ORG $+2
$SG70319 DB	'<RC>', 00H
	ORG $+3
$SG70320 DB	09H, 00H
	ORG $+2
$SG70321 DB	'<TAB>', 00H
	ORG $+2
$SG70323 DB	0dH, 0aH, 00H
	ORG $+1
$SG70324 DB	0aH, 00H
_DATA	ENDS
END
