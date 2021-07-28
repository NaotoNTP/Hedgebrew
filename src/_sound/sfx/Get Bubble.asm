GetBubble_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $05, GetBubble_FM5, $0E, $00

GetBubble_FM5:
	sVoice		$07
	ssMod68k	$01, $01, $21, $6E
	dc.b nCs3, $07, nRst, $06
	ssMod68k	$01, $01, $44, $1E
	dc.b nAb3, $08
	sStop	
