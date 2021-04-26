Scriptname _Lull_SkySpyCapScript extends ObjectReference  

ObjectReference Property pegRef auto
Sound Property installSound auto
ObjectReference Property Analyst auto
Actor Property PlayerRef auto
Message Property _Lull_InstallPeg auto

bool Property isAnalyst = false auto
bool doOnce = false

Event OnActivate(ObjectReference akActionRef)
	if(!doOnce)
		pegRef.EnableNoWait(1)
		installSound.Play(PlayerRef)
		_Lull_InstallPeg.show()
		WoL.Log(self, "Peg installed.")
		if isAnalyst
			Analyst.EnableNoWait()
			WoL.Log(self, "Analyst enabled")
		endif
		doOnce = true
	endif
EndEvent