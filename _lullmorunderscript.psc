Scriptname _LullMorUnderScript extends ObjectReference  

Faction Property whitehornFaction Auto
Faction Property chronographerFaction Auto
Event OnTriggerEnter(ObjectReference akActionRef)
    
    Actor tmpRef = akActionRef as Actor
    if !tmpRef  ; get out if not an actor
        return
    endif
        if tmpRef.IsInFaction(whitehornFaction)
        tmpRef.Kill()
    Else
        if tmpRef.IsInFaction(chronographerFaction)
            tmpRef.MoveToMyEditorLocation()
        endif
    Endif

EndEvent