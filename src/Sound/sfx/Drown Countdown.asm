DrownCountdown_Header:
	sHeaderInit	
	sHeaderPrio	$60
	sHeaderCh	$01
	sHeaderSFX	$80, $04, DrownCountdown_FM4, $04, $08

DrownCountdown_FM4:
	sVoice		$14

DrownCountdown_Loop1:
	sCall		DrownCountdown_Call1
	saTranspose	$05
	saVolFM		$08
	sLoop		$01, $03, DrownCountdown_Loop1
	saTranspose	$EC
	saVolFM		$E0
	sStop

DrownCountdown_Call1:
	dc.b nC2, $02
	saTranspose	$01
	sLoop		$00, $0A, DrownCountdown_Call1
	saTranspose	$F6
	sRet