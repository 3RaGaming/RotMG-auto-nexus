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
		if (graycolor = 0x363636) and (nexusiconblack = 0x090909) and (hpcolor3 != 0x3434E0) and (hpcolor4 != 0x3434E0) and (hpcolor5 != 0x3434E0) and (hpendcolor != 0x3434E0)
		{
			if (hpcolor != 0x3434E0) and (hpcolor2 != 0x3434E0)
			{
				Send R
			} else {
				if (classicon = 0x9D9D9D)
				{
					Send {Space} ; priest heal spell
				} else {
					Send F ; all other classes drink health potion
				}
			}
			sleep 400
		}
	}
}	

^!Tab::
IfWinActive, Adobe Flash Player
{
	Send {Enter}Regroup on me for fame train.{Enter}
}
Return
	
; +Tab::
; Send "`"
; sleep 100
; Send test{Enter}
; Return

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
