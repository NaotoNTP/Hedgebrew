; =========================================================================================================================================================
; Water surface object
; =========================================================================================================================================================
		rsset	_objLvlSSTs
_objSurfPause	rs.b	1			; Animation stop flag
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjWaterSurface:
		move.l	#ObjWaterSurface_Main,_objAddress(a0)	; Next routine
		move.l	#Map_ObjWaterSurface,_objMapping(a0)	; Mappings
		move.w	#$8690,_objVRAM(a0)		; Tile properties
		move.b	#4,_objRender(a0)			; Render flags
	displaySprite	0,a0,a1,0			; Priority
		move.b	#$80,_objDrawW(a0)			; Sprite width
		move.b	#$20,_objDrawH(a0)			; Sprite height

ObjWaterSurface_Main:
		move.w	waterYPos.w,d1		; Get water height
		subq.w	#6,d1				; Shift it
		move.w	d1,_objYPos(a0)			; Set Y position

		tst.b	_objSurfPause(a0)			; Is the animation paused?
		bne.s	.ChkUnpause			; If so, branch
		btst	#7,ctrlPressP1.w			; Has the start button been pressed?
		beq.s	.Animate			; If not, branch
		addq.b	#3,_objFrame(a0)			; Use different frames
		st	_objSurfPause(a0)			; Pause the animation
		bra.s	.Animate			; Continue

.ChkUnpause:
		tst.b	pauseFlag.w			; Is the game paused?
		bne.s	.Animate			; If so, branch
		clr.b	_objSurfPause(a0)			; Resume animation
		subq.b	#3,_objFrame(a0)			; Use normal frames

.Animate:
		lea	.AniScript(pc),a1		; Get animation script
		moveq	#0,d1
		move.b	_objAnimFrame(a0),d1		; Get animation script frame
		move.b	(a1,d1.w),_objFrame(a0)		; Set mapping frame
		addq.b	#1,_objAnimFrame(a0)		; Next frame in animation script
		andi.b	#$3F,_objAnimFrame(a0)		; Loop in necessary
	nextObject
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
.AniScript:
		dc.b	0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1
		dc.b	1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2
		dc.b	2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1
		dc.b	1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1
		even
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Data
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Map_ObjWaterSurface:
		include	"Objects/Water Surface/Mappings.asm"
		even
; =========================================================================================================================================================