; --------------------------------------------------------------------------------
; Sprite mappings - output from SonMapEd - Sonic 3 & Knuckles format
; --------------------------------------------------------------------------------

SME_PS_OI:	
		dc.w SME_PS_OI_A-SME_PS_OI, SME_PS_OI_12-SME_PS_OI	
		dc.w SME_PS_OI_1A-SME_PS_OI, SME_PS_OI_22-SME_PS_OI	
		dc.w SME_PS_OI_3C-SME_PS_OI	
SME_PS_OI_A:	dc.b 0, 1	
		dc.b $F8, 9, 0, 0, $FF, $F4	
SME_PS_OI_12:	dc.b 0, 1	
		dc.b $F0, $F, 0, $20, $FF, $F0	
SME_PS_OI_1A:	dc.b 0, 1	
		dc.b $F0, $F, 0, $30, $FF, $F0	
SME_PS_OI_22:	dc.b 0, 4	
		dc.b $EC, $A, 0, 6, $FF, $EC	
		dc.b $EC, 5, 0, $F, 0, 4	
		dc.b 4, 5, $18, $F, $FF, $EC	
		dc.b $FC, $A, $18, 6, $FF, $FC	
SME_PS_OI_3C:	dc.b 0, 4	
		dc.b $EC, $A, 0, $13, $FF, $EC	
		dc.b $EC, 5, 0, $1C, 0, 4	
		dc.b 4, 5, $18, $1C, $FF, $EC	
		dc.b $FC, $A, $18, $13, $FF, $FC	
		even