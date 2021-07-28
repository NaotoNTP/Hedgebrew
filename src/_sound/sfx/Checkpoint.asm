Checkpoint_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $05, Checkpoint_FM5, $00, $01

Checkpoint_FM5:
	sVoice		$19
	dc.b nC5, 6, nA4, $16
	sStop	
