extends TextureButton

func _on_pressed():
	var globals = get_node("/root/Globals")
	globals.is_easy = true
	get_tree().change_scene_to_file("res://game.tscn")
