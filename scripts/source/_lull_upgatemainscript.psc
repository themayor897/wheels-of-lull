Scriptname _lull_UpgateMainScript extends ObjectReference  
GlobalVariable Property destinationGate auto
ObjectReference Property gateMarker1 auto
ObjectReference Property gateMarker2 auto
ObjectReference Property gateMarker3 auto
ObjectReference Property gateMarker4 auto
ObjectReference Property gateMarker5 auto
ObjectReference Property gateMarker6 auto
Quest Property deepSea auto
Event OnActivate(ObjectReference akActionRef)
	int gateFail = Utility.RandomInt(0, 4)
	if(gateFail == 2 && !deepSea.IsCompleted())
		Game.GetPlayer().MoveTo(gateMarker6)
		Debug.MessageBox("Something went wrong it seems.")
	else
		if(destinationGate.GetValue() == 0)
			Debug.MessageBox("Doesn't look like it'll go anywhere.")
		elseif(destinationGate.GetValue() == 1)
			Game.GetPlayer().MoveTo(gateMarker1)
		elseif(destinationGate.GetValue() == 2)
			Game.GetPlayer().MoveTo(gateMarker2)
		elseif(destinationGate.GetValue() == 3)
			Game.GetPlayer().MoveTo(gateMarker3)
		elseif(destinationGate.GetValue() == 4)
			Game.GetPlayer().MoveTo(gateMarker4)
		elseif(destinationGate.GetValue() == 5)
			Game.GetPlayer().MoveTo(gateMarker5)
		endif
	endif
EndEvent
