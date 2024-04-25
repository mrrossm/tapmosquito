extends Node2D

var normal_enemy = preload("res://enemy.tscn")
var hard_enemy = preload("res://enemy_hard.tscn")
var chosen_level_of_enemy = normal_enemy

@onready var tapped_sfx = $Tapped
# Check if the player's difficulty mode
@onready var globals = get_node("/root/Globals")

# Signal indicates scoring
signal point_up
# Signal indicates losing life
signal life_down

func _process(delta):
	if globals.is_easy == false:
		chosen_level_of_enemy = hard_enemy

func _on_timer_timeout():
	# Get spawn area reference
	var spawn_area = $SpawnArea
	# Get a random coordinate from the spawn_areak
	var spawn_area_position = spawn_area.position + Vector2(randf() * spawn_area.size.x, randf() * spawn_area.size.y)
	
	### UNCOMMENT THESE IF NEEDED
	## Get area dimension
	#var viewRect = get_viewport_rect()
	#var xPosition = randf_range(viewRect.position.x, viewRect.end.x)
	#var yPosition = randf_range(viewRect.position.y, viewRect.end.y)
	## Spawn enemy randomly around the gathered dimension
	#var enemy = enemy_scene.instantiate()
	#enemy.position = Vector2(xPosition, yPosition)
	### END OF COMMENT
	
	
	var enemy = chosen_level_of_enemy.instantiate()
	# Using the new spawn mechanism
	enemy.position = spawn_area_position
	add_child(enemy)
	# Connect the enemy's is_tapped signal to a function in the spawner
	enemy.is_tapped.connect(_on_enemy_is_tapped)
	# Connect the enemy's not_tapped signal to a function in the spawner
	enemy.not_tapped.connect(_on_enemy_not_tapped)
	
func _on_enemy_is_tapped():
	emit_signal("point_up")
	# Play sound effect
	tapped_sfx.play() # why is this here? structurkfk e could be better...

func _on_enemy_not_tapped():
	emit_signal("life_down")
