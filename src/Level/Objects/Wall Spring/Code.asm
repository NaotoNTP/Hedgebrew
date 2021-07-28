; =========================================================================================================================================================
; Mighty The Armadillo in PRISM PARADISE
; By Nat The Porcupine 2021
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Wall spring object
; =========================================================================================================================================================
ObjWallSpring:
		move.l	#ObjWallSpring_Main,oAddr(a0)	; Next routine
	;	move.l	#Map_ObjWallSpring,oMap(a0)	; Mappings
	;	clr.w	oVRAM(a0)			; Tile properties
	;	ori.b	#4,oRender(a0)			; Render flags
	;	move.w	#rSprInput+$200,oPrio(a0)	; Priority
	;	move.b	#8,oDrawW(a0)			; Sprite width
	;	move.b	#$40,oDrawH(a0)			; Sprite height
		move.b	#8,oColW(a0)			; Collision width
		move.b	#$40,oColH(a0)			; Collision height

		move.b	oSubtype(a0),d0			; Get subtype
		lsr.b	#4,d0				; Get map frame
		andi.b	#7,d0				; ''
		move.b	d0,oFrame(a0)			; Set map frame
		beq.s	ObjWallSpring_Main		; If it was 0, branch
	;	move.b	#$80,oDrawH(a0)			; Larger sprite height
		move.b	#$80,oColH(a0)			; Larger collision height
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjWallSpring_Main:
		moveq	#8,d1				; Width
		moveq	#0,d2
		move.b	oColH(a0),d2			; Height
		move.w	d2,d3				; ''
		addq.w	#1,d3				; ''
		move.w	oXPos(a0),d4			; X position
		jsr	SolidObject_Always		; Make us solid

		btst	#cTouchSideBit,d6		; Has Sonic touched the side of the spring?
		beq.s	.Display			; If not, branch
		bset	#1,oStatus(a1)			; Set in air
		move.b	oStatus(a0),d1			; Get status
		move.w	oXPos(a0),d0			; Get distance between us and Sonic
		sub.w	oXPos(a1),d0			; ''
		bcs.s	.ChkXStat			; If Sonic is towards the right of the spring, branch
		eori.b	#1,d1				; Go the other way

.ChkXStat:
		andi.b	#1,d1				; Has Sonic touched the front of spring?
		bne.s	.Display			; If not, branch
		bsr.s	.Bounce

.Display:
		jsr	CheckObjActive.w		; Delete if inactive
	nextObject
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
.Bounce:
		cmpi.b	#$C,oRoutine(a1)			; Is Sonic dead?
		blo.s	.DoBounce			; If not, branch
		rts

.DoBounce:
		move.b	#4,oRoutine(a1)			; Make Sonic not hurt if he is
		move.w	#-$800,oXVel(a1)		; Bounce left
		move.w	#-$800,oYVel(a1)		; Bounce up
		bset	#0,oStatus(a1)			; Face left
		btst	#0,oStatus(a0)			; Are we facing left?
		bne.s	.MoveLock			; If so, branch
		bclr	#0,oStatus(a1)			; Face right
		neg.w	oXVel(a1)			; Go right

.MoveLock:
		move.b	#$F,oMoveLock(a1)		; Set move lock timer
		btst	#2,oStatus(a1)			; Was Sonic jumping?
		bne.s	.ChkNoYVel			; If so, branch
		clr.b	oAni(a1)			; Reset animation

.ChkNoYVel:
		move.b	oSubtype(a0),d0			; Get subtype
		bpl.s	.ChkFlip			; If Sonic should still bounce up, branch
		clr.b	oYVel(a1)			; Stop Y velocity

.ChkFlip:
		btst	#0,d0				; Should Sonic tumble?
		beq.s	.PlaySnd			; If not, branch
		move.w	#1,oFlipDir(a1)			; Set flip direction
		move.b	#1,oFlipAngle(a1)		; Set flip angle
		clr.b	oAni(a1)			; Reset animation
		move.b	#1,oFlipRemain(a1)		; Set flips remaining
		move.b	#8,oFlipSpeed(a1)		; Set flip speed
		btst	#1,d0				; Should Sonic do 3 flips?
		bne.s	.ChkDir				; If not, branch
		move.b	#3,oFlipRemain(a1)		; Do 3 flips isntead

.ChkDir:
		btst	#0,oStatus(a1)			; Was Sonic facing left?
		beq.s	.PlaySnd			; If not, branch
		neg.b	oFlipAngle(a1)			; Flip the other way
		neg.w	oFlipDir(a1)			; ''

.PlaySnd:
		bclr	#cPushBit,oStatus(a0)		; Stop pushing
		bclr	#cPushBit,oStatus(a1)		; ''
		playSnd	#sSpring, 2			; Play spring sound
		rts
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Data
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Map_ObjWallSpring:
		include	"Level/Objects/Wall Spring/Mappings.asm"
		even
; =========================================================================================================================================================