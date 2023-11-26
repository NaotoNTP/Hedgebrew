; ---------------------------------------------------------------------------
; Animation script - Sonic
; ---------------------------------------------------------------------------
SonicAniData:
		dc.w SonicAni_Walk-SonicAniData
		dc.w SonicAni_Run-SonicAniData
		dc.w SonicAni_Roll-SonicAniData
		dc.w SonicAni_Roll2-SonicAniData
		dc.w SonicAni_Push-SonicAniData
		dc.w SonicAni_Wait-SonicAniData
		dc.w SonicAni_Balance-SonicAniData
		dc.w SonicAni_LookUp-SonicAniData
		dc.w SonicAni_Duck-SonicAniData
		dc.w SonicAni_Sprint-SonicAniData
		dc.w SonicAni_Hang-SonicAniData
		dc.w SonicAni_Seizure-SonicAniData
		dc.w SonicAni_Blank-SonicAniData
		dc.w SonicAni_Skid-SonicAniData
		dc.w SonicAni_Float1-SonicAniData
		dc.w SonicAni_Float2-SonicAniData
		dc.w SonicAni_Spring-SonicAniData
		dc.w SonicAni_Blank-SonicAniData
		dc.w SonicAni_Blank-SonicAniData
		dc.w SonicAni_Blank-SonicAniData
		dc.w SonicAni_Blank-SonicAniData
		dc.w SonicAni_Bubble-SonicAniData
		dc.w SonicAni_Blank-SonicAniData
		dc.w SonicAni_Drown-SonicAniData
		dc.w SonicAni_Death-SonicAniData
		dc.w SonicAni_Blank-SonicAniData
		dc.w SonicAni_Hurt-SonicAniData
		dc.w SonicAni_Slide-SonicAniData
		dc.w SonicAni_Blank-SonicAniData
		dc.w SonicAni_Float3-SonicAniData
		dc.w SonicAni_Float4-SonicAniData
SonicAni_Blank:		dc.b 1, 0, $FD, 0
SonicAni_Walk:		dc.b $FF, $08, $09, $0A, $0B, $06, $07, $FF
SonicAni_Run:		dc.b $FF, $1E, $1F, $20, $21, $FF, $FF,	$FF
SonicAni_Sprint:	dc.b $FF, $58, $59, $5A, $5B, $FF, $FF, $FF
SonicAni_Roll:		dc.b $FE, $2E, $2F, $30, $31, $32, $FF,	$FF
SonicAni_Roll2:		dc.b $FE, $2E, $2F, $32, $30, $31, $32,	$FF
SonicAni_Push:		dc.b $FD, $45, $46, $47, $48, $FF, $FF,	$FF
SonicAni_Wait:		dc.b $17, 1, 1,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 3, 2, 2, 2, 3, 4, $FE, 2, 0
SonicAni_Balance:	dc.b $1F, $3A, $3B, $FF
SonicAni_LookUp:	dc.b $3F, 5, $FF, 0
SonicAni_Duck:		dc.b $3F, $39, $FF, 0
SonicAni_Skid:		dc.b 7,	$37, $38, $FF
SonicAni_Float1:	dc.b 7,	$3C, $3F, $FF
SonicAni_Float2:	dc.b 7,	$3C, $3D, $53, $3E, $54, $FF, 0
SonicAni_Spring:	dc.b $2F, $40, $FD, 0
SonicAni_Hang:		dc.b $FC, $78, $79, $78, $77, $FF
SonicAni_Bubble:	dc.b $B, $56, $56, $A, $B, $FD,	0, 0
SonicAni_Drown:		dc.b $2F, $4C, $FF, 0
SonicAni_Death:		dc.b 3,	$4D, $FF, 0
SonicAni_Hurt:		dc.b 3,	$55, $FF, 0
SonicAni_Slide:		dc.b 7, $55, $57, $FF
SonicAni_Float3:	dc.b 3,	$3C, $3D, $53, $3E, $54, $FF, 0
SonicAni_Float4:	dc.b 3,	$3C, $FD, 0
SonicAni_Seizure:	dc.b 2, $7A, $7B, $7C, $7D, $FF
		even
