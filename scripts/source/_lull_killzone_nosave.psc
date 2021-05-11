Scriptname _Lull_Killzone_NoSave extends ObjectReference  
Actor property playerRef auto
Faction Property followerFact Auto
Faction Property potentialFollowerFact Auto
Event OnTriggerEnter(ObjectReference akActionRef)
     Actor tmpRef = akActionRef as Actor
    if !tmpRef  ; get out if not an actor
        return
    endif
    if(tmpRef == playerRef)
        playerRef.Kill()
    Else
        if tmpRef.IsInFaction(FollowerFact)||tmpRef.IsInFaction(PotentialFollowerFact)
            tmpRef.MoveTo(playerRef)
        endif
    endif

EndEvent