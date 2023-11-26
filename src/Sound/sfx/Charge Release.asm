Peelout_Release_Header:
	sHeaderInit
	sHeaderPrio	$60
	sHeaderCh	$02

	sHeaderSFX	$80, $04, Peelout_Release_FM4, $00, $00
	sHeaderSFX	$80, $05, Peelout_Release_FM5, $00, $08

; FM4 Data
Peelout_Release_FM4:
	sVoice		$0C
	ssMod68k	$01, $01, $C5, $1A
	dc.b		nE6, $07
	saVol		$09
	sPan		spCenter, $00
	sVoice		$0A
	ssMod68k	$03, $01, $09, $FF
	dc.b		nCs7, $25
	sModOff

Peelout_Release_Loop00:
	dc.b		sHold
	saVol		$01
	dc.b		nG7, $02
	sLoop		$00, $2A, Peelout_Release_Loop00
	sStop

; FM5 Data
Peelout_Release_FM5:
	sVoice		$0B
	ssMod68k	$01, $01, $20, $08
	dc.b		nRst, $0A

Peelout_Release_Loop01:
	dc.b		nG0, $0F
	sLoop		$00, $03, Peelout_Release_Loop01

Peelout_Release_Loop02:
	dc.b		nG0, $0A
	saVol		$05
	sLoop		$00, $06, Peelout_Release_Loop02
	sStop
