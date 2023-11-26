Rumble_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $05, Rumble_FM5, $00, $00

Rumble_FM5:
	sVoice		$0B
	ssMod68k	$01, $01, $20, $08

Rumble_Loop1:
	dc.b nBb0, $0A
	sLoop		$00, $08, Rumble_Loop1

Rumble_Loop2:
	dc.b nBb0, $10
	saVolFM		$03
	sLoop		$00, $09, Rumble_Loop2
	sStop	
