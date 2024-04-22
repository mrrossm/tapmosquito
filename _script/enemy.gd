extends Node2D

func _on_timer_timeout():
	queue_free() # automatically disappears when not pressed by the player.


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		# Delete enemy instance then record score
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# print("yow, delete this object will you?")
			# Remove enemy instance
			queue_free()
			# Record score... nothing here yet...
