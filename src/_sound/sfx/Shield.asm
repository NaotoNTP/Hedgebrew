Shield_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $05, Shield_FM5, $0C, $00

Shield_FM5:
	sVoice		$05
	dc.b nRst, $01, nBb2, $05, sHold, nB2, $26
	sStop	
