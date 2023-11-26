

; ------------------------------------------------------------------------
; AMPS music patch list
; -------------------------------------------------------------------------

	; Patch $00
	; $2A
	; $02, $32, $03, $01,	$5F, $5F, $9F, $9C
	; $9F, $1F, $9F, $04,	$00, $00, $00, $07
	; $15, $15, $15, $F5,	$05, $08, $0C, $1A
	spAlgorithm	$02
	spFeedback	$05
	spDetune	$00, $00, $03, $00
	spMultiple	$02, $03, $02, $01
	spRateScale	$01, $02, $01, $02
	spAttackRt	$1F, $1F, $1F, $1C
	spAmpMod	$01, $01, $00, $00
	spSustainRt	$1F, $1F, $1F, $04
	spDecayRt	$00, $00, $00, $07
	spSustainLv	$01, $01, $01, $0F
	spReleaseRt	$05, $05, $05, $05
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$05, $0C, $08, $1A

	; Patch $01
	; $38
	; $01, $00, $01, $00,	$1F, $1F, $1F, $1F
	; $00, $00, $00, $0D,	$0E, $00, $00, $1F
	; $00, $00, $00, $30,	$1C, $11, $28, $04
	spAlgorithm	$00
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$01, $01, $00, $00
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $0D
	spDecayRt	$0E, $00, $00, $1F
	spSustainLv	$00, $00, $00, $03
	spReleaseRt	$00, $00, $00, $00
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$1C, $28, $11, $04

	; Patch $02
	; $21
	; $00, $00, $00, $00,	$1F, $1F, $1F, $1F
	; $0B, $08, $0F, $0B,	$01, $13, $1F, $1F
	; $14, $B4, $44, $14,	$7F, $7F, $14, $04
	spAlgorithm	$01
	spFeedback	$04
	spDetune	$00, $00, $00, $00
	spMultiple	$00, $00, $00, $00
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0B, $0F, $08, $0B
	spDecayRt	$01, $1F, $13, $1F
	spSustainLv	$01, $04, $0B, $01
	spReleaseRt	$04, $04, $04, $04
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$7F, $14, $7F, $04

	; Patch $03
	; $34
	; $74, $02, $6B, $02,	$1F, $53, $53, $11
	; $11, $1F, $12, $01,	$00, $00, $00, $00
	; $2B, $0B, $F9, $69,	$2A, $0C, $13, $04
	spAlgorithm	$04
	spFeedback	$06
	spDetune	$07, $06, $00, $00
	spMultiple	$04, $0B, $02, $02
	spRateScale	$00, $01, $01, $00
	spAttackRt	$1F, $13, $13, $11
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$11, $12, $1F, $01
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$02, $0F, $00, $06
	spReleaseRt	$0B, $09, $0B, $09
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$2A, $13, $0C, $04

	; Patch $04
	; $24
	; $10, $01, $31, $11,	$9B, $5C, $1B, $5C
	; $0A, $10, $0A, $10,	$03, $04, $03, $04
	; $1F, $0C, $8F, $0C,	$06, $05, $04, $05
	spAlgorithm	$04
	spFeedback	$04
	spDetune	$01, $03, $00, $01
	spMultiple	$00, $01, $01, $01
	spRateScale	$02, $00, $01, $01
	spAttackRt	$1B, $1B, $1C, $1C
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0A, $0A, $10, $10
	spDecayRt	$03, $03, $04, $04
	spSustainLv	$01, $08, $00, $00
	spReleaseRt	$0F, $0F, $0C, $0C
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$06, $04, $05, $05

	; Patch $05
	; $38
	; $56, $15, $10, $72,	$1F, $1F, $1F, $1F
	; $08, $08, $0A, $00,	$07, $07, $07, $06
	; $F0, $F5, $F6, $F8,	$2C, $28, $12, $05
	spAlgorithm	$00
	spFeedback	$07
	spDetune	$05, $01, $01, $07
	spMultiple	$06, $00, $05, $02
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$08, $0A, $08, $00
	spDecayRt	$07, $07, $07, $06
	spSustainLv	$0F, $0F, $0F, $0F
	spReleaseRt	$00, $06, $05, $08
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$2C, $12, $28, $05

	; Patch $06
	; $02
	; $71, $32, $06, $01,	$5F, $5E, $9F, $9C
	; $02, $06, $05, $04,	$08, $07, $08, $07
	; $F8, $F8, $F8, $F8,	$00, $10, $07, $05
	spAlgorithm	$02
	spFeedback	$00
	spDetune	$07, $00, $03, $00
	spMultiple	$01, $06, $02, $01
	spRateScale	$01, $02, $01, $02
	spAttackRt	$1F, $1F, $1E, $1C
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$02, $05, $06, $04
	spDecayRt	$08, $08, $07, $07
	spSustainLv	$0F, $0F, $0F, $0F
	spReleaseRt	$08, $08, $08, $08
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$00, $07, $10, $05

	; Patch $07
	; $3D
	; $01, $01, $01, $01,	$8E, $52, $14, $4C
	; $08, $08, $0E, $03,	$00, $00, $00, $00
	; $1F, $1F, $1F, $1F,	$1B, $05, $05, $05
	spAlgorithm	$05
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$01, $01, $01, $01
	spRateScale	$02, $00, $01, $01
	spAttackRt	$0E, $14, $12, $0C
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$08, $0E, $08, $03
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$01, $01, $01, $01
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$1B, $05, $05, $05

	; Patch $08
	; $0D
	; $77, $65, $05, $15,	$1F, $5F, $5F, $5F
	; $00, $10, $08, $10,	$00, $03, $05, $04
	; $0F, $FC, $8C, $CC,	$1F, $05, $05, $05
	spAlgorithm	$05
	spFeedback	$01
	spDetune	$07, $00, $06, $01
	spMultiple	$07, $05, $05, $05
	spRateScale	$00, $01, $01, $01
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $08, $10, $10
	spDecayRt	$00, $05, $03, $04
	spSustainLv	$00, $08, $0F, $0C
	spReleaseRt	$0F, $0C, $0C, $0C
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$1F, $05, $05, $05

	; Patch $09
	; $32
	; $71, $0D, $33, $01,	$5F, $99, $5F, $94
	; $05, $05, $05, $07,	$02, $02, $02, $02
	; $11, $11, $11, $72,	$23, $2D, $26, $05
	spAlgorithm	$02
	spFeedback	$06
	spDetune	$07, $03, $00, $00
	spMultiple	$01, $03, $0D, $01
	spRateScale	$01, $01, $02, $02
	spAttackRt	$1F, $1F, $19, $14
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$05, $05, $05, $07
	spDecayRt	$02, $02, $02, $02
	spSustainLv	$01, $01, $01, $07
	spReleaseRt	$01, $01, $01, $02
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$23, $26, $2D, $05

	; Patch $0A
	; $08
	; $0A, $70, $30, $00,	$1F, $1F, $5F, $5F
	; $12, $0E, $0A, $0A,	$00, $04, $04, $03
	; $2F, $2F, $2F, $2F,	$22, $2E, $13, $04
	spAlgorithm	$00
	spFeedback	$01
	spDetune	$00, $03, $07, $00
	spMultiple	$0A, $00, $00, $00
	spRateScale	$00, $01, $00, $01
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$12, $0A, $0E, $0A
	spDecayRt	$00, $04, $04, $03
	spSustainLv	$02, $02, $02, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$22, $13, $2E, $04

	; Patch $0B
	; $28
	; $39, $35, $30, $31,	$1F, $1F, $1F, $1F
	; $0C, $0A, $07, $0A,	$07, $07, $07, $09
	; $26, $16, $16, $F6,	$17, $32, $14, $05
	spAlgorithm	$00
	spFeedback	$05
	spDetune	$03, $03, $03, $03
	spMultiple	$09, $00, $05, $01
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0C, $07, $0A, $0A
	spDecayRt	$07, $07, $07, $09
	spSustainLv	$02, $01, $01, $0F
	spReleaseRt	$06, $06, $06, $06
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$17, $14, $32, $05

	; Patch $0C
	; $3D
	; $6F, $22, $62, $22,	$1F, $1F, $1F, $1F
	; $0F, $0F, $0F, $0F,	$08, $08, $08, $08
	; $25, $25, $25, $25,	$1E, $36, $05, $09
	spAlgorithm	$05
	spFeedback	$07
	spDetune	$06, $06, $02, $02
	spMultiple	$0F, $02, $02, $02
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0F, $0F, $0F, $0F
	spDecayRt	$08, $08, $08, $08
	spSustainLv	$02, $02, $02, $02
	spReleaseRt	$05, $05, $05, $05
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$1E, $05, $36, $09

	; Patch $0D
	; $06
	; $61, $03, $32, $71,	$1F, $1F, $1F, $1F
	; $00, $00, $00, $00,	$00, $00, $00, $00
	; $07, $07, $07, $07,	$1E, $0A, $05, $05
	spAlgorithm	$06
	spFeedback	$00
	spDetune	$06, $03, $00, $07
	spMultiple	$01, $02, $03, $01
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$07, $07, $07, $07
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$1E, $05, $0A, $05

	; Patch $0E
	; $24
	; $31, $71, $61, $16,	$11, $55, $14, $55
	; $1F, $01, $00, $04,	$00, $00, $00, $01
	; $11, $97, $05, $A7,	$04, $05, $00, $05
	spAlgorithm	$04
	spFeedback	$04
	spDetune	$03, $06, $07, $01
	spMultiple	$01, $01, $01, $06
	spRateScale	$00, $00, $01, $01
	spAttackRt	$11, $14, $15, $15
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$1F, $00, $01, $04
	spDecayRt	$00, $00, $00, $01
	spSustainLv	$01, $00, $09, $0A
	spReleaseRt	$01, $05, $07, $07
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$04, $00, $05, $05

	; Patch $0F
	; $36
	; $72, $02, $01, $01,	$D8, $47, $8D, $87
	; $01, $04, $01, $05,	$00, $05, $07, $00
	; $51, $14, $15, $14,	$11, $05, $7F, $7F
	spAlgorithm	$06
	spFeedback	$06
	spDetune	$07, $00, $00, $00
	spMultiple	$02, $01, $02, $01
	spRateScale	$03, $02, $01, $02
	spAttackRt	$18, $0D, $07, $07
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$01, $01, $04, $05
	spDecayRt	$00, $07, $05, $00
	spSustainLv	$05, $01, $01, $01
	spReleaseRt	$01, $05, $04, $04
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$11, $7F, $05, $7F

	; Patch $10
	; $24
	; $10, $01, $31, $11,	$9B, $5C, $1B, $5C
	; $0A, $10, $0A, $10,	$03, $04, $03, $04
	; $1F, $0C, $8F, $0C,	$06, $05, $04, $05
	spAlgorithm	$04
	spFeedback	$04
	spDetune	$01, $03, $00, $01
	spMultiple	$00, $01, $01, $01
	spRateScale	$02, $00, $01, $01
	spAttackRt	$1B, $1B, $1C, $1C
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0A, $0A, $10, $10
	spDecayRt	$03, $03, $04, $04
	spSustainLv	$01, $08, $00, $00
	spReleaseRt	$0F, $0F, $0C, $0C
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$06, $04, $05, $05

	; Patch $11
	; $23
	; $30, $75, $30, $70,	$08, $1F, $1D, $5B
	; $8B, $16, $96, $95,	$01, $00, $00, $00
	; $8B, $3A, $3A, $3A,	$05, $0D, $0B, $02
	spAlgorithm	$03
	spFeedback	$04
	spDetune	$03, $03, $07, $07
	spMultiple	$00, $00, $05, $00
	spRateScale	$00, $00, $00, $01
	spAttackRt	$08, $1D, $1F, $1B
	spAmpMod	$01, $01, $00, $01
	spSustainRt	$0B, $16, $16, $15
	spDecayRt	$01, $00, $00, $00
	spSustainLv	$08, $03, $03, $03
	spReleaseRt	$0B, $0A, $0A, $0A
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$05, $0B, $0D, $02

	; Patch $12
	; $2C
	; $70, $32, $00, $00,	$9F, $1F, $5F, $5E
	; $1A, $15, $0C, $05,	$08, $06, $02, $09
	; $28, $AA, $BA, $8A,	$08, $05, $0B, $05
	spAlgorithm	$04
	spFeedback	$05
	spDetune	$07, $00, $03, $00
	spMultiple	$00, $00, $02, $00
	spRateScale	$02, $01, $00, $01
	spAttackRt	$1F, $1F, $1F, $1E
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$1A, $0C, $15, $05
	spDecayRt	$08, $02, $06, $09
	spSustainLv	$02, $0B, $0A, $08
	spReleaseRt	$08, $0A, $0A, $0A
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$08, $0B, $05, $05

	; Patch $13
	; $35
	; $77, $03, $74, $32,	$1A, $14, $56, $17
	; $97, $9F, $9D, $9F,	$13, $0F, $0F, $0E
	; $7C, $1D, $1D, $1D,	$13, $04, $02, $06
	spAlgorithm	$05
	spFeedback	$06
	spDetune	$07, $07, $00, $03
	spMultiple	$07, $04, $03, $02
	spRateScale	$00, $01, $00, $00
	spAttackRt	$1A, $16, $14, $17
	spAmpMod	$01, $01, $01, $01
	spSustainRt	$17, $1D, $1F, $1F
	spDecayRt	$13, $0F, $0F, $0E
	spSustainLv	$07, $01, $01, $01
	spReleaseRt	$0C, $0D, $0D, $0D
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$13, $02, $04, $06

	; Patch $14
	; $35
	; $21, $31, $20, $15,	$8E, $9B, $95, $94
	; $00, $05, $00, $80,	$01, $02, $02, $02
	; $47, $37, $19, $07,	$19, $05, $0E, $08
	spAlgorithm	$05
	spFeedback	$06
	spDetune	$02, $02, $03, $01
	spMultiple	$01, $00, $01, $05
	spRateScale	$02, $02, $02, $02
	spAttackRt	$0E, $15, $1B, $14
	spAmpMod	$00, $00, $00, $01
	spSustainRt	$00, $00, $05, $00
	spDecayRt	$01, $02, $02, $02
	spSustainLv	$04, $01, $03, $00
	spReleaseRt	$07, $09, $07, $07
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$19, $0E, $05, $08

	; Patch $15
	; $35
	; $22, $32, $21, $34,	$8E, $9B, $8F, $94
	; $00, $05, $00, $80,	$01, $02, $02, $02
	; $07, $36, $17, $08,	$15, $12, $14, $05
	spAlgorithm	$05
	spFeedback	$06
	spDetune	$02, $02, $03, $03
	spMultiple	$02, $01, $02, $04
	spRateScale	$02, $02, $02, $02
	spAttackRt	$0E, $0F, $1B, $14
	spAmpMod	$00, $00, $00, $01
	spSustainRt	$00, $00, $05, $00
	spDecayRt	$01, $02, $02, $02
	spSustainLv	$00, $01, $03, $00
	spReleaseRt	$07, $07, $06, $08
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$15, $14, $12, $05

	; Patch $16
	; $2B
	; $31, $32, $35, $31,	$1F, $59, $9E, $5E
	; $06, $80, $80, $85,	$01, $17, $12, $0A
	; $AA, $AF, $F9, $FC,	$0E, $12, $46, $05
	spAlgorithm	$03
	spFeedback	$05
	spDetune	$03, $03, $03, $03
	spMultiple	$01, $05, $02, $01
	spRateScale	$00, $02, $01, $01
	spAttackRt	$1F, $1E, $19, $1E
	spAmpMod	$00, $01, $01, $01
	spSustainRt	$06, $00, $00, $05
	spDecayRt	$01, $12, $17, $0A
	spSustainLv	$0A, $0F, $0A, $0F
	spReleaseRt	$0A, $09, $0F, $0C
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$0E, $46, $12, $05

	; Patch $17
	; $04
	; $00, $00, $01, $02,	$9F, $1F, $9F, $1F
	; $8A, $8A, $91, $94,	$0E, $0A, $0E, $0E
	; $F8, $48, $F8, $F8,	$17, $04, $07, $04
	spAlgorithm	$04
	spFeedback	$00
	spDetune	$00, $00, $00, $00
	spMultiple	$00, $01, $00, $02
	spRateScale	$02, $02, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$01, $01, $01, $01
	spSustainRt	$0A, $11, $0A, $14
	spDecayRt	$0E, $0E, $0A, $0E
	spSustainLv	$0F, $0F, $04, $0F
	spReleaseRt	$08, $08, $08, $08
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$17, $07, $04, $04

	; Patch $18
	; $3A
	; $71, $0C, $33, $01,	$5F, $5F, $5F, $5F
	; $84, $89, $84, $8A,	$00, $01, $03, $06
	; $15, $12, $16, $28,	$25, $2F, $25, $03
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$07, $03, $00, $00
	spMultiple	$01, $03, $0C, $01
	spRateScale	$01, $01, $01, $01
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$01, $01, $01, $01
	spSustainRt	$04, $04, $09, $0A
	spDecayRt	$00, $03, $01, $06
	spSustainLv	$01, $01, $01, $02
	spReleaseRt	$05, $06, $02, $08
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$25, $25, $2F, $03

	; Patch $19
	; $3A
	; $04, $02, $08, $02,	$1F, $1F, $1F, $1F
	; $00, $00, $00, $11,	$15, $0F, $0B, $1F
	; $00, $00, $00, $50,	$09, $07, $3F, $04
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$04, $08, $02, $02
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $11
	spDecayRt	$15, $0B, $0F, $1F
	spSustainLv	$00, $00, $00, $05
	spReleaseRt	$00, $00, $00, $00
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$09, $3F, $07, $04

	; Patch $1A
	; $39
	; $11, $0C, $00, $00,	$1F, $5F, $D4, $D3
	; $07, $15, $0B, $0A,	$00, $10, $06, $01
	; $17, $8D, $06, $06,	$27, $24, $0C, $05
	spAlgorithm	$01
	spFeedback	$07
	spDetune	$01, $00, $00, $00
	spMultiple	$01, $00, $0C, $00
	spRateScale	$00, $03, $01, $03
	spAttackRt	$1F, $14, $1F, $13
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$07, $0B, $15, $0A
	spDecayRt	$00, $06, $10, $01
	spSustainLv	$01, $00, $08, $00
	spReleaseRt	$07, $06, $0D, $06
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$27, $0C, $24, $05

	; Patch $1B
	; $3A
	; $60, $70, $21, $13,	$1F, $1F, $1F, $1F
	; $08, $09, $09, $09,	$00, $00, $00, $00
	; $FF, $FF, $FF, $FF,	$2C, $3C, $16, $05
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$06, $02, $07, $01
	spMultiple	$00, $01, $00, $03
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$08, $09, $09, $09
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$0F, $0F, $0F, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$2C, $16, $3C, $05

	; Patch $1C
	; $3A
	; $62, $62, $20, $13,	$1F, $1F, $1F, $1F
	; $05, $10, $05, $08,	$1F, $1F, $1F, $1F
	; $FF, $FF, $FF, $FF,	$2C, $3C, $16, $05
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$06, $02, $06, $01
	spMultiple	$02, $00, $02, $03
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$05, $05, $10, $08
	spDecayRt	$1F, $1F, $1F, $1F
	spSustainLv	$0F, $0F, $0F, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$2C, $16, $3C, $05

	; Patch $1D
	; $17
	; $08, $70, $70, $30,	$1F, $19, $1C, $5F
	; $93, $8F, $93, $95,	$00, $09, $06, $09
	; $2F, $3F, $0C, $1A,	$05, $13, $20, $0B
	spAlgorithm	$07
	spFeedback	$02
	spDetune	$00, $07, $07, $03
	spMultiple	$08, $00, $00, $00
	spRateScale	$00, $00, $00, $01
	spAttackRt	$1F, $1C, $19, $1F
	spAmpMod	$01, $01, $01, $01
	spSustainRt	$13, $13, $0F, $15
	spDecayRt	$00, $06, $09, $09
	spSustainLv	$02, $00, $03, $01
	spReleaseRt	$0F, $0C, $0F, $0A
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$05, $20, $13, $0B

	; Patch $1E
	; $33
	; $52, $60, $1B, $31,	$9A, $1F, $9C, $9F
	; $08, $1F, $09, $19,	$00, $00, $00, $02
	; $05, $16, $07, $08,	$23, $04, $19, $05
	spAlgorithm	$03
	spFeedback	$06
	spDetune	$05, $01, $06, $03
	spMultiple	$02, $0B, $00, $01
	spRateScale	$02, $02, $00, $02
	spAttackRt	$1A, $1C, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$08, $09, $1F, $19
	spDecayRt	$00, $00, $00, $02
	spSustainLv	$00, $00, $01, $00
	spReleaseRt	$05, $07, $06, $08
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$23, $19, $04, $05

	; Patch $1F
	; $1B
	; $31, $13, $71, $52,	$18, $10, $16, $13
	; $17, $9F, $1F, $1F,	$00, $00, $00, $00
	; $06, $01, $07, $0C,	$0C, $10, $0E, $05
	spAlgorithm	$03
	spFeedback	$03
	spDetune	$03, $07, $01, $05
	spMultiple	$01, $01, $03, $02
	spRateScale	$00, $00, $00, $00
	spAttackRt	$18, $16, $10, $13
	spAmpMod	$00, $00, $01, $00
	spSustainRt	$17, $1F, $1F, $1F
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$06, $07, $01, $0C
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$0C, $0E, $10, $05

	; Patch $20
	; $11
	; $01, $75, $64, $31,	$1F, $9F, $5F, $9F
	; $04, $88, $06, $01,	$02, $02, $02, $02
	; $81, $31, $51, $6A,	$08, $12, $16, $05
	spAlgorithm	$01
	spFeedback	$02
	spDetune	$00, $06, $07, $03
	spMultiple	$01, $04, $05, $01
	spRateScale	$00, $01, $02, $02
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $01, $00
	spSustainRt	$04, $06, $08, $01
	spDecayRt	$02, $02, $02, $02
	spSustainLv	$08, $05, $03, $06
	spReleaseRt	$01, $01, $01, $0A
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$08, $16, $12, $05

	; Patch $21
	; $22
	; $50, $05, $10, $00,	$D8, $DD, $DD, $9F
	; $04, $05, $08, $0B,	$00, $00, $00, $06
	; $FC, $FF, $FC, $FF,	$14, $16, $2B, $02
	spAlgorithm	$02
	spFeedback	$04
	spDetune	$05, $01, $00, $00
	spMultiple	$00, $00, $05, $00
	spRateScale	$03, $03, $03, $02
	spAttackRt	$18, $1D, $1D, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$04, $08, $05, $0B
	spDecayRt	$00, $00, $00, $06
	spSustainLv	$0F, $0F, $0F, $0F
	spReleaseRt	$0C, $0C, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$14, $2B, $16, $02

	; Patch $22
	; $35
	; $01, $00, $72, $31,	$9F, $14, $52, $52
	; $0A, $8A, $8A, $0A,	$09, $0E, $0F, $10
	; $11, $26, $26, $26,	$0F, $08, $05, $05
	spAlgorithm	$05
	spFeedback	$06
	spDetune	$00, $07, $00, $03
	spMultiple	$01, $02, $00, $01
	spRateScale	$02, $01, $00, $01
	spAttackRt	$1F, $12, $14, $12
	spAmpMod	$00, $01, $01, $00
	spSustainRt	$0A, $0A, $0A, $0A
	spDecayRt	$09, $0F, $0E, $10
	spSustainLv	$01, $02, $02, $02
	spReleaseRt	$01, $06, $06, $06
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$0F, $05, $08, $05

	; Patch $23
	; $0D
	; $50, $02, $14, $00,	$9D, $5E, $9D, $5C
	; $8C, $09, $8B, $02,	$00, $00, $09, $00
	; $FF, $FF, $FF, $FF,	$0C, $10, $0B, $05
	spAlgorithm	$05
	spFeedback	$01
	spDetune	$05, $01, $00, $00
	spMultiple	$00, $04, $02, $00
	spRateScale	$02, $02, $01, $01
	spAttackRt	$1D, $1D, $1E, $1C
	spAmpMod	$01, $01, $00, $00
	spSustainRt	$0C, $0B, $09, $02
	spDecayRt	$00, $09, $00, $00
	spSustainLv	$0F, $0F, $0F, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$0C, $0B, $10, $05

	; Patch $24
	; $35
	; $30, $01, $70, $30,	$5F, $57, $56, $5F
	; $19, $0A, $0A, $0A,	$0F, $0F, $0F, $0F
	; $05, $35, $35, $35,	$13, $05, $05, $05
	spAlgorithm	$05
	spFeedback	$06
	spDetune	$03, $07, $00, $03
	spMultiple	$00, $00, $01, $00
	spRateScale	$01, $01, $01, $01
	spAttackRt	$1F, $16, $17, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$19, $0A, $0A, $0A
	spDecayRt	$0F, $0F, $0F, $0F
	spSustainLv	$00, $03, $03, $03
	spReleaseRt	$05, $05, $05, $05
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$13, $05, $05, $05

	; Patch $25
	; $3B
	; $00, $01, $00, $03,	$1F, $1F, $16, $14
	; $03, $02, $02, $00,	$02, $02, $02, $1F
	; $22, $14, $13, $15,	$0E, $04, $23, $04
	spAlgorithm	$03
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$00, $00, $01, $03
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $16, $1F, $14
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$03, $02, $02, $00
	spDecayRt	$02, $02, $02, $1F
	spSustainLv	$02, $01, $01, $01
	spReleaseRt	$02, $03, $04, $05
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$0E, $23, $04, $04

	; Patch $26
	; $3B
	; $30, $50, $33, $10,	$59, $55, $19, $1A
	; $00, $00, $00, $00,	$1F, $1F, $1F, $03
	; $7E, $17, $27, $17,	$0F, $00, $0D, $05
	spAlgorithm	$03
	spFeedback	$07
	spDetune	$03, $03, $05, $01
	spMultiple	$00, $03, $00, $00
	spRateScale	$01, $00, $01, $00
	spAttackRt	$19, $19, $15, $1A
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$1F, $1F, $1F, $03
	spSustainLv	$07, $02, $01, $01
	spReleaseRt	$0E, $07, $07, $07
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$0F, $0D, $00, $05

	; Patch $27
	; $35
	; $21, $31, $20, $14,	$8E, $9B, $95, $94
	; $00, $05, $00, $80,	$01, $02, $02, $02
	; $4F, $3F, $1F, $0F,	$16, $06, $08, $05
	spAlgorithm	$05
	spFeedback	$06
	spDetune	$02, $02, $03, $01
	spMultiple	$01, $00, $01, $04
	spRateScale	$02, $02, $02, $02
	spAttackRt	$0E, $15, $1B, $14
	spAmpMod	$00, $00, $00, $01
	spSustainRt	$00, $00, $05, $00
	spDecayRt	$01, $02, $02, $02
	spSustainLv	$04, $01, $03, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$16, $08, $06, $05

	; Patch $28
	; $24
	; $01, $33, $00, $00,	$12, $0A, $0D, $0C
	; $00, $8F, $03, $0F,	$00, $00, $00, $00
	; $4F, $1F, $1F, $1F,	$03, $05, $10, $05
	spAlgorithm	$04
	spFeedback	$04
	spDetune	$00, $00, $03, $00
	spMultiple	$01, $00, $03, $00
	spRateScale	$00, $00, $00, $00
	spAttackRt	$12, $0D, $0A, $0C
	spAmpMod	$00, $00, $01, $00
	spSustainRt	$00, $03, $0F, $0F
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$04, $01, $01, $01
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$03, $10, $05, $05

	; Patch $29
	; $29
	; $33, $50, $02, $25,	$9D, $56, $13, $5E
	; $01, $01, $00, $01,	$15, $0F, $0C, $0F
	; $4F, $3F, $3F, $3F,	$13, $10, $1B, $05
	spAlgorithm	$01
	spFeedback	$05
	spDetune	$03, $00, $05, $02
	spMultiple	$03, $02, $00, $05
	spRateScale	$02, $00, $01, $01
	spAttackRt	$1D, $13, $16, $1E
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$01, $00, $01, $01
	spDecayRt	$15, $0C, $0F, $0F
	spSustainLv	$04, $03, $03, $03
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$13, $1B, $10, $05

	; Patch $2A
	; $2B
	; $31, $32, $35, $31,	$1F, $59, $9E, $5E
	; $80, $80, $80, $85,	$01, $17, $12, $0A
	; $AA, $AF, $F9, $FC,	$0F, $12, $46, $05
	spAlgorithm	$03
	spFeedback	$05
	spDetune	$03, $03, $03, $03
	spMultiple	$01, $05, $02, $01
	spRateScale	$00, $02, $01, $01
	spAttackRt	$1F, $1E, $19, $1E
	spAmpMod	$01, $01, $01, $01
	spSustainRt	$00, $00, $00, $05
	spDecayRt	$01, $12, $17, $0A
	spSustainLv	$0A, $0F, $0A, $0F
	spReleaseRt	$0A, $09, $0F, $0C
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$0F, $46, $12, $05

	; Patch $2B
	; $04
	; $70, $70, $30, $31,	$9F, $1F, $9F, $1F
	; $80, $80, $9F, $8E,	$00, $00, $12, $00
	; $09, $09, $09, $09,	$33, $05, $08, $05
	spAlgorithm	$04
	spFeedback	$00
	spDetune	$07, $03, $07, $03
	spMultiple	$00, $00, $00, $01
	spRateScale	$02, $02, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$01, $01, $01, $01
	spSustainRt	$00, $1F, $00, $0E
	spDecayRt	$00, $12, $00, $00
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$09, $09, $09, $09
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$33, $08, $05, $05

	; Patch $2C
	; $1F
	; $16, $61, $03, $52,	$1C, $9F, $1F, $1F
	; $92, $8F, $8F, $8F,	$00, $00, $00, $00
	; $FF, $0F, $0F, $0F,	$05, $05, $05, $05
	spAlgorithm	$07
	spFeedback	$03
	spDetune	$01, $00, $06, $05
	spMultiple	$06, $03, $01, $02
	spRateScale	$00, $00, $02, $00
	spAttackRt	$1C, $1F, $1F, $1F
	spAmpMod	$01, $01, $01, $01
	spSustainRt	$12, $0F, $0F, $0F
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$0F, $00, $00, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$05, $05, $05, $05

	; Patch $2D
	; $2C
	; $74, $74, $34, $34,	$12, $12, $12, $12
	; $80, $80, $80, $80,	$00, $01, $00, $01
	; $07, $37, $07, $37,	$16, $05, $17, $05
	spAlgorithm	$04
	spFeedback	$05
	spDetune	$07, $03, $07, $03
	spMultiple	$04, $04, $04, $04
	spRateScale	$00, $00, $00, $00
	spAttackRt	$12, $12, $12, $12
	spAmpMod	$01, $01, $01, $01
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$00, $00, $01, $01
	spSustainLv	$00, $00, $03, $03
	spReleaseRt	$07, $07, $07, $07
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$16, $17, $05, $05

	; Patch $2E
	; $07
	; $34, $74, $32, $70,	$1F, $1F, $1F, $1F
	; $0A, $0A, $05, $03,	$00, $00, $00, $00
	; $3F, $3F, $2F, $2F,	$05, $05, $05, $05
	spAlgorithm	$07
	spFeedback	$00
	spDetune	$03, $03, $07, $07
	spMultiple	$04, $02, $04, $00
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0A, $05, $0A, $03
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$03, $02, $03, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$05, $05, $05, $05

	; Patch $2F
	; $3A
	; $70, $76, $30, $71,	$1F, $95, $1F, $1F
	; $0E, $0F, $05, $0C,	$07, $06, $06, $07
	; $2F, $4F, $1F, $5F,	$18, $0E, $0F, $02
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$07, $03, $07, $07
	spMultiple	$00, $00, $06, $01
	spRateScale	$00, $00, $02, $00
	spAttackRt	$1F, $1F, $15, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0E, $05, $0F, $0C
	spDecayRt	$07, $06, $06, $07
	spSustainLv	$02, $01, $04, $05
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$18, $0F, $0E, $02

	; Patch $30
	; $20
	; $34, $38, $30, $31,	$DF, $DF, $9F, $9F
	; $07, $08, $08, $0A,	$07, $0E, $0A, $11
	; $20, $1F, $1F, $1F,	$22, $37, $14, $00
	spAlgorithm	$00
	spFeedback	$04
	spDetune	$03, $03, $03, $03
	spMultiple	$04, $00, $08, $01
	spRateScale	$03, $02, $03, $02
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$07, $08, $08, $0A
	spDecayRt	$07, $0A, $0E, $11
	spSustainLv	$02, $01, $01, $01
	spReleaseRt	$00, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$22, $14, $37, $00

	; Patch $31
	; $3A
	; $31, $7F, $61, $0A,	$9C, $DB, $9C, $9A
	; $04, $08, $03, $09,	$03, $01, $00, $00
	; $1F, $0F, $FF, $FF,	$23, $25, $1B, $06
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$03, $06, $07, $00
	spMultiple	$01, $01, $0F, $0A
	spRateScale	$02, $02, $03, $02
	spAttackRt	$1C, $1C, $1B, $1A
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$04, $03, $08, $09
	spDecayRt	$03, $00, $01, $00
	spSustainLv	$01, $0F, $00, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$23, $1B, $25, $06

	; Patch $32
	; $04
	; $02, $02, $03, $03,	$13, $10, $13, $10
	; $06, $0C, $06, $0C,	$00, $00, $00, $00
	; $4F, $2F, $4F, $2F,	$18, $06, $18, $06
	spAlgorithm	$04
	spFeedback	$00
	spDetune	$00, $00, $00, $00
	spMultiple	$02, $03, $02, $03
	spRateScale	$00, $00, $00, $00
	spAttackRt	$13, $13, $10, $10
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$06, $06, $0C, $0C
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$04, $04, $02, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$18, $18, $06, $06

	; Patch $33
	; $38
	; $75, $13, $71, $11,	$DF, $5F, $1F, $1F
	; $0C, $0D, $01, $01,	$00, $00, $00, $00
	; $FF, $FF, $FF, $FF,	$1E, $1E, $1E, $03
	spAlgorithm	$00
	spFeedback	$07
	spDetune	$07, $07, $01, $01
	spMultiple	$05, $01, $03, $01
	spRateScale	$03, $00, $01, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0C, $01, $0D, $01
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$0F, $0F, $0F, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$1E, $1E, $1E, $03

	; Patch $34
	; $34
	; $74, $21, $16, $71,	$11, $1F, $1F, $1F
	; $08, $05, $08, $09,	$00, $00, $00, $00
	; $FF, $FF, $FF, $FF,	$17, $05, $10, $05
	spAlgorithm	$04
	spFeedback	$06
	spDetune	$07, $01, $02, $07
	spMultiple	$04, $06, $01, $01
	spRateScale	$00, $00, $00, $00
	spAttackRt	$11, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$08, $08, $05, $09
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$0F, $0F, $0F, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$17, $10, $05, $05

	; Patch $35
	; $38
	; $41, $11, $71, $41,	$16, $13, $0F, $17
	; $02, $0C, $05, $01,	$00, $0F, $00, $00
	; $1F, $3F, $5F, $1F,	$2A, $12, $24, $04
	spAlgorithm	$00
	spFeedback	$07
	spDetune	$04, $07, $01, $04
	spMultiple	$01, $01, $01, $01
	spRateScale	$00, $00, $00, $00
	spAttackRt	$16, $0F, $13, $17
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$02, $05, $0C, $01
	spDecayRt	$00, $00, $0F, $00
	spSustainLv	$01, $05, $03, $01
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$2A, $24, $12, $04

	; Patch $36
	; $3D
	; $01, $01, $01, $01,	$94, $19, $19, $19
	; $0F, $0D, $0D, $0D,	$07, $04, $04, $04
	; $25, $1A, $1A, $1A,	$15, $05, $05, $05
	spAlgorithm	$05
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$01, $01, $01, $01
	spRateScale	$02, $00, $00, $00
	spAttackRt	$14, $19, $19, $19
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0F, $0D, $0D, $0D
	spDecayRt	$07, $04, $04, $04
	spSustainLv	$02, $01, $01, $01
	spReleaseRt	$05, $0A, $0A, $0A
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$15, $05, $05, $05

	; Patch $37
	; $3A
	; $31, $77, $32, $02,	$1C, $13, $0E, $4E
	; $04, $10, $09, $0A,	$0C, $00, $03, $00
	; $16, $2B, $24, $18,	$1D, $13, $2A, $04
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$03, $03, $07, $00
	spMultiple	$01, $02, $07, $02
	spRateScale	$00, $00, $00, $01
	spAttackRt	$1C, $0E, $13, $0E
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$04, $09, $10, $0A
	spDecayRt	$0C, $03, $00, $00
	spSustainLv	$01, $02, $02, $01
	spReleaseRt	$06, $04, $0B, $08
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$1D, $2A, $13, $04

	; Patch $38
	; $03
	; $01, $78, $39, $3A,	$1F, $1F, $1F, $1F
	; $06, $00, $08, $0A,	$00, $00, $00, $00
	; $F4, $02, $56, $F5,	$33, $1B, $43, $04
	spAlgorithm	$03
	spFeedback	$00
	spDetune	$00, $03, $07, $03
	spMultiple	$01, $09, $08, $0A
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$06, $08, $00, $0A
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$0F, $05, $00, $0F
	spReleaseRt	$04, $06, $02, $05
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$33, $43, $1B, $04

	; Patch $39
	; $3A
	; $01, $07, $01, $01,	$8E, $8E, $8D, $53
	; $0E, $0E, $0E, $03,	$00, $00, $00, $00
	; $13, $FA, $13, $0A,	$18, $1E, $27, $04
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$01, $01, $07, $01
	spRateScale	$02, $02, $02, $01
	spAttackRt	$0E, $0D, $0E, $13
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0E, $0E, $0E, $03
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$01, $01, $0F, $00
	spReleaseRt	$03, $03, $0A, $0A
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$18, $27, $1E, $04

	; Patch $3A
	; $24
	; $7D, $35, $3D, $75,	$1F, $1F, $1F, $1F
	; $01, $0D, $01, $0D,	$10, $12, $10, $12
	; $F5, $38, $F5, $38,	$00, $04, $00, $04
	spAlgorithm	$04
	spFeedback	$04
	spDetune	$07, $03, $03, $07
	spMultiple	$0D, $0D, $05, $05
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$01, $01, $0D, $0D
	spDecayRt	$10, $10, $12, $12
	spSustainLv	$0F, $0F, $03, $03
	spReleaseRt	$05, $05, $08, $08
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$00, $00, $04, $04

	; Patch $3B
	; $32
	; $2A, $61, $65, $23,	$94, $10, $54, $19
	; $85, $0B, $0E, $05,	$06, $04, $03, $03
	; $12, $14, $24, $27,	$2E, $0A, $1B, $05
	spAlgorithm	$02
	spFeedback	$06
	spDetune	$02, $06, $06, $02
	spMultiple	$0A, $05, $01, $03
	spRateScale	$02, $01, $00, $00
	spAttackRt	$14, $14, $10, $19
	spAmpMod	$01, $00, $00, $00
	spSustainRt	$05, $0E, $0B, $05
	spDecayRt	$06, $03, $04, $03
	spSustainLv	$01, $02, $01, $02
	spReleaseRt	$02, $04, $04, $07
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$2E, $1B, $0A, $05

	; Patch $3C
	; $38
	; $71, $31, $71, $41,	$5F, $1F, $1F, $1F
	; $07, $06, $09, $1F,	$00, $00, $00, $00
	; $98, $9A, $09, $0C,	$1C, $1B, $1A, $04
	spAlgorithm	$00
	spFeedback	$07
	spDetune	$07, $07, $03, $04
	spMultiple	$01, $01, $01, $01
	spRateScale	$01, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$07, $09, $06, $1F
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$09, $00, $09, $00
	spReleaseRt	$08, $09, $0A, $0C
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$1C, $1A, $1B, $04

	; Patch $3D
	; $02
	; $61, $7C, $04, $31,	$14, $D0, $8F, $54
	; $01, $05, $05, $08,	$02, $02, $05, $1F
	; $01, $11, $31, $88,	$1C, $2D, $27, $05
	spAlgorithm	$02
	spFeedback	$00
	spDetune	$06, $00, $07, $03
	spMultiple	$01, $04, $0C, $01
	spRateScale	$00, $02, $03, $01
	spAttackRt	$14, $0F, $10, $14
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$01, $05, $05, $08
	spDecayRt	$02, $05, $02, $1F
	spSustainLv	$00, $03, $01, $08
	spReleaseRt	$01, $01, $01, $08
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$1C, $27, $2D, $05

	; Patch $3E
	; $13
	; $01, $04, $00, $01,	$1C, $9D, $DE, $DF
	; $11, $0D, $02, $01,	$1F, $18, $0B, $01
	; $6F, $63, $FF, $3F,	$1E, $1C, $19, $05
	spAlgorithm	$03
	spFeedback	$02
	spDetune	$00, $00, $00, $00
	spMultiple	$01, $00, $04, $01
	spRateScale	$00, $03, $02, $03
	spAttackRt	$1C, $1E, $1D, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$11, $02, $0D, $01
	spDecayRt	$1F, $0B, $18, $01
	spSustainLv	$06, $0F, $06, $03
	spReleaseRt	$0F, $0F, $03, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$1E, $19, $1C, $05

	; Patch $3F
	; $17
	; $32, $72, $32, $12,	$C8, $88, $8C, $C8
	; $00, $13, $8C, $8D,	$01, $01, $01, $00
	; $08, $58, $A8, $78,	$04, $08, $09, $07
	spAlgorithm	$07
	spFeedback	$02
	spDetune	$03, $03, $07, $01
	spMultiple	$02, $02, $02, $02
	spRateScale	$03, $02, $02, $03
	spAttackRt	$08, $0C, $08, $08
	spAmpMod	$00, $01, $00, $01
	spSustainRt	$00, $0C, $13, $0D
	spDecayRt	$01, $01, $01, $00
	spSustainLv	$00, $0A, $05, $07
	spReleaseRt	$08, $08, $08, $08
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$04, $09, $08, $07

	; Patch $40
	; $3D
	; $01, $01, $01, $01,	$10, $50, $50, $50
	; $07, $08, $08, $08,	$01, $00, $00, $00
	; $20, $1A, $1A, $1A,	$19, $05, $05, $05
	spAlgorithm	$05
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$01, $01, $01, $01
	spRateScale	$00, $01, $01, $01
	spAttackRt	$10, $10, $10, $10
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$07, $08, $08, $08
	spDecayRt	$01, $00, $00, $00
	spSustainLv	$02, $01, $01, $01
	spReleaseRt	$00, $0A, $0A, $0A
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$19, $05, $05, $05

	; Patch $41
	; $3A
	; $03, $08, $03, $01,	$8E, $8E, $8D, $53
	; $0E, $0E, $0E, $03,	$00, $00, $00, $00
	; $1F, $FF, $1F, $0F,	$17, $28, $20, $05
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$03, $03, $08, $01
	spRateScale	$02, $02, $02, $01
	spAttackRt	$0E, $0D, $0E, $13
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0E, $0E, $0E, $03
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$01, $01, $0F, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$17, $20, $28, $05

	; Patch $42
	; $07
	; $06, $7C, $75, $0A,	$1F, $1F, $1F, $1F
	; $00, $00, $00, $00,	$00, $00, $00, $00
	; $0F, $0F, $0F, $0F,	$07, $07, $07, $07
	spAlgorithm	$07
	spFeedback	$00
	spDetune	$00, $07, $07, $00
	spMultiple	$06, $05, $0C, $0A
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$07, $07, $07, $07

	; Patch $43
	; $3A
	; $01, $40, $01, $31,	$1F, $1F, $1F, $1F
	; $0B, $04, $04, $04,	$02, $04, $03, $02
	; $5F, $1F, $5F, $2F,	$18, $05, $11, $05
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$00, $00, $04, $03
	spMultiple	$01, $01, $00, $01
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0B, $04, $04, $04
	spDecayRt	$02, $03, $04, $02
	spSustainLv	$05, $05, $01, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$18, $11, $05, $05

	; Patch $44
	; $3C
	; $01, $01, $0E, $04,	$8D, $52, $9F, $1F
	; $09, $00, $00, $0D,	$00, $00, $00, $00
	; $23, $08, $02, $6F,	$15, $02, $10, $05
	spAlgorithm	$04
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$01, $0E, $01, $04
	spRateScale	$02, $02, $01, $00
	spAttackRt	$0D, $1F, $12, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$09, $00, $00, $0D
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$02, $00, $00, $06
	spReleaseRt	$03, $02, $08, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$15, $10, $02, $05

	; Patch $45
	; $04
	; $37, $72, $77, $49,	$1F, $1F, $1F, $1F
	; $07, $0A, $07, $0D,	$00, $0B, $00, $0B
	; $1F, $0F, $1F, $0F,	$23, $00, $23, $00
	spAlgorithm	$04
	spFeedback	$00
	spDetune	$03, $07, $07, $04
	spMultiple	$07, $07, $02, $09
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$07, $07, $0A, $0D
	spDecayRt	$00, $00, $0B, $0B
	spSustainLv	$01, $01, $00, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$23, $23, $00, $00

	; Patch $46
	; $3C
	; $31, $73, $71, $31,	$10, $8C, $0A, $13
	; $00, $00, $00, $00,	$00, $0C, $00, $03
	; $0F, $0F, $0F, $0F,	$20, $00, $20, $00
	spAlgorithm	$04
	spFeedback	$07
	spDetune	$03, $07, $07, $03
	spMultiple	$01, $01, $03, $01
	spRateScale	$00, $00, $02, $00
	spAttackRt	$10, $0A, $0C, $13
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$00, $00, $0C, $03
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$20, $20, $00, $00

	; Patch $47
	; $24
	; $00, $04, $01, $04,	$10, $19, $10, $0D
	; $00, $03, $00, $00,	$02, $00, $01, $00
	; $0A, $0C, $0D, $0C,	$08, $04, $0B, $05
	spAlgorithm	$04
	spFeedback	$04
	spDetune	$00, $00, $00, $00
	spMultiple	$00, $01, $04, $04
	spRateScale	$00, $00, $00, $00
	spAttackRt	$10, $10, $19, $0D
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $03, $00
	spDecayRt	$02, $01, $00, $00
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$0A, $0D, $0C, $0C
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$08, $0B, $04, $05

	; Patch $48
	; $22
	; $61, $7C, $04, $31,	$14, $D0, $8F, $54
	; $01, $05, $05, $08,	$02, $02, $05, $1F
	; $01, $11, $31, $88,	$19, $28, $24, $00
	spAlgorithm	$02
	spFeedback	$04
	spDetune	$06, $00, $07, $03
	spMultiple	$01, $04, $0C, $01
	spRateScale	$00, $02, $03, $01
	spAttackRt	$14, $0F, $10, $14
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$01, $05, $05, $08
	spDecayRt	$02, $05, $02, $1F
	spSustainLv	$00, $03, $01, $08
	spReleaseRt	$01, $01, $01, $08
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$19, $24, $28, $00

	; Patch $49
	; $3B
	; $51, $71, $61, $41,	$51, $16, $18, $1A
	; $05, $01, $01, $00,	$09, $01, $01, $01
	; $17, $97, $27, $87,	$1C, $22, $15, $00
	spAlgorithm	$03
	spFeedback	$07
	spDetune	$05, $06, $07, $04
	spMultiple	$01, $01, $01, $01
	spRateScale	$01, $00, $00, $00
	spAttackRt	$11, $18, $16, $1A
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$05, $01, $01, $00
	spDecayRt	$09, $01, $01, $01
	spSustainLv	$01, $02, $09, $08
	spReleaseRt	$07, $07, $07, $07
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$1C, $15, $22, $00

	; Patch $4A
	; $32
	; $00, $01, $04, $04,	$1F, $16, $18, $1B
	; $08, $07, $07, $04,	$07, $08, $06, $1F
	; $04, $58, $05, $77,	$06, $05, $15, $00
	spAlgorithm	$02
	spFeedback	$06
	spDetune	$00, $00, $00, $00
	spMultiple	$00, $04, $01, $04
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $18, $16, $1B
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$08, $07, $07, $04
	spDecayRt	$07, $06, $08, $1F
	spSustainLv	$00, $00, $05, $07
	spReleaseRt	$04, $05, $08, $07
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$06, $15, $05, $00

	; Patch $4B
	; $39
	; $01, $61, $00, $00,	$1F, $5F, $5F, $5F
	; $10, $11, $09, $09,	$1F, $1F, $1E, $1C
	; $FF, $FF, $FF, $FF,	$1C, $22, $1F, $02
	spAlgorithm	$01
	spFeedback	$07
	spDetune	$00, $00, $06, $00
	spMultiple	$01, $00, $01, $00
	spRateScale	$00, $01, $01, $01
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$10, $09, $11, $09
	spDecayRt	$1F, $1E, $1F, $1C
	spSustainLv	$0F, $0F, $0F, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$1C, $1F, $22, $02

	; Patch $4C
	; $27
	; $14, $30, $51, $62,	$5C, $5C, $5C, $5C
	; $00, $00, $00, $00,	$04, $1B, $04, $04
	; $FA, $F8, $F8, $FA,	$08, $08, $08, $08
	spAlgorithm	$07
	spFeedback	$04
	spDetune	$01, $05, $03, $06
	spMultiple	$04, $01, $00, $02
	spRateScale	$01, $01, $01, $01
	spAttackRt	$1C, $1C, $1C, $1C
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$04, $04, $1B, $04
	spSustainLv	$0F, $0F, $0F, $0F
	spReleaseRt	$0A, $08, $08, $0A
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$08, $08, $08, $08

	; Patch $4D
	; $26
	; $01, $02, $01, $00,	$11, $19, $10, $17
	; $01, $01, $03, $01,	$07, $04, $03, $03
	; $05, $45, $3A, $0A,	$0A, $02, $0E, $00
	spAlgorithm	$06
	spFeedback	$04
	spDetune	$00, $00, $00, $00
	spMultiple	$01, $01, $02, $00
	spRateScale	$00, $00, $00, $00
	spAttackRt	$11, $10, $19, $17
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$01, $03, $01, $01
	spDecayRt	$07, $03, $04, $03
	spSustainLv	$00, $03, $04, $00
	spReleaseRt	$05, $0A, $05, $0A
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$0A, $0E, $02, $00

	; Patch $4E
	; $32
	; $30, $51, $72, $72,	$13, $18, $1F, $1F
	; $18, $1E, $1A, $05,	$05, $04, $02, $04
	; $25, $D5, $35, $25,	$15, $04, $1C, $00
	spAlgorithm	$02
	spFeedback	$06
	spDetune	$03, $07, $05, $07
	spMultiple	$00, $02, $01, $02
	spRateScale	$00, $00, $00, $00
	spAttackRt	$13, $1F, $18, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$18, $1A, $1E, $05
	spDecayRt	$05, $02, $04, $04
	spSustainLv	$02, $03, $0D, $02
	spReleaseRt	$05, $05, $05, $05
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$15, $1C, $04, $00

	; Patch $4F
	; $3E
	; $38, $01, $7A, $34,	$59, $D9, $5F, $9C
	; $0F, $04, $0F, $0A,	$02, $02, $05, $05
	; $AF, $AF, $66, $66,	$28, $00, $23, $00
	spAlgorithm	$06
	spFeedback	$07
	spDetune	$03, $07, $00, $03
	spMultiple	$08, $0A, $01, $04
	spRateScale	$01, $01, $03, $02
	spAttackRt	$19, $1F, $19, $1C
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0F, $0F, $04, $0A
	spDecayRt	$02, $05, $02, $05
	spSustainLv	$0A, $06, $0A, $06
	spReleaseRt	$0F, $06, $0F, $06
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$28, $23, $00, $00

	; Patch $50
	; $3A
	; $31, $37, $72, $02,	$0F, $0B, $0B, $8B
	; $04, $10, $09, $0A,	$00, $00, $03, $00
	; $19, $08, $08, $18,	$1E, $21, $37, $00
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$03, $07, $03, $00
	spMultiple	$01, $02, $07, $02
	spRateScale	$00, $00, $00, $02
	spAttackRt	$0F, $0B, $0B, $0B
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$04, $09, $10, $0A
	spDecayRt	$00, $03, $00, $00
	spSustainLv	$01, $00, $00, $01
	spReleaseRt	$09, $08, $08, $08
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$1E, $37, $21, $00

	; Patch $51
	; $3D
	; $0A, $06, $06, $06,	$1F, $0C, $0C, $0C
	; $00, $09, $09, $01,	$01, $02, $05, $01
	; $F6, $F8, $F7, $F7,	$00, $00, $00, $00
	spAlgorithm	$05
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$0A, $06, $06, $06
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $0C, $0C, $0C
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $09, $09, $01
	spSustainLv	$0F, $0F, $0F, $0F
	spDecayRt	$01, $05, $02, $01
	spReleaseRt	$06, $07, $08, $07
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$00, $00, $00, $00

	; Patch $52
	; $3C
	; $31, $73, $71, $31,	$10, $8C, $0A, $13
	; $00, $00, $00, $00,	$00, $0C, $00, $03
	; $0F, $0F, $0F, $0F,	$20, $00, $20, $00
	spAlgorithm	$04
	spFeedback	$07
	spDetune	$03, $07, $07, $03
	spMultiple	$01, $01, $03, $01
	spRateScale	$00, $00, $02, $00
	spAttackRt	$10, $0A, $0C, $13
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spSustainLv	$00, $00, $00, $00
	spDecayRt	$00, $00, $0C, $03
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$20, $20, $00, $00

	; Patch $53
	; $3C
	; $33, $41, $7F, $74,	$5B, $9F, $5F, $1F
	; $04, $07, $07, $08,	$00, $00, $00, $00
	; $A7, $C6, $C9, $D9,	$21, $00, $2D, $06
	spAlgorithm	$04
	spFeedback	$07
	spDetune	$03, $07, $04, $07
	spMultiple	$03, $0F, $01, $04
	spRateScale	$01, $01, $02, $00
	spAttackRt	$1B, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$04, $07, $07, $08
	spSustainLv	$0A, $0C, $0C, $0D
	spDecayRt	$00, $00, $00, $00
	spReleaseRt	$07, $09, $06, $09
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$21, $2D, $00, $06

	; Patch $54
	; $22
	; $61, $77, $02, $31,	$14, $D0, $8F, $54
	; $01, $05, $05, $08,	$02, $02, $05, $1F
	; $01, $11, $31, $88,	$19, $28, $20, $00
	spAlgorithm	$02
	spFeedback	$04
	spDetune	$06, $00, $07, $03
	spMultiple	$01, $02, $07, $01
	spRateScale	$00, $02, $03, $01
	spAttackRt	$14, $0F, $10, $14
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$01, $05, $05, $08
	spSustainLv	$00, $03, $01, $08
	spDecayRt	$02, $05, $02, $1F
	spReleaseRt	$01, $01, $01, $08
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$19, $20, $28, $00

	; Patch $55
	; $22
	; $61, $7C, $04, $31,	$14, $D0, $8F, $54
	; $01, $05, $05, $08,	$02, $02, $05, $1F
	; $01, $11, $31, $88,	$19, $28, $24, $00
	spAlgorithm	$02
	spFeedback	$04
	spDetune	$06, $00, $07, $03
	spMultiple	$01, $04, $0C, $01
	spRateScale	$00, $02, $03, $01
	spAttackRt	$14, $0F, $10, $14
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$01, $05, $05, $08
	spSustainLv	$00, $03, $01, $08
	spDecayRt	$02, $05, $02, $1F
	spReleaseRt	$01, $01, $01, $08
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$19, $24, $28, $00

	; Patch $56
	; $20
	; $66, $65, $60, $61,	$DF, $DF, $9F, $9F
	; $07, $06, $09, $06,	$07, $06, $06, $08
	; $29, $19, $19, $F9,	$1C, $3A, $16, $00
	spAlgorithm	$00
	spFeedback	$04
	spDetune	$06, $06, $06, $06
	spMultiple	$06, $00, $05, $01
	spRateScale	$03, $02, $03, $02
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$07, $09, $06, $06
	spDecayRt	$07, $06, $06, $08
	spSustainLv	$02, $01, $01, $0F
	spReleaseRt	$09, $09, $09, $09
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$1C, $16, $3A, $00

	; Patch $57
	; $3A
	; $31, $01, $01, $71,	$8F, $8F, $4F, $4D
	; $09, $09, $00, $03,	$00, $00, $00, $00
	; $15, $F5, $05, $0A,	$19, $1F, $19, $01
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$03, $00, $00, $07
	spMultiple	$01, $01, $01, $01
	spRateScale	$02, $01, $02, $01
	spAttackRt	$0F, $0F, $0F, $0D
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$09, $00, $09, $03
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$01, $00, $0F, $00
	spReleaseRt	$05, $05, $05, $0A
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$19, $19, $1F, $01

	; Patch $58
	; $3A
	; $01, $07, $01, $01,	$8E, $8E, $8D, $53
	; $0E, $0E, $0E, $03,	$00, $00, $00, $00
	; $1F, $FF, $1F, $0F,	$17, $28, $27, $86
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$01, $01, $07, $01
	spRateScale	$02, $02, $02, $01
	spAttackRt	$0E, $0D, $0E, $13
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0E, $0E, $0E, $03
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$01, $01, $0F, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$17, $27, $28, $06

	; Patch $59
	; $3A
	; $51, $07, $51, $02,	$0F, $0B, $0F, $0F
	; $1F, $1F, $1F, $0F,	$00, $00, $00, $02
	; $0F, $0F, $0F, $1F,	$1C, $28, $22, $81
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$05, $05, $00, $00
	spMultiple	$01, $01, $07, $02
	spRateScale	$00, $00, $00, $00
	spAttackRt	$0F, $0F, $0B, $0F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$1F, $1F, $1F, $0F
	spDecayRt	$00, $00, $00, $02
	spSustainLv	$00, $00, $00, $01
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$1C, $22, $28, $01

	even

; -------------------------------------------------------------------------
