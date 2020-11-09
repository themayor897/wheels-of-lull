scriptName _Lull_IdiotScript extends ObjectReference

globalvariable property bottomUsed auto
cell property boiling13 auto
weapon property ohmRod auto
cell property boiling6 auto
cell property bottom1 auto
cell property cave7 auto
cell property bottom2 auto
globalvariable property brassUsed auto
cell property boiling12 auto
ObjectReference property foundryMarker auto
cell property boiling3 auto
cell property boiling10 auto
ObjectReference property brassMarker auto
cell property bottom4 auto
cell property boiling7 auto
weapon property unwinder auto
cell property bottom3 auto
cell property cave8 auto
cell property bottom7 auto
cell property boiling2 auto
cell property cave9 auto
cell property bottom5 auto
armor property lullShield auto
cell property cave5 auto
cell property cave4 auto
cell property cave3 auto
globalvariable property timesUsed auto
cell property boiling4 auto
cell property boiling8 auto
cell property cave2 auto
cell property cave1 auto
cell property brass3 auto
cell property brass1 auto
ObjectReference property caveMarker auto
cell property bottom9 auto
cell property bottom8 auto
cell property bottom6 auto
cell property boiling1 auto
cell property brass4 auto
cell property cave6 auto
globalvariable property boilUsed auto
cell property brass8 auto
ObjectReference property bottomMarker auto
cell property boiling5 auto
cell property boiling9 auto
cell property brass6 auto
cell property boiling11 auto
cell property brass2 auto
cell property brass7 auto
cell property brass5 auto

Int numberActivated = 0


function OnActivate(ObjectReference akActionRef)

	if numberActivated == 0
		self.BlockActivation(true)
		numberActivated = 1
		debug.MessageBox("Something about this lantern disturbs you. You feel like if you pick it up and use it, very bad things will happen.")
		return 
	elseIf numberActivated == 1
		debug.MessageBox("You try to ignore the warnings in your head, but they reach a crescendo. Every fiber of your being tells you that this lantern is Wrong. You realize that using it will cause extreme consequences, and you will only have yourself to blame.")
		numberActivated = 2
		return 
	elseIf numberActivated == 2
		debug.MessageBox("Despite your persistence, you feel like using this lantern will hold consequences. There's clearly plenty of reasons not to use the lantern, and you feel like you should only use this if you truly are, as the name suggest, a complete idiot. Using the lantern for any other reason would be foolish.")
		numberActivated = 3
		return 
	elseIf numberActivated == 3
		self.BlockActivation(false)
		self.Activate(game.GetPlayer() as ObjectReference, false)
	endIf
endFunction


function OnLoad()

	self.BlockActivation(true)
endFunction


function OnEquipped(actor akActor)

	if game.GetPlayer().GetParentCell() == boiling1 || game.GetPlayer().GetParentCell() == boiling2 || game.GetPlayer().GetParentCell() == boiling3 || game.GetPlayer().GetParentCell() == boiling4 || game.GetPlayer().GetParentCell() == boiling5 || game.GetPlayer().GetParentCell() == boiling6 || game.GetPlayer().GetParentCell() == boiling7 || game.GetPlayer().GetParentCell() == boiling8 || game.GetPlayer().GetParentCell() == boiling9 || game.GetPlayer().GetParentCell() == boiling10 || game.GetPlayer().GetParentCell() == boiling11 || game.GetPlayer().GetParentCell() == boiling12 || game.GetPlayer().GetParentCell() == boiling13
		if game.GetPlayer().GetItemCount(ohmRod as form) <= 0
			game.GetPlayer().AddItem(ohmRod, 1)
		endIf
		game.GetPlayer().MoveTo(foundryMarker)
		timesUsed.SetValue(timesUsed.GetValue() + 1 as Float)
		boilUsed.SetValue(1 as Float)
	endIf
	if game.GetPlayer().GetParentCell() == brass1 || game.GetPlayer().GetParentCell() == brass2 || game.GetPlayer().GetParentCell() == brass3 || game.GetPlayer().GetParentCell() == brass4 || game.GetPlayer().GetParentCell() == brass5 || game.GetPlayer().GetParentCell() == brass6 || game.GetPlayer().GetParentCell() == brass7 || game.GetPlayer().GetParentCell() == brass8
		if game.GetPlayer().GetItemCount(unwinder as form) <= 0
			game.GetPlayer().AddItem(unwinder, 1)
		endIf
		game.GetPlayer().MoveTo(brassMarker)
		timesUsed.SetValue(timesUsed.GetValue() + 1 as Float)
		brassUsed.SetValue(1 as Float)
	endIf
	if game.GetPlayer().GetParentCell() == bottom1 || game.GetPlayer().GetParentCell() == bottom2 || game.GetPlayer().GetParentCell() == bottom3 || game.GetPlayer().GetParentCell() == bottom4 || game.GetPlayer().GetParentCell() == bottom5 || game.GetPlayer().GetParentCell() == bottom6 || game.GetPlayer().GetParentCell() == bottom7 || game.GetPlayer().GetParentCell() == bottom8 || game.GetPlayer().GetParentCell() == bottom9
		if game.GetPlayer().GetItemCount(lullShield as form) <= 0
			game.GetPlayer().AddItem(lullShield)
		endIf
		game.GetPlayer().MoveTo(bottomMarker)
		timesUsed.SetValue(timesUsed.GetValue() + 1 as Float)
		bottomUsed.SetValue(1 as Float)
	endIf
	if game.GetPlayer().GetParentCell() == cave1 || game.GetPlayer().GetParentCell() == cave2 || game.GetPlayer().GetParentCell() == cave3 || game.GetPlayer().GetParentCell() == cave4 || game.GetPlayer().GetParentCell() == cave5 || game.GetPlayer().GetParentCell() == cave6 || game.GetPlayer().GetParentCell() == cave7 || game.GetPlayer().GetParentCell() == cave8 || game.GetPlayer().GetParentCell() == cave9
		game.GetPlayer().MoveTo(caveMarker)
		timesUsed.SetValue(timesUsed.GetValue() + 1 as Float)
	endIf
endFunction
