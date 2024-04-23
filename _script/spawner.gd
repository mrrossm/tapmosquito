extends Area2D

var enemy_scene = preload("res://enemy.tscn")

# Signal indicates scoring
signal point_up
# Signal indicates losing life
signal life_down
	
func _on_timer_timeout():
	# Get area dimension
	var viewRect = get_viewport_rect()
	var xPosition = randf_range(viewRect.position.x, viewRect.end.x)
	var yPosition = randf_range(viewRect.position.y, viewRect.end.y)
	# Spawn enemy randomly around the gathered dimension
	var enemy = enemy_scene.instantiate()
	enemy.position = Vector2(xPosition, yPosition)
	add_child(enemy)
	# Connect the enemy's is_tapped signal to a function in the spawner
	enemy.is_tapped.connect(_on_enemy_is_tapped)
	# Connect the enemy's not_tapped signal to a function in the spawner
	enemy.not_tapped.connect(_on_enemy_not_tapped)
	
func _on_enemy_is_tapped():
	emit_signal("point_up")

func _on_enemy_not_tapped():
	emit_signal("life_down")
