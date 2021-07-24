Scriptname _Lull_Update_Alias extends ReferenceAlias  

_Lull_Update Property UpdateQuest Auto

Event OnPlayerLoadGame()
	UpdateQuest.CheckLullVersion()
EndEvent 