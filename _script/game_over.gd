extends Control

@onready var score_label = $Panel/VBoxContainer/Score
@onready var globals = get_node("/root/Globals")

func _start():
	$BadMusic.play()

func _process(delta):
	score_label.text = "Tapped: " + str(globals.score)
