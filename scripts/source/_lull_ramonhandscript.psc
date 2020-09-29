Scriptname _Lull_RamonHandScript extends ObjectReference  
ObjectReference Property handMarker auto

;Normal hand markers
ObjectReference Property handMarker1 auto
ObjectReference Property handMarker2 auto
ObjectReference Property handMarker3 auto
Spell Property handLaser auto;
Sound Property stopSound auto
;SMASH HAND marker
ObjectReference Property smashHandMarker auto


;Variables for controlling attack
int attack;
int locType = 0;
bool doOnce = false;
bool hasSmashed = false;

Event OnLoad()
	self.TranslateToRef(handMarker, 600)
EndEvent

Event OnTranslationComplete()
	if(hasSmashed)
		self.TranslateToRef(handMarker2, 3000)
		hasSmashed = false
	elseif(!doOnce)
		moveAttack()
		doOnce = true;
	else
		attack = Utility.RandomInt(0, 2)
		if(attack == 0) ;Move
			moveAttack()
		elseif(attack == 1);Bolt
			handLaser.Cast(self, Game.GetPlayer())
			moveAttack()
		elseif(attack == 2);Hand slam
			handSlam()
		endif
	endif
	stopSound.Play(self)
EndEvent

Function moveAttack()
	locType = Utility.RandomInt(0, 2)
	if(locType == 0)
		self.TranslateToRef(handMarker1, 1000)
	elseif(locType == 1)
		self.TranslateToRef(handMarker2, 1000)
	elseif(locType == 2)
		self.TranslateToRef(handMarker3, 1000)
	endif
EndFunction

Function handSlam()
		self.TranslateToRef(smashHandMarker, 1500)
		hasSmashed = true
EndFunction