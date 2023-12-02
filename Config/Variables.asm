; =========================================================================================================================================================
; User defined RAM addresses
; =========================================================================================================================================================
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Standard variables
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
		rsset	RAM_START

		; --- BUFFERS ---

rBuffer		rs.b	0				; General buffer
rChunks		rs.b	$8000				; Chunk table (uses same space as general buffer)
rBuffer_End	rs.b	0

		rsset	RAM_WORD_START

rKosPBuf	rs.b	$1000				; Kosinski decompression buffer

rDMAQueue	rs.b	$FC				; DMA queue buffer
rDMASlot	rs.w	1				; DMA queue buffer slot

rHScroll	rs.b	$380				; HScroll table
rHScroll_End	rs.b	0				; ''

rVScroll	rs.b	$50				; VScroll table
rVScroll_End	rs.b	0				; ''
rVScrollFG	EQU	rVScroll			; VScroll foreground value
rVScrollBG	EQU	rVScroll+2			; VScroll background value

rSprites	rs.b	$280				; Sprite table
rSprites_End	rs.b	0				; ''

; NTP: we won't be able to save ram like this until we switch to SWAP mappings (and we'll need per-piece limit checks on lest we overwrite the water palette)
;rDestWtrPal	equ	rSprites_End-$100		; Target water palette buffer
;rDestPal	equ	rSprites_End-$80		; Target palette buffer

rDestWtrPal	rs.b	$80				; Target water palette buffer
rDestPal	rs.b	$80				; Target palette buffer
rWaterPal	rs.b	$80				; Water palette buffer
rPalette	rs.b	$80				; Palette buffer

rKosPVars	rs.b	0				; Kosinski decompression queue variables
rKosPCnt	rs.w	1				; Kosinski decompression queue count
rKosPRegs	rs.b	$1A				; Kosinski decompression stored registers
rKosPSR		rs.w	1				; Kosinski decompression stored SR
rKosPBookmark	rs.l	1				; Kosinski decompression bookmark
rKosPList	rs.b	$20				; Kosinski decompression queue
rKosPSrc	equ	rKosPList			; ''
rKosPDest	equ	rKosPList+4			; ''
rKosPList_End	rs.b	0				; ''
rKosPMMods	rs.w	1				; Kosinski moduled decompression modules left
rKosPMLastSz	rs.w	1				; Kosinski moduled decompression last module size
rKosPMList	rs.b	$20*6				; Kosinski moduled decompression queue
rKosPMSrc	equ	rKosPMList			; ''
rKosPMDest	equ	rKosPMList+4			; ''
rKosPMList_End	rs.b	0				; ''
rKosPVars_End	rs.b	0				; End of Kosinski decompression queue variables

rObjects	rs.b	0				; Object SSTs
		maxObjRAM $2400				; ''
rObjects_End	rs.b	0

OBJECT_COUNT	equ	(rObjects_End-rObjects)/oSize

rTailAddr	rs.l	1				; pointer to tail object code
rTailNext	rs.w	1				; pointer to the first object in linked list
rTailPrev	rs.w	1				; pointer to the last object in linked list
rFreeHead	rs.w	1				; pointer to the first object that is not loaded

rDispInput	equ __rs-dnext
		rs.b	dSize*8				; Sprite display input list (8 priority levels)
rDispInput_End	rs.b	0				; 

rRespawns	rs.b	$300				; Object respawn table
rRespawns_End	rs.b	0				; ''

rFGRowBuf	rs.b	$102				; Foreground horizontal plane buffer
rFGColBuf	rs.b	$82				; Foreground vertical plane buffer
rBGRowBuf	rs.b	$102				; Background horizontal plane buffer
rBGColBuf	rs.b	$82				; Background vertical plane buffer

rAMPS		rs.b	0			; AMPS variables
		include	"Sound/amps/code/ram.asm"

		; --- ENGINE VARIABLES ---

rP1Data		rs.b	0				; Controller 1 data
rP1Hold		rs.b	1				; Controller 1 held button data
rP1Press	rs.b	1				; Controller 1 pressed button data
rP2Data		rs.b	0				; Controller 2 data
rP2Hold		rs.b	1				; Controller 2 held button data
rP2Press	rs.b	1				; Controller 2 pressed button data

rHWVersion	rs.b	1				; Hardware version
rVINTFlag	rs.b	0				; V-INT flag
rVINTRout	rs.b	1				; V-INT routine

rPalFade	rs.b	0				; Palette fade properties
rFadeStart	rs.b	1				; Palette fade start index
rFadeLen	rs.b	1				; Palette fade size

rLagCount	rs.b	1				; Lag frame counter

rHIntFlag	rs.b	1				; H-INT run flag

rVIntJmp	rs.w	1				; Header will point here for V-INT
rVIntAddr	rs.l	1				; V-INT address
rHIntJmp	rs.w	1				; Header will point here for H-INT
rHIntAddr	rs.l	1				; H-INT address

rFrameCnt	rs.l	1				; Frame counter

rGameMode	rs.b	1				; Game mode ID
rSprCount	rs.b	1				; Sprite count
rPauseFlag	rs.b	1				; Pause flag
rHIntUpdates	rs.b	1				; Level updates in H-INT flag

rHIntReg	rs.b	1				; H-INT counter register
rHIntCnt	rs.b	1				; H-INT counter value

rRNGSeed	rs.l	1				; RNG seed

rVDPReg1	rs.w	1				; VDP register 1 register ID and value
rWindowY	rs.w	1				; Window Y position (VDP register)

rMoveCheat	rs.b	1
rArtCheat	rs.b	1

rOscNums	rs.b	0				; Oscillation numbers
rOscCtrl	rs.w	1				; Oscillation control
rOscData	rs.w	$20				; Oscialltion data
rOscNums_End	rs.b	0				; ''

		; --- GLOBAL VARIABLES ---

rLevel		rs.b	0				; Level ID
rZone		rs.b	1				; Zone ID
rAct		rs.b	1				; Act ID

rChkpoint	rs.b	0				; Checkpoint RAM
rLastChkpoint	rs.b	1				; Last checkpoint hit
		rs.b	1
rSavedXPos	rs.w	1				; Saved player X position
rSavedYPos	rs.w	1				; Saved player Y position
rChkpoint_End	rs.b	0				; End of checkpoint RAM

rObjPosAddr	rs.l	1				; Object position data pointer
rObjManInit	rs.b	1				; Object manager initialized flag

rStartFall	rs.b	1				; Start level by falling flag

rObjLoadR	rs.l	1				; Object data address (for going right)
rObjLoadL	rs.l	1				; Object data address (for going left)
rObjRespL	rs.w	1				; Object respawn address (for going right)
rObjRespR	rs.w	1				; Object respawn address (for going left)
rObjXCoarse	rs.w	1				; Object manager's coarse X position
rObjYCoarse	rs.w	1				; Object manager's coarse Y position
rObjManX	rs.w	1				; Object manager's camera X position
rObjManY	rs.w	1				; Object manager's camera Y position

rPalCycTimer	rs.b	1				; Palette cycle timer
rPalCycIndex	rs.b	1				; Palette cycle index

		; --- LOCAL VARIABLES ---

rGameVars	rs.b	0				; Start of local game variables
		rs.b	((-__rs)&$FFFF)-$100		; You have the rest of RAM here for local variables
rGameVars_End	rs.b	0				; End of local game variables

		; --- STACK SPACE ---

rStackSpace	rs.b	$100				; Stack space
rStackBase	rs.b	0				; ''
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Title screen variables
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
		rsset	rGameVars

	if __rs>=rGameVars_End
		inform	3,"Title screen variables take too much space!"
	endif
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Level variables
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
		rsset	rGameVars
rBlocks		rs.b	$1800				; Block table

rScrlSecs	rs.b	$384				; Scroll sections
rScrlSecs_End	rs.b	0				; ''

rColList	rs.b	$80				; Collision response list
rColList_End	rs.b	0				; ''

rLayout		rs.b	0				; Level layout ROM addresses
rLayoutFG	rs.l	1				
rLayoutBG	rs.l	1				

rRings		rs.w	1				; Ring count

rRingManRout	rs.b	1				; Ring manager routine
rRingFrame	rs.b	1				; Ring animation frame

rRingAniTime	rs.b	1				; Ring animation timer
rRLossAniT	rs.b	1
rRLossAniA	rs.w	1
rRLossAniF	rs.b	1

rBossDefeat	rs.b	1

rRingStat	rs.b	$400				; Ring status table
rRingStat_End	rs.b	0				; ''

rRingCol	rs.b	0				; Ring collection table
rRingColCnt	rs.w	1				; Ring collection count
rRingColList	rs.b	$7E				; Ring collection list
rRingCol_End	rs.b	0				; ''

rRingPosAddr	rs.l	1				; Ring position data pointer
rRingLoadL	rs.l	1				; Ring data address for the left side of the screen
rRingLoadR	rs.l	1				; Ring data address for the right side of the screen
rRingStatPtr	rs.w	1				; Ring status address

rPlayer1Addr	rs.w	1				; Player 1 object address
rShield1Addr	rs.w	1				; Player 1 shield address
rInvinc1Addr	rs.w	1				; Player 1 invincibility address
rAftImg1Addr	rs.w	1				; Player 1 after image address

rPlayer2Addr	rs.w	1				; Player 2 object address
rShield2Addr	rs.w	1				; Player 2 shield address
rInvinc2Addr	rs.w	1				; Player 2 invincibility address
rAftImg2Addr	rs.w	1				; Player 2 after image address

rWater1Addr	rs.w	1				; Water surface 1 address
rWater2Addr	rs.w	1				; Water surface 2 address

rCamera		rs.b	0				; Camera RAM

rFGCam		rs.b	cSize2				; Foreground variables
rBGCam		rs.b	cSize2				; Background variables

rDestMaxCam	rs.b	0				; Target maximum camera positions
rDestMaxX	rs.w	1				; Target maximum camera X position
rDestMaxY	rs.w	1				; Target maximum camera Y position
rMaxCam		rs.b	0				; Maximum camera positions
rMaxCamX	rs.w	1				; Maximum camera X position
rMaxCamY	rs.w	1				; Maximum camera Y position
rDestMinCam	rs.b	0				; Target minimum camera positions
rDestMinX	rs.w	1				; Target minimum camera X position
rDestMinY	rs.w	1				; Target minimum camera Y position
rMinCam		rs.b	0				; Minimum camera positions
rMinCamX	rs.w	1				; Minimum camera X position
rMinCamY	rs.w	1				; Minimum camera Y position
rCamYPosDist	rs.w	1				; Distance from the player's Y position and the camera's
rCamLocked	rs.b	0				; Camera locked flags
rCamLockX	rs.b	1				; Camera locked horizontally flag
rCamLockY	rs.b	1				; Camera locked vertically flag
rCamMaxChg	rs.b	1				; Camera max Y position changing flag

rCamera_End	rs.b	0				; End of camera RAM

rDebugMode	rs.b	1				; Debug placement mode

rCamXPosCenter	rs.w	1				; Camera X center

rCtrl		rs.b	0				; Player control data
rCtrlHold	rs.b	1				; Player control held button data
rCtrlPress	rs.b	1				; Player control pressed button data

rLevelMusic	rs.b	1				; Level music ID
rBossMusic	rs.b	1				; Boss music ID

r1stCol		rs.l	1				; Primary level collision data pointer
r2ndCol		rs.l	1				; Secondary level collision data pointer

rColAddr	rs.l	1				; Current collsion address

rLayerPos	rs.w	1				; Fake layer position

rAngleVals	rs.l	1				; Angle value array pointer
rColArrayN	rs.l	1				; Normal height map array pointer
rColArrayR	rs.l	1				; Rotated height map array pointer

rNextLevel	rs.b	1				; Flag to go to the next level

rUpdateRings	rs.b	1				; Update Ring counter in the HUD flag

rWaterFlag	rs.b	1				; Water in level flag
rWaterFullscr	rs.b	1				; Water fullscreen flag
rWaterLvl	rs.w	1				; Water height
rDestWtrLvl	rs.w	1				; Target water height

rLvlFrames	rs.w	1				; Level frame counter
rLvlReload	rs.b	1				; Level reload flag
rTimeOver	rs.b	1				; Time over flag

rDynEvRout	rs.b	1				; Dynamic event routine ID

rFloorActive	rs.b	1				; Floor active flag
rFloorTimer	rs.w	1				; Floor timer

rAnimCnts	rs.b	$10				; Level art animation counters

	if __rs>=rGameVars_End
		inform	3,"Level variables take too much space!"
	endif
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Camera variables
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
rCamXPos	equ	rFGCam+cXPos			; Camera X position
rCamYPos	equ	rFGCam+cYPos			; Camera Y position
rCamBGXPos	equ	rBGCam+cXPos			; Background camera X position
rCamBGYPos	equ	rBGCam+cYPos			; Background camera Y position
rFGRedraw	equ	rFGCam+cRedraw		; Foreground redraw flag
rBGRedraw	equ	rBGCam+cRedraw		; Background redraw flag
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Variables for the vector table
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
vInterrupt	equ	rVIntJmp			; V-INT
hInterrupt	equ	rHIntJmp			; H-INT
; =========================================================================================================================================================