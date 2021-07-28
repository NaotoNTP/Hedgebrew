SndJump_Header:
	sHeaderInit
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $05, SndJump_FM5, $EA, $09

SndJump_FM5:
	sVoice	$01
	saVol	$05
	dc.b nF3, $04
	saVol $FB
	ssMod68k	$01, $01, $34, $64
	dc.b nBb3, $15
	sStop
