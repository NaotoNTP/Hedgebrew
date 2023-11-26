RingLoss_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$02
	sHeaderSFX	$80, $04, RingLoss_FM4, $00, $05
	sHeaderSFX	$80, $05, RingLoss_FM5, $00, $08

RingLoss_FM4:
	sVoice		$03
	dc.b nA5, $02, $05, $05, $05, $05, $05, $05, $3A
	sStop	

RingLoss_FM5:
	sVoice		$03
	dc.b nRst, $02, nG5, $02, $05, $15, $02, $05, $32
	sStop	
