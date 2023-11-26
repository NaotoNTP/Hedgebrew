; ---------------------------------------------------------------------------
; Animation script - springs
; ---------------------------------------------------------------------------
		dc.w byte_18FEE-Ani_ObjSpring
		dc.w byte_18FF1-Ani_ObjSpring
		dc.w byte_18FFD-Ani_ObjSpring
		dc.w byte_19000-Ani_ObjSpring
		dc.w byte_1900C-Ani_ObjSpring
		dc.w byte_1900F-Ani_ObjSpring
byte_18FEE:
		dc.b  $F, 0, $FF
		even
byte_18FF1:
		dc.b 0, 1, 1, 1, 1, 1, 1, $FD, 0
		even
byte_18FFD:
		dc.b $F, 2, $FF
		even
byte_19000:
		dc.b 0, 3, 3, 3, 3, 3, 3, $FD, 2
		even
byte_1900C:
		dc.b $F, 4, $FF
		even
byte_1900F:
		dc.b 0, 5, 5, 5, 5, 5, 5, $FD, 4
		even