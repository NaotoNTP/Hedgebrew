; ===========================================================================
; Spike object
; ===========================================================================
		rsset	oLvlSSTs
oSpikeX		rs.w	1
oSpikeY		rs.w	1
oSpkMvOff	rs.w	1
oSpkMvState	rs.w	1
oSpkMvTime	rs.w	1
; ===========================================================================
ObjSpike:
		moveq	#0,d0
		move.b	oRoutine(a0),d0
		jsr	ObjSpike_Index(pc,d0.w)
	nextObject
; ===========================================================================
ObjSpike_Index:
		bra.w ObjSpike_Init
		bra.w ObjSpike_Upright
		bra.w ObjSpike_Sideways
		bra.w ObjSpike_UpsideDown
; ===========================================================================
;ObjSpike_InitData:
;		dc.b $10,$10	; 0	- Upright or ceiling spikes
;		dc.b $10,$10	; 2	- Sideways spikes
; ===========================================================================
ObjSpike_Init:
		addq.b	#4,oRoutine(a0)
		move.l	#Map_ObjSpike,oMap(a0)
		move.w	#$6A8,oVRAM(a0)
		ori.b	#4,oRender(a0)
	displaySprite	4,a0,a1,0			; Priority
		move.b	oSubtype(a0),d0
		andi.b	#$F,oSubtype(a0)
		andi.w	#$F0,d0
		moveq	#$10,d1
		move.b	d1,oDrawW(a0)
		move.b	d1,oColW(a0)
		move.b	d1,oDrawH(a0)
		move.b	d1,oColH(a0)
		lsr.w	#4,d0
		move.b	d0,oFrame(a0)
		cmpi.b	#1,d0
		bne.s	.ChkUpsideDown
		addq.b	#4,oRoutine(a0)
		move.w	#$6AC,oVRAM(a0)

.ChkUpsideDown:
		btst	#1,oStatus(a0)
		beq.s	.SavePos
		move.b	#$C,oRoutine(a0)

.SavePos:
		move.w	oXPos(a0),oSpikeX(a0)
		move.w	oYPos(a0),oSpikeY(a0)

		bsr.w	MoveSpikes		; make the object move
		cmpi.b	#1,oFrame(a0)		; is object type $1x ?
		beq.s	ObjSpike_SideWays	; if yes, branch
; ===========================================================================
; Upright spikes
; ===========================================================================
ObjSpike_Upright:
		bsr.w	MoveSpikes
		moveq	#0,d1
		move.b	oDrawW(a0),d1
		addi.w	#$B,d1
		moveq	#0,d2
		move.b	oDrawH(a0),d2
		move.w	d2,d3
		addq.w	#1,d3
		move.w	oXPos(a0),d4
		jsr	SolidObject
		btst	#cStandBit,oStatus(a0)
		beq.s	ObjSpike_UprightEnd
		movea.w	rPlayer1Addr.w,a1
		bsr.w	Touch_ChkHurt2

ObjSpike_UprightEnd:
		move.w	oSpikeX(a0),d0
		jmp	CheckObjActive.w
; ===========================================================================
; Sideways spikes
; ===========================================================================
ObjSpike_Sideways:
		move.w	oXPos(a0),-(sp)	
		bsr.w	MoveSpikes
		moveq	#0,d1
		move.b	oDrawW(a0),d1
		addi.w	#$B,d1
		moveq	#0,d2
		move.b	oDrawH(a0),d2
		move.w	d2,d3
		addq.w	#1,d3
		move.w	(sp)+,d4
		jsr	SolidObject
		btst	#cTouchSideBit,d6
		beq.s	ObjSpike_SidewaysEnd
		movea.w	rPlayer1Addr.w,a1
		bsr.w	Touch_ChkHurt2

ObjSpike_SidewaysEnd:
		move.w	oSpikeX(a0),d0
		jmp	CheckObjActive.w
; ===========================================================================
; Upside down spikes
; ===========================================================================
ObjSpike_UpsideDown:
		bsr.w	MoveSpikes
		moveq	#0,d1
		move.b	oDrawW(a0),d1
		addi.w	#$B,d1
		moveq	#0,d2
		move.b	oDrawH(a0),d2
		move.w	d2,d3
		addq.w	#1,d3
		move.w	oXPos(a0),d4
		jsr	SolidObject
		btst	#cTouchBtmBit,d6
		beq.s	ObjSpike_UpsideDownEnd
		movea.w	rPlayer1Addr.w,a1
		bsr.w	Touch_ChkHurt2

ObjSpike_UpsideDownEnd:
		move.w	oSpikeX(a0),d0
		jmp	CheckObjActive.w
; ===========================================================================
Touch_ChkHurt2:
		tst.b	oInvulTime(a1)			; is Sonic invincible?
		bne.s	.End				; if yes, branch
		cmpi.b	#8,oRoutine(a1)
		beq.s	.End
		move.l	oYPos(a1),d3
		move.w	oYVel(a1),d0
		ext.l	d0
		asl.l	#8,d0
		sub.l	d0,d3
		move.l	d3,oYPos(a1)
		movea.l	a0,a2
		movea.l	a1,a0
		jsr	ObjPlayer_GetHurt
		movea.l	a2,a0

.End:
		rts
; ===========================================================================
MoveSpikes:	
		moveq	#0,d0
		move.b	oSubtype(a0),d0
		add.w	d0,d0
		jmp	MoveSpikes_Behaviors(pc,d0.w)
; ===========================================================================
MoveSpikes_Behaviors:
		bra.s MoveSpikes_Still
		bra.s MoveSpikes_Vertical
		bra.s MoveSpikes_Horizontal
; ===========================================================================
MoveSpikes_Still:
		rts			; don't move the object
; ===========================================================================
MoveSpikes_Vertical:
		bsr.w	MoveSpikes_Delay
		moveq	#0,d0
		move.b	oSpkMvOff(a0),d0
		add.w	oSpikeY(a0),d0
		move.w	d0,oYPos(a0)	; move the object vertically
		rts
; ===========================================================================
MoveSpikes_Horizontal:
		bsr.w	MoveSpikes_Delay
		moveq	#0,d0
		move.b	oSpkMvOff(a0),d0
		add.w	oSpikeX(a0),d0
		move.w	d0,oXPos(a0)	; move the object horizontally
		rts
; ===========================================================================
MoveSpikes_Delay:
		tst.w	oSpkMvTime(a0)		; is time delay	= zero?
		beq.s	MoveSpikes_ChkDir		; if yes, branch
		subq.w	#1,oSpkMvTime(a0)	; subtract 1 from time delay
		bne.s	locret_CFE6
		tst.b	oRender(a0)
		bpl.s	locret_CFE6
		playSnd	#sSpikeMove, 2		; Play spike move sound
		bra.s	locret_CFE6
; ===========================================================================
MoveSpikes_ChkDir:
		tst.w	oSpkMvState(a0)
		beq.s	MoveSpikes_Retract
		subi.w	#$800,oSpkMvOff(a0)
		bcc.s	locret_CFE6
		move.w	#0,oSpkMvOff(a0)
		move.w	#0,oSpkMvState(a0)
		move.w	#60,oSpkMvTime(a0)	; set time delay to 1 second
		bra.s	locret_CFE6
; ===========================================================================
MoveSpikes_Retract:
		addi.w	#$800,oSpkMvOff(a0)
		cmpi.w	#$2000,oSpkMvOff(a0)
		bcs.s	locret_CFE6
		move.w	#$2000,oSpkMvOff(a0)
		move.w	#1,oSpkMvState(a0)
		move.w	#60,oSpkMvTime(a0)	; set time delay to 1 second

locret_CFE6:
		rts
; ===========================================================================
; Spike object mappings
; ===========================================================================
Map_ObjSpike:
	include "Objects/Spikes/Mappings.asm"
; ===========================================================================