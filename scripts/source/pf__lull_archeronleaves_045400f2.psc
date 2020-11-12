scriptName PF__Lull_ArcheronLeaves_045400F2 extends Package hidden

objectreference property hisMarker auto
objectreference property lullWall auto
objectreference property lullWall2 auto
actor property archeron auto
actor property massCroft auto
activator property teleportFX auto
objectreference property lullWall3 auto
actor property llavados auto

function Fragment_0(actor akActor)

	archeron.DisableNoWait(false)
	massCroft.DisableNoWait(false)
	lullWall.DisableNoWait(false)
	lullWall2.EnableNoWait(false)
	lullWall3.EnableNoWait(false)
	llavados.MoveTo(hisMarker, 0.000000, 0.000000, 0.000000, true)
	llavados.PlaceAtMe(teleportFX as form, 1, false, false)
endFunction

