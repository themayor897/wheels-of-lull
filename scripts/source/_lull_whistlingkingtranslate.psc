Scriptname _Lull_WhistlingKingTranslate extends ObjectReference  

Actor Property whistlingKing auto
Sound Property whistlingKingAwakens auto
MusicType Property bossMusic auto


Event OnTranslationComplete()
	whistlingKing.MoveTo(self)
	self.DisableNoWait()
	bossMusic.Add()
	Game.EnablePlayerControls()
	whistlingKingAwakens.Play(Game.GetPlayer())
EndEvent