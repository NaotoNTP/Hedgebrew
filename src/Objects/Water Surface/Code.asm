; =========================================================================================================================================================
; Water surface object
; =========================================================================================================================================================
		rsset	oLvlSSTs
oSurfPause	rs.b	1			; Animation stop flag
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjWaterSurface:
		move.l	#ObjWaterSurface_Main,oAddr(a0)	; Next routine
		move.l	#Map_ObjWaterSurface,oMap(a0)	; Mappings
		move.w	#$8690,oVRAM(a0)		; Tile properties
		move.b	#4,oRender(a0)			; Render flags
	displaySprite	0,a0,a1,0			; Priority
		move.b	#$80,oDrawW(a0)			; Sprite width
		move.b	#$20,oDrawH(a0)			; Sprite height

ObjWaterSurface_Main:
		move.w	rWaterLvl.w,d1		; Get water height
		subq.w	#6,d1				; Shift it
		move.w	d1,oYPos(a0)			; Set Y position

		tst.b	oSurfPause(a0)			; Is the animation paused?
		bne.s	.ChkUnpause			; If so, branch
		btst	#7,rP1Press.w			; Has the start button been pressed?
		beq.s	.Animate			; If not, branch
		addq.b	#3,oFrame(a0)			; Use different frames
		st	oSurfPause(a0)			; Pause the animation
		bra.s	.Animate			; Continue

.ChkUnpause:
		tst.b	rPauseFlag.w			; Is the game paused?
		bne.s	.Animate			; If so, branch
		clr.b	oSurfPause(a0)			; Resume animation
		subq.b	#3,oFrame(a0)			; Use normal frames

.Animate:
		lea	.AniScript(pc),a1		; Get animation script
		moveq	#0,d1
		move.b	oAniFrame(a0),d1		; Get animation script frame
		move.b	(a1,d1.w),oFrame(a0)		; Set mapping frame
		addq.b	#1,oAniFrame(a0)		; Next frame in animation script
		andi.b	#$3F,oAniFrame(a0)		; Loop in necessary
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
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ArtKosM_WaterSurface:
		incbin	"Objects/Water Surface/Art.kosm.bin"
		even
; =========================================================================================================================================================