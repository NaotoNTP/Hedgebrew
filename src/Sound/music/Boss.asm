Boss_Header:
	sHeaderInit
	sHeaderTempo	$01, $1D
	sHeaderCh	$05, $03

	sHeaderDAC	Boss_DAC2
	sHeaderDAC	Boss_DAC
	sHeaderFM	Boss_FM1,	$0C, $0A
	sHeaderFM	Boss_FM2,	$0C, $06
	sHeaderFM	Boss_FM3,	$0C, $08
	sHeaderFM	Boss_FM4,	$00, $0F
	sHeaderFM	Boss_FM5,	$00, $0F
	sHeaderPSG	Boss_PSG1,	$E8-$0C, $04, $00, v0C
	sHeaderPSG	Boss_PSG2,	$E8-$0C, $06, $00, v0C
	sHeaderPSG	Boss_PSG3,	$FE-$0C, $03, $00, v04

; FM1 Data
Boss_FM1:
	sVoice        $56

Boss_Jump01:
	sNoteTimeOut        $08
	sCall            Boss_Call02
	sNoteTimeOut        $0A

Boss_Loop0B:
	dc.b	nE1, $0C, nE2
	sLoop            $00, $04, Boss_Loop0B
	sNoteTimeOut        $08
	sCall            Boss_Call02
	sNoteTimeOut        $0A
	dc.b	nE1, $0C, nE2, nFs1, nFs2, nG1, nG2, nAb1, nAb2

Boss_Loop0C:
	sCall            Boss_Call03
	dc.b	nG1, $0C, nG2, $06, nG2, nG1, $0C, nG2, $06, nG2
	sCall            Boss_Call03
	dc.b	nE1, $0C, nE2, $06, nE2, nE1, $0C, nE2, $06, nE2
	sLoop            $00, $04, Boss_Loop0C
	ssJump            Boss_Jump01

Boss_Call03:
	dc.b	nA1, $0C, nA2, $06, nA2, nA1, $0C, nA2, $06, nA2, nA1, $0C
	dc.b	nA2, $06, nA2, nA1, $0C, nA2, $06, nA2, nG1, $0C, nG2, $06
	dc.b	nG2, nG1, $0C, nG2, $06, nG2
	sRet

Boss_Call02:
	dc.b	nA1, $0C, nA2, nA2, nA1, nA2, nA2, nA1, nA2
	sRet

; PSG1 Data
Boss_PSG1:
; PSG2 Data
Boss_PSG2:
Boss_DAC2:
	sStop

; FM2 Data
Boss_FM2:
	sVoice        $58

Boss_Loop09:
	sNoteTimeOut        $08
	dc.b	nA3, $0C, nE3, nE3, nA3, nE3, nE3, nA3, nE3
	sNoteTimeOut        $17
	dc.b	nB3, $18, nB3, nB3, nB3
	sLoop            $00, $02, Boss_Loop09
	saTranspose      $F4
	sVoice        $59

Boss_Loop0A:
	sCall            Boss_Call01
	sLoop            $00, $04, Boss_Loop0A
	saTranspose      $0C
	ssJump            Boss_FM2

Boss_Call01:
	dc.b	nA3, $06, nRst, nB3, nRst, nC4, $18, nD4, nC4, nB3, $06, nRst
	dc.b	nC4, nRst, nB3, nRst, nG3, $18, nE3, $06, nRst, nG3, $18, nA3
	dc.b	$06, nRst, nB3, nRst, nC4, $18, nD4, nC4, nB3, $06, nRst, nC4
	dc.b	nRst, nD4, nRst, nEb4, nRst, nE4, $0C, nRst, $24
	sRet

; FM3 Data
Boss_FM3:
	sVoice        $58

Boss_Loop06:
	sNoteTimeOut        $08
	dc.b	nC4, $0C, nA3, nA3, nC4, nA3, nA3, nC4, nA3
	sNoteTimeOut        $17
	dc.b	nAb3, $18, nAb3, nAb3, nAb3
	sLoop            $00, $02, Boss_Loop06

Boss_Loop07:
	dc.b	nRst, $30
	sLoop            $00, $10, Boss_Loop07
	ssDetune       $03
	saVol        $FC

Boss_Loop08:
	sCall            Boss_Call01
	sLoop            $00, $02, Boss_Loop08
	ssDetune       $00
	saVol        $04
	ssJump            Boss_FM3

; FM4 Data
Boss_FM4:
	sPan             spLeft, $00
	ssDetune       $02
	ssMod68k          $0C, $01, $04, $04
	ssJump            Boss_Jump00

; FM5 Data
Boss_FM5:
	sPan             spRight, $00
	ssMod68k          $0C, $01, $FC, $04

Boss_Jump00:
	sModOff
	sVoice        $57
	dc.b	nRst, $30, nRst, $24, nD5, $06, nE5, nF5, $0C, nF5, nE5, nE5
	dc.b	nD5, nD5, nE5, nRst, nRst, $30, nRst, $24, nD5, $06, nE5, nF5
	dc.b	$0C, nE5, nEb5, nE5, nAb5, $18, nE5

Boss_Loop05:
	dc.b	nRst, $30, nRst
	sLoop            $00, $04, Boss_Loop05
	sModOn
	saVol        $02
	sCall            Boss_Call00
	dc.b	nG3
	sCall            Boss_Call00
	dc.b	nAb3, nC5, sHold, $18, nD5, $0C, nC5, nB4, $30, nG4, nC5, sHold
	dc.b	$18, nD5, $0C, nC5, nB4, $30, nAb4
	saVol        $F5
	sVoice        $58
	dc.b	nC5, $06, nRst, nD5, nRst, nE5, $18, nF5, nE5, nD5, $06, nRst
	dc.b	nE5, nRst, nD5, nRst, nB4, $18, nG4, $06, nRst, nB4, $18, nC5
	dc.b	$06, nRst, nD5, nRst, nE5, $18, nF5, nE5, nD5, $06, nRst, nE5
	dc.b	nRst, nF5, nRst, nFs5, nRst, nAb5, $0C, nRst, $24
	saVol        $09
	ssJump            Boss_Jump00

Boss_Call00:
	dc.b	nC4, $30, sHold, $18, nD4, $0C, nC4, nB3, $30
	sRet

; PSG3 Data
Boss_PSG3:
	sNoisePSG         $E7
	sNoteTimeOut        $05

Boss_Loop0D:
	dc.b	nA5, $24, $24, $18, nRst, $30, nRst
	sLoop            $00, $02, Boss_Loop0D

Boss_Loop0E:
	dc.b	nA5, $18
	sLoop            $00, $40, Boss_Loop0E
	ssJump            Boss_Loop0D

; DAC Data
Boss_DAC:
	dc.b	dSnare, $0C, dSnare, dSnare, dSnare, dSnare, dSnare, dSnare, dSnare, dTomMid, $0C, dTomL
	dc.b	dTomMid, dTomL, dTomMid, dTomL, dTomMid, dTomL
	sLoop            $00, $02, Boss_DAC
	dc.b	dKick, $0C, dSnare, $06, dSnare

Boss_Loop00:
	dc.b	dKick, $0C, dSnare, $06, dSnare
	sLoop            $00, $06, Boss_Loop00
	dc.b	dKick, $0C, dSnare, $02, dTomMid, $04, dSnare, $02, dTomMid, $04, dTomL, $0C
	dc.b	dSnare, $06, dSnare

Boss_Loop01:
	dc.b	dKick, $0C, dSnare, $06, dSnare
	sLoop            $00, $05, Boss_Loop01
	dc.b	dKick, $0C, dSnare, $02, dTomMid, $04, dSnare, $02, dTomMid, $04, dTomL, $0C
	dc.b	dSnare, $02, dTomMid, $04, dSnare, $02, dTomMid, $04, dTomL, $0C, dSnare, $06
	dc.b	dSnare
	sLoop            $01, $03, Boss_Loop00

Boss_Loop02:
	dc.b	dKick, $0C, dSnare, $06, dSnare
	sLoop            $00, $06, Boss_Loop02
	dc.b	dKick, $0C, dSnare, $02, dTomMid, $04, dSnare, $02, dTomMid, $04, dTomL, $0C
	dc.b	dSnare, $06, dSnare

Boss_Loop03:
	dc.b	dKick, $0C, dSnare, $06, dSnare
	sLoop            $00, $03, Boss_Loop03

Boss_Loop04:
	dc.b	dTomL, $0C, dSnare, $02, dTomMid, $04, dSnare, $02, dTomMid, $04
	sLoop            $00, $04, Boss_Loop04
	ssJump            Boss_DAC
