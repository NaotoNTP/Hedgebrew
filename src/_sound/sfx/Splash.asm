Splash_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$02
	sHeaderSFX	$80, $04, Splash_FM4, $10, $08
	sHeaderSFX	$80, $05, Splash_FM5, $00, $00

Splash_FM4:
	sVoice		$1A
	ssMod68k	$02, $01, $20, $03
	dc.b nC0, $06

Splash_Loop1:
	dc.b nC0, $0E
	saVolFM		$0E
	sLoop		$00, $04, Splash_Loop1
	sStop

Splash_FM5:
	sVoice		$1B
	dc.b nCs3, $06, $14
	sStop	
