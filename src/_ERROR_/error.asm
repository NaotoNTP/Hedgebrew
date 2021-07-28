; -------------------------------------------------------------------------
; Mighty The Armadillo in PRISM PARADISE
; By Nat The Porcupine 2021
; -------------------------------------------------------------------------
; Vladikcomper's debugger
; -------------------------------------------------------------------------

	if DEBUG

; -------------------------------------------------------------------------
; Error handler control flags
; -------------------------------------------------------------------------

; Screen appearence flags
_eh_address_error	equ	$01	; use for address and bus errors only (tells error handler to display additional "Address" field)
_eh_show_sr_usp		equ	$02	; displays SR and USP registers content on error screen

; Advanced execution flags
; WARNING! For experts only, DO NOT USES them unless you know what you're doing
_eh_return		equ	$20
_eh_enter_console	equ	$40
_eh_align_offset	equ	$80

; -------------------------------------------------------------------------
; Errors vector table
; -------------------------------------------------------------------------

; Default screen configuration
_eh_default		equ	0	;_eh_show_sr_usp

; -------------------------------------------------------------------------

exBus:
	__ErrorMessage "BUS ERROR", _eh_default|_eh_address_error

exAddr:
	__ErrorMessage "ADDRESS ERROR", _eh_default|_eh_address_error

exIll:
	__ErrorMessage "ILLEGAL INSTRUCTION", _eh_default

exDiv:
	__ErrorMessage "ZERO DIVIDE", _eh_default

exChk:
	__ErrorMessage "CHK INSTRUCTION", _eh_default

Trapv:
	__ErrorMessage "TRAPV INSTRUCTION", _eh_default

exPriv:
	__ErrorMessage "PRIVILEGE VIOLATION", _eh_default

exTrace:
	__ErrorMessage "TRACE", _eh_default

exLineA:
	__ErrorMessage "LINE A EMULATOR", _eh_default

exLineF:
	__ErrorMessage "LINE F EMULATOR", _eh_default

exMisc:
	__ErrorMessage "MISC EXCEPTION", _eh_default

; -------------------------------------------------------------------------
; Import error handler global functions
; -------------------------------------------------------------------------

ErrorHandler.__global__error_initconsole		equ	ErrorHandler+$146
ErrorHandler.__global__errorhandler_setupvdp		equ	ErrorHandler+$234
ErrorHandler.__global__console_loadpalette		equ	ErrorHandler+$A1C
ErrorHandler.__global__console_setposasxy_stack		equ	ErrorHandler+$A58
ErrorHandler.__global__console_setposasxy		equ	ErrorHandler+$A5E
ErrorHandler.__global__console_getposasxy		equ	ErrorHandler+$A8A
ErrorHandler.__global__console_startnewline		equ	ErrorHandler+$AAC
ErrorHandler.__global__console_setbasepattern		equ	ErrorHandler+$AD4
ErrorHandler.__global__console_setwidth			equ	ErrorHandler+$AE8
ErrorHandler.__global__console_writeline_withpattern	equ	ErrorHandler+$AFE
ErrorHandler.__global__console_writeline		equ	ErrorHandler+$B00
ErrorHandler.__global__console_write			equ	ErrorHandler+$B04
ErrorHandler.__global__console_writeline_formatted	equ	ErrorHandler+$BB0
ErrorHandler.__global__console_write_formatted		equ	ErrorHandler+$BB4

; -------------------------------------------------------------------------
; Error handler external functions (compiled only when used)
; -------------------------------------------------------------------------

	if ref(ErrorHandler.__extern_scrollconsole)
ErrorHandler.__extern__scrollconsole:

	endif

	if ref(ErrorHandler.__extern__console_only)
ErrorHandler.__extern__console_only:
	dc.l	$46FC2700, $4FEFFFF2, $48E7FFFE, $47EF003C
	jsr		ErrorHandler.__global__errorhandler_setupvdp(pc)
	jsr		ErrorHandler.__global__error_initconsole(pc)
	dc.l	$4CDF7FFF, $487A0008, $2F2F0012, $4E7560FE
	endif

	if ref(ErrorHandler.__extern__vsync)
ErrorHandler.__extern__vsync:
	dc.l	$41F900C0, $000444D0, $6BFC44D0, $6AFC4E75
	endif

; -------------------------------------------------------------------------
; Include error handler binary module
; -------------------------------------------------------------------------

ErrorHandler:
	incbin	"_ERROR_/ErrorHandler.bin"

; -------------------------------------------------------------------------
; WARNING!
;	DO NOT put any data from now on! DO NOT use ROM padding!
;	Symbol data should be appended here after ROM is compiled
;	by ConvSym utility, otherwise debugger modules won't be able
;	to resolve symbol names.
; -------------------------------------------------------------------------

	else
exBus	EQU	ICD_BLK
exAddr	EQU	ICD_BLK
exIll	EQU	ICD_BLK
exDiv	EQU	ICD_BLK
exChk	EQU	ICD_BLK
Trapv	EQU	ICD_BLK
exPriv	EQU	ICD_BLK
exTrace	EQU	ICD_BLK
exLineA	EQU	ICD_BLK
exLineF	EQU	ICD_BLK
exMisc	EQU	ICD_BLK
	endif

; -------------------------------------------------------------------------
