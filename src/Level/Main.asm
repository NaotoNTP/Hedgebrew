; =========================================================================================================================================================
; Mighty The Armadillo in PRISM PARADISE
; By Nat The Porcupine 2021
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Level
; =========================================================================================================================================================
Level:
		playSnd	#Mus_FadeOut, 1			; Fade out sound

		jsr	FadeToBlack			; Fade to black

Level_NoFade:
		; --- Set up the VDP ---

		intsOff					; Disable interrupts
		displayOff				; Disable display

		lea	VDP_CTRL,a5			; VDP control port
		move.w	#$8004,(a5)			; Disable H-INT
		move.w	#$8230,(a5)			; Plane A at $C000
		move.w	#$8407,(a5)			; Plane B at $E000
		move.w	#$8720,(a5)			; Set background color to palette line 2, entry 0
		move.w	#$8B03,(a5)			; V-Scroll by screen, H-Scroll by scanline
		move.w	#$9001,(a5)			; 64x32 cell plane area
		move.w	#$9200,d0			; Make the window invisible
		move.w	d0,rWindowY.w			; ''
		move.w	d0,(a5)				; ''
		clr.w	rDMAQueue.w			; Set stop token at the beginning of the DMA queue
		move.w	#rDMAQueue,rDMASlot.w	; Reset the DMA queue slot

		jsr	ClearScreen.w			; Clear the screen

		; --- Clear some RAM ---

		clrRAM	rKosPVars			; Clear Kosinski queue variables
		clrRAM	rGameVars			; Clear variables
		clrRAM	rOscNums			; Clear oscillation data

		; --- Do some final initializing and play the level music ---

		move.b	#3,rRingAniTime.w		; Set ring animation timer
		move.w	#30,rFloorTimer.w		; Set floor timer
		clr.w	rPalCycTimer.w		; Reset palette cycle

		lea	Level_MusicIDs(pc),a0		; Music ID list
		move.w	rLevel.w,d0			; Get level ID
		ror.b	#1,d0				; Turn into offset
		lsr.w	#7,d0				; ''
		move.b	(a0,d0.w),d0			; Get music ID
		move.b	d0,rLevelMusic.w		; Store it
		playSnd	d0, 1				; Play it

		intsOn					; Enable interrupts

		; --- Load level data ---

		lea	PLC_LevelMain,a3		; Load main level PLCs
		jsr	LoadKosMQueue.w			; ''

		jsr	InitObjectList.w

		jsr	FindFreeObj.w
		move.l	#ObjMighty,oAddr(a1)		; Load Mighty object
		move.w	a1,rPlayer1Addr.w		; Store the address

		tst.b	rWaterFlag.w			; Does the level have water?
		beq.s	.NoSurface			; If not, branch

							; Load water surfaces
		jsr	FindFreeObj.w
		move.l	#ObjWaterSurface,oAddr(a1)
		move.w	#$60,oXPos(a1)
		move.w	a1,rWater1Addr.w		; Store the address

		jsr	FindFreeObj.w
		move.l	#ObjWaterSurface,oAddr(a1)
		move.w	#$120,oXPos(a1)
		move.w	a1,rWater2Addr.w		; Store the address

.NoSurface:
		bsr.w	Level_LoadData			; Load level data

.WaitPLCs:
		move.b	#vGeneral,rVINTRout.w		; Level load V-INT routine
		jsr	ProcessKos.w			; Process Kosinski queue
		jsr	VSync_Routine.w			; V-SYNC
		jsr	ProcessKosM.w			; Process Kosinski Moduled queue
		tst.b	rKosPMMods.w			; Are there still modules left?
		bne.s	.WaitPLCs			; If so, branch

		clr.b	rWaterFlag.w			; Clear the water flag

		lea	Level_WaterLevels(pc),a0	; Water heights
		move.w	rLevel.w,d0			; Get level ID
		ror.b	#1,d0				; Turn into offset
		lsr.w	#6,d0				; ''
		move.w	(a0,d0.w),d0			; Get water height
		bmi.s	.NoWater			; If it's negative, branch
		move.w	d0,rWaterLvl.w		; Set the water height
		move.w	d0,rDestWtrLvl.w

		st	rWaterFlag.w			; Set the water flag
		move.w	#$8014,VDP_CTRL			; Enable H-INT
		bsr.w	Level_WaterHeight		; Update water height
		move.w	rHIntReg.w,VDP_CTRL		; Set H-INT counter

.NoWater:
		move.w	#320/2,rCamXPosCenter.w		; Set camera X center

		jsr	InitOscillation.w		; Initialize oscillation

		bsr.w	Level_HandleCamera		; Initialize the camera
		bsr.w	Level_InitHUD			; Initialize the HUD
		bsr.w	Level_WaterHeight		; Initialize water height

		bsr.w	Level_AnimateArt		; Animate level art

		; --- Load the planes ---

		intsOff					; Disable interrupts
		move.l	#VInt_RunSMPS,rVIntAddr.w	; Swap V-INT
		intsOn					; Enable interrupts
		bsr.w	Level_InitPlanes		; Initialize the planes
		intsOff					; Disable interrupts
		move.l	#VInt_Standard,rVIntAddr.w	; Swap V-INT
		intsOn					; Enable interrupts
		move.b	#vLvlLoad,rVINTRout.w		; Level load V-INT routine
		jsr	VSync_Routine.w			; V-SYNC

		; --- Load the level objects and rings ---

		sf	rObjManInit.w			; Reset object manager routine
		bsr.w	Level_RingsManager		; Initialize the ring manager
		jsr	ObjectManager.w			; Run the object manager
	runObjects
		jsr	RenderObjects.w			; Render objects

		clr.b	rLvlReload.w			; Clear the level reload flag

		displayOn				; Enable display
		jsr	FadeFromBlack.w			; Fade from black
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Main loop
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
.Loop:
		move.b	#vLevel,rVINTRout.w		; Level V-INT routine
		jsr	ProcessKos.w			; Process Kosinski queue
		jsr	VSync_Routine.w			; V-SYNC

		jsr	CheckPause.w			; Check for pausing
		addq.w	#1,rLvlFrames.w			; Increment frame counter

		jsr	UpdateOscillation.w		; Update oscillation

		bsr.w	Level_RingsManager		; Run the ring manager
		jsr	ObjectManager.w			; Run the object manager

	runObjects

		tst.b	rLvlReload.w			; Does the level need to be reloaded?
		bne.w	Level				; If so, branch

		bsr.w	Level_HandleCamera		; Handle the camera
		bsr.w	Level_UpdatePlanes		; Update the planes (draw new tiles and scroll)
		bsr.w	Level_UpdateWaterSurface	; Update the water surface

		jsr	RenderObjects.w			; Render objects

		bsr.w	Level_WaterHeight		; Update water height
		bsr.w	Level_AnimateArt		; Animate level art
		bsr.w	Level_PalCycle			; Do palette cycling
		bsr.w	Level_DynEvents			; Run dynamic events

		subq.b	#1,rRingAniTime.w		; Decrement ring animation timer
		bpl.s	.NoRingAni			; If it hasn't run out, branch
		move.b	#3,rRingAniTime.w		; Reset animation timer
		addq.b	#1,rRingFrame.w			; Next ring frame
		andi.b	#7,rRingFrame.w			; Limit it

		moveq	#0,d0
		move.b	rRingFrame.w,d0			; Get ring frame
		lsl.w	#7,d0				; Convert to offset
		move.l	#ArtUnc_Ring,d1			; Source address
		add.l	d0,d1				; ''
		move.w	#$D780,d2			; VRAM address
		move.w	#$80/2,d3			; Size
		jsr	QueueDMATransfer.w		; Queue a transfer

.NoRingAni:
		tst.b	rRLossAniT.w
		beq.s	.NoRingLossAni
		moveq	#0,d0
		move.b	rRLossAniT.w,d0
		add.w	rRLossAniA.w,d0
		move.w	d0,rRLossAniA.w
		rol.w	#8,d0
		andi.w	#7,d0
		move.b	d0,rRLossAniF.w
		subq.b	#1,rRLossAniT.w

		moveq	#0,d0
		move.b	rRLossAniF.w,d0		; Get ring frame
		lsl.w	#7,d0				; Convert to offset
		move.l	#ArtUnc_Ring,d1			; Source address
		add.l	d0,d1				; ''
		move.w	#$D680,d2			; VRAM address
		move.w	#$80/2,d3			; Size
		jsr	QueueDMATransfer.w		; Queue a transfer

.NoRingLossAni:
		jsr	ProcessKosM.w			; Process Kosinski Moduled queue

		cmpi.b	#gLevel,rGameMode.w		; Is the game mode level?
		beq.w	.Loop				; If so, branch
		jmp	GotoGameMode.w			; Go to the correct game mode
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Level functions
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
		include	"Level/Level Drawing.asm"
		include	"Level/Level Collision.asm"
		include	"Level/Level Functions.asm"
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Music IDs
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Level_MusicIDs:
		dc.b	mWWZ, mWWZ
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Level water heights (-1 for no water)
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Level_WaterLevels:
		;dc.w	$490, -1			; Wacky Workbench
		dc.w	-1, -1
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Level data pointers
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; FORMAT:
;	dc.l	CHUNKS, BLOCKS, TILES, PALETTE
;	dc.l	LAYOUT, OBJECTS, RINGS, COLLISION
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Level_DataPointers:
		dc.l	WWZ_Chunks, WWZ_Blocks,  WWZ_Tiles, WWZ_Pal
		dc.l	WWZ_Layout, WWZ_Objects, WWZ_Rings, WWZ_Collision
		dc.l	WWZ_Chunks, WWZ_Blocks,  WWZ_Tiles, WWZ_Pal
		dc.l	WWZ_Layout, WWZ_Objects, WWZ_Rings, WWZ_Collision
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Size and start position data
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Level_SizeStartPos:
		dc.w	$3000, $580
		incbin	"Level/Level Data/Wacky Workbench/Start Position.bin"
		dc.w	$3000, $580
		incbin	"Level/Level Data/Wacky Workbench/Start Position.bin"
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Dynamic events routines
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Level_DynEvenRouts:
		dc.l	DynEv_WWZ			; Wacky Workbench
		dc.l	DynEv_WWZ
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Wacky Workbench dynamic events routine
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
DynEv_WWZ:
		moveq	#0,d0
		move.b	rDynEvRout.w,d0
		move.w	.Index(pc,d0.w),d0
		jmp	.Index(pc,d0.w)
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
.Index:
		dc.w	.WaitBoss-.Index
		dc.w	.Done-.Index
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
.WaitBoss:
		cmpi.w	#$2EE0,rCamXPos.w
		blt.s	.Done
		move.w	#$340,rMinCamY.w
		move.w	#$340,rDestMaxY.w
		move.w	#$2EE0,rMinCamX.w
		move.w	#$2EE0,rMaxCamX.w
		addq.b	#2,rDynEvRout.w

.Done:
		rts
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Palette cycle routines
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Level_PalCycRouts:
		dc.l	PalCycle_WWZ			; Wacky Workbench
		dc.l	PalCycle_WWZ
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Wacky Workbench palette cycle routine
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
PalCycle_WWZ:
		tst.b	rFloorActive.w		; Is the floor active?
		bne.s	.Flash				; If so, branch

		subq.w	#1,rFloorTimer.w		; Decrement the floor timer
		bpl.s	.ResetPal			; If it hasn't run out, branch
		st	rFloorActive.w		; Set the floor active flag
		move.w	#180,rFloorTimer.w		; Set the floor timer

.ResetPal:
		clr.w	rPalCycTimer.w		; Reset the palette cycle
		move.w	#$C28,(rPalette+$62).w		; Set the floor color to be deactivated
		move.w	#$E48,(rWaterPal+$62).w	; ''
		rts

.Flash:
		subq.w	#1,rFloorTimer.w		; Decrement the floor timer
		bpl.s	.UpdatePal			; If it hasn't run out, branch
		clr.b	rFloorActive.w		; Clear the floor active flag
		move.w	#30,rFloorTimer.w		; Set the floor timer

.UpdatePal:
		subq.b	#1,rPalCycTimer.w		; Decrement the palette cycle timer
		bpl.s	.End				; If it hasn't run out, branch
		move.b	#1,rPalCycTimer.w		; Reset the palette cycle timer

		moveq	#0,d0
		move.b	rPalCycIndex.w,d0		; Get the palette cycle index
		add.w	d0,d0				; Turn into offset
							; Set the floor color
		move.w	PalCyc_WWZFloor(pc,d0.w),(rPalette+$62).w
		move.w	PalCyc_WWZFloorUW(pc,d0.w),(rWaterPal+$62).w

		addq.b	#1,rPalCycIndex.w		; Increment the palette cycle index
		cmpi.b	#5,rPalCycIndex.w		; Has it reached the end of the cycle?
		bcs.s	.End				; If not, branch
		clr.b	rPalCycIndex.w		; Reset the palette cycle index

.End:
		rts
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
PalCyc_WWZFloor:
		dc.w	$C28, $000, $0EE, $000, $EEE
PalCyc_WWZFloorUW:
		dc.w	$E48, $220, $2EE, $220, $EEE
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Animated art routines
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Level_AniArtRouts:
		dc.l	AniArt_WWZ			; Wacky Workbench
		dc.l	AniArt_WWZ
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Wacky Workbench animated art routine
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
AniArt_WWZ:
		lea	.AniData(pc),a2			; Tutorial animated art data
		bra.w	AniArt_DoAnimate		; Handle animations
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
.AniData:
		dc.w	2

		lvlAniDat 3, ArtUnc_Electricity, $162, 4, 8
		dc.b	0, 8, $10, $18

		lvlAniDat 1, ArtUnc_ElectricOrbs, $15E, $E, 4
		dc.b	0, 4, 4, 0, 4, 4, 8, 4, 4, 8, $C, 4, 4, $C

		lvlAniDat 4, ArtUnc_Sirens, $A8, 8, 4
		dc.b	0, 4, 4, 8, $C, $C, $C, $C
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Level drawing initialization and update routines
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; PARAMETERS:
;	a1.l	- Camera RAM
;	a3.l	- Row plane buffer
;	a4.l	- Column plane buffer
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; RETURNS:
;	Nothing
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Level_RenderRouts:
		dc.l	General_InitFG			; Wacky Workbench
		dc.l	WWZ_InitBG
		dc.l	General_UpdateFG
		dc.l	WWZ_UpdateBG
		dc.l	General_InitFG
		dc.l	WWZ_InitBG
		dc.l	General_UpdateFG
		dc.l	WWZ_UpdateBG
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Wacky Workbench background initialization
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
WWZ_InitBG:
		lea	rFGCam.w,a2			; Get foreground camera RAM
		move.w	cYPos(a2),d0			; Get foreground Y position
		asr.w	#2,d0				; Divide by $20
		move.w	d0,cYPos(a1)			; Set as background Y position

		bsr.w	Level_RefreshPlane		; Refresh the plane

		lea	WWZ_Scroll(pc),a3		; Get background scroll data
		bra.w	ScrollSections			; Scroll the planes
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Wacky Workbench background update
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
WWZ_UpdateBG:
		lea	rFGCam.w,a2			; Get foreground camera RAM
		move.w	cYPos(a2),d0			; Get foreground Y position
		asr.w	#2,d0				; Divide by $20
		move.w	d0,cYPos(a1)			; Set as background Y position

		bsr.w	Level_ChkRedrawPlane		; Check if the plane needs to be redrawn
		moveq	#(512/16)-1,d4			; Number of blocks per column
		bsr.w	Level_UpdatePlaney		; Update the plane

		lea	WWZ_Scroll(pc),a3		; Get background scroll data
		bra.w	ScrollSections			; Scroll the planes
; --------------------------------------------------------------------------------------------------------------------------------------
		scrollInit WWZ_Scroll

		; CEILING LIGHTS
		scrollSection	 48, $80
		scrollSection	 32, $60
		scrollSection	 32, $50
		scrollSection	 24, $40
		scrollSection	 24, $38
		scrollSection	 16, $30
		scrollSection	 16, $2C
		scrollSection	 16, $28
		scrollSection	 16, $24
		scrollSection	 16, $20

		; BACK WALL
		scrollSection	160, $40

		; FRONT WALL
		scrollSection	368, $80

		scrollEnd
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Wacky Workbench level data
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
WWZ_Layout:
		incbin	"Level/Level Data/Wacky Workbench/Layout.bin"
		even
WWZ_Chunks:
		incbin	"Level/Level Data/Wacky Workbench/Chunks.bin"
		even
WWZ_Blocks:
		incbin	"Level/Level Data/Wacky Workbench/Blocks.bin"
		even
WWZ_Tiles:
		incbin	"Level/Level Data/Wacky Workbench/Tiles.kosm.bin"
		even
		dc.w	$FFFF, 0, 0
WWZ_Objects:
		incbin	"Level/Level Data/Wacky Workbench/Objects.bin"
		even
WWZ_Rings:
		incbin	"Level/Level Data/Wacky Workbench/Rings.bin"
		even
WWZ_Pal:
		dc.w	$100>>1-1
		incbin	"Level/Level Data/Wacky Workbench/Palette.pal.bin"
		incbin	"Level/Level Data/Wacky Workbench/Palette (Water).pal.bin"
		even
WWZ_Collision:
		dc.l	.ColData, .Angles, .Heights, .HeightsR
.ColData:
		incbin	"Level/Level Data/Wacky Workbench/Collision.bin"
		even
.Angles:
		incbin	"Level/Level Data/Wacky Workbench/Angle Values.bin"
		even
.Heights:
		incbin	"Level/Level Data/Wacky Workbench/Height Values.bin"
		even
.HeightsR:
		incbin	"Level/Level Data/Wacky Workbench/Height Values (Rotated).bin"
		even
ArtUnc_Electricity:
		incbin	"Level/Level Data/Wacky Workbench/Electricity.bin"
		even
ArtUnc_ElectricOrbs:
		incbin	"Level/Level Data/Wacky Workbench/Electric Orbs.bin"
		even
ArtUnc_Sirens:
		incbin	"Level/Level Data/Wacky Workbench/Sirens.bin"
		even
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Main level PLCs
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
PLC_LevelMain:
		dc.w	$A
		dc.l	ArtKosM_Chkpoint
		dc.w	$AFC0
		dc.l	ArtKosM_Monitor
		dc.w	$B100
		dc.l	ArtKosM_SpringH
		dc.w	$B740
		dc.l	ArtKosM_SpringV
		dc.w	$B940
		dc.l	ArtKosM_SpringD
		dc.w	$BB20
		dc.l	ArtKosM_HUD
		dc.w	$D000
		dc.l	ArtKosM_WaterSurface
		dc.w	$D200
		dc.l	ArtKosM_SpikesN
		dc.w	$D500
		dc.l	ArtKosM_SpikesS
		dc.w	$D580
		dc.l	ArtKosM_RingSparkle
		dc.w	$D700
		dc.l	ArtKosM_Explosion
		dc.w	$D800
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Level PLCs
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Level_PLCs:
		dc.l	PLC_WWZ
		dc.l	PLC_WWZ
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Wacky Workbench PLCs
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
PLC_WWZ:
		dc.w	0
		dc.l	ArtKosM_Bumper
		dc.w	$6B60
	;	dc.l	ArtKosM_Orbinaut
	;	dc.w	$71A0
	;	dc.l	ArtKosM_Diamond
	;	dc.w	$7580
	;	dc.l	ArtKosM_CNZBarrel
	;	dc.w	$7A00
	;	dc.l	ArtKosM_Slicer
	;	dc.w	$8000
	;	dc.l	ArtKosM_ShlCrker
	;	dc.w	$8400
	;	dc.l	ArtKosM_Asteron
	;	dc.w	$8880
	;	dc.l	ArtKosM_Harpoon
	;	dc.w	$8A60
	;	dc.l	ArtKosM_WFZBoss
	;	dc.w	$9000
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Art
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ArtKosM_HUD:
		incbin	"Level/Objects/HUD/Art - HUD Base.kosm.bin"
		even
ArtKosM_RingSparkle:
		incbin	"Level/Objects/Ring/Art - Sparkle.kosm.bin"
		even
ArtUnc_Ring:
		incbin	"Level/Objects/Ring/Art - Ring.unc.bin"
		even
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Object index
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Level_ObjIndex:
		dc.l	ObjMonitor
		dc.l	ObjSpike
		dc.l	ObjSpring
		dc.l	ObjCheckpoint
		dc.l	ObjNull			;ObjSlicer
		dc.l	ObjNull			;ObjShlCrker
		dc.l	ObjNull			;ObjAsteron
		dc.l	ObjNull			;ObjWFZBoss
		dc.l	ObjWallSpring
		dc.l	ObjNull			;ObjHarpoon
		dc.l	ObjBallMode
		dc.l	ObjBumper
		dc.l	ObjNull			;ObjCNZBarrel
		dc.l	ObjNull			;ObjDiamond
		dc.l	ObjNull			;ObjOrbinaut
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Objects
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
ObjNull:
		jmp	DeleteObject
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
		include	"Level/Objects/Mighty/Code.asm"		; Mighty object
		include	"Level/Objects/Ring/Code.asm"		; Ring loss object
		include	"Level/Objects/Explosion/Code.asm"	; Explosion object
		include	"Level/Objects/Water Surface/Code.asm"	; Water surface object
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
		include	"Level/Objects/Monitor/Code.asm"	; Monitor object
		include	"Level/Objects/Spikes/Code.asm"		; Spike object
		include	"Level/Objects/Spring/Code.asm"		; Spring object
		include	"Level/Objects/Checkpoint/Code.asm"	; Checkpoint object
		include	"Level/Objects/Wall Spring/Code.asm"	; Wall spring object
		include	"Level/Objects/Ball Mode/Code.asm"	; Ball mode switch object
		include	"Level/Objects/Bumper/Code.asm"		; Bumper object
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Unused/Temporary
;		include	"Level/Objects/Slicer/Code.asm"		; Slicer object
;		include	"Level/Objects/Shellcracker/Code.asm"	; Shellcracker object
;		include	"Level/Objects/Asteron/Code.asm"	; Asteron object
;		include	"Level/Objects/Boss - WFZ/Code.asm"	; WFZ boss object
;		include	"Level/Objects/Harpoon/Code.asm"	; Harpoon object
;		include	"Level/Objects/CNZ Barrel/Code.asm"	; CNZ barrel object
;		include	"Level/Objects/Diamond/Code.asm"	; Diamond object
;		include	"Level/Objects/Orbinaut/Code.asm"	; Orbinaut object
; =========================================================================================================================================================
