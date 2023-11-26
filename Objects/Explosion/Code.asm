; =========================================================================================================================================================
; Explosion object
; =========================================================================================================================================================
EXPLODE_ANI	EQU	3
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjBossExplode:
		playSnd	#sBomb, 2			; Play explosion sound
		bra.s	ObjExplosion_Init		; Continue
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjExplosion:
		playSnd	#sBreakItem, 2			; Play explosion sound

ObjExplosion_Init:
		move.l	#ObjExplosion_Main,oAddr(a0)	; Next routine
		move.b	#4,oRender(a0)			; Render flags
		move.w	#$86C0,oVRAM(a0)		; Tile properties
		move.l	#Map_ObjExplosion,oMap(a0)	; Mappings
	displaySprite	1,a0,a1,0			; Priority
		move.b	#$C,oDrawW(a0)			; Sprite width
		move.b	#$C,oDrawH(a0)			; Sprite height
		move.b	#EXPLODE_ANI,oAniTimer(a0)	; Animation timer
		clr.b	oFrame(a0)			; Mapping frame
		
ObjExplosion_Main:
		subq.b	#1,oAniTimer(a0)		; Decrement animation timer
		bpl.s	.Display			; If it hasn't run out, branch
		move.b	#EXPLODE_ANI,oAniTimer(a0)	; Reset animation timer
		addq.b	#1,oFrame(a0)			; Next frame
		cmpi.b	#5,oFrame(a0)			; Has it reached the last frame?
		bne.s	.Display			; If not, branch
		jsr	DeleteObject.w
		
.Display:
	nextObject
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Data
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Map_ObjExplosion:
		include	"Objects/Explosion/Mappings.asm"
		even
; =========================================================================================================================================================