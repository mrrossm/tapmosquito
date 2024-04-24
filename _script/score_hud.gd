extends Control

var initial_score: int = 0
var initial_life: int = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	var score_label = $GridContainer/Panel/Score
	var life_label = $GridContainer/Panel2/Life
	score_label.text = "Score: " + str(initial_score)
	life_label.text = "Life: " + str(initial_life)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var score_label = $GridContainer/Panel/Score
	var life_label = $GridContainer/Panel2/Life
	score_label.text = "Score: " + str(initial_score)
	life_label.text = "Life: " + str(initial_life)

# Increment score
func _on_spawner_point_up():
	initial_score += 1

# Decrease life :todo switch to game over screen
func _on_spawner_life_down():
	initial_life -= 1
	# if life turns 0, turn to game over scene. also transfer the globals value score
	if initial_life <= 0:
		var globals = get_node("/root/Globals")
		globals.score = initial_score
		get_tree().change_scene_to_file("res://game_over.tscn")
