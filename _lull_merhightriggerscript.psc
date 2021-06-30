Scriptname _Lull_MerHighTriggerScript extends ObjectReference  
;switched getplayer to playerref. Darthvitrial, 6/30/21
Quest Property MQ03 auto
Sound Property alarmSound auto
ObjectReference Property lullMove auto
Actor Property archeron auto
Actor Property masscroft auto
ObjectReference Property archerMove auto
ObjectReference Property massMove auto
ObjectReference Property lightBulb auto
ObjectReference Property chestThings auto
Int Property stage03 auto
Armor Property thalmorRobes auto
bool property doOnce = True auto
Actor property playerRef auto
Faction Property WhitehornThalmor auto

auto STATE waitingforPlayer
    Event OnTriggerEnter(ObjectReference akActionRef)
        Actor tmpRef = akActionRef as Actor
    if !tmpRef  ; get out if not an actor
        return
    endif
    if(tmpRef == playerRef)
            Game.DisablePlayerControls()
            alarmSound.Play(playerRef)
            lightBulb.EnableNoWait(1)
            Utility.Wait(3)
            playerRef.RemoveItem(thalmorRobes)
            ;playerRef.RemoveAllItems(chestThings)
            ;playerRef.MoveTo(lullMove)
            WhitehornThalmor.SendPlayertoJail()         
            archeron.MoveTo(archerMove)
            masscroft.MoveTo(massMove)
            MQ03.SetStage(stage03)
            archeron.EvaluatePackage()
            masscroft.EvaluatePackage()
            Game.EnablePlayerControls()
            
            if doOnce
                gotoState("hasBeenTriggered")
            endif
        
            Disable()
        
        endif
    EndEvent
EndState

STATE hasBeenTriggered
    ; this is an empty state.
endSTATE 