extends Area2D

var enemy_scene = preload("res://enemy.tscn")
	
func _on_timer_timeout():
	# Get area dimension
	var viewRect = get_viewport_rect()
	var xPosition = randf_range(viewRect.position.x, viewRect.end.x)
	var yPosition = randf_range(viewRect.position.y, viewRect.end.y)
	# Spawn enemy randomly around the gathered dimension
	var enemy = enemy_scene.instantiate()
	enemy.position = Vector2(xPosition, yPosition)
	add_child(enemy)
