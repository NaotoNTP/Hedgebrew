BreakItem_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $05, BreakItem_FM5, $00, $00

BreakItem_FM5:
	ssMod68k	$03, $01, $72, $0B
	sVoice		$04
	dc.b nA4, $16
	sStop	
