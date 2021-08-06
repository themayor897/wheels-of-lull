Scriptname _lull_clearWhitehorn extends ObjectReference  
location property whitehornFortress auto
location property whitehornJail auto
event OnDeath(actor akKiller)
    whitehornJail.SetCleared(true)
    whitehornFortress.SetCleared(true)
    
endevent 