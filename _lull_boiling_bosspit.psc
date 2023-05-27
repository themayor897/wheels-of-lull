Scriptname _Lull_Boiling_BossPit extends ObjectReference  

;Modified April 2021 by themayor897 - added logging functions
;Modified 11 May 2021 by themayor897 - transitioned death functions to mq04 script fragment
;Modified 30 JUne 2021 by themayor897 - fixed log strings

Actor Property bossEnemy auto
;ObjectReference Property reward auto ;no longer used
;ObjectReference Property wallBall auto ;no longer used
Sound Property bossScream auto
;Sound Property bossDie auto ;no longer used
Spell Property effectSpell auto
GlobalVariable property NumFalls auto
GlobalVariable property TotalFalls auto
MusicType Property minibossMusic auto
Quest Property MQ04 Auto
Actor property playerRef auto 
bool doOnce = FALSE
float HitDamage
float total
float hits

Event OnTriggerEnter(ObjectReference akActionRef)
    if(akActionRef == bossEnemy)
        hits = NumFalls.GetValue()
        total = TotalFalls.GetValue()
        if !doOnce
            CheckHealth(bossEnemy)
            doOnce = TRUE
        endif
        if(hits < total)
            bossScream.Play(playerRef)
            bossEnemy.DamageAV("Health", HitDamage)
            Utility.Wait(3)
            bossEnemy.MoveToMyEditorLocation()
            NumFalls.Mod(1.0)
            WoL.Log(self, "Fall registered on Welding soldier. " + ((hits + 1) as string) + "/" + (total as string) + " falls.")
            if bossEnemy.isDead() && !bossEnemy.isDisabled()
                WoL.Log(self, "Welding Soldier died prematurely! Hits: " + hits + ". Resurrecting", 1)
                bossEnemy.resurrect()
            endif
        else
            MQ04.SetStage(22) 
        endif
    endif
EndEvent

Function CheckHealth(Actor akActor)
    Float BaseValue = akActor.GetBaseActorValue("Health")
    Float CurrentMaxValue = Math.Ceiling(akActor.GetActorValue("Health") / akActor.GetActorValuePercentage("Health"))
    Float ValueDifference = CurrentMaxValue - (akactor.GetActorValue("Health"))
    akactor.RestoreAV("Health", ValueDifference)
    HitDamage = ((CurrentMaxValue / total) - 1)
    WoL.log(self, "Welding soldier hit value calculated to be" + HitDamage)
EndFunction