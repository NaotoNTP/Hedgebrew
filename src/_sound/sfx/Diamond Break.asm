DiamondBreak_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $05, DiamondBreak_FM5, $00, $07

DiamondBreak_FM5:
	sVoice		$1E
	dc.b nA3, $08
	sStop	
