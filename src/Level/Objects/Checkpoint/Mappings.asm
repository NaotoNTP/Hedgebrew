; --------------------------------------------------------------------------------
; Sprite mappings - output from SonMapEd - Sonic 3 & Knuckles format
; --------------------------------------------------------------------------------

SME_JjCUP:	
		dc.w SME_JjCUP_A-SME_JjCUP, SME_JjCUP_24-SME_JjCUP	
		dc.w SME_JjCUP_38-SME_JjCUP, SME_JjCUP_40-SME_JjCUP	
		dc.w SME_JjCUP_48-SME_JjCUP	
SME_JjCUP_A:	dc.b 0, 4	
		dc.b $E8, 1, $20, 4, $FF, $FC	
		dc.b $F8, 3, $20, 6, $FF, $F8	
		dc.b $F8, 3, $28, 6, 0, 0	
		dc.b $D8, 5, 0, 0, $FF, $F8	
SME_JjCUP_24:	dc.b 0, 3	
		dc.b $E8, 1, $20, 4, $FF, $FC	
		dc.b $F8, 3, $20, 6, $FF, $F8	
		dc.b $F8, 3, $28, 6, 0, 0	
SME_JjCUP_38:	dc.b 0, 1	
		dc.b $F8, 5, 0, 0, $FF, $F8	
SME_JjCUP_40:	dc.b 0, 1	
		dc.b $F8, 5, $20, 0, $FF, $F8	
SME_JjCUP_48:	dc.b 0, 4	
		dc.b $E8, 1, $20, 4, $FF, $FC	
		dc.b $F8, 3, $20, 6, $FF, $F8	
		dc.b $F8, 3, $28, 6, 0, 0	
		dc.b $D8, 5, $20, 0, $FF, $F8	
		even