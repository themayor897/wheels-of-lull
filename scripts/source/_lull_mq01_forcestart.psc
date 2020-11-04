scriptName _Lull_MQ01_ForceStart extends ObjectReference

ObjectReference property lullTalkyActivator3 auto
quest property Lull_MQ01 auto
activator property TeleportMarker auto
ObjectReference property Llavados auto
ObjectReference property numinar auto
quest property Lull_MQ05 auto
quest property Lull_MQ04 auto
quest property Lull_MQ06 auto


Event OnActivate(ObjectReference akActionRef)

	if Lull_MQ01.GetStage() < 10
		if (Game.GetPlayer()).GetLevel() >= 16
			debug.MessageBox("You feel the world... shift, if that is the right word. It feels like something has happened, yet you hear nor see anything.")
			Llavados.MoveTo(Game.GetPlayer())
			Llavados.EnableNoWait(false)
		endIf
	endIf
	if Lull_MQ04.IsCompleted()
		if (Game.GetPlayer()).GetLevel() >= 25
			debug.MessageBox("You feel the world start to shift once more.")
			numinar.MoveTo(Game.GetPlayer())
			numinar.PlaceAtMe(TeleportMarker)
			numinar.enable(false)
		endIf
	endIf
	if Lull_MQ05.IsCompleted()
		if (Game.GetPlayer()).GetLevel() >= 30
			lullTalkyActivator3.MoveTo(Game.GetPlayer())
			(Game.GetPlayer()).PlaceAtMe(TeleportMarker)
			Lull_MQ06.SetStage(5)
		endIf
	endIf
endEvent
