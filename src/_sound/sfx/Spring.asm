Spring_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $04, Spring_FM4, $00, $02

Spring_FM4:
	sVoice		$06
	dc.b nRst, $01
	ssMod68k	$03, $01, $5D, $0F
	dc.b nB3, $0C
	sModOff	

Spring_Loop1:
	dc.b sHold
	saVol		$02
	dc.b nC5, $02
	sLoop		$00, $19, Spring_Loop1
	sStop	
