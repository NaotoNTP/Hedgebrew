; =========================================================================================================================================================
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
		move.w	d0,vdpWindowY.w			; ''
		move.w	d0,(a5)				; ''
		clr.w	dmaQueue.w			; Set stop token at the beginning of the DMA queue
		move.w	#dmaQueue,dmaSlot.w	; Reset the DMA queue slot

		jsr	ClearScreen.w			; Clear the screen

		; --- Clear some RAM ---

		clrRAM	kosVars			; Clear Kosinski queue variables
		clrRAM	opmodeVars			; Clear variables
		clrRAM	oscillators			; Clear oscillation data

		; --- Do some final initializing and play the level music ---

		move.b	#3,ringAnimTime.w		; Set ring animation timer
		move.w	#30,rFloorTimer.w		; Set floor timer
		clr.w	palCycTimer.w		; Reset palette cycle

		lea	Level_MusicIDs(pc),a0		; Music ID list
		move.w	levelID.w,d0			; Get level ID
		ror.b	#1,d0				; Turn into offset
		lsr.w	#7,d0				; ''
		move.b	(a0,d0.w),d0			; Get music ID
		move.b	d0,lvlMusic.w		; Store it
		playSnd	d0, 1				; Play it

		intsOn					; Enable interrupts

		; --- Load level data ---

		lea	PLC_LevelMain,a3		; Load main level PLCs
		jsr	LoadKosMQueue.w			; ''

		jsr	InitObjectList.w

		jsr	FindFreeObj.w
		move.l	#ObjPlayer,_objAddress(a1)		; Load Player object
		move.w	a1,playerPtrP1.w		; Store the address

		tst.b	lvlHasWater.w			; Does the level have water?
		beq.s	.NoSurface			; If not, branch

							; Load water surfaces
		jsr	FindFreeObj.w
		move.l	#ObjWaterSurface,_objAddress(a1)
		move.w	#$60,_objXPos(a1)
		move.w	a1,waterObjPtr1.w		; Store the address

		jsr	FindFreeObj.w
		move.l	#ObjWaterSurface,_objAddress(a1)
		move.w	#$120,_objXPos(a1)
		move.w	a1,waterObjPtr2.w		; Store the address

.NoSurface:
		bsr.w	Level_LoadData			; Load level data

.WaitPLCs:
		move.b	#vGeneral,vIntRoutine.w		; Level load V-INT routine
		jsr	ProcessKos.w			; Process Kosinski queue
		jsr	VSync_Routine.w			; V-SYNC
		jsr	ProcessKosM.w			; Process Kosinski Moduled queue
		tst.b	kosMModules.w			; Are there still modules left?
		bne.s	.WaitPLCs			; If so, branch

		clr.b	lvlHasWater.w			; Clear the water flag

		lea	Level_WatelevelIDs(pc),a0	; Water heights
		move.w	levelID.w,d0			; Get level ID
		ror.b	#1,d0				; Turn into offset
		lsr.w	#6,d0				; ''
		move.w	(a0,d0.w),d0			; Get water height
		bmi.s	.NoWater			; If it's negative, branch
		move.w	d0,waterYPos.w		; Set the water height
		move.w	d0,destWaterYPos.w

		st	lvlHasWater.w			; Set the water flag
		move.w	#$8014,VDP_CTRL			; Enable H-INT
		bsr.w	Level_WaterHeight		; Update water height
		move.w	hIntCntReg.w,VDP_CTRL		; Set H-INT counter

.NoWater:
		move.w	#320/2,panCamXPos.w		; Set camera X center

		jsr	InitOscillation.w		; Initialize oscillation

		bsr.w	Level_HandleCamera		; Initialize the camera
		bsr.w	Level_InitHUD			; Initialize the HUD
		bsr.w	Level_WaterHeight		; Initialize water height

		bsr.w	Level_AnimateArt		; Animate level art

		; --- Load the planes ---

		intsOff					; Disable interrupts
		move.l	#VInt_RunSMPS,vIntAddress.w	; Swap V-INT
		intsOn					; Enable interrupts
		bsr.w	Level_InitPlanes		; Initialize the planes
		intsOff					; Disable interrupts
		move.l	#VInt_Standard,vIntAddress.w	; Swap V-INT
		intsOn					; Enable interrupts
		move.b	#vLvlLoad,vIntRoutine.w		; Level load V-INT routine
		jsr	VSync_Routine.w			; V-SYNC

		; --- Load the level objects and rings ---

		sf	objMgrInit.w			; Reset object manager routine
		bsr.w	Level_RingsManager		; Initialize the ring manager
		jsr	ObjectManager.w			; Run the object manager
	runObjects
		jsr	RenderObjects.w			; Render objects

		clr.b	lvlReload.w			; Clear the level reload flag

		displayOn				; Enable display
		jsr	FadeFromBlack.w			; Fade from black
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Main loop
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
.Loop:
		move.b	#vLevel,vIntRoutine.w		; Level V-INT routine
		jsr	ProcessKos.w			; Process Kosinski queue
		jsr	VSync_Routine.w			; V-SYNC

		jsr	CheckPause.w			; Check for pausing
		addq.w	#1,lvlFrameCnt.w			; Increment frame counter

		jsr	UpdateOscillation.w		; Update oscillation

		bsr.w	Level_RingsManager		; Run the ring manager
		jsr	ObjectManager.w			; Run the object manager

	runObjects

		tst.b	lvlReload.w			; Does the level need to be reloaded?
		bne.w	Level				; If so, branch

		bsr.w	Level_HandleCamera		; Handle the camera
		bsr.w	Level_UpdatePlanes		; Update the planes (draw new tiles and scroll)
		bsr.w	Level_UpdateWaterSurface	; Update the water surface

		jsr	RenderObjects.w			; Render objects

		bsr.w	Level_WaterHeight		; Update water height
		bsr.w	Level_AnimateArt		; Animate level art
		bsr.w	Level_PalCycle			; Do palette cycling
		bsr.w	Level_DynEvents			; Run dynamic events

		subq.b	#1,ringAnimTime.w		; Decrement ring animation timer
		bpl.s	.NoRingAni			; If it hasn't run out, branch
		move.b	#3,ringAnimTime.w		; Reset animation timer
		addq.b	#1,ringAnimFrame.w			; Next ring frame
		andi.b	#7,ringAnimFrame.w			; Limit it

		moveq	#0,d0
		move.b	ringAnimFrame.w,d0			; Get ring frame
		lsl.w	#7,d0				; Convert to offset
		move.l	#ArtUnc_Ring,d1			; Source address
		add.l	d0,d1				; ''
		move.w	#$D780,d2			; VRAM address
		move.w	#$80/2,d3			; Size
		jsr	QueueDMATransfer.w		; Queue a transfer

.NoRingAni:
		tst.b	ringLossAnimT.w
		beq.s	.NoRingLossAni
		moveq	#0,d0
		move.b	ringLossAnimT.w,d0
		add.w	ringLossAnimA.w,d0
		move.w	d0,ringLossAnimA.w
		rol.w	#8,d0
		andi.w	#7,d0
		move.b	d0,ringLossAnimF.w
		subq.b	#1,ringLossAnimT.w

		moveq	#0,d0
		move.b	ringLossAnimF.w,d0		; Get ring frame
		lsl.w	#7,d0				; Convert to offset
		move.l	#ArtUnc_Ring,d1			; Source address
		add.l	d0,d1				; ''
		move.w	#$D680,d2			; VRAM address
		move.w	#$80/2,d3			; Size
		jsr	QueueDMATransfer.w		; Queue a transfer

.NoRingLossAni:
		jsr	ProcessKosM.w			; Process Kosinski Moduled queue

		cmpi.b	#gLevel,opmode.w		; Is the game mode level?
		beq.w	.Loop				; If so, branch
		jmp	GotoGameMode.w			; Go to the correct game mode

; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Check for pausing
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
CheckPause:
		tst.b	pauseFlag.w			; Is the game already paused?
		bne.s	.SetPause			; If so, branch
		btst	#7,ctrlPressP1.w			; Has the start button been pressed?
		beq.s	.End				; If not, branch

.SetPause:
		st	pauseFlag.w			; Pause the game
		AMPS_MUSPAUSE				; Pause the music

.PauseLoop:
		move.b	#vGeneral,vIntRoutine.w		; General V-INT routine
		bsr.w	VSync_Routine			; V-SYNC
		btst	#7,ctrlPressP1.w			; Has the start button been pressed?
		beq.s	.PauseLoop			; If not, branch

		AMPS_MUSUNPAUSE				; Unpause the music
		clr.b	pauseFlag.w			; Unpause the game

.End:
		rts

; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Level functions
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
		include	"Opmodes/Gameplay/Level Drawing.asm"
		include	"Opmodes/Gameplay/Level Collision.asm"
		include	"Opmodes/Gameplay/Level Functions.asm"
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Music IDs
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Level_MusicIDs:
		dc.b	mWWZ, mWWZ
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Level water heights (-1 for no water)
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Level_WatelevelIDs:
		;dc.w	$490, -1			; Wacky Workbench
		dc.w	-1, -1
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Level data pointers
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; FORMAT:
;	dc.l	CHUNKS, BLOCKS, TILES, PALETTE
;	dc.l	FG LAYOUT, BG LAYOUT 
;	dc.l	OBJECTS, RINGS, COLLISION
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Level_DataPointers:
		dc.l	WWZ_Chunks, WWZ_Blocks, WWZ_Tiles, WWZ_Pal
		dc.l	WWZ_FGLayout, WWZ_BGLayout
		dc.l	WWZ_Objects, WWZ_Rings, WWZ_Collision

		dc.l	WWZ_Chunks, WWZ_Blocks, WWZ_Tiles, WWZ_Pal
		dc.l	WWZ_FGLayout, WWZ_BGLayout
		dc.l	WWZ_Objects, WWZ_Rings, WWZ_Collision
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Size and start position data
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Level_SizeStartPos:
		dc.w	$3000, $580
		incbin	"Zones/Wacky Workbench/Start Position.bin"
		dc.w	$3000, $580
		incbin	"Zones/Wacky Workbench/Start Position.bin"
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
		move.b	dynEventRout.w,d0
		move.w	.Index(pc,d0.w),d0
		jmp	.Index(pc,d0.w)
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
.Index:
		dc.w	.WaitBoss-.Index
		dc.w	.Done-.Index
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
.WaitBoss:
		cmpi.w	#$2EE0,fgCamXPos.w
		blt.s	.Done
		move.w	#$340,minCamYPos.w
		move.w	#$340,targetMaxCamY.w
		move.w	#$2EE0,minCamXPos.w
		move.w	#$2EE0,maxCamXPos.w
		addq.b	#2,dynEventRout.w

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
		tst.b	rFlooactIDive.w		; Is the floor active?
		bne.s	.Flash				; If so, branch

		subq.w	#1,rFloorTimer.w		; Decrement the floor timer
		bpl.s	.ResetPal			; If it hasn't run out, branch
		st	rFlooactIDive.w		; Set the floor active flag
		move.w	#180,rFloorTimer.w		; Set the floor timer

.ResetPal:
		clr.w	palCycTimer.w		; Reset the palette cycle
		move.w	#$C28,(paletteBuff+$62).w		; Set the floor color to be deactivated
		move.w	#$E48,(paletteBuffAlt+$62).w	; ''
		rts

.Flash:
		subq.w	#1,rFloorTimer.w		; Decrement the floor timer
		bpl.s	.UpdatePal			; If it hasn't run out, branch
		clr.b	rFlooactIDive.w		; Clear the floor active flag
		move.w	#30,rFloorTimer.w		; Set the floor timer

.UpdatePal:
		subq.b	#1,palCycTimer.w		; Decrement the palette cycle timer
		bpl.s	.End				; If it hasn't run out, branch
		move.b	#1,palCycTimer.w		; Reset the palette cycle timer

		moveq	#0,d0
		move.b	palCycIndex.w,d0		; Get the palette cycle index
		add.w	d0,d0				; Turn into offset
							; Set the floor color
		move.w	PalCyc_WWZFloor(pc,d0.w),(paletteBuff+$62).w
		move.w	PalCyc_WWZFloorUW(pc,d0.w),(paletteBuffAlt+$62).w

		addq.b	#1,palCycIndex.w		; Increment the palette cycle index
		cmpi.b	#5,palCycIndex.w		; Has it reached the end of the cycle?
		bcs.s	.End				; If not, branch
		clr.b	palCycIndex.w		; Reset the palette cycle index

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
		bra.w	AniArt_D_objAnimmate		; Handle animations
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
		lea	fgCamVars.w,a2			; Get foreground camera RAM
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
		lea	fgCamVars.w,a2			; Get foreground camera RAM
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

; =========================================================================================================================================================
