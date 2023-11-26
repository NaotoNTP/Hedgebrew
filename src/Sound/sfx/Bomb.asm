Bomb_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $05, Bomb_FM5, $00, $00

Bomb_FM5:
	sVoice		$09
	dc.b nA0, $22
	sStop	
