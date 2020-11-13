Scriptname _Lull_WatchmanScript extends ObjectReference  

Enchantment Property ohmSpell auto
Spell Property orderSpell auto ;Shows what order to hit them in.
ObjectReference Property switch1 auto
ObjectReference Property switch2 auto
ObjectReference Property switch3 auto
ObjectReference Property switch4 auto
Quest Property watchmanEnable auto
float property order1 auto ;Order for the first one
float property order2 auto ;Order for the second one
float property order3 auto ;Order for the third one
float property order4 auto ;Order for the fourth one
GlobalVariable Property currentSet auto ;What order you hit them in.
GlobalVariable Property currentNode auto
GlobalVariable Property showedPatern auto;Simply a boolean
ObjectReference Property watchmanBoots auto
ObjectReference Property watchmanArmor auto
ObjectReference Property watchmanHelm auto
ObjectReference Property watchmanGauntlets auto
ActorBase Property watchMan auto
ObjectReference Property xMarker auto
weapon property ohmsRod auto

Sound Property startupSound auto

Event OnActivate(ObjectReference akActionRef)

	if game.GetPlayer().GetItemCount(ohmsRod as form) < 1
		debug.MessageBox("It looks like you'll need some sort of special staff to activate this, and you feel like you won't find that staff until you help out the Chronographers more")
	else
		debug.MessageBox("It seems like you should shoot this switch with your Rod of Ohm. This is extremely obvious, and you feel like a complete idiot for not realizing it.")
	endIf
endEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Enchantment akSpell = akSource as Enchantment 
	if(akSpell == ohmSpell)
		if(showedPatern.GetValue() == 0)
			showOrder();
		elseif(showedPatern.GetValue() == 1)
			checkOrder();
		endif
	endif
EndEvent

Function showOrder()
	if(currentSet.GetValue() == 0)
		orderSpell.Cast(switch1, switch1)
		Utility.Wait(1)
		orderSpell.Cast(switch2, switch2)
		Utility.Wait(1)
		orderSpell.Cast(switch3, switch3)
		Utility.Wait(1)
		orderSpell.Cast(switch4, switch4)
		showedPatern.SetValue(1)
	elseif(currentSet.GetValue() == 1)
		orderSpell.Cast(switch4, switch4)
		Utility.Wait(1)
		orderSpell.Cast(switch3, switch3)
		Utility.Wait(1)
		orderSpell.Cast(switch1, switch1)
		Utility.Wait(1)
		orderSpell.Cast(switch2, switch2)
		showedPatern.SetValue(1)
	elseif(currentSet.GetValue() == 2)
		orderSpell.Cast(switch2, switch2)
		Utility.Wait(1)
		orderSpell.Cast(switch3, switch3)
		Utility.Wait(1)
		orderSpell.Cast(switch4, switch4)
		Utility.Wait(1)
		orderSpell.Cast(switch1, switch1)
		showedPatern.SetValue(1)
	elseif(currentSet.GetValue() == 3)
		orderSpell.Cast(switch3, switch3)
		Utility.Wait(1)
		orderSpell.Cast(switch1, switch1)
		Utility.Wait(1)
		orderSpell.Cast(switch2, switch2)
		Utility.Wait(1)
		orderSpell.Cast(switch4, switch4)
		showedPatern.SetValue(1)
	endif
EndFunction

Function checkOrder()

	if(currentSet.GetValue() == 0)


		if((currentNode.GetValue() + 1) == order1)
			currentNode.SetValue(currentNode.GetValue() + 1)
	
			if(currentNode.GetValue() >= 4)

				Debug.MessageBox("The switches move to the next phase.")
				currentNode.SetValue(0)
				currentSet.SetValue(currentSet.GetValue() + 1)
			
				if(currentSet.GetValue() >= 4)

					switch1.DisableNoWait()
					switch2.DisableNoWait()
					switch3.DisableNoWait()
					switch4.DisableNoWait()
					startupSound.Play(Game.GetPlayer())
					watchmanEnable.SetObjectiveCompleted(2)
					watchmanEnable.SetStage(3)
					watchmanEnable.CompleteQuest()
					EnableWatchman()
				else	

					showOrder()
				endif

			endif
		else
			Debug.MessageBox("The switches reset.")

			currentNode.SetValue(0)
			showOrder()	
		endif			
	elseif(currentSet.GetValue() == 1)
		if((currentNode.GetValue() + 1) == order2)
			currentNode.SetValue(currentNode.GetValue() + 1)

			if(currentNode.GetValue() >= 4)
				Debug.MessageBox("The switches move to the next phase.")
				currentNode.SetValue(0)
				currentSet.SetValue(currentSet.GetValue() + 1)

				if(currentSet.GetValue() >= 4)
					switch1.DisableNoWait()
					switch2.DisableNoWait()
					switch3.DisableNoWait()
					switch4.DisableNoWait()
					startupSound.Play(Game.GetPlayer())
					watchmanEnable.SetObjectiveCompleted(2)
					watchmanEnable.SetStage(3)
					watchmanEnable.CompleteQuest()
					EnableWatchman()
				else	
					showOrder()
				endif

			endif
		else
			Debug.MessageBox("The switches reset.")
			currentNode.SetValue(0)
			showOrder()	
		endif	
	elseif(currentSet.GetValue() == 2)
		if((currentNode.GetValue() + 1) == order3)
			currentNode.SetValue(currentNode.GetValue() + 1)

			if(currentNode.GetValue() >= 4)
				Debug.MessageBox("The switches move to the next phase.")
				currentNode.SetValue(0)
				currentSet.SetValue(currentSet.GetValue() + 1)

				if(currentSet.GetValue() >= 4)
					switch1.DisableNoWait()
					switch2.DisableNoWait()
					switch3.DisableNoWait()
					switch4.DisableNoWait()
					startupSound.Play(Game.GetPlayer())
					watchmanEnable.SetObjectiveCompleted(2)
					watchmanEnable.SetStage(3)
					watchmanEnable.CompleteQuest()
					EnableWatchman()
				else	
					showOrder()
				endif

			endif
		else
			Debug.MessageBox("The switches reset.")
			currentNode.SetValue(0)
			showOrder()	
		endif	

	elseif(currentSet.GetValue() == 3)
		if((currentNode.GetValue() + 1) == order4)
			currentNode.SetValue(currentNode.GetValue() + 1)

			if(currentNode.GetValue() >= 4)
				Debug.MessageBox("The switches move to the next phase.")
				currentNode.SetValue(0)
				currentSet.SetValue(currentSet.GetValue() + 1)

				if(currentSet.GetValue() >= 4)
					switch1.DisableNoWait()
					switch2.DisableNoWait()
					switch3.DisableNoWait()
					switch4.DisableNoWait()
					startupSound.Play(Game.GetPlayer())
					watchmanEnable.SetObjectiveCompleted(2)
					watchmanEnable.SetStage(3)
					watchmanEnable.CompleteQuest()
					EnableWatchman()
				else	
					showOrder()
				endif

			endif
		else
			Debug.MessageBox("The switches reset.")
			currentNode.SetValue(0)
			showOrder()	
		endif	
	endif
EndFunction

Function EnableWatchman()
	watchmanBoots.DisableNoWait()
	watchmanArmor.DisableNoWait()
	watchmanHelm.DisableNoWait()
	watchmanGauntlets.DisableNoWait()
	xMarker.PlaceAtMe(watchMan, 1)
EndFunction