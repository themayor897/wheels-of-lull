Scriptname _Lull_MagnusVisorScript extends ObjectReference  

ImageSpaceModifier Property redSight auto
Spell Property lullianPing auto

Event OnEquipped(Actor akActor)
  if akActor == Game.GetPlayer()
	akActor.AddSpell(lullianPing)
	redSight.Apply()
  endIf
endEvent


Event OnUnequipped(Actor akActor)
  if akActor == Game.GetPlayer()
	akActor.RemoveSpell(lullianPing)
	redSight.Remove()
  endIf
endEvent