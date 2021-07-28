WallSmash_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$02
	sHeaderSFX	$80, $05, WallSmash_FM5, $00, $00
	sHeaderSFX	$80, $C0, WallSmash_PSG3, $0C, $00

WallSmash_FM5:
	sVoice		$0F
	ssMod68k	$03, $01, $20, $04

WallSmash_Loop2:
	dc.b nC0, $18
	saVolFM		$0A
	sLoop		$00, $06, WallSmash_Loop2
	sStop	

WallSmash_PSG3:
	ssMod68k	$01, $01, $0F, $05
	sNoisePSG	$E7

WallSmash_Loop1:
	dc.b nB3, $18, sHold
	saVolPSG	$18
	sLoop		$00, $05, WallSmash_Loop1
	sStop	
