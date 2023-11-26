Push_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $05, Push_FM5, $00, $06

Push_FM5:
	sVoice		$13
	dc.b nD1, $07, nRst, $02, nD1, $06, nRst, $10
	sStop	
