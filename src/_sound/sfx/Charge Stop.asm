PeeloutStop_Header:
	sHeaderInit
	sHeaderPrio	$60
	sHeaderCh   $01

	sHeaderSFX $80, $05, PeeloutStop_FM5,	$00, $00

; FM5 Data
PeeloutStop_FM5:
	sStop
