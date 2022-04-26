Scriptname _lull_addPerk extends ObjectReference  
Perk Property lullPerk Auto
Message property perkMessage auto
Message property alreadyHave auto 
Actor Property PlayerRef Auto
event OnActivate(ObjectReference akActionRef)
    if (!playerRef.hasPerk(lullPerk))
            playerRef.addPerk(lullPerk)
            perkMessage.show()
    else 
            alreadyHave.show()
         EndIf
     endevent