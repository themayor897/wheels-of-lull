Scriptname _Lull_SQ_WaterEffectScript extends activemagiceffect  

MiscObject Property waterBottle auto
Event OnEffectStart(Actor akTarget, Actor akCaster)
	Game.GetPlayer().AddItem(waterBottle, 1)
endEvent