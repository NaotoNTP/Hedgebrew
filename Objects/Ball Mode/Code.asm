; =========================================================================================================================================================
; Ball mode enable/disable object
; =========================================================================================================================================================
		rsset	_objLvlSSTs
_objBModeTouch	rs.b	1				; Touched flag
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjBallMode:
	;	move.l	#ObjBallMode_Main,_objAddress(a0)	; Next routine
	;	move.l	#Map_ObjMonitor,_objMapping(a0)	; Mappings
	;	clr.w	_objVRAM(a0)			; Tile properties
	;	ori.b	#4,_objRender(a0)			; Render flags
	;	move.w	#rSprInput+$280,oPrio(a0)	; Priority
	;	move.b	#$10,_objDrawW(a0)			; Sprite width
	;	move.b	#$10,_objDrawH(a0)			; Sprite height
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjBallMode_Main:
		lea	.RangeData(pc),a1		; Range data
		movea.w	playerPtrP1.w,a2		; Player object
		jsr	CheckObjInRange.w		; Is the player in range?
		tst.w	d0				; ''
		beq.s	.NotTouched			; If not, branch

		bclr	#2,_objFlags(a2)
		
		tst.b	_objSubtype(a0)			; Should we force Sonic out of ball mode?
		bmi.s	.NoBallMode			; If so, branch
		bne.s	.BallMode			; Branch if we should force Sonic in to ball mode

		tst.b	_objBModeTouch(a0)		; Have we already been touched?
		bne.s	.End				; If so, branch
		st	_objBModeTouch(a0)		; Touched

		not.b	_objBallMode(a2)		; Switch ball mode for Sonic
		beq.s	.End				; If it's not set, branch

.MakeSonicRoll:
		movea.l	a0,a1				; Save a0
		movea.l	a2,a0				; Make Sonic roll
		jsr	ObjPlayer_DoRoll		; ''
		movea.l	a1,a0				; Restore a0
	nextObject

.NotTouched:
		clr.b	_objBModeTouch(a0)		; Not touched
	nextObject

.BallMode:
		st	_objBallMode(a2)		; Get in to ball mode
		bra.s	.MakeSonicRoll			; ''

.NoBallMode:
		clr.b	_objBallMode(a2)		; Get out of ball mode

.End:
	nextObject
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
.RangeData:
		dc.w	-$10, $20
		dc.w	-$10, $20
; =========================================================================================================================================================