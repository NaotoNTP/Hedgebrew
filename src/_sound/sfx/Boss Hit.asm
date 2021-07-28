BossHit_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $05, BossHit_FM4, $00, $00

BossHit_FM4:
	sVoice		$0F
	ssMod68k	$01, $01, $0C, $01

BossHit_Loop1:
	dc.b nC0, $0A
	saVol		$10
	sLoop		$00, $04, BossHit_Loop1
	sStop	
