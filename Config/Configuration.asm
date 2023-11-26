; =========================================================================================================================================================
; Configuration
; =========================================================================================================================================================
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; ASM68K Options
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
		opt	l.				; Use "." for local labels
		opt	ws+				; allow white spaces in operand parsing
		opt	op+				; Optimize to PC relative addressing
		opt	os+				; Optimize short branches
		opt	ow+				; Optimize absolute long addressing
		opt	oz+				; Optimize zero displacements
		opt	oaq+				; Optimize to addq
		opt	osq+				; Optimize to subq
		opt	omq+				; Optimize to moveq
		opt	ae-				; Disable automatic evens
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Required
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
GAME_NAME	equs	"Hedgebrew Engine Project                        "; International name
IO_SUPPORT	equs	"J"				; I/O support
SRAM_SUPPORT	equ	$20202020			; SRAM support
SRAM_START	equ	$20202020			; SRAM start address
SRAM_END	equ	$20202020			; SRAM end address
NOTES		equs	""; Notes
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; User defined
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
DEBUG_BUILD	equ	0				; Debug build flag (0 = Disabled)
ENABLE_HANDLER	equ	0|DEBUG				; Vladikcomper's error handler enable flag (0 = Disabled)
ENABLE_LAGMETER	equ	0				; Lag meter enable flag (0 = Disabled)
DEBUG		equ	DEBUG_BUILD			; Hack
; =========================================================================================================================================================
