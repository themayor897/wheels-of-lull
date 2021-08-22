Scriptname _lull_enablechestondeath extends ObjectReference
Activator property chest Auto
event OnDeath(actor akKiller)
if self.isEnabled()
    chest.enable()
    EndIf
EndEvent