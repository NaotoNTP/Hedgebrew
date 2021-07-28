Signpost_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$02
	sHeaderSFX	$80, $04, Signpost_FM4, $27, $03
	sHeaderSFX	$80, $05, Signpost_FM5, $27, $00

Signpost_FM4:
	dc.b nRst, $04
Signpost_FM5:
	sVoice		$12

Signpost_Loop1:
	dc.b nEb4, $05
	saVolFM		$02
	sLoop		$00, $15, Signpost_Loop1
	sStop	
