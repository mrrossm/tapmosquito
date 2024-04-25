extends Control

# Using the save system...
var save_path = "user://badge.save"
var easy_peasy = false
var woah = false
var woah_bandicoot = false
var wow_really = false
var game_completed = false
var badges = [easy_peasy, woah, woah_bandicoot, wow_really, game_completed]

# Reset button duration
var reset_duration = 4
var reset_start = 0

func _ready():
	# Script to show the badges
	load_data()
	# Make badges visible depending on the save file
	if badges[0] == true:
		$TestBadges/c1.visible = true
	if badges[1] == true:
		$TestBadges/c2.visible = true
	if badges[2] == true:
		$TestBadges/c3.visible = true
	if badges[3] == true:
		$TestBadges/c4.visible = true
	if badges[4] == true:
		$TestBadges/c5.visible = true
	
		
func _process(delta):
	# Listen for ESC to quit game
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	# Listen for pressing the key "r" to administer resetting if reaching the duration
	if Input.is_key_pressed(KEY_R):
		reset_start += 1 * delta
		if reset_start >= reset_duration:
			reset_data()
			get_tree().reload_current_scene()
	else:
		reset_start = 0

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		badges[0] = file.get_var(easy_peasy)
		badges[1] = file.get_var(woah)
		badges[2] = file.get_var(woah_bandicoot)
		badges[3] = file.get_var(wow_really)
		badges[4] = file.get_var(game_completed)
	else:
		print("no date saved yet...")
		easy_peasy = false
		woah = false
		woah_bandicoot = false
		wow_really = false
		game_completed = false

func reset_data():
	if FileAccess.file_exists(save_path):
		DirAccess.remove_absolute(save_path)
	else:
		print("no save file to reset...")
