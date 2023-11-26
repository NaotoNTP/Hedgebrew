Drown_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$02
	sHeaderSFX	$80, $04, Drown_FM4, $0C, $03
	sHeaderSFX	$80, $05, Drown_FM5, $0E, $03

Drown_FM4:
	sVoice		$10
	ssMod68k	$00, $01, $83, $0B

Drown_Loop1:
	dc.b nA0, $05, $05
	saVolFM		$03
	sLoop		$00, $0A, Drown_Loop1
	sStop	

Drown_FM5:
	dc.b nRst, $04
	sVoice		$10
	ssMod68k	$00, $01, $6F, $0D

Drown_Loop2:
	dc.b nC1, $04, $05
	saVolFM		$03
	sLoop		$00, $0A, Drown_Loop2
	sStop	
