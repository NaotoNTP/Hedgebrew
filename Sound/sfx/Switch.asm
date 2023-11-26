Switch_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $A0, Switch_PSG2, $0C, $00

Switch_PSG2:
	dc.b nBb4, $02
	sStop	
