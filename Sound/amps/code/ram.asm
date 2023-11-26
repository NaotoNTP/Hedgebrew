; ===========================================================================
; ---------------------------------------------------------------------------
; RAM definitions
; ---------------------------------------------------------------------------

mFlags		rs.b 1		; various driver flags, see below
mCtrPal		rs.b 1		; frame counter fo 50hz fix
mVctSFX		rs.l 1		; address of voice table for sfx
mComm		rs.b 8		; communications bytes
mMasterVolFM	rs.b 0		; master volume for FM channels
mFadeAddr	rs.l 1		; fading program address
mTempoMain	rs.b 1		; music normal tempo
mTempoSpeed	rs.b 1		; music speed shoes tempo
mTempo		rs.b 1		; current tempo we are using right now
mTempoCur	rs.b 1		; tempo counter/accumulator
mQueue		rs.b 3		; sound queue
mMasterVolPSG	rs.b 1		; master volume for PSG channels
mMasterVolDAC	rs.b 1		; master volume for DAC channels
mSpindash	rs.b 1		; spindash rev counter
mContCtr	rs.b 1		; continous sfx loop counter
mContLast	rs.b 1		; last continous sfx played
		rs.w 0		; align channel data

mDAC1		rs.b cSize	; DAC 1 data
mDAC2		rs.b cSize	; DAC 2 data
mFM1		rs.b cSize	; FM 1 data
mFM2		rs.b cSize	; FM 2 data
mFM3		rs.b cSize	; FM 3 data
mFM4		rs.b cSize	; FM 4 data
mFM5		rs.b cSize	; FM 5 data
mPSG1		rs.b cSize	; PSG 1 data
mPSG2		rs.b cSize	; PSG 2 data
mPSG3		rs.b cSize	; PSG 3 data
mSFXDAC1	rs.b cSizeSFX	; SFX DAC 1 data
mSFXFM3		rs.b cSizeSFX	; SFX FM 3 data
mSFXFM4		rs.b cSizeSFX	; SFX FM 4 data
mSFXFM5		rs.b cSizeSFX	; SFX FM 5 data
mSFXPSG1	rs.b cSizeSFX	; SFX PSG 1 data
mSFXPSG2	rs.b cSizeSFX	; SFX PSG 2 data
mSFXPSG3	rs.b cSizeSFX	; SFX PSG 3 data

	if safe=1
msChktracker	rs.b 1		; safe mode only: If set, bring up debugger
	endif
		rsEven
mSize		rs.w 0		; end of the driver RAM
; ===========================================================================
