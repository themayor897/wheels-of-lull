;updated 7/8/21 darthvitrial. Move to xmarker instead of editor location.
Scriptname _Lull_LullMorUnderScript extends ObjectReference  

Faction Property whitehornFaction Auto
Faction Property chronographerFaction Auto
ObjectReference property respawnPoint Auto
Event OnTriggerEnter(ObjectReference akActionRef)
    
    Actor tmpRef = akActionRef as Actor
    if !tmpRef  ; get out if not an actor
        return
    endif
        if tmpRef.IsInFaction(whitehornFaction)
        tmpRef.Kill()
    Else
        if tmpRef.IsInFaction(chronographerFaction)
            ;tmpRef.MoveToMyEditorLocation()
            tmpRef.MoveTo(respawnPoint)
        endif
    Endif

EndEvent