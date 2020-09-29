Scriptname _Lull_MQ06_ThalmorDeathScript extends ObjectReference  

GlobalVariable Property lullThalmorDeathCount auto
Quest Property MQ06 auto
Actor Property Fyr auto
Actor Property Yagrum auto
Actor Property Numinar auto
Event OnDeath(Actor akKiller)
	lullThalmorDeathCount.SetValue(lullThalmorDeathCount.GetValue() + 1)
	if(lullThalmorDeathCount.GetValue() >= 7)
		MQ06.SetStage(14)
		Fyr.EvaluatePackage()
		Yagrum.EvaluatePackage()
		Numinar.EvaluatePackage()
	endif
EndEvent