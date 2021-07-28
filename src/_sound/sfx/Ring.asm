Ring_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $05, Ring_FM5, $00, $0A

Ring_FM5:
	sVoice		$03
	dc.b nE5, $05, nG5, $05, nC6, $1B
	sStop	
