Death_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $05, Death_FM5, $F4, $00

Death_FM5:
	sVoice		$02
	dc.b nB3, $07, sHold, nAb3

Death_Loop1:
	dc.b $01
	saVol		$01
	sLoop		$00, $2F, Death_Loop1
	sStop	
