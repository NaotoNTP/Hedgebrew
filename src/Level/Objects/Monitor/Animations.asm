; ---------------------------------------------------------------------------
; Animation script - monitors
; ---------------------------------------------------------------------------
		dc.w .Static-Ani_ObjMonitor
		dc.w .Eggman-Ani_ObjMonitor
		dc.w .Rings-Ani_ObjMonitor
		dc.w .Shoes-Ani_ObjMonitor
		dc.w .Shield-Ani_ObjMonitor
		dc.w .Stars-Ani_ObjMonitor
		dc.w .Destroyed-Ani_ObjMonitor
.Static:	dc.b 1, 0, 1, $FF, 0
.Eggman:	dc.b 1, 0, 2, 2, 1, 2, 2, $FF, 0
.Rings:		dc.b 1, 0, 3, 3, 1, 3, 3, $FF, 0
.Shoes:		dc.b 1, 0, 4, 4, 1, 4, 4, $FF, 0
.Shield:	dc.b 1, 0, 5, 5, 1, 5, 5, $FF, 0
.Stars:		dc.b 1, 0, 6, 6, 1, 6, 6, $FF, 0
.Destroyed:	dc.b 1, 0, 1, 7, $FE, 1, 0
		even