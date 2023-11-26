SpikeMove_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$02
	sHeaderSFX	$80, $04, SpikeMove_FM5, $00, $0A
	sHeaderSFX	$80, $05, SpikeMove_FM4, $00, $00

SpikeMove_FM5:
	sVoice		$1D
	ssMod68k	$00, $01, $60, $00
	dc.b nC4, 5
	sModOff
	saDetune	$0A
	saVolFM		$F6
	sJump		SpikeMove_Jump01

SpikeMove_FM4:
	dc.b nRst, 5

SpikeMove_Jump01:
	sVoice		$1C
	dc.b nFs7, 1, nRst, 1, nFs7, $11
	sVoice		$00
	sStop
