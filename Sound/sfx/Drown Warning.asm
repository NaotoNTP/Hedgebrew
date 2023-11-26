DrownWarning_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $05, DrownWarning_FM5, $00, $04

DrownWarning_FM5:
	sVoice		$11
	dc.b nC7, $06, $40
	sStop	
