; by 3Ra Gaming
; Automatically Nexuses you when you get to about 40% health and auto-heals around 60% health.
; Todo: add paladin specific heal code

Loop {
	sleep 10
	IfWinActive, Adobe Flash Player
	{
		PixelGetColor, graycolor, 1910, 460
		PixelGetColor, nexusiconblack, 1851, 390
		PixelGetColor, classicon, 1490, 370
		; StringRight, OutputVar, InputVar, 2
		PixelGetColor, hpcolor, 1650, 459
		PixelGetColor, hpcolor2, 1700, 459
		PixelGetColor, hpcolor3, 1725, 459
		PixelGetColor, hpcolor4, 1800, 459
		PixelGetColor, hpcolor5, 1850, 459
		PixelGetColor, hpendcolor, 1890, 459
		if (graycolor = 0x363636) and (nexusiconblack = 0x090909) and (hpcolor3 = 0x545454) and (hpcolor4 = 0x545454) and (hpcolor5 = 0x545454) and (hpendcolor = 0x545454)
		{
			if (hpcolor = 0x545454) and (hpcolor2 = 0x545454)
			{
				Send R
			} else {
				if (classicon = 0x9D9D9D)
				{
					Send {Space} ; priest heal spell
					sleep 400
				} else {
					; Send F ; all other classes drink health potion
					; sleep 400
				}
			}
		}
	}
}	

SendToChat(chatkey, msg) {
	IfWinActive, Adobe Flash Player
	{
		ClipSave := clipboard
		clipboard = %msg%
		Send %chatkey%^v{Enter}
		clipboard = %ClipSave%
	}
}

~^g::
SendToChat("{Enter}","heal plz")
Return
	
^!Tab::
; SendToChat("{Enter}","Regroup on me for fame train. Priests, pallys, and warriors please use your spells.")	
SendToChat("{Enter}","Priests, pallys, and warriors please don't let your mana get above 90%. Use your spells to keep the train moving fast.")	
Return
	
~Tab::
SendToChat("``","Auto-reply: I'm taking a break from trading for a bit. I may be free in half an hour if you are still interested.")	
Return

^!Q::
ExitApp
Return

^!R::
Reload
Return

F11::
Pause:
Pause
Return
