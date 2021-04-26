Scriptname _lull_UpgateMainScript extends ObjectReference  

;Modified by 4.25.21 by themayor897. Changed to playerref, removed excess getvalue calls

GlobalVariable Property destinationGate auto
ObjectReference Property gateMarker1 auto
ObjectReference Property gateMarker2 auto
ObjectReference Property gateMarker3 auto
ObjectReference Property gateMarker4 auto
ObjectReference Property gateMarker5 auto
ObjectReference Property gateMarker6 auto
Quest Property deepSea auto

Message Property _Lull_UpgateDeepSea01 auto
Message Property _Lull_UpgateDeepSea02 auto

Actor Property PlayerRef auto

Event OnActivate(ObjectReference akActionRef)
	int destgate = destinationGate.getvalue() as int
	int gateFail = Utility.RandomInt(0, 4)
	if(gateFail == 2 && !deepSea.IsCompleted())
		PlayerRef.MoveTo(gateMarker6)
		_Lull_UpgateDeepSea01.show()
	else
		if(destgate == 0)
			_Lull_UpgateDeepSea02.show()
		elseif(destgate == 1)
			PlayerRef.MoveTo(gateMarker1)
		elseif(destgate == 2)
			PlayerRef.MoveTo(gateMarker2)
		elseif(destgate == 3)
			PlayerRef.MoveTo(gateMarker3)
		elseif(destgate == 4)
			PlayerRef.MoveTo(gateMarker4)
		elseif(destgate == 5)
			PlayerRef.MoveTo(gateMarker5)
		endif
	endif
EndEvent 