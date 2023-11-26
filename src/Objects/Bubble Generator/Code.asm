; =========================================================================================================================================================
; Bubble generator object
; =========================================================================================================================================================
		rsset	oLvlSSTs
oBubOrgX	rs.w	1
oBubInhale	rs.b	1
oBubAng		rs.b	1
oBubTime	rs.b	1
oBubFreq	rs.b	1
oBubTypeInd	rs.w	1
oBub_Unk36	rs.w	1
oBub_Unk38	rs.w	1
oBubTypeAddr	rs.l	1
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjBubbles:
		moveq	#0,d0
		move.b	oRoutine(a0),d0			; Get routine ID
		move.w	.Index(pc,d0.w),d0		; Get routine pointer
		jmp	.Index(pc,d0.w)			; Jump to it
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
.Index:
		dc.w	ObjBubbles_Init-.Index
		dc.w	ObjBubbles_Main-.Index
		dc.w	ObjBubbles_ChkWater-.Index
		dc.w	ObjBubbles_Display-.Index
		dc.w	ObjBubbles_Delete-.Index
		dc.w	ObjBubbles_Maker-.Index
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjBubbles_Init:
		addq.b	#2,oRoutine(a0)			; Next routine
		move.l	#Map_ObjBubbles,oMap(a0)	; Mappings
		move.w	#$8319,oVRAM(a0)		; Tile properties
		move.b	#$84,oRender(a0)		; Render flags
		move.w	#rSprInput+$80,oPrio(a0)	; Priority
		move.b	#$10,oDrawW(a0)			; Sprite width
		move.b	#$10,oDrawH(a0)			; Sprite height
		move.b	oSubtype(a0),d0
		bpl.s	.Bubble

		addq.b	#8,oRoutine(a0)
		andi.w	#$7F,d0
		move.b	d0,oBubTime(a0)
		move.b	d0,oBubFreq(a0)
		move.b	#6,oAni(a0)
		bra.w	ObjBubbles_Maker

.Bubble:
		move.b	d0,oAni(a0)
		move.w	oXPos(a0),oBubOrgX(a0)
		move.w	#-$88,oYVel(a0)
		jsr	RandomNumber.w
		move.b	d0,oBubAng(a0)
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjBubbles_Main:
		lea	Ani_ObjBubbles,a1
		jsr	AnimateObject.w
		cmpi.b	#6,oFrame(a0)
		bne.s	ObjBubbles_ChkWater
		st	oBubInhale(a0)
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjBubbles_ChkWater:
		move.w	rWaterLvl.w,d0		; Get water level
		cmp.w	oYPos(a0),d0			; Have we gone beyond it?
		bcs.s	.Wobble				; If not, branch
		move.b	#6,oRoutine(a0)			; Next routine
		addq.b	#3,oAni(a0)			; Next animation
		bra.w	ObjBubbles_Display		; Continue

.Wobble:
		move.b	oBubAng(a0),d0
		addq.b	#1,oBubAng(a0)
		andi.w	#$7F,d0
		lea	ObjDrownCnt_WobbleData,a1
		move.b	(a1,d0.w),d0
		ext.w	d0
		add.w	oBubOrgX(a0),d0
		move.w	d0,oXPos(a0)
		tst.b	oBubInhale(a0)
		beq.s	.Display
		bsr.w	ObjBubbles_ChkSonic
		cmpi.b	#6,oRoutine(a0)
		beq.s	ObjBubbles_Display

.Display:
		jsr	ObjectMove.w
		tst.b	oRender(a0)
		bpl.s	ObjBubbles_Delete
		jmp	DisplayObject.w

ObjBubbles_Delete:
		jmp	DeleteObject.w
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjBubbles_Display:
		lea	Ani_ObjBubbles,a1
		jsr	AnimateObject.w
		tst.b	oRender(a0)
		bpl.s	ObjBubbles_Delete
		jmp	DisplayObject.w
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjBubbles_Maker:
		tst.w	oBub_Unk36(a0)
		bne.s	.loc_12874
		move.w	rWaterLvl.w,d0		; Get water level
		cmp.w	oYPos(a0),d0			; Have we gone beyond it?
		bcc.w	.ChkDel				; If so, branch
		tst.b	oRender(a0)
		bpl.w	.ChkDel
		subq.w	#1,oBub_Unk38(a0)
		bpl.w	.loc_12914
		move.w	#1,oBub_Unk36(a0)

.TryAgain:
		jsr	RandomNumber.w
		move.w	d0,d1
		andi.w	#7,d0
		cmpi.w	#6,d0
		bcc.s	.TryAgain

		move.b	d0,oBubTypeInd(a0)
		andi.w	#$C,d1
		lea	.BubTypes(pc),a1
		adda.w	d1,a1
		move.l	a1,oBubTypeAddr(a0)
		subq.b	#1,oBubTime(a0)
		bpl.s	.loc_12872
		move.b	oBubFreq(a0),oBubTime(a0)
		bset	#7,oBub_Unk36(a0)

.loc_12872:
		bra.s	.loc_1287C

.loc_12874:
		subq.w	#1,oBub_Unk38(a0)
		bpl.w	.loc_12914

.loc_1287C:
		jsr	RandomNumber.w
		andi.w	#$1F,d0
		move.w	d0,oBub_Unk38(a0)
		jsr	FindFreeObj.w
		bne.s	.Fail
		move.l	oAddr(a0),oAddr(a1)
		move.w	oXPos(a0),oXPos(a1)
		jsr	RandomNumber.w
		andi.w	#$F,d0
		subq.w	#8,d0
		add.w	d0,oXPos(a1)
		move.w	oYPos(a0),oYPos(a1)
		moveq	#0,d0
		move.b	oBubTypeInd(a0),d0
		movea.l	oBubTypeAddr(a0),a2
		move.b	(a2,d0.w),oSubtype(a1)
		btst	#7,oBub_Unk36(a0)
		beq.s	.Fail
		jsr	RandomNumber.w
		andi.w	#3,d0
		bne.s	.loc_buh
		bset	#6,oBub_Unk36(a0)
		bne.s	.Fail
		move.b	#2,oSubtype(a1)

.loc_buh:
		tst.b	oBubTypeInd(a0)
		bne.s	.Fail
		bset	#6,oBub_Unk36(a0)
		bne.s	.Fail
		move.b	#2,oSubtype(a1)

.Fail:
		subq.b	#1,oBubTypeInd(a0)
		bpl.s	.loc_12914
		jsr	RandomNumber.w
		andi.w	#$7F,d0
		addi.w	#$80,d0
		add.w	d0,oBub_Unk38(a0)
		clr.w	oBub_Unk36(a0)

.loc_12914:
		lea	Ani_ObjBubbles,a1
		jsr	AnimateObject.w

.ChkDel:
		move.w	oXPos(a0),d0
		andi.w	#$FF80,d0
		sub.w	rObjXCoarse.w,d0
		cmpi.w	#$280,d0
		bhi.s	.Delete
		move.w	rWaterLvl.w,d0
		cmp.w	oYPos(a0),d0
		blo.s	.Display
		rts

.Display:
		jmp	DisplayObject.w

.Delete:
		move.w	oRespawn(a0),d0			; Get respawn table entry address
		beq.s	.DoDelete			; If 0, branch
		movea.w	d0,a2
		bclr	#7,(a2)				; Mark as gone

.DoDelete:
		jmp	DeleteObject.w
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
.BubTypes:
		dc.b	0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0
		even
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjBubbles_ChkSonic:
		lea	rObj_Player.w,a1
		
		tst.b	rDebugMode.w
		bne.w	.End
		btst	#0,oFlags(a1)
		bne.w	.End
		
		move.w	oXPos(a1),d0
		move.w	oXPos(a0),d1
		subi.w	#$10,d1
		cmp.w	d0,d1
		bcc.s	.End
		addi.w	#$20,d1
		cmp.w	d0,d1
		bcs.s	.End
		move.w	oYPos(a1),d0
		move.w	oYPos(a0),d1
		cmp.w	d0,d1
		bcc.s	.End
		addi.w	#$10,d1
		cmp.w	d0,d1
		bcs.s	.End

		jsr	ObjDrown_ResetDrown
		playSnd	#sBubble, 2
		clr.l	oXVel(a1)
		clr.w	oGVel(a1)
		move.b	#$15,oAni(a1)
		move.b	#$23,oMoveLock(a1)
		clr.b	oJumping(a1)
		bclr	#5,oStatus(a1)
		btst	#2,oStatus(a1)
		beq.s	.Burst
		bclr	#2,oStatus(a1)
		move.b	oInitColH(a1),oColH(a1)		; Reset collision height
		move.b	oInitColW(a1),oColW(a1)		; Reset collision width
		subq.w	#5,oYPos(a1)			; Align Sonic with the ground

.Burst:
		cmpi.b	#6,oRoutine(a0)
		beq.s	.End
		move.b	#6,oRoutine(a0)
		addq.b	#3,oAni(a0)

.End:
		rts
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Data
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Map_ObjBubbles:
		include	"Objects/Bubble Generator/Mappings.asm"
		even
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Ani_ObjBubbles:
		dc.w	.Small-Ani_ObjBubbles
		dc.w	.Medium-Ani_ObjBubbles
		dc.w	.Large-Ani_ObjBubbles
		dc.w	.IncRoutine-Ani_ObjBubbles
		dc.w	.IncRoutine-Ani_ObjBubbles
		dc.w	.Burst-Ani_ObjBubbles
		dc.w	.BubMaker-Ani_ObjBubbles
.Small:		dc.b	$A, 0, 1, 2, $FC, 0
.Medium:	dc.b	$A, 1, 2, 3, 4, $FC
.Large:		dc.b	$A, 2, 3, 4, 5, 6, $FC, 0
.IncRoutine:	dc.b	4, $FC
.Burst:		dc.b	4, 6, 7, 8, $FC, 0
.BubMaker:	dc.b	$F, $13, $14, $15, $FF
		even
; =========================================================================================================================================================