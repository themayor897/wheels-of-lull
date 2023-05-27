Scriptname _lull_EnableSword extends ObjectReference  
actor property playerRef auto 
ObjectReference property sword auto 
quest property MQ07 auto 
bool doOnce =false
event OnTriggerEnter(ObjectReference akActionRef)
    if !doOnce
        Actor tmpref=akActionRef as actor
        if !tmpRef || tmpRef != playerRef 
            Return
        endif 
        if mq07.getStage() >= 20
            sword.enablenowait()
            doOnce = true
        endif 
    endif 
endevent 