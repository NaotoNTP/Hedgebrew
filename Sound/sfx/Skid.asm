Skid_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$02
	sHeaderSFX	$80, $04, Skid_FM4, $F6, $10
	sHeaderSFX	$80, $05, Skid_FM5, $F7, $10

Skid_FM4:
	sVoice		$00

Skid_Loop1:
	dc.b nBb3, $01, nRst, $01
	sLoop		$00, $0B, Skid_Loop1
	sStop	

Skid_FM5:
	sVoice		$00
	dc.b nRst, $01

Skid_Loop2:
	dc.b nAb3, $01, nRst, $01
	sLoop		$00, $0B, Skid_Loop2
	sStop	
