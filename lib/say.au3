If $CMDLINE[0] = 1 Then
	_say($CMDLINE[1], 1, 100)
Else
	_say('Input text is missing')
EndIf

Func _say($text, $rate = 1, $vol = 100)
	; use sapi text to speech
	If $rate > 10 Or $vol > 100 Then Return
	Local $sapi = ObjCreate('SAPI.SpVoice')
	If Not @error Then
		With $sapi
			.Rate = $rate
			.Volume = $vol
			.Speak($text, 1)
			.WaitUntilDone(500)
			.Pause()
			 Sleep(1000)
			.Resume()
			.WaitUntilDone(-1)
		EndWith
	EndIf
EndFunc