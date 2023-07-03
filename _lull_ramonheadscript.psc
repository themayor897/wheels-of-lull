Scriptname _Lull_RamonHeadScript extends ObjectReference  
ObjectReference Property headMarker auto
GlobalVariable Property ramonHeadState auto
Quest Property MQ07 auto
ObjectReference Property rotateMarker1 auto
ObjectReference Property rotateMarker2 auto
ObjectReference Property rotateMarker3 auto
ObjectReference Property rotateMarker4 auto
ObjectReference Property rotateMarker5 auto
ObjectReference Property rotateMarker6 auto
ObjectReference Property rotateMarker7 auto
Spell Property frostBreath auto
Spell Property fxSpell auto
Spell Property lullianSpell auto
Spell Property fireboltl auto
Sound Property screamSound auto
projectile property LullianProjectile auto 
Sound Property deathSound auto
Sound Property moveSound auto
ObjectReference Property hand1 auto
ObjectReference Property hand2 auto
int numHits = 0;
bool wasHit = false


Actor Property PlayerRef auto

Event OnLoad()
    self.TranslateToRef(headMarker, 600)
EndEvent

Event OnTranslationComplete()
    ContinueTranslation()
    moveSound.Play(PlayerRef)
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
    Spell akSpell = akSource as Spell
    if(akSpell == lullianSpell || akProjectile == LullianProjectile)
        
        if(!wasHit)
            StopTranslation()
            screamSound.Play(PlayerRef)
            wasHit = true
            numHits += 1
            if(numHits >= 10)
                WoL.Log(self, "RAMON death sequence starting...")
                self.StopTranslation()
                hand1.StopTranslation()
                hand2.StopTranslation()
                deathSound.Play(PlayerRef)
                fxSpell.Cast(self, self)
                Utility.Wait(1.5)
                fxSpell.Cast(self, self)
                Utility.Wait(1.5)
                fxSpell.Cast(self, self)
                Utility.Wait(0.5)
                fxSpell.Cast(self,self)
                Utility.Wait(0.5)
                fxSpell.Cast(self,self) 
                self.DisableNoWait()
                hand1.DisableNoWait()
                hand2.DisableNoWait()
                MQ07.setstage(10)
            else
                WoL.Log(self, "RAMON hit registered. " + numHits as string + "/10 hits total.")
                Game.ShakeCamera()
                Utility.Wait(2)
                ContinueTranslation()
                wasHit = false
            endif
        endif
    endif
EndEvent


Function ContinueTranslation()
    float HeadState = ramonHeadState.Getvalue() as Float
    if(HeadState == 0)
        Game.EnablePlayerControls()
        frostBreath.Cast(self, PlayerRef)
        ramonHeadState.SetValue(1)
        self.TranslateToRef(rotateMarker1, 1200)
    elseif(HeadState == 1)
        frostBreath.Cast(self, PlayerRef)
        ramonHeadState.SetValue(2)
        self.TranslateToRef(rotateMarker2, 1200)
    elseif(HeadState == 2)
        frostBreath.Cast(self, PlayerRef)
        ramonHeadState.SetValue(3)
        self.TranslateToRef(rotateMarker3, 1200)
    elseif(HeadState == 3)
        frostBreath.Cast(self, PlayerRef)
        ramonHeadState.SetValue(4)
        self.TranslateToRef(rotateMarker4, 1200)
    elseif(HeadState == 4)
        frostBreath.Cast(self, PlayerRef)
        ramonHeadState.SetValue(5)
        self.TranslateToRef(rotateMarker5, 1200)
    elseif(HeadState == 5)
        frostBreath.Cast(self, PlayerRef)
        ramonHeadState.SetValue(6)
        self.TranslateToRef(rotateMarker6, 1200)
    elseif(HeadState == 6)
        frostBreath.Cast(self, PlayerRef)
        ramonHeadState.SetValue(7)
        self.TranslateToRef(rotateMarker7, 1200)
    elseif(HeadState == 7)
        frostBreath.Cast(self, PlayerRef)
        ramonHeadState.SetValue(0)
        self.TranslateToRef(headMarker, 1200)
    endif
EndFunction