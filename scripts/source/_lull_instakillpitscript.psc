Scriptname _Lull_InstakillPitScript extends ObjectReference  

Armor Property lull_securityPack auto
ObjectReference Property startMarker auto
Actor Property PlayerRef auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef == PlayerRef)
		if PlayerRef.IsEquipped(lull_securityPack)
			PlayerRef.MoveTo(startMarker)
		else
			PlayerRef.Kill()
		endif
	endif
EndEvent