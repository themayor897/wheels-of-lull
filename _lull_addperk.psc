Scriptname _lull_addPerk extends ObjectReference  
Perk Property lullPerk Auto
Message property perkMessage auto
Message property alreadyHave auto 
Actor Property PlayerRef Auto
perk Property matchingsetLullHeavy auto 
perk Property matchingsetLullLight auto 
event OnActivate(ObjectReference akActionRef)
    if (!playerRef.hasPerk(lullPerk))
            playerRef.addPerk(lullPerk)
            playerRef.addPerk(matchingsetLullHeavy)
           playerRef.addperk(matchingsetLullLight)
            perkMessage.show()
    else 
            alreadyHave.show()
         EndIf
     endevent