; =========================================================================================================================================================
; Water surface object
; =========================================================================================================================================================
		rsset	oLvlSSTs

; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjBumper:
		move.l	#ObjBumperMain,oAddr(a0)	; Next routine
		move.l	#Map_ObjBumper,oMap(a0)		; Mappings
		move.w	#$35B,oVRAM(a0)			; Tile properties
		move.b	#4,oRender(a0)			; Render flags
	displaySprite	1,a0,a1,0			; Priority
		moveq	#$10,d1
		move.b	d1,oDrawW(a0)
		move.b	d1,oColW(a0)
		move.b	d1,oDrawH(a0)
		move.b	d1,oColH(a0)
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjBumperMain:
		tst.b	rDebugMode.w
		bne.w	.Display

		lea	.RangeData(pc),a1		; Range data
		movea.w	rPlayer1Addr.w,a2		; Player object
		cmpi.b	#$C,oRoutine(a2)
		bcc.w	.Display
		jsr	CheckObjInRange.w		; Is the player in range?
		tst.w	d0				; ''
		beq.s	.Display			; If not, branch

		move.w	oXPos(a0),d1
		move.w	oYPos(a0),d2
		sub.w	oXPos(a2),d1
		sub.w	oYPos(a2),d2
		jsr	CalcArcTan.w
		move.b	(rFrameCnt+3).w,d1
		andi.w	#3,d1
		add.w	d1,d0
		jsr	CalcSine.w
		muls.w	#-$700,d1
		asr.l	#8,d1
		move.w	d1,oXVel(a2)
		muls.w	#-$700,d0
		asr.l	#8,d0
		move.w	d0,oYVel(a2)
		cmpi.b	#8,oRoutine(a2)
		bne.s	.NotHurt
		move.b	#2,oAni(a2)
		addq.w	#5,oYPos(a2)
		move.b	#$E,oColH(a2)
		move.b	#7,oColW(a2)
		bset	#2,oStatus(a2)

.NotHurt:
		move.b	#4,oRoutine(a2)
		bset	#1,oStatus(a2)
		bclr	#5,oStatus(a2)
		clr.b	oJumping(a2)
		move.b	#1,oAni(a0)
		playSnd	#sBumper, 2

.Display:
		lea	Ani_ObjBumper(pc),a1
		jsr	AnimateObject.w
		jsr	CheckObjActive.w		; Display
		jsr	AddToColResponse		; Allow collision
	nextObject
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
.RangeData:
		dc.w	-$18, $30
		dc.w	-$18, $30
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Data
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Map_ObjBumper:
		include	"Objects/Bumper/Mappings.asm"
		even
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Ani_ObjBumper:
		dc.w	.Ani0-Ani_ObjBumper
		dc.w	.Ani1-Ani_ObjBumper
.Ani0:		dc.b	5, 0, $FF, 0
.Ani1:		dc.b	5, 1, 2, 1, 2, $FD, 0
		even
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ArtKosM_Bumper:
		incbin	"Objects/Bumper/Art.kosm.bin"
		even
; =========================================================================================================================================================