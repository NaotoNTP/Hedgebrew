; =========================================================================================================================================================
; Mighty The Armadillo in PRISM PARADISE
; By Nat The Porcupine 2021
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Title splash screen
; =========================================================================================================================================================

; ---------------------------------------------------------------------------------------------------------------------------------------------------------
TitleScreen:
		bra.s	TitleScreen
; ---------------------------------------------------------------------------------------------------------------------------------------------------------	
;		playSnd	#Mus_Stop, 1			; Stop sound
;
;		bsr.w	FadeToBlack			; Fade to black
;
;		intsOff					; Disable interrupts
;		clrRAM	rKosPVars
;		clrRAM	rChkpoint
;		clrRAM	rGameVars
;		clrRAM	rObjects
;
;		lea	VDP_CTRL,a5
;		move.w	#$8004,(a5)			; $8004 - Disable H-INT, H/V Counter
;		move.w	#$8174,(a5)			; $8134 - Enable display, enable V-INT, enable DMA, V28
;		move.w	#$8230,(a5)			; $8230 - Plane A at $C000
;		move.w	#$8407,(a5)			; $8407 - Plane B at $E000
;		move.w	#$9011,(a5)			; $9001 - 64x64 cell plane area
;		move.w	#$9200,(a5)			; $9200 - Window V position at default
;		move.w	#$8B00,(a5)			; $8B03 - V-Scroll by screen, H-Scroll by screen
;		move.w	#$8700,(a5)			; $8700 - BG color pal 0 color 0
;		clr.w	rDMAQueue.w			; Set stop token at the beginning of the DMA queue
;		move.w	#rDMAQueue,rDMASlot.w	; Reset the DMA queue slot
;
;		bsr.w	ClearScreen			; Clear screen
;
;		lea	rDestPal.w,a0			; Fade target palette
;		moveq	#$80>>2-1,d0			; Size
;
;.FillPal:
;		move.l	#$0EEE0EEE,(a0)+		; Fill palette with white
;		dbf	d0,.FillPal			; Loop
;
;		bsr.w	FadeFromBlack			; Fade from black
;		
;		bsr.w	SEGA_FMV			; Run SEGA FMV
;
;TitleScreen2:
;		intsOff
;
;		clr.b	rArtCheat.w
;		clrRAM	rGameVars
;		clrRAM	rObjects
;
;		move.w	#$8200|($C000/$400),VDP_CTRL	; Reset plane A address
;		bsr.w	FadeToWhite			; Fade to white
;
;		intsOff
;		bsr.w	ClearScreen			; Clear screen
;
;		lea	MapEni_TitleBG,a0		; Decompress background mappings
;		lea	rBuffer,a1			; Decompress into RAM
;		moveq	#1,d0				; Base tile properties: Tile ID 1, no flags
;		bsr.w	EniDec				; Decompress!
;
;		lea	rBuffer,a1			; Load mappings
;		move.l	#$60000003,d0			; At (0, 0) on plane A
;		moveq	#$27,d1				; $28x$1C tiles
;		moveq	#$1B,d2				; ''
;		moveq	#0,d3				; Base tile properties: Tile ID 0, no flags
;		bsr.w	LoadPlaneMap			; Load the map
;
;		lea	MapEni_TitleLogo,a0		; Decompress logo mappings
;		lea	rBuffer,a1			; Decompress into RAM
;		move.w	#$8370,d0			; Base tile properties: Tile ID 1, no flags
;		bsr.w	EniDec				; Decompress!
;
;		lea	rBuffer,a1			; Load mappings
;		move.l	#$41040003,d0			; At (0, 0) on plane A
;		moveq	#$E,d1				; $28x$1C tiles
;		moveq	#$C,d2				; ''
;		moveq	#0,d3				; Base tile properties: Tile ID 0, no flags
;		bsr.w	LoadPlaneMap			; Load the map
;
;		lea	Pal_Title,a0			; Load palette to target buffer
;		move.w	#(Pal_Title_End-Pal_Title)>>1-1,d0
;		bsr.w	LoadTargetPal			; ''
;
;		lea	ArtKosM_TitleBG,a1		; Load background art
;		move.w	#$20,d2				; ''
;		bsr.w	QueueKosMData			; ''
;
;		lea	ArtKosM_TitleLogo,a1		; Load logo art
;		move.w	#$6E00,d2			; ''
;		bsr.w	QueueKosMData			; ''
;
;		lea	ArtKosM_TtlSonic,a1		; Load Sonic art
;		move.w	#$4000,d2			; ''
;		bsr.w	QueueKosMData			; ''
;
;		lea	ArtKosM_TtlBird,a1		; Load bird art
;		move.w	#$8400,d2			; ''
;		bsr.w	QueueKosMData			; ''
;
;		lea	ArtKosM_TtlGlove,a1		; Load glove art
;		move.w	#$8600,d2			; ''
;		bsr.w	QueueKosMData			; ''
;
;.WaitPLCs:
;		move.b	#vGeneral,rVINTRout.w		; Level load V-INT routine
;		jsr	ProcessKos.w			; Process Kosinski queue
;		jsr	VSync_Routine.w			; V-SYNC
;		jsr	ProcessKosM.w			; Process Kosinski Moduled queue
;		tst.b	rKosPMMods.w			; Are there still modules left?
;		bne.s	.WaitPLCs			; If so, branch
;		move.b	#vGeneral,rVINTRout.w		; Level load V-INT routine
;		jsr	VSync_Routine.w			; V-SYNC
;		
;		move.l	#ObjTtlSonic,rObj_0.w		; Load the Sonic object
;		move.w	#320+96,(rObj_0+oX).w		; Set X
;		move.w	#128,(rObj_0+oY).w		; Set Y
;
;		move.l	#ObjTtlBird,rObj_1.w		; Load the bird object
;		move.w	#-64,(rObj_1+oX).w		; Set X
;		move.w	#64,(rObj_1+oY).w		; Set Y
;
;		move.l	#ObjTtlGlove,rObj_2.w		; Load the glove object
;		move.w	#224,(rObj_2+oX).w		; Set X
;		move.w	#320,(rObj_2+oY).w		; Set Y
;
;		jsr	RunObjects.w			; Run objects
;		jsr	RenderObjects.w			; Render objects
;
;		clr.w	rPalCycTimer.w		; Reset palette cycle
;
;		bsr.w	FadeFromWhite			; Fade from white
;
;		lea	SampleList+$C0,a3		; Play title screen music
;		jsr	PlayDAC1			; ''
;
;.Loop:
;		move.b	#vTitle,rVINTRout.w		; V-SYNC
;		bsr.w	VSync_Routine			; ''
;
;		bsr.s	Title_Updates			; Do updates
;		
;		jsr	RunObjects.w			; Run objects
;		jsr	RenderObjects.w			; Render objects
;
;		lea	FreeMove_Cheat(pc),a0
;		lea	rMoveCheat.w,a1
;		lea	rCheatEntry.w,a2
;		bsr.w	Title_ChkCheats
;		lea	Art_Cheat(pc),a0
;		lea	rArtCheat.w,a1
;		lea	rCheatEntry2.w,a2
;		bsr.w	Title_ChkCheats
;
;		tst.b	rArtCheat.w
;		bne.w	BinbowieArt
;
;		tst.b	rP1Press.w			; Has start been pressed
;		bpl.s	.Loop				; If so, branch
;
;		st	(rObj_2+oGloveFlag).w		; Set the punch flag
;
;		lea	SampleList+$E0,a3		; Punch
;		jsr	PlayDAC1			; ''
;
;.PunchLoop:
;		move.b	#vTitle,rVINTRout.w		; V-SYNC
;		bsr.w	VSync_Routine			; ''
;
;		bsr.s	Title_Updates			; Do updates
;
;		jsr	RunObjects.w			; Run objects
;		jsr	RenderObjects.w			; Render objects
;		
;		tst.b	(rObj_2+oGloveTime).w		; Has the timer run out?
;		bpl.s	.PunchLoop			; If not, loop
;		
;		st	rStartFall.w			; Set flag to start the level by falling
;
;		move.b	#gLevel,rGameMode.w		; Set game mode to "level"
;		jmp	Level				; Go to level
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Palette cycle
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
;Title_Updates:
;		move.b	rLogoAngle.w,d0		; Get logo hover angle
;		addq.b	#4,rLogoAngle.w		; Increment angle
;		jsr	CalcSine.w			; Get sine
;		asr.w	#5,d0				; ''
;		move.w	d0,rVScrollFG.w		; Set logo's Y position
;
;		subq.b	#1,rPalCycTimer.w		; Decrement timer
;		bpl.s	.End				; If it hasn't run out, branch
;		move.b	#6,rPalCycTimer.w		; Reset timer
;		
;		moveq	#0,d0
;		move.b	rPalCycIndex.w,d0		; Get index
;		mulu.w	#$C,d0				; Turn into offset
;		lea	PalCyc_Title(pc,d0.w),a0	; Get pointer to palette data
;		lea	(rPalette+$14).w,a1		; Palette
;		move.w	(a0)+,(a1)+			; Load palette
;		move.w	(a0)+,(a1)+			; ''
;		move.w	(a0)+,(a1)+			; ''
;		move.w	(a0)+,(a1)+			; ''
;		move.w	(a0)+,(a1)+			; ''
;		move.w	(a0)+,(a1)+			; ''
;		
;		addq.b	#1,rPalCycIndex.w		; Increment index
;		cmpi.b	#6,rPalCycIndex.w		; Has it reached the end?
;		bcs.s	.End				; If not, branch
;		clr.b	rPalCycIndex.w		; Reset index

;.End:
;		rts
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
;PalCyc_Title:
;		dc.w	$00E, $08E, $0EE, $0E0, $E00, $808
;		dc.w	$08E, $0EE, $0E0, $E00, $808, $00E
;		dc.w	$0EE, $0E0, $E00, $808, $00E, $08E
;		dc.w	$0E0, $E00, $808, $00E, $08E, $0EE
;		dc.w	$E00, $808, $00E, $08E, $0EE, $0E0
;		dc.w	$808, $00E, $08E, $0EE, $0E0, $E00
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Check for cheats
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
;Title_ChkCheats:
;		tst.b	(a1)
;		bne.s	.End
;		move.w	(a2),d0
;		adda.w	d0,a0
;		move.b	rP1Press.w,d0
;		cmp.b	(a0),d0
;		bne.s	.ResetCheat
;		addq.w	#1,(a2)
;		tst.b	d0
;		bne.s	.End
;		st	(a1)
;		playSnd	#sRing, 2
;		rts
;
;.ResetCheat:
;		tst.b	d0
;		beq.s	.End
;		clr.w	(a2)
;
;.End:
;		rts
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
;FreeMove_Cheat:
;		dc.b	1, 2, 4, 8, 0, $FF
;		even
;Art_Cheat:
;		dc.b	1, 1, 2, 2, 4, 8, 4, 8, $40, $10, $40, $10, 0, $FF
;		even
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; BinBowie's art
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
;BinbowieArt:
;		bsr.w	FadeToWhite			; Fade to white
;		
;		lea	SampleList,a3
;		jsr	PlayDAC1
;
;		intsOff
;
;		jsr	ClearScreen.w
;
;		lea	MapEni_BinBowieArt(pc),a0	; Decompress mappings
;		lea	rBuffer,a1			; Decompress into RAM
;		moveq	#1,d0				; Base tile properties: Tile ID 1, no flags
;		bsr.w	EniDec				; Decompress!
;
;		lea	rBuffer,a1			; Load mappings
;		move.l	#$40000003,d0			; At (0, 0) on plane A
;		moveq	#$27,d1				; $28x$1C tiles
;		moveq	#$1B,d2				; ''
;		moveq	#0,d3				; Base tile properties: Tile ID 0, no flags
;		bsr.w	LoadPlaneMap			; Load the map
;
;		lea	Pal_BinBowieArt,a0		; Load palette to target buffer
;		move.w	#(Pal_BinBowieArt_End-Pal_BinBowieArt)>>1-1,d0
;		bsr.w	LoadTargetPal			; ''
;
;		lea	ArtKosM_BinBowieArt,a1		; Load art
;		move.w	#$20,d2				; ''
;		bsr.w	QueueKosMData			; ''
;
;.WaitPLCs:
;		move.b	#vGeneral,rVINTRout.w		; Level load V-INT routine
;		jsr	ProcessKos.w			; Process Kosinski queue
;		jsr	VSync_Routine.w			; V-SYNC
;		jsr	ProcessKosM.w			; Process Kosinski Moduled queue
;		tst.b	rKosPMMods.w			; Are there still modules left?
;		bne.s	.WaitPLCs			; If so, branch
;		move.b	#vGeneral,rVINTRout.w		; Level load V-INT routine
;		jsr	VSync_Routine.w			; V-SYNC
;
;		jsr	FadeFromWhite.w
;
;		lea	SampleList+$100,a3
;		jsr	PlayDAC1
;
;.Loop:
;		move.b	#vTitle,rVINTRout.w		; Level load V-INT routine
;		jsr	ProcessKos.w			; Process Kosinski queue
;		move.b	rP1Press.w,d0
;		andi.b	#%10010000,d0
;		beq.s	.Loop
;
;		jmp	TitleScreen2
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Objects
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
;		include	"Title Screen/Objects/Sonic/Code.asm"
;		include	"Title Screen/Objects/Bird/Code.asm"
;		include	"Title Screen/Objects/Glove/Code.asm"
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Art
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
;ArtKosM_TitleBG:
;		incbin	"Title Screen/Data/Art - Background.kosm.bin"
;		even
;ArtKosM_TitleLogo:
;		incbin	"Title Screen/Data/Art - Logo.kosm.bin"
;		even
;ArtKosM_BinBowieArt:
;		incbin	"Title Screen/Data/Art - BinBowie.kosm.bin"
;		even
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Plane mappings
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
;MapEni_TitleBG:
;		incbin	"Title Screen/Data/Map - Background.eni.bin"
;		even
;MapEni_TitleLogo:
;		incbin	"Title Screen/Data/Map - Logo.eni.bin"
;		even
;MapEni_BinBowieArt:
;		incbin	"Title Screen/Data/Map - BinBowie.eni.bin"
;		even
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Palette
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
;Pal_Title:
;		incbin	"Title Screen/Data/Palette.pal.bin"
;Pal_Title_End:
;		even
;Pal_BinBowieArt:
;		incbin	"Title Screen/Data/BinBowie Palette.pal.bin"
;Pal_BinBowieArt_End:
;		even
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; SEGA FMV
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
;		include	"Title Screen/SEGA FMV/FMV.asm"
; =========================================================================================================================================================