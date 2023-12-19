; =========================================================================================================================================================
; Water splash object
; =========================================================================================================================================================
		rsset	oLvlDynSSTs
oSurfacePause		rs.b	1				; Animation stop flag
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjWaterSplash:
		move.l	#ObjWaterSplash_Main,_objAddress(a0)		; Next routine
		move.l	#Map_ObjWaterSplash,_objMappingpings(a0)	; Mappings
		move.w	#$480,oTileProps(a0)			; Tile properties
		move.b	#4,_objRender(a0)				; Render flags
		move.w	#rSprInput,oPriority(a0)		; Priority
		move.b	#$80,_objDrawWidth(a0)			; Sprite width
		move.b	#$20,_objDrawHeight(a0)			; Sprite height

ObjWaterSplash_Main:
		move.w	rWaterHeight.w,d1			; Get water height
		subq.w	#6,d1					; Shift it
		move.w	d1,_objYPos(a0)				; Set Y position

		tst.b	oSurfacePause(a0)			; Is the animation paused?
		bne.s	.ChkUnpause				; If so, branch
		btst	#7,rCtrl1_Press.w			; Has the start button been pressed?
		beq.s	.Animate				; If not, branch
		addq.b	#3,_objMappingFrame(a0)			; Use different frames
		st	oSurfacePause(a0)			; Pause the animation
		bra.s	.Animate				; Continue

.ChkUnpause:
		tst.b	pauseFlag.w				; Is the game paused?
		bne.s	.Animate				; If so, branch
		clr.b	oSurfacePause(a0)			; Resume animation
		subq.b	#3,_objMappingFrame(a0)			; Use normal frames

.Animate:
		lea	.AniScript(pc),a1			; Get animation script
		moveq	#0,d1
		move.b	_objAnimmFrame(a0),d1			; Get animation script frame
		move.b	(a1,d1.w),_objMappingFrame(a0)			; Set mapping frame
		addq.b	#1,_objAnimmFrame(a0)			; Next frame in animation script
		andi.b	#$3F,_objAnimmFrame(a0)			; Loop in necessary
		jsr	DisplayObject.w				; Display the object

		runNextObj					; Run the next object
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
.AniScript:
		dc.b	0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1
		dc.b	1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2
		dc.b	2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1
		dc.b	1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Data
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Map_ObjWaterSplash:
		include	"Objects/Water Splash/Mappings.asm"
		even
; =========================================================================================================================================================