Warp_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $05, Warp_FM5, $00, $02

Warp_FM5:
	sVoice		$16
	ssMod68k	$01, $01, $5B, $02
	dc.b nEb6, $65
	sStop	
