Scriptname _Lull_InstakillPitScript extends ObjectReference  

Armor Property lull_securityPack auto
ObjectReference Property startMarker auto
Actor Property PlayerRef Auto
Faction Property FollowerFact Auto
Faction Property PotentialFollowerFact Auto
Event OnTriggerEnter(ObjectReference akActionRef)
    
    Actor tmpRef = akActionRef as Actor
    if !tmpRef  ; get out if not an actor
        return
    endif
    
    if tmpRef == PlayerRef
        if PlayerRef.IsEquipped(lull_securityPack)
            PlayerRef.MoveTo(startMarker)
        else
            PlayerRef.Kill()
        endif
    Else
        if tmpRef.IsInFaction(FollowerFact)||tmpRef.IsInFaction(PotentialFollowerFact)
            utility.wait(1) ;we wait in case the player fell in and died too, this way the player has time to reset
            if !PlayerRef.isDead()
                tmpRef.MoveTo(PlayerRef) ;no point moving them if the save is about to reload.
            EndIf
        endif
    endif

EndEvent