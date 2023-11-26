BumperHeader:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$03
	sHeaderSFX	$80, $05, BumperFM5, $00, $00
	sHeaderSFX	$80, $04, BumperFM4, $00, $00
	sHeaderSFX	$80, $02, BumperFM3, $00, $02

BumperFM5:
	sVoice		$0D
	ssJump		BumperJump1

BumperFM4:
	sVoice		$0D
	saDetune	$07
	dc.b nRst, $01

BumperJump1:
	dc.b nA4, $20
	sStop	

BumperFM3:
	sVoice		$0E
	dc.b nCs2, $03
	sStop	
