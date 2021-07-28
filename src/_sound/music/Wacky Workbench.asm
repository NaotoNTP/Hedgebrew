; Level music was replaced with a silent music track, since I did not create the music, 
; nor do I currently have permission to share it.

Mus_WWZ_Header:
	sHeaderInit
	sHeaderTempo	$02, $33
	sHeaderCh	$05, $03
	sHeaderDAC	Mus_WWZ_DAC2
	sHeaderDAC	Mus_WWZ_DAC
	sHeaderFM	Mus_WWZ_FM1, $00, $0A
	sHeaderFM	Mus_WWZ_FM2, $00, $11
	sHeaderFM	Mus_WWZ_FM3, $00, $10
	sHeaderFM	Mus_WWZ_FM4, $00, $10
	sHeaderFM	Mus_WWZ_FM5, $00, $0C
	sHeaderPSG	Mus_WWZ_PSG1, $00, $20>>3, $00, v00
	sHeaderPSG	Mus_WWZ_PSG2, $00, $40>>3, $00, v00
	sHeaderPSG	Mus_WWZ_PSG3, $00, $18>>3, $00, v00

Mus_WWZ_DAC:
Mus_WWZ_DAC2:
Mus_WWZ_FM1:
Mus_WWZ_FM2:
Mus_WWZ_FM3:
Mus_WWZ_FM4:
Mus_WWZ_FM5:
Mus_WWZ_PSG1:
Mus_WWZ_PSG2:
Mus_WWZ_PSG3:
	sStop
