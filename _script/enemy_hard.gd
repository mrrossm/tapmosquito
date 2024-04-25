extends Node2D

signal is_tapped
signal not_tapped

@onready var anim = $AnimatedSprite2D

func _process(delta):
	anim.play("fight")

func _on_timer_timeout():
	# if the player didn't tap mosquito, emit life losing signal
	emit_signal("not_tapped")
	queue_free() # automatically disappears when not pressed by the player.

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		# Delete enemy instance then record score
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# Send a signal for scoring
			emit_signal("is_tapped")
			# Remove enemy instance
			queue_free()
