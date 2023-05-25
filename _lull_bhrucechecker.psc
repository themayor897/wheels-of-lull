Scriptname _Lull_BhruceChecker extends Quest  
{checks to see if the player has met bhruce}


GlobalVariable Property MetBhruce Auto
bool metBrhuce 

Event OnInit()
    if !metBrhuce
        BhruceCheck()
    endif 
EndEvent

Function BhruceCheck()

    RegisterForModEvent("tw_metbhruce", "PlayerMetBhruce")

EndFunction

Event PlayerMetBhruce(Form sender)
    if !metBrhuce
    metBrhuce==true
    WoL.Log(self, "Player has met Bhruce Hammar, setting dialogue conditioning global...")
    MetBhruce.SetValue(1)
endif
EndEvent