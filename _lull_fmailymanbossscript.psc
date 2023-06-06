Scriptname _lull_fmailymanbossscript extends ActiveMagicEffect 


actor property oldThoMahalis auto 
actor myFamilyman  
event OnEffectStart(Actor Target, Actor Caster)
    myFamilyman = Target
  RegisterForSingleUpdate(0.5)
endevent 

event onUpdate() 
    if oldThoMahalis.isDead() || myFamilyman.isDead()
        myFamilyman.kill()
        UnregisterForUpdate()
        self.dispel()
    else 
        RegisterForSingleUpdate(0.5)
    endif 
 endevent 

