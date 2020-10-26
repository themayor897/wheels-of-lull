scriptName _Lull_MQ01_ForceStart extends ObjectReference

ObjectReference property lullTalkyActivator3 auto
ObjectReference property PlayerRef auto
quest property Lull_MQ01 auto
activator property TeleportMarker auto
ObjectReference property Llavados auto
ObjectReference property numinar auto
quest property Lull_MQ05 auto
quest property Lull_MQ04 auto
quest property Lull_MQ06 auto


Event OnActivate(ObjectReference akActionRef)

	if Lull_MQ01.GetStage() < 10
		if PlayerRef.GetLevel() >= 16
			debug.MessageBox("You feel the world... shift, if that is the right word. It feels like something has happened, yet you hear nor see anything.")
			Llavados.MoveTo(PlayerRef as ObjectReference, 0.000000, 0.000000, 0.000000, true)
			Llavados.EnableNoWait(false)
		endIf
	endIf
	if Lull_MQ04.IsCompleted()
		if PlayerRef.GetLevel() >= 25
			debug.MessageBox("You feel the world start to shift once more.")
			numinar.MoveTo(PlayerRef as ObjectReference, 0.000000, 0.000000, 0.000000, true)
			numinar.PlaceAtMe(TeleportMarker as form, 1, false, false)
			numinar.enable(false)
		endIf
	endIf
	if Lull_MQ05.IsCompleted()
		if PlayerRef.GetLevel() >= 30
			lullTalkyActivator3.MoveTo(PlayerRef as ObjectReference, 0.000000, 0.000000, 0.000000, true)
			PlayerRef.PlaceAtMe(TeleportMarker as form, 1, false, false)
			Lull_MQ06.SetStage(5)
		endIf
	endIf
endEvent
