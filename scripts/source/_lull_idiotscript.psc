scriptName _Lull_IdiotScript extends ObjectReference

;Modified 4.20.21 by themayor897 - added logging functions, simplified globalvariable modification functions

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

Message Property Idiot1 auto
Message Property Idiot2 auto
Message Property Idiot3 auto

Int numberActivated = 0


Event OnActivate(ObjectReference akActionRef)

	if numberActivated == 0
		self.BlockActivation(true)
		numberActivated = 1
		Idiot1.show()
		WoL.Log(self, "Idiot lantern activation 1/3")
		return 
	elseIf numberActivated == 1
		Idiot2.show()
		numberActivated = 2
		WoL.Log(self, "Idiot lantern activation 2/3")
		return 
	elseIf numberActivated == 2
		Idiot3.show()
		self.BlockActivation(false)
		numberActivated = 3
		WoL.Log(self, "Idiot lantern activation 3/3")
		return
	elseIf numberActivated == 3
		WoL.Log(self, "Idiot lantern picked up")
		;now you can pick it up.
	endIf
endEvent


Event OnLoad()

	self.BlockActivation(true)

endEvent


Event OnEquipped(actor akActor)

	if Boiling.Find(PlayerRef.GetParentCell()) >= 0
		WoL.Log(self, "Player is in the Boiling Foundry")
		if PlayerRef.GetItemCount(ohmRod as form) <= 0
			PlayerRef.AddItem(ohmRod, 1)
			WoL.Log(self, "Player does not have Rod of Ohm, adding to inventory...")
		endIf
		PlayerRef.MoveTo(foundryMarker)
		timesUsed.Mod(1)
		boilUsed.SetValue(1)
		WoL.Log(self, "Lantern times used set to " + timesused.GetValue() + ", boilUsed set to" + boilUsed.GetValue())
	endIf
	if Forest.Find(PlayerRef.GetParentCell()) >= 0
		WoL.Log(self, "Player is in the Brass Forest")
		if PlayerRef.GetItemCount(unwinder as form) <= 0
			PlayerRef.AddItem(unwinder, 1)
			WoL.Log(self, "Player does not have Unwinder, adding to inventory...")
		endIf
		PlayerRef.MoveTo(brassMarker)
		timesUsed.Mod(1)
		brassUsed.SetValue(1)
		WoL.Log(self, "Lantern times used set to " + timesused.GetValue() + ", brassUsed set to" + brassUsed.GetValue())
	endIf
	if Bottom.Find(PlayerRef.GetParentCell()) >= 0
		WoL.Log(self, "Player is at the Bottom of the World")
		if PlayerRef.GetItemCount(lullShield as form) <= 0
			PlayerRef.AddItem(lullShield)
			WoL.Log(self, "Player does not have Shield, adding to inventory...")
		endIf
		PlayerRef.MoveTo(bottomMarker)
		timesUsed.Mod(1)
		bottomUsed.SetValue(1)
		WoL.Log(self, "Lantern times used set to " + timesused.GetValue() + ", bottomUsed set to" + bottomUsed.GetValue())
	endIf
	if Cave.Find(PlayerRef.GetParentCell()) >= 0
		WoL.Log(self, "Player is in the Cave")
		PlayerRef.MoveTo(caveMarker)
		timesUsed.mod(1)
		WoL.Log(self, "Lantern times used set to " + timesused.GetValue())
	endIf

endEvent
