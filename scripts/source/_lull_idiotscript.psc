scriptName _Lull_IdiotScript extends ObjectReference

globalvariable property bottomUsed auto
globalvariable property brassUsed auto
globalvariable property timesUsed auto
globalvariable property boilUsed auto

weapon property ohmRod auto
weapon property unwinder auto
armor property lullShield auto

ObjectReference property foundryMarker auto
ObjectReference property brassMarker auto
ObjectReference property caveMarker auto
ObjectReference property bottomMarker auto

ObjectReference Property PlayerRef auto

Cell[] property Boiling auto
Cell[] property Forest auto
Cell[] property Bottom auto
Cell[] property Cave auto


Int numberActivated = 0


Event OnActivate(ObjectReference akActionRef)

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
		debug.MessageBox("Despite your persistence, you feel like using this lantern will hold consequences. There are clearly plenty of reasons not to use the lantern, and you feel like you should only use this if you truly are, as the name suggests, a complete idiot. Using the lantern for any other reason would be foolish.")
		self.BlockActivation(false)
		numberActivated = 3
		return
	elseIf numberActivated == 3
		;now you can pick it up.
	endIf
endEvent


Event OnLoad()

	self.BlockActivation(true)

endEvent


Event OnEquipped(actor akActor)

	if Boiling.Find(PlayerRef.GetParentCell()) >= 0
		if PlayerRef.GetItemCount(ohmRod as form) <= 0
			PlayerRef.AddItem(ohmRod, 1)
		endIf
		PlayerRef.MoveTo(foundryMarker)
		timesUsed.SetValue(timesUsed.GetValue() + 1 as Float)
		boilUsed.SetValue(1 as Float)
	endIf
	if Forest.Find(PlayerRef.GetParentCell()) >= 0
		if PlayerRef.GetItemCount(unwinder as form) <= 0
			PlayerRef.AddItem(unwinder, 1)
		endIf
		PlayerRef.MoveTo(brassMarker)
		timesUsed.SetValue(timesUsed.GetValue() + 1 as Float)
		brassUsed.SetValue(1 as Float)
	endIf
	if Bottom.Find(PlayerRef.GetParentCell()) >= 0
		if PlayerRef.GetItemCount(lullShield as form) <= 0
			PlayerRef.AddItem(lullShield)
		endIf
		PlayerRef.MoveTo(bottomMarker)
		timesUsed.SetValue(timesUsed.GetValue() + 1 as Float)
		bottomUsed.SetValue(1 as Float)
	endIf
	if Cave.Find(PlayerRef.GetParentCell()) >= 0
		PlayerRef.MoveTo(caveMarker)
		timesUsed.SetValue(timesUsed.GetValue() + 1 as Float)
	endIf

endEvent
