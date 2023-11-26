; =========================================================================================================================================================
; End splash screen
; =========================================================================================================================================================

; ---------------------------------------------------------------------------------------------------------------------------------------------------------
Ending:
		bra.s	Ending
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
;		playSnd	#Mus_Stop, 1			; Stop sound
;
;		intsOff					; Disable interrupts
;
;		lea	VDP_CTRL,a5
;		move.w	#$8004,(a5)			; $8004 - Disable H-INT, H/V Counter
;		move.w	#$8134,(a5)			; $8134 - Disable display, enable V-INT, enable DMA, V28
;		move.w	#$8230,(a5)			; $8230 - Plane A at $C000
;		move.w	#$8407,(a5)			; $8407 - Plane B at $E000
;		move.w	#$9001,(a5)			; $9001 - 64x32 cell plane area
;		move.w	#$9200,(a5)			; $9200 - Window V position at default
;		move.w	#$8B00,(a5)			; $8B03 - V-Scroll by screen, H-Scroll by screen
;		move.w	#$8700,(a5)			; $8700 - BG color pal 0 color 0
;		clr.w	rDMAQueue.w			; Set stop token at the beginning of the DMA queue
;		move.w	#rDMAQueue,rDMASlot.w	; Reset the DMA queue slot
;
;		jsr	ClearScreen.w			; Clear screen
;
;		lea	MapEni_End(pc),a0		; Decompress background mappings
;		lea	rBuffer,a1			; Decompress into RAM
;		moveq	#1,d0				; Base tile properties: Tile ID 1, no flags
;		jsr	EniDec.w			; Decompress!
;
;		lea	rBuffer,a1			; Load mappings
;		move.l	#$60000003,d0			; At (0, 0) on plane A
;		moveq	#$27,d1				; $28x$1C tiles
;		moveq	#$1B,d2				; ''
;		moveq	#0,d3				; Base tile properties: Tile ID 0, no flags
;		jsr	LoadPlaneMap.w			; Load the map
;
;		lea	ArtKosM_End,a1			; Load background art
;		move.w	#$20,d2				; ''
;		jsr	QueueKosMData.w			; ''
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
;		lea	SampleList+$F0,a3
;		jsr	PlayDAC1
;
;		lea	Pal_End(pc),a0			; Load palette to target buffer
;		move.w	#(Pal_End_End-Pal_End)>>1-1,d0	; ''
;		jsr	LoadPalette.w			; ''
;
;		displayOn
;
;.Loop:
;		move.b	#vTitle,rVINTRout.w		; V-SYNC
;		jsr	VSync_Routine.w			; ''
;		bra.s	.Loop
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Art
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
;ArtKosM_End:
;		incbin	"Ending/Data/Art - Background.kosm.bin"
;		even
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Plane mappings
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
;MapEni_End:
;		incbin	"Ending/Data/Map - Background.eni.bin"
;		even
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
; Palette
; ---------------------------------------------------------------------------------------------------------------------------------------------------------
;Pal_End:
;		incbin	"Ending/Data/Palette.pal.bin"
;Pal_End_End:
;		even
; =========================================================================================================================================================