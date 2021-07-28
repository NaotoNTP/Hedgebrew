; --------------------------------------------------------------------------------
; Sprite mappings - output from SonMapEd - Sonic 3 & Knuckles format
; --------------------------------------------------------------------------------

SME_k4ulR:	
		dc.w SME_k4ulrA-SME_k4ulR, SME_k4ulrC-SME_k4ulR	
		dc.w SME_k4ulr14-SME_k4ulR, SME_k4ulr1C-SME_k4ulR	
		dc.w SME_k4ulr24-SME_k4ulR	
SME_k4ulrA:	dc.b 0, 1	
		dc.b $F8, 5, 0, 0, $FF, $F8
SME_k4ulrC:	dc.b 0, 1	
		dc.b $F8, 5, $18, 4, $FF, $F8	
SME_k4ulr14:	dc.b 0, 1	
		dc.b $F8, 5, $18, 4, $FF, $F8	
SME_k4ulr1C:	dc.b 0, 1	
		dc.b $F8, 5, 8, 4, $FF, $F8	
SME_k4ulr24:	dc.b 0, 1	
		dc.b $F8, 5, $10, 4, $FF, $F8	
		even