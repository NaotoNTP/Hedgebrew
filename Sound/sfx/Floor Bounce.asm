FloorBounce_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $05, FloorBounce_FM5, $00, $00

FloorBounce_FM5:
	sVoice		$18
	dc.b nG2, $0F
	saVol		$0F
	sLoop		$00, $04, FloorBounce_FM5
	sStop	
