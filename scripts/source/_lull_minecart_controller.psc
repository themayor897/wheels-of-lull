Scriptname _Lull_Minecart_Controller extends ObjectReference

ObjectReference Property minecart auto;
ObjectReference Property minecartLocation1 auto;
ObjectReference Property minecartLocation2 auto;
Sound Property minecartMoveSound auto
int minecartLocation = 0; 0 is at origin, 1 is at first destination

Event OnCellAttach()
	if(minecartLocation == 0)
		self.TranslateToRef(minecartLocation1, 300)
	else
		self.TranslateToRef(minecartLocation2, 300)
	endif
EndEvent

Event OnTranslationComplete()
	if(minecartLocation == 0)
		Utility.Wait(1)
		self.TranslateToRef(minecartLocation2, 300)
		minecartLocation = 1
	else
		Utility.Wait(1)
		self.TranslateToRef(minecartLocation1, 300)
		minecartLocation = 0
	endif
EndEvent


