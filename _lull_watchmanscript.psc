Scriptname _Lull_WatchmanScript extends ObjectReference  
;updated 8/10/21 vitrial. Reorganize to only show next stage messages if it's not the final stage, replace getplayer with playerref, add wait function
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
ObjectReference Property watchmanActivator auto
ActorBase Property watchMan auto
ObjectReference Property xMarker auto
weapon property ohmsRod auto
Actor property playerRef auto
Sound Property startupSound auto

Message Property _Lull_UseOhm Auto
Message Property _Lull_NeedOhm Auto
Message Property _Lull_WatchmanSwitchNextPhase auto
Message Property _Lull_WatchmanSwitchReset Auto
int CSet
Event OnActivate(ObjectReference akActionRef)

    if playerRef.GetItemCount(ohmsRod as form) < 1
        _Lull_NeedOhm.show()
    else
        _Lull_UseOhm.Show()
    endIf
endEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
    Enchantment akSpell = akSource as Enchantment 
    int Pattern = showedPatern.GetValue() as int
    if(akSpell == ohmSpell)
        if(Pattern == 0)
            showOrder();
        elseif(Pattern == 1)
            checkOrder();
        endif
    endif
EndEvent

Function showOrder()
     CSet = currentSet.GetValue() as int
     while utility.isInMenuMode()
           utility.wait(0.1)
     endWhile
       utility.wait(1)
    if(CSet == 0)
        orderSpell.Cast(switch1, switch1)
        Utility.Wait(1)
        orderSpell.Cast(switch2, switch2)
        Utility.Wait(1)
        orderSpell.Cast(switch3, switch3)
        Utility.Wait(1)
        orderSpell.Cast(switch4, switch4)
        showedPatern.SetValue(1)
    elseif(CSet == 1)
        orderSpell.Cast(switch4, switch4)
        Utility.Wait(1)
        orderSpell.Cast(switch3, switch3)
        Utility.Wait(1)
        orderSpell.Cast(switch1, switch1)
        Utility.Wait(1)
        orderSpell.Cast(switch2, switch2)
        showedPatern.SetValue(1)
    elseif(CSet == 2)
        orderSpell.Cast(switch2, switch2)
        Utility.Wait(1)
        orderSpell.Cast(switch3, switch3)
        Utility.Wait(1)
        orderSpell.Cast(switch4, switch4)
        Utility.Wait(1)
        orderSpell.Cast(switch1, switch1)
        showedPatern.SetValue(1)
    elseif(CSet == 3)
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
            currentNode.Mod(1)
    
            if(currentNode.GetValue() >= 4)


                currentNode.SetValue(0)
                currentSet.Mod(1)
            if(currentSet.GetValue() < 4)
                _Lull_WatchmanSwitchNextPhase.show()
            endif
            
                if(currentSet.GetValue() >= 4)

                    switch1.DisableNoWait()
                    switch2.DisableNoWait()
                    switch3.DisableNoWait()
                    switch4.DisableNoWait()
                    startupSound.Play(playerRef)
                    watchmanEnable.SetObjectiveCompleted(2)
                    watchmanEnable.SetStage(3)
                    watchmanEnable.CompleteQuest()
                    EnableWatchman()
                else    

                    showOrder()
                endif

            endif
        else
            _Lull_WatchmanSwitchReset.show()

            currentNode.SetValue(0)
            showOrder() 
        endif           
    elseif(currentSet.GetValue() == 1)
        if((currentNode.GetValue() + 1) == order2)
            currentNode.Mod(1)

            if(currentNode.GetValue() >= 4)
                
                currentNode.SetValue(0)
                currentSet.Mod(1)
                if(currentSet.GetValue() < 4)
                _Lull_WatchmanSwitchNextPhase.show()
            endif
                if(currentSet.GetValue() >= 4)
                    switch1.DisableNoWait()
                    switch2.DisableNoWait()
                    switch3.DisableNoWait()
                    switch4.DisableNoWait()
                    startupSound.Play(playerRef)
                    watchmanEnable.SetObjectiveCompleted(2)
                    watchmanEnable.SetStage(3)
                    watchmanEnable.CompleteQuest()
                    EnableWatchman()
                else    
                    showOrder()
                endif

            endif
        else
            _Lull_WatchmanSwitchReset.show()
            currentNode.SetValue(0)
            showOrder() 
        endif   
    elseif(currentSet.GetValue() == 2)
        if((currentNode.GetValue() + 1) == order3)
            currentNode.Mod(1)

            if(currentNode.GetValue() >= 4)
                currentNode.SetValue(0)
                currentSet.Mod(1)
                if(currentSet.GetValue() < 4)
                _Lull_WatchmanSwitchNextPhase.show()
                endif
                if(currentSet.GetValue() >= 4)
                    switch1.DisableNoWait()
                    switch2.DisableNoWait()
                    switch3.DisableNoWait()
                    switch4.DisableNoWait()
                    startupSound.Play(playerRef)
                    watchmanEnable.SetObjectiveCompleted(2)
                    watchmanEnable.SetStage(3)
                    watchmanEnable.CompleteQuest()
                    EnableWatchman()
                else    
                    showOrder()
                endif

            endif
        else
            _Lull_WatchmanSwitchReset.show()
            currentNode.SetValue(0)
            showOrder() 
        endif   

    elseif(currentSet.GetValue() == 3)
        if((currentNode.GetValue() + 1) == order4)
            currentNode.Mod(1)

            if(currentNode.GetValue() >= 4)

                currentNode.SetValue(0)
                currentSet.Mod(1)
                if(currentSet.GetValue() < 4)
                _Lull_WatchmanSwitchNextPhase.show()
                endif
                if(currentSet.GetValue() >= 4)
                    switch1.DisableNoWait()
                    switch2.DisableNoWait()
                    switch3.DisableNoWait()
                    switch4.DisableNoWait()
                    startupSound.Play(playerRef)
                    watchmanEnable.SetObjectiveCompleted(2)
                    watchmanEnable.SetStage(3)
                    watchmanEnable.CompleteQuest()
                    EnableWatchman()
                else    
                    showOrder()
                endif

            endif
        else
            _Lull_WatchmanSwitchReset.show()
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
    watchmanActivator.DisableNoWait()
    xMarker.PlaceAtMe(watchMan, 1)
EndFunction 