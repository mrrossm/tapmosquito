extends Node2D

@onready var tapped_sfx = $Tapped

func play_tapped_sfx():
	tapped_sfx.play()
