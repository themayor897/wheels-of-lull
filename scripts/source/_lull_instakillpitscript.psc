Scriptname _Lull_InstakillPitScript extends ObjectReference  

Armor Property lull_securityPack auto
ObjectReference Property startMarker auto
ObjectReference Property PlayerRef auto

Event OnTriggerEnter(ObjectReference akActionRef)
	Actor akActor = akActionRef as Actor
	if(akActor.IsEquipped(lull_securityPack)) && (akActionRef == PlayerRef)
		akActor.MoveTo(startMarker)
	else
		akActor.Kill()
	endif
EndEvent