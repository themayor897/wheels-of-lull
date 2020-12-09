Scriptname _Lull_SkySpyCapScript extends ObjectReference  

ObjectReference Property pegRef auto
Sound Property installSound auto
ObjectReference Property Analyst auto

MiscObject Property Peg auto
ObjectReference Property PlayerRef auto

bool Property isAnalyst = false auto
bool doOnce = false

Event OnActivate(ObjectReference akActionRef)
	if(!doOnce)
		PlayerRef.RemoveItem(Peg)
		pegRef.EnableNoWait(1)
		installSound.Play(Game.GetPlayer())
		Debug.MessageBox("You install one of the pegs into the slot.")
		if isAnalyst
			Analyst.EnableNoWait()
		endif
		doOnce = true
	endif
EndEvent