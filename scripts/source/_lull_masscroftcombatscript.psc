Scriptname _Lull_MasscroftCombatScript extends Actor  

ObjectReference Property teleportMarker1 auto
ObjectReference Property teleportMarker2 auto
ObjectReference Property teleportMarker3 auto
ObjectReference Property teleportMarker4 auto
Spell Property invisibleSpell auto
Cell Property bottomCell auto
Actor Property PlayerRef auto
Activator Property teleporter auto
bool doOnce = FALSE
GlobalVariable property NumFalls auto
GlobalVariable property TotalFalls auto
float HitDamage
float ReqHits

Spell Property lullSpell auto
ActorBase Property MasscroftBase auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Spell akSpell = akSource as Spell
	if(akSpell == lullSpell)
		PlayerRef.PushActorAway(self, 15)
		Utility.Wait(2)
		endif
EndEvent


Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
  if (akTarget == PlayerRef)
	if(self.GetParentCell() == bottomCell)
		if(!doOnce)
			RegisterForSingleUpdate(7)
			ReqHits = TotalFalls.GetValue()
			CheckHealth(self)
			doOnce = TRUE
		endif
	endif
 endif
EndEvent


Event OnUpdate()
	float hits = (NumFalls.GetValue() - 1) ;numfalls defaults to 1 so totalfalls works properly in MCM.
 	int randomNumber = Utility.RandomInt(0, 3)
	invisibleSpell.Cast(self, self)
	WoL.Log(self, "Masscroft update processed, choosing random location...")
		if(randomNumber == 0)
			self.PlaceAtMe(teleporter, 1)
			self.MoveTo(teleportMarker1)
			self.Resurrect()
			self.DamageAV("Health", (hits*HitDamage))
			self.StartCombat(PlayerRef)
			invisibleSpell.Cast(self, self)
		elseif(randomNumber == 1)
			self.PlaceAtMe(teleporter, 1)
			self.MoveTo(teleportMarker2)
			self.Resurrect()
			self.DamageAV("Health", (hits*HitDamage))
			self.StartCombat(PlayerRef)
			invisibleSpell.Cast(self, self)
		elseif(randomNumber == 2)
			self.PlaceAtMe(teleporter, 1)
			self.MoveTo(teleportMarker3)
			self.Resurrect()
			self.DamageAV("Health", (hits*HitDamage))
			self.StartCombat(PlayerRef)
			invisibleSpell.Cast(self, self)
		elseif(randomNumber == 3)
			self.PlaceAtMe(teleporter, 1)
			self.MoveTo(teleportMarker4)
			self.Resurrect()
			self.DamageAV("Health", (hits*HitDamage))
			self.StartCombat(PlayerRef)
			invisibleSpell.Cast(self, self)
		endif
		if(!self.IsDisabled())
			RegisterForSingleUpdate(20)
		endif

EndEvent 

Function CheckHealth(Actor akActor)
	Float BaseValue = akActor.GetBaseActorValue("Health")
	Float CurrentMaxValue = Math.Ceiling(akActor.GetActorValue("Health") / akActor.GetActorValuePercentage("Health"))
	Float ValueDifference = CurrentMaxValue - (akactor.GetActorValue("Health"))
	akactor.RestoreAV("Health", ValueDifference)
	HitDamage = ((CurrentMaxValue / ReqHits) - 1)
	WoL.log(self, "Masscroft hit value calculated to be" + HitDamage)
EndFunction