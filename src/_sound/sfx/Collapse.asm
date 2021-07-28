Collapse_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$02
	sHeaderSFX	$80, $05, Collapse_FM5, $00, $00
	sHeaderSFX	$80, $C0, Collapse_PSG3, $0C, $00

Collapse_FM5:
	sVoice		$0F
	ssMod68k	$03, $01, $20, $04

Collapse_Loop2:
	dc.b nC0, $18
	saVol		$0A
	sLoop		$00, $06, Collapse_Loop2
	sStop	

Collapse_PSG3:
	ssMod68k	$01, $01, $0F, $05
	sNoisePSG	$E7

Collapse_Loop1:
	dc.b nB3, $18, sHold
	saVolPSG	$18
	sLoop		$00, $05, Collapse_Loop1
	sStop	
