Scriptname _Lull_CavePitScript extends ObjectReference  

Keyword Property lull_isMutant auto
Sound Property deathSound auto
Faction Property FollowerFact Auto
Faction Property PotentialFollowerFact Auto
Actor Property playerRef auto 
Event OnTriggerEnter(ObjectReference akActionRef)
        
    Actor tmpRef = akActionRef as Actor
    if !tmpRef  ; get out if not an actor
        return
    endif
    
    if(tmpRef == playerRef)
        playerRef.Kill() 
    Else
        if tmpRef.IsInFaction(FollowerFact)||tmpRef.IsInFaction(PotentialFollowerFact)
            utility.wait(1) ;we wait in case the player fell in and died too, this way the player has time to reset
            if !playerRef.isDead()
                tmpRef.MoveTo(playerRef) ;no point moving them if the save is about to reload.
            EndIf
        endif
    endif
    
    if(tmpRef.HasKeyword(lull_isMutant))
        tmpRef.DisableNoWait(1)
        deathSound.Play(playerRef)
    endif
EndEvent