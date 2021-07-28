; --------------------------------------------------------------------------------
; Sprite mappings - output from SonMapEd - Sonic 3 & Knuckles format
; --------------------------------------------------------------------------------

SME_3VuTU:	
		dc.w SME_3VuTU_6-SME_3VuTU, SME_3VuTU_E-SME_3VuTU	
		dc.w SME_3VuTU_16-SME_3VuTU	
SME_3VuTU_6:	dc.b 0, 1	
		dc.b $F0, $F, 0, 0, $FF, $F0	
SME_3VuTU_E:	dc.b 0, 1	
		dc.b $F4, $A, 0, $29, $FF, $F4	
SME_3VuTU_16:	dc.b 0, 4	
		dc.b $EC, $F, 0, $10, $FF, $EC	
		dc.b $EC, 3, 0, $20, 0, $C	
		dc.b $C, $C, 0, $24, $FF, $EC	
		dc.b $C, 0, 0, $28, 0, $C	
		even