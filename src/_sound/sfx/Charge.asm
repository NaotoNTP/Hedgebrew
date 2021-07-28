PeeloutCharge_Header:
	sHeaderInit
	sHeaderPrio	$60
	sHeaderCh	$01

	sHeaderSFX	$80, $05, PeeloutCharge_FM5, $00, $05

; FM5 Data
PeeloutCharge_FM5:
	sVoice	$0A
	dc.b	nRst, $01
	ssMod68k	$01, $01, $09, $FF
	dc.b	nCs6, $22
	sModOn
	saVol	$02
	sModOff

PeeloutCharge_Jump00:
	dc.b	sHold, nAb6, $02
	ssJump	PeeloutCharge_Jump00
