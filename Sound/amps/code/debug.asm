	if safe=1	; all of this code is only required in safe mode!
		if ~def(isAMPS)
			inform 1,"Not using custom debugger macro definition! All features may not work."
		endif
; ===========================================================================
; ---------------------------------------------------------------------------
; write channel string to console
; ---------------------------------------------------------------------------

	if def(RaiseError)	; check if Vladik's debugger is active
AMPS_Debug_GetChannel	macro
	cmp.w	#mPSG1,a5
	bne.s	AMPS_Debug_Writepsg2
	Console.Write "PSG1"
	bra.w	AMPS_Debug_Writeend

AMPS_Debug_Writepsg2
	cmp.w	#mPSG2,a5
	bne.s	AMPS_Debug_Writepsg3
	Console.Write "PSG2"
	bra.w	AMPS_Debug_Writeend

AMPS_Debug_Writepsg3
	cmp.w	#mPSG3,a5
	bne.s	AMPS_Debug_Writepsgs1
	Console.Write "PSG3"
	bra.w	AMPS_Debug_Writeend

AMPS_Debug_Writepsgs1
	cmp.w	#mSFXPSG1,a5
	bne.s	AMPS_Debug_Writepsgs2
	Console.Write "SFX PSG1"
	bra.w	AMPS_Debug_Writeend

AMPS_Debug_Writepsgs2
	cmp.w	#mSFXPSG2,a5
	bne.s	AMPS_Debug_Writepsgs3
	Console.Write "SFX PSG2"
	bra.w	AMPS_Debug_Writeend

AMPS_Debug_Writepsgs3
	cmp.w	#mSFXPSG3,a5
	bne.s	AMPS_Debug_Writedacs1
	Console.Write "SFX PSG3"
	bra.w	AMPS_Debug_Writeend

AMPS_Debug_Writedacs1
	cmp.w	#mSFXDAC1,a5
	bne.s	AMPS_Debug_Writedac1
	Console.Write "SFX DAC1"
	bra.w	AMPS_Debug_Writeend

AMPS_Debug_Writedac1
	cmp.w	#mDAC1,a5
	bne.s	AMPS_Debug_Writedac2
	Console.Write "DAC1"
	bra.w	AMPS_Debug_Writeend

AMPS_Debug_Writedac2
	cmp.w	#mDAC2,a5
	bne.s	AMPS_Debug_Writefm1
	Console.Write "DAC2"
	bra.w	AMPS_Debug_Writeend

AMPS_Debug_Writefm1
	cmp.w	#mFM1,a5
	bne.s	AMPS_Debug_Writefm2
	Console.Write "FM1"
	bra.w	AMPS_Debug_Writeend

AMPS_Debug_Writefm2
	cmp.w	#mFM2,a5
	bne.s	AMPS_Debug_Writefm3
	Console.Write "FM2"
	bra.w	AMPS_Debug_Writeend

AMPS_Debug_Writefm3
	cmp.w	#mFM3,a5
	bne.s	AMPS_Debug_Writefm4
	Console.Write "FM3"
	bra.w	AMPS_Debug_Writeend

AMPS_Debug_Writefm4
	cmp.w	#mFM4,a5
	bne.s	AMPS_Debug_Writefm5
	Console.Write "FM4"
	bra.w	AMPS_Debug_Writeend

AMPS_Debug_Writefm5
	cmp.w	#mFM5,a5
	bne.s	AMPS_Debug_Writefms3
	Console.Write "FM5"
	bra.w	AMPS_Debug_Writeend

AMPS_Debug_Writefms3
	cmp.w	#mSFXFM3,a5
	bne.s	AMPS_Debug_Writefms4
	Console.Write "SFX FM3"
	rts

AMPS_Debug_Writefms4
	cmp.w	#mSFXFM4,a5
	bne.s	AMPS_Debug_Writefms5
	Console.Write "SFX FM4"
	bra.s	AMPS_Debug_Writeend

AMPS_Debug_Writefms5
	cmp.w	#mSFXFM5,a5
	beq.s	AMPS_Debug_Writefms5_

AMPS_Debug_Writeaddr
	Console.Write "%<fpal2>%<.l a5>"
	rts

AMPS_Debug_Writefms5_
	Console.Write "SFX FM5"
AMPS_Debug_Writeend
	endm
	endif
; ===========================================================================
; ---------------------------------------------------------------------------
; Channel console code
; ---------------------------------------------------------------------------

	if def(RaiseError)	; check if Vladik's debugger is active
AMPS_Debug_Console_Channel:
	Console.WriteLine "  %<fpal0>d0: %<fpal2>%<.l d0>  %<fpal0>a0: %<fpal2>%<.l a0>"
	Console.WriteLine "  %<fpal0>d1: %<fpal2>%<.l d1>  %<fpal0>a1: %<fpal2>%<.l a1>"
	Console.WriteLine "  %<fpal0>d2: %<fpal2>%<.l d2>  %<fpal0>a2: %<fpal2>%<.l a2>"
	Console.WriteLine "  %<fpal0>d3: %<fpal2>%<.l d3>  %<fpal0>a3: %<fpal2>%<.l a3>"
	Console.WriteLine "  %<fpal0>d4: %<fpal2>%<.l d4>  %<fpal0>a4: %<fpal2>%<.l a4>"
	Console.WriteLine "  %<fpal0>d5: %<fpal2>%<.l d5>  %<fpal0>a5: %<fpal2>%<.l a5>"
	Console.WriteLine "  %<fpal0>d6: %<fpal2>%<.l d6>  %<fpal0>a6: %<fpal2>%<.l a6>"
	Console.WriteLine "  %<fpal0>d7: %<fpal2>%<.l d7>  %<fpal0>sp: %<fpal2>%<.l a7>"
	Console.BreakLine

	Console.Write "%<fpal1>Channel: %<fpal0>"
	AMPS_Debug_GetChannel
	Console.BreakLine

	Console.WriteLine "%<fpal1>Addr: %<fpal0>%<.l a4 sym|fsplit>%<fpal2,fsymdisp>"
; fmt: flag, type, pan, det, pitch, vol, tick, sample/voice, dur, lastdur, freq
	Console.Write	  "%<fpal1>CH: %<fpal2>%<.b (a5)> %<.b cType(a5)> %<.b cPanning(a5)> "
	Console.Write	  "%<.b cDetune(a5)> %<.b cPitch(a5)> %<.b cVolume(a5)> %<.b cTick(a5)> "
	Console.WriteLine "%<.b cSample(a5)> %<.b cDuration(a5)> %<.b cLastDur(a5)> %<.w cFreq(a5)>"
	Console.BreakLine

	Console.WriteLine "%<fpal1>Mod: %<fpal0>%<.l cMod(a5) sym|fsplit>%<fpal2,fsymdisp>"
	Console.Write	  "%<fpal1>Mod Data: %<fpal2>%<.b cModDelay(a5)> %<fpal2>%<.w cModFreq(a5)> "
	Console.WriteLine "%<.b cModSpeed(a5)> %<.b cModStep(a5)> %<.b cModCount(a5)>"
	Console.BreakLine

	Console.Write "%<fpal1>Loop: %<fpal2>%<.b cLoop(a5)> %<.b cLoop+1(a5)> %<.b cLoop+2(a5)> "
	cmp.w	#mSFXDAC1,a5
	bhs.w	AMPS_Debug_Console_Channel_Writerts
	Console.WriteLine "%<.b cNoteTimeCur(a5)> %<.b cNoteTimeMain(a5)>"
	Console.WriteLine "%<fpal1>Stack: %<fpal2>%<.b cStack(a5)>"

	move.w	a5,d1
	add.w	#cSize,d1

	moveq	#0,d0
	move.b	cStack(a5),d0
	add.w	d0,a5

AMPS_Debug_Console_Channel_Writeloop
	cmp.w	a5,d1
	bls.s	AMPS_Debug_Console_Channel_Writerts
	Console.WriteLine "%<fpal0>%<.l (a5)+ sym|fsplit>%<fpal2,fsymdisp>"
	bra.s	AMPS_Debug_Console_Channel_Writeloop

AMPS_Debug_Console_Channel_Writerts
	rts
	endif
; ===========================================================================
; ---------------------------------------------------------------------------
; Generic console code
; ---------------------------------------------------------------------------

	if def(RaiseError)	; check if Vladik's debugger is active
AMPS_Debug_Console_Main:
	Console.WriteLine "  %<fpal0>d0: %<fpal2>%<.l d0>  %<fpal0>a0: %<fpal2>%<.l a0>"
	Console.WriteLine "  %<fpal0>d1: %<fpal2>%<.l d1>  %<fpal0>a1: %<fpal2>%<.l a1>"
	Console.WriteLine "  %<fpal0>d2: %<fpal2>%<.l d2>  %<fpal0>a2: %<fpal2>%<.l a2>"
	Console.WriteLine "  %<fpal0>d3: %<fpal2>%<.l d3>  %<fpal0>a3: %<fpal2>%<.l a3>"
	Console.WriteLine "  %<fpal0>d4: %<fpal2>%<.l d4>  %<fpal0>a4: %<fpal2>%<.l a4>"
	Console.WriteLine "  %<fpal0>d5: %<fpal2>%<.l d5>  %<fpal0>a5: %<fpal2>%<.l a5>"
	Console.WriteLine "  %<fpal0>d6: %<fpal2>%<.l d6>  %<fpal0>a6: %<fpal2>%<.l a6>"
	Console.WriteLine "  %<fpal0>d7: %<fpal2>%<.l d7>  %<fpal0>sp: %<fpal2>%<.l a7>"
	Console.BreakLine

	Console.Write	  "%<fpal1>Misc:   %<fpal2>%<.b mFlags.w> %<.b mCtrPal.w> "
	Console.WriteLine "%<.b mSpindash.w> %<.b mContCtr.w> %<.b mContLast.w>"
	Console.Write	  "%<fpal1>Tempo:  %<fpal2>%<.b mTempoMain.w> %<.b mTempoSpeed.w> "
	Console.WriteLine "%<.b mTempo.w> %<.b mTempoCur.w>"
	Console.Write	  "%<fpal1>Volume: %<fpal2>%<.b mMasterVolFM.w> %<.b mMasterVolDAC.w> "
	Console.WriteLine "%<.b mMasterVolPSG.w>"
	Console.WriteLine "%<fpal1>Fade:   %<fpal0>%<.l mFadeAddr.w sym|fsplit>%<fpal2,fsymdisp>"
	Console.WriteLine "%<fpal1>Queue:  %<fpal2>%<.b mQueue.w> %<.b mQueue+1.w> %<.b mQueue+2.w>"
	Console.Write	  "%<fpal1>Comm:   %<fpal2>%<.b mComm.w> %<.b mComm+1.w> %<.b mComm+2.w> "
	Console.Write	  "%<.b mComm+3.w> %<.b mComm+4.w> %<.b mComm+5.w> %<.b mComm+6.w> "
	Console.WriteLine "%<.b mComm+7.w>"

.rts
	rts
	endif
; ===========================================================================
; ---------------------------------------------------------------------------
; Invalid fade command handler
; ---------------------------------------------------------------------------

AMPS_Debug_FadeCmd	macro
	cmp.b	#fLast,d0	; check against max
	bhs.s	.fail		; if in range, branch
	cmp.b	#$80,d0		; check against min
	blo.s	.fail		; if too little, bra
	btst	#1,d0		; check if bit1 set
	bne.s	.fail		; if is, branch
	btst	#0,d0		; check if even
	beq.s	.ok		; if is, branch

.fail
	if def(RaiseError)	; check if Vladik's debugger is active
		jsr	AMPS_DebugR_FadeCmd
	else
		bra.w	*
	endif

.ok
    endm

	if def(RaiseError)	; check if Vladik's debugger is active
AMPS_DebugR_FadeCmd:
		RaiseError2 "Invalid Fade command: %<.b d0>", AMPS_Debug_Console_Main
	endif
; ===========================================================================
; ---------------------------------------------------------------------------
; Invalid volume envelope handler
; ---------------------------------------------------------------------------

AMPS_Debug_VolEnvID	macro
	cmp.b	#(VolEnvs_End-VolEnvs)/4,d4	; check against max
	bls.s	.ok			; if in range, branch

	if def(RaiseError)	; check if Vladik's debugger is active
		jsr	AMPS_DebugR_VolEnvID
	else
		bra.w	*
	endif

.ok
    endm

	if def(RaiseError)	; check if Vladik's debugger is active
AMPS_DebugR_VolEnvID:
		RaiseError2 "Volume envelope ID out of range: %<.b d4>", AMPS_Debug_Console_Channel
	endif
; ===========================================================================
; ---------------------------------------------------------------------------
; Invalid volume envelope command handler
; ---------------------------------------------------------------------------

AMPS_Debug_VolEnvCmd	macro
	cmp.b	#eLast,d0	; check against max
	bhs.s	.fail		; if too much, bra
	cmp.b	#$80,d0		; check against min
	blo.s	.fail		; if too little, bra
	btst	#0,d0		; check if even
	beq.s	.ok		; if is, branch

.fail
	if def(RaiseError)	; check if Vladik's debugger is active
		RaiseError2 "Volume envelope command invalid: %<.b d0>", AMPS_Debug_Console_Channel
	else
		bra.w	*
	endif

.ok
    endm
; ===========================================================================
; ---------------------------------------------------------------------------
; PSG note check
; ---------------------------------------------------------------------------

AMPS_Debug_NotePSG	macro
	cmp.b	#dFreqPSG_-dFreqPSG,d5; check against max
	blo.s	.ok		; if too little, bra

.fail
	if def(RaiseError)	; check if Vladik's debugger is active
		jsr	AMPS_DebugR_NotePSG
	else
		bra.w	*
	endif

.ok
    endm

	if def(RaiseError)	; check if Vladik's debugger is active
AMPS_DebugR_NotePSG:
		lsr.w	#1,d5	; get real note
		RaiseError2 "Invalid PSG note: %<.b d5>", AMPS_Debug_Console_Channel
	endif
; ===========================================================================
; ---------------------------------------------------------------------------
; FM note check
; ---------------------------------------------------------------------------

AMPS_Debug_NoteFM	macro
	cmp.b	#dFreqFM_-dFreqFM,d5; check against max
	blo.s	.ok		; if too little, bra

.fail
	if def(RaiseError)	; check if Vladik's debugger is active
		jsr	AMPS_DebugR_NoteFM
	else
		bra.w	*
	endif

.ok
    endm

	if def(RaiseError)	; check if Vladik's debugger is active
AMPS_DebugR_NoteFM:
		lsr.w	#1,d5	; get real note
		RaiseError2 "Invalid FM note: %<.b d5>", AMPS_Debug_Console_Channel
	endif
; ===========================================================================
; ---------------------------------------------------------------------------
; DAC frequency check
; ---------------------------------------------------------------------------

AMPS_Debug_FreqDAC	macro
	cmp.w	#MaxPitch,d6	; check if frequency is too large
	bgt.s	.fail		; if so, branch
	cmp.w	#-MaxPitch,d6	; check if frequency is too small
	bge.s	.ok		; if not, branch

.fail
	if def(RaiseError)	; check if Vladik's debugger is active
		jsr	AMPS_DebugR_FreqDAC
	else
		bra.w	*
	endif

.ok
    endm

	if def(RaiseError)	; check if Vladik's debugger is active
AMPS_DebugR_FreqDAC:
		RaiseError "Out of range DAC frequency: %<.w d6>", AMPS_Debug_Console_Channel
	endif
; ===========================================================================
; ---------------------------------------------------------------------------
; Invalid tracker command handlers
; ---------------------------------------------------------------------------

AMPS_Debug_dcInvalid	macro
	if def(RaiseError)	; check if Vladik's debugger is active
		RaiseError "Invalid command detected!", AMPS_Debug_Console_Channel
	else
		bra.w	*
	endif
    endm
; ===========================================================================
; ---------------------------------------------------------------------------
; PSG on sPan handler
; ---------------------------------------------------------------------------

AMPS_Debug_dcPan	macro
	tst.b	cType(a5)	; check for PSG channel
	bpl.s	.ok		; if no, branch

	if def(RaiseError)	; check if Vladik's debugger is active
		RaiseError "sPan on a PSG channel!", AMPS_Debug_Console_Channel
	else
		bra.w	*
	endif

.ok
    endm
; ===========================================================================
; ---------------------------------------------------------------------------
; Timeout command on SFX channel handler
; ---------------------------------------------------------------------------

AMPS_Debug_dcTimeout	macro
	cmp.w	#mSFXDAC1,a5	; check for SFX channel
	blo.s	.ok		; if no, branch

	if def(RaiseError)	; check if Vladik's debugger is active
		RaiseError "sNoteTimeOut on a SFX channel!", AMPS_Debug_Console_Channel
	else
		bra.w	*
	endif

.ok
    endm
; ===========================================================================
; ---------------------------------------------------------------------------
; Call command handlers
; ---------------------------------------------------------------------------

AMPS_Debug_dcCall1	macro
	cmp.w	#mSFXDAC1,a5	; check for SFX channel
	blo.s	.ok1		; if no, branch

	if def(RaiseError)	; check if Vladik's debugger is active
		RaiseError "sCall on a SFX channel!", AMPS_Debug_Console_Channel
	else
		bra.w	*
	endif

.ok1
    endm

AMPS_Debug_dcCall2	macro
	cmp.b	#cNoteTimeCur,d0; check for invalid stack address
	bhi.s	.ok2		; if no, branch

	if def(RaiseError)	; check if Vladik's debugger is active
		RaiseError "sCall stack too deep!", AMPS_Debug_Console_Channel
	else
		bra.w	*
	endif

.ok2
    endm
; ===========================================================================
; ---------------------------------------------------------------------------
; Loop command handler
; ---------------------------------------------------------------------------

AMPS_Debug_dcLoop	macro
	cmp.b	#3,d0		; check for invalid call number
	bhi.s	.fail		; if is, branch
	cmp.w	#mSFXDAC1,a5	; check for SFX channel
	blo.s	.nosfx		; if no, branch
	cmp.b	#1,d0		; check if cPrio
	beq.s	.fail		; if so, branch

.nosfx
	cmp.b	#$C0,cType(a5)	; check if PSG3 or PSG4
	blo.s	AMPS_Debug_dcLoop_ok; if no, branch
	cmp.b	#2,d0		; check if cStatPSG4
	bne.s	AMPS_Debug_dcLoop_ok; if no, branch

.fail
	if def(RaiseError)	; check if Vladik's debugger is active
		RaiseError "sLoop ID is invalid!", AMPS_Debug_Console_Channel
	else
		bra.w	*
	endif

AMPS_Debug_dcLoop_ok
    endm
; ===========================================================================
; ---------------------------------------------------------------------------
; Return command handlers
; ---------------------------------------------------------------------------

AMPS_Debug_dcReturn1	macro
	cmp.w	#mSFXDAC1,a5	; check for SFX channel
	blo.s	.ok1		; if no, branch

	if def(RaiseError)	; check if Vladik's debugger is active
		RaiseError "sRet on a SFX channel!", AMPS_Debug_Console_Channel
	else
		bra.w	*
	endif

.ok1
    endm

AMPS_Debug_dcReturn2	macro
	cmp.b	#cSize,d0	; check for invalid stack address
	bls.s	.ok2		; if no, branch

	if def(RaiseError)	; check if Vladik's debugger is active
		RaiseError "sRet stack too shallow!", AMPS_Debug_Console_Channel
	else
		bra.w	*
	endif

.ok2
    endm
; ===========================================================================
; ---------------------------------------------------------------------------
; Update FM voice handler
; ---------------------------------------------------------------------------

AMPS_Debug_UpdVoiceFM	macro
	cmp.b	#'N',(a1)+	; check if this is valid voice
	bne.s	.fail		; if not, branch
	cmp.w	#'AT',(a1)+	; check if this is valid voice
	beq.s	.ok		; if is, branch

.fail
	if def(RaiseError)	; check if Vladik's debugger is active
		RaiseError "FM voice Update invalid voice: %<.b cVoice(a5)>", AMPS_Debug_Console_Channel
	else
		bra.w	*
	endif

.ok
    endm
; ===========================================================================
; ---------------------------------------------------------------------------
; Update FM Volume handler
; ---------------------------------------------------------------------------

AMPS_Debug_UpdVolFM	macro
	cmp.b	#'N',(a1)+	; check if this is valid voice
	bne.s	.fail		; if not, branch
	cmp.w	#'AT',(a1)+	; check if this is valid voice
	beq.s	.ok		; if is, branch

.fail
	if def(RaiseError)	; check if Vladik's debugger is active
		jsr	AMPS_DebugR_UpdVolFM
	else
		bra.w	*
	endif

.ok
    endm

	if def(RaiseError)	; check if Vladik's debugger is active
AMPS_DebugR_UpdVolFM:
	RaiseError2 "FM Volume Update invalid voice: %<.b cVoice(a5)>", AMPS_Debug_Console_Channel
	endif
; ===========================================================================
; ---------------------------------------------------------------------------
; Invalid cue handler
; ---------------------------------------------------------------------------

AMPS_Debug_CuePtr	macro id
	cmp.l	#$A00000+YM_Buffer1,a0	; check against min
	blo.s	.fail\@			; if not in range, branch
	cmp.l	#$A00000+YM_Buffer2+$400,a0; check against max
	blo.s	.ok\@			; if in range, branch

.fail\@
	if def(RaiseError)	; check if Vladik's debugger is active
		jsr	AMPS_Debug_CuePtr\id
	else
		bra.w	*
	endif

.ok\@
    endm

	if def(RaiseError)	; check if Vladik's debugger is active
AMPS_Debug_CuePtr1:
		RaiseError2 "CUE invalid at WriteYM_Pt1: %<.l a0>", AMPS_Debug_Console_Channel
AMPS_Debug_CuePtr2:
		RaiseError2 "CUE invalid at WriteYM_Pt2: %<.l a0>", AMPS_Debug_Console_Channel
AMPS_Debug_CuePtr0:
		RaiseError2 "CUE invalid at dUpdateVoiceFM: %<.l a0>", AMPS_Debug_Console_Channel
AMPS_Debug_CuePtr3:
		RaiseError2 "CUE invalid at dAMPSend: %<.l a0>", AMPS_Debug_Console_Channel
	endif
; ===========================================================================
; ---------------------------------------------------------------------------
; Play Command handler
; ---------------------------------------------------------------------------

AMPS_Debug_PlayCmd	macro
	cmp.b	#(dSoundCommands_End-dSoundCommands)/4,d7; check if this is valid command
	bls.s	.ok		; if is, branch

	if def(RaiseError)	; check if Vladik's debugger is active
		RaiseError "Invalid command in queue: %<.b d7>", AMPS_Debug_Console_Channel
	else
		bra.w	*
	endif

.ok
    endm
; ===========================================================================
; ---------------------------------------------------------------------------
; Tracker address handlers
; ---------------------------------------------------------------------------

AMPS_Debug_PlayTrackMus	macro
	cmp.l	#musaddr,d0	; check if this is valid tracker
	blo.s	.fail\@		; if no, branch
	cmp.l	#musend,d0	; check if this is valid tracker
	blo.s	.ok\@		; if is, branch

.fail\@
	if def(RaiseError)	; check if Vladik's debugger is active
		lsr.w	#2,d7	; get actual ID
		RaiseError "Invalid tracker at Music %<.b d7>: %<.l a4>%<fendl>%<.l a4 sym>", AMPS_Debug_Console_Main
	else
		bra.w	*
	endif

.ok\@
    endm

AMPS_Debug_PlayTrackMus2	macro ch
	and.l	#$FFFFFF,d0	; remove high byte
	cmp.l	#musaddr,d0	; check if this is valid tracker
	blo.s	.fail\@		; if no, branch
	cmp.l	#dacaddr,d0	; check if this is valid tracker
	blo.s	.ok\@		; if is, branch

.fail\@
	if def(RaiseError)	; check if Vladik's debugger is active
		RaiseError "Invalid tracker at Music \ch\: %<.l d0>%<fendl>%<.l d0 sym>", AMPS_Debug_Console_Main
	else
		bra.w	*
	endif

.ok\@
    endm

AMPS_Debug_PlayTrackSFX	macro
	cmp.l	#sfxaddr,d0	; check if this is valid tracker
	blo.s	.fail\@		; if no, branch
	cmp.l	#musaddr,d0	; check if this is valid tracker
	blo.s	.ok\@		; if is, branch

.fail\@
	if def(RaiseError)	; check if Vladik's debugger is active
		RaiseError "Invalid tracker at SFX %<.b d0>: %<.l a4>%<fendl>%<.l a4 sym>", AMPS_Debug_Console_Main
	else
		bra.w	*
	endif

.ok\@
    endm

AMPS_Debug_PlayTrackSFX2	macro
	cmp.l	#sfxaddr,d0	; check if this is valid tracker
	blo.s	.fail\@		; if no, branch
	cmp.l	#musaddr,d0	; check if this is valid tracker
	blo.s	.ok\@		; if is, branch

.fail\@
	if def(RaiseError)	; check if Vladik's debugger is active
		RaiseError "Invalid tracker at SFX ch: %<.l d0>%<fendl>%<.l d0 sym>", AMPS_Debug_Console_Main
	else
		bra.w	*
	endif

.ok\@
    endm

AMPS_Debug_TrackUpd	macro
	move.l	a4,d1		; copy to d1
	and.l	#$FFFFFF,d1	; remove high byte
	cmp.l	#sfxaddr,d1	; check if this is valid tracker
	blo.s	.fail2		; if no, branch
	cmp.l	#dacaddr,d1	; check if this is valid tracker
	blo.s	.data		; if is, branch

.fail2
	if def(RaiseError)	; check if Vladik's debugger is active
		RaiseError "Invalid tracker address: %<.l a4>%<fendl>%<.l a4 sym>", AMPS_Debug_Console_Channel
	else
		bra.w	*
	endif
    endm
; ===========================================================================
; ---------------------------------------------------------------------------
; Tracker debugger handler and console code
; ---------------------------------------------------------------------------

AMPS_Debug_ChkTracker	macro
.fail
	if def(RaiseError)	; check if Vladik's debugger is active
		jsr	AMPS_DebugR_ChkTracker
	else
		bra.w	*
	endif
    endm

AMPS_DebugR_ChkTracker:
	if ~def(isAMPS)		; if not custom version
		moveq	#0,d7
		Console.Run AMPS_DebugR_ChkTracker2

	else
		jsr	AMPS_Debug_CalcMax(pc)
		swap	d7			; swap d7 words

AMPS_DebugR_ChkTracker_loop
		move.l	d7,$FF0000		; save stuff in RAM
		Console.Run AMPS_DebugR_ChkTracker2, "NAT"
		move.l	$FF0000,d7		; get stuff back

AMPS_DebugR_ChkTracker_nodraw
		moveq	#-1,d6
		dbf	d6,*			; delay a lot

	; implement reading control data
		lea	$A10003,a1
		move.b	#0,(a1)			; set TH low
		or.l	d0,d0			; delay
		move.b	#$40,(a1)		; set TH high
		or.l	d0,d0			; delay
		move.b	(a1),d0			; get dpad stat

		move.w	d7,d5			; copy to d5
		btst	#0,d0			; check if up held
		bne.s	AMPS_Debug_Writekd			; if not ,branch

		subq.w	#1,d7			; move up
		bpl.s	AMPS_Debug_Writekd			; if positive, branch
		clr.w	d7			; else force to 0

AMPS_Debug_Writekd
		btst	#1,d0			; check if down held
		bne.s	AMPS_Debug_Writekdraw			; if not ,branch

		swap	d7
		move.w	d7,d6			; copy high word to d6
		swap	d7

		cmp.w	d6,d7			; check if we can move up
		bge.s	AMPS_Debug_Writekdraw			; if not, branch
		addq.w	#1,d7			; move down

AMPS_Debug_Writekdraw
		cmp.w	d7,d5			; check if we need to redraw
		beq.s	AMPS_DebugR_ChkTracker_nodraw; if not, branch
		bra.w	AMPS_DebugR_ChkTracker_loop
	endif

AMPS_Debug_CalcMax:
		moveq	#28,d6	; max lines count
		moveq	#10-1,d7	; run for 10 chs
		moveq	#cSize,d5	; prepare size
		lea	mPSG3.w,a5	; start at PSG3

AMPS_Debug_Writehkloop
		tst.w	d6		; check if we have no lines left
	;	ble.s	.rts		; if so, we found it
		subq.w	#3,d6		; we need at least 3 lines
		bmi.s	.add		; if not enough lines, branch

		move.w	a5,d1		; copy ch to d1
		add.w	#cSize,d1	; go to end of it

		moveq	#0,d0
		move.b	cStack(a5),d0	; get stack to d0
		lea	(a5,d0.w),a6	; and get first element to a6

.stack
		cmp.w	a6,d1		; check if stack is dry now
		bhi.s	.inc		; if not, branch

		sub.w	d5,a5		; sub ch size
		dbf	d7,AMPS_Debug_Writehkloop	; loop for all chans
		bra.s	.add

.inc
		addq.w	#4,a6		; go to next long
		subq.w	#1,d6		; sub 1 line
		bpl.s	.stack		; if lines left, branch

.add
		addq.w	#1,d7		; increase ch by 1
.rts
		rts

AMPS_DebugR_ChkTracker_Ch:
		subq.w	#1,d7		; sub 1 from offset
		bpl.w	AMPS_Debug_Write_n; branch if positive
		tst.w	d6		; check if we need to render anymore
		bmi.w	AMPS_Debug_Write_n; if not, branch

; fmt: <addr> lstdur, dur, freq, sample, loop0, loop1, loop2
		jsr	(a0)
	Console.Write	  ": %<fpal2>%<.w a5> %<.b cLastDur(a5)> %<.b cDuration(a5)> %<.w cFreq(a5)>"
	Console.WriteLine " %<.b cSample(a5)> %<.b cLoop(a5)> %<.b cLoop+1(a5)> %<.b cLoop+2(a5)>"
	Console.WriteLine " %<fpal1>Addr: %<fpal0>%<.l cData(a5) sym|fsplit>%<fpal2,fsymdisp>"

		subq.w	#2,d6		; sub those 2 lines from stuff
		bmi.w	AMPS_Debug_Write_n; if drawn all, branch
		move.w	a5,d1		; copy ch to d1
		add.w	d5,d1		; go to end of it

		moveq	#0,d0
		move.b	cStack(a5),d0	; get stack to d0
		lea	(a5,d0.w),a6	; and get first element to a6

		cmp.w	a6,d1		; check if stack is dry
		bls.s	AMPS_Debug_Write		; if is, branch
	Console.WriteLine " %<fpal1>Stack:%<fpal0>%<.l (a6)+ sym|fsplit>%<fpal2,fsymdisp>"
		subq.w	#1,d6		; sub a line
		bmi.s	AMPS_Debug_Write_n; if drawn all, branch

AMPS_DebugR_ChkTracker_Ch_loop
		cmp.w	a6,d1		; check if we printed full stack
		bls.s	AMPS_Debug_Write		; if not though, branch
	Console.WriteLine "   %<fpal0>%<.l (a6)+ sym|fsplit>%<fpal2,fsymdisp>"
		subq.w	#1,d6		; sub a line
		bpl.s	AMPS_DebugR_ChkTracker_Ch_loop; if we havent drawn all, branch

AMPS_Debug_Write
	Console.BreakLine
		subq.w	#1,d6		; sub a line
AMPS_Debug_Write_n
		add.w	d5,a5		; go to next ch
		rts

AMPS_DebugR_ChkTracker2:
		moveq	#40-1,d6
		moveq	#cSize,d5
		lea	mDAC1.w,a5


		lea	AMPS_DebugR_ChkTracker2_dac1(pc),a0
		jsr	AMPS_DebugR_ChkTracker_Ch(pc)
		lea	AMPS_DebugR_ChkTracker2_dac2(pc),a0
		jsr	AMPS_DebugR_ChkTracker_Ch(pc)

		lea	AMPS_DebugR_ChkTracker2_fm1(pc),a0
		jsr	AMPS_DebugR_ChkTracker_Ch(pc)
		lea	AMPS_DebugR_ChkTracker2_fm2(pc),a0
		jsr	AMPS_DebugR_ChkTracker_Ch(pc)
		lea	AMPS_DebugR_ChkTracker2_fm3(pc),a0
		jsr	AMPS_DebugR_ChkTracker_Ch(pc)
		lea	AMPS_DebugR_ChkTracker2_fm4(pc),a0
		jsr	AMPS_DebugR_ChkTracker_Ch(pc)
		lea	AMPS_DebugR_ChkTracker2_fm5(pc),a0
		jsr	AMPS_DebugR_ChkTracker_Ch(pc)

		lea	AMPS_DebugR_ChkTracker2_psg1(pc),a0
		jsr	AMPS_DebugR_ChkTracker_Ch(pc)
		lea	AMPS_DebugR_ChkTracker2_psg2(pc),a0
		jsr	AMPS_DebugR_ChkTracker_Ch(pc)
		lea	AMPS_DebugR_ChkTracker2_psg3(pc),a0
		jmp	AMPS_DebugR_ChkTracker_Ch(pc)

AMPS_DebugR_ChkTracker2_dac1
	Console.Write " %<fpal0>DAC1"
		rts

AMPS_DebugR_ChkTracker2_dac2
	Console.Write " %<fpal0>DAC2"
		rts

AMPS_DebugR_ChkTracker2_fm1
	Console.Write " %<fpal0> FM1"
		rts

AMPS_DebugR_ChkTracker2_fm2
	Console.Write " %<fpal0> FM2"
		rts

AMPS_DebugR_ChkTracker2_fm3
	Console.Write " %<fpal0> FM3"
		rts

AMPS_DebugR_ChkTracker2_fm4
	Console.Write " %<fpal0> FM4"
		rts

AMPS_DebugR_ChkTracker2_fm5
	Console.Write " %<fpal0> FM5"
		rts

AMPS_DebugR_ChkTracker2_psg1
	Console.Write " %<fpal0>PSG1"
		rts

AMPS_DebugR_ChkTracker2_psg2
	Console.Write " %<fpal0>PSG2"
		rts

AMPS_DebugR_ChkTracker2_psg3
	Console.Write " %<fpal0>PSG3"
		rts
	endif
