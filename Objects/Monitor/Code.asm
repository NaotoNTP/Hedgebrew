; =========================================================================================================================================================
; Monitor object
; =========================================================================================================================================================
		rsset	oLvlSSTs
oMonFall	rs.b	1				; Fall flag
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjMonitor:
		move.l	#ObjMonitorMain,oAddr(a0)
		move.b	#$E,oColH(a0)
		move.b	#$E,oColW(a0)
		move.l	#Map_ObjMonitor,oMap(a0)
		move.w	#$588,oVRAM(a0)
		move.b	#4,oRender(a0)
	displaySprite	3,a0,a1,0			; Priority
		move.b	#$F,oDrawW(a0)
		move.b	#$F,oDrawH(a0)
		move.w	oRespawn(a0),d0
		beq.s	ObjMonitorNotBroken
		movea.w	d0,a2
		btst	#0,(a2)				; has monitor been broken?
		beq.s	ObjMonitorNotBroken		; if not, branch
		move.b	#7,oFrame(a0)		; use broken monitor frame
		move.l	#ObjMonitorCheckActive,oAddr(a0)
	nextObject
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjMonitorNotBroken:
		move.b	#6,oColType(a0)
		move.b	oSubtype(a0),oAni(a0)

ObjMonitorMain:
		bsr.s	ObjMonitorFall
		move.w	#$19,d1
		move.w	#$10,d2
		move.w	d2,d3
		move.w	oXPos(a0),d4
		movea.w	rPlayer1Addr.w,a1
		bsr.s	SolidObject_Monitor

		move.w	rMaxCamY.w,d0
		addi.w	#$E0,d0
		cmp.w	oYPos(a0),d0
		blt.s	ObjMonitorDelete

		jsr	AddToColResponse
		lea	Ani_ObjMonitor(pc),a1
		jsr	AnimateObject.w
		jsr	CheckObjActive.w
	nextObject

ObjMonitorDelete:
		jsr	DeleteObject.w
	nextObject
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjMonitorAnimate:
		cmpi.b	#7,oFrame(a0)
		bcs.s	.NotBroken
		move.l	#ObjMonitorCheckActive,oAddr(a0)

.NotBroken:
		lea	Ani_ObjMonitor(pc),a1
		jsr	AnimateObject.w
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjMonitorCheckActive:
		jsr	CheckObjActive.w
	nextObject
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjMonitorFall:
		move.b	oMonFall(a0),d0
		beq.s	.End
		jsr	ObjectMoveAndFall.w
		tst.w	oYVel(a0)
		bmi.s	.End
		jsr	ObjCheckFloorDist
		tst.w	d1
		beq.s	.InGround
		bpl.s	.End

.InGround:
		add.w	d1,oYPos(a0)
		clr.w	oYVel(a0)
		clr.b	oMonFall(a0)

.End:
		rts
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
SolidObject_Monitor:
		btst	#cStandBit,oStatus(a0)
		bne.s	ObjMonitorChkOverEdge
		cmpi.b	#2,oAni(a1)
		beq.s	.End
		cmpi.b	#$17,oAni(a1)		; check if in drowning animation
		bne.s	.SetSolid

.End:
		rts

.SetSolid:
		jmp	SolidObject_ChkCollision

ObjMonitorChkOverEdge:
		move.w	d1,d2
		add.w	d2,d2
		btst	#1,oStatus(a1)
		bne.s	.NotOnMonitor
		move.w	oXPos(a1),d0
		sub.w	oXPos(a0),d0
		add.w	d1,d0
		bmi.s	.NotOnMonitor
		cmp.w	d2,d0
		blo.s	ObjMonitorCharStandOn

.NotOnMonitor:
		bclr	#cStandBit,oStatus(a1)
		bset	#1,oStatus(a1)
		bclr	#cStandBit,oStatus(a0)
		moveq	#0,d4
		rts
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjMonitorCharStandOn:
		move.w	d4,d2
		jsr	PlayerMoveOnPtfm
		moveq	#0,d4
		rts
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjMonitorBreakOpen:
		playSnd	#sBreakItem, 2			; Play destroy sound
		
		move.b	oStatus(a0),d0
		andi.b	#cStand|cPush,d0
		beq.s	ObjMonitorSpawnIcon
		movea.w	rPlayer1Addr.w,a1
		andi.b	#$D7,oStatus(a1)
		ori.b	#2,oStatus(a1)

ObjMonitorSpawnIcon:
		clr.b	oStatus(a0)
		move.b	#0,oColType(a0)
		jsr	FindFreeObj.w
		beq.s	.SkipIconCreation
		move.l	#ObjMonitorContents,oAddr(a1)		; load monitor contents	object
		move.w	oXPos(a0),oXPos(a1)
		move.w	oYPos(a0),oYPos(a1)
		move.b	oAni(a0),oAni(a1)
		move.b	oRender(a0),oRender(a1)
		move.b	oStatus(a0),oStatus(a1)

.SkipIconCreation:
		jsr	FindFreeObj.w
		beq.s	.SkipExplosionCreation
		move.l	#ObjExplosion,oAddr(a1)			; load explosion object
		move.w	oXPos(a0),oXPos(a1)
		move.w	oYPos(a0),oYPos(a1)

.SkipExplosionCreation:
		move.w	oRespawn(a0),d0
		beq.s	.NotRemembered
		movea.w	d0,a2
		bset	#0,(a2)

.NotRemembered:
		move.b	#6,oAni(a0)
		move.l	#ObjMonitorAnimate,oAddr(a0)
	nextObject
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Contents of monitor object
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjMonitorContents:
		moveq	#0,d0
		move.b	oRoutine(a0),d0
		jsr	ObjMonitorContents_Index(pc,d0.w)
	nextObject
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjMonitorContents_Index:
		bra.s	ObjMonitorContents_Main
		bra.s	ObjMonitorContents_Move
		bra.w	ObjMonitorContents_Delete
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjMonitorContents_Main:
		addq.b	#2,oRoutine(a0)
		move.w	#$8588,oVRAM(a0)
		move.b	#$24,oRender(a0)
	displaySprite	3,a0,a1,0			; Priority
		move.b	#8,oDrawW(a0)
		move.b	#8,oDrawH(a0)
		move.w	#-$300,oYVel(a0)
		moveq	#0,d0
		move.b	oAni(a0),d0
		addq.b	#1,d0
		movea.l	#Map_ObjMonitor,a1
		add.b	d0,d0
		adda.w	(a1,d0.w),a1
		addq.w	#2,a1
		move.l	a1,oMap(a0)

		move.b	oAni(a0),d0
		addq.b	#1,d0
		move.b	d0,oFrame(a0)

ObjMonitorContents_Move:
		tst.w	oYVel(a0)			; is object moving?
		bpl.w	ObjMonitorContents_GetType	; if not, branch
		jsr	ObjectMove.w
		addi.w	#$18,oYVel(a0)			; reduce object	speed
		rts
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjMonitorContents_GetType:
		addq.b	#2,oRoutine(a0)
		move.b	#29,oAniTimer(a0)
		move.b	oAni(a0),d0
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
		cmpi.b	#1,d0
		bne.s	.ChkRings
		push.l	a0
		movea.l	a0,a2
		movea.w	rPlayer1Addr.w,a0
		jsr	ObjPlayer_GetHurt
		pop.l	a0
		rts
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
.ChkRings:
		cmpi.b	#2,d0
		bne.s	.Display
		addi.w	#10,rRings.w 				; add 10 rings to the number of rings you have
		ori.b	#1,rUpdateRings.w 			; update the ring counter
		playSnd	#sRing, 2				; Play ring sound

.Display:
		rts
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjMonitorContents_Delete:
		subq.b	#1,oAniTimer(a0)
		bpl.s	.NoDelete
		jmp	DeleteObject.w

.NoDelete:
		rts
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Data
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Map_ObjMonitor:
		include	"Objects/Monitor/Mappings.asm"
Ani_ObjMonitor:
		include	"Objects/Monitor/Animations.asm"
; =========================================================================================================================================================