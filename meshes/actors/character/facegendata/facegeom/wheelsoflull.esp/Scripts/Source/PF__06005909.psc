;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname PF__06005909 Extends Package Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(Actor akActor)
;BEGIN CODE
lullApproached.SetValue(lullApproached.GetValue() + 1 as Float)
	if lullApproached.GetValue() >= 3 as Float
		saboteurScene.Start()
		mq06.SetStage(15)
	endIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

globalvariable property lullApproached auto
scene property saboteurScene auto
quest property mq06 auto
