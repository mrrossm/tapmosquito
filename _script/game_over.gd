extends Control

@onready var score_label = $Panel/VBoxContainer/Score
@onready var globals = get_node("/root/Globals")

# Save system...
var save_path = "user://badge.save"
var easy_peasy = false
var woah = false
var woah_bandicoot = false
var wow_really = false
var game_completed = false
var badges = [easy_peasy, woah, woah_bandicoot, wow_really, game_completed]

func _start():
	$BadMusic.play()

func _process(delta):
	score_label.text = "Tapped: " + str(globals.score)
	
	# todo: load saved badges here first to override default ones
	load_data()
	
	var prompt = ""
	
	# Badge rewarding analysis
	var score_now = globals.score
	var is_easy = globals.is_easy
	
	#For debugging purposes
	#is_easy = false
	#score_now = 35
	
	# Hard analysis
	if !is_easy and score_now >= 30:
		for badge in badges:
			badges[badges.find(badge, 0)] = true
		prompt = "game's really done. Thank you!"
	elif !is_easy and score_now >= 15:
		for i in 4:
			badges[i] = true
		prompt = "game's done. go home! :)"
	# Easy analysis
	if is_easy and score_now >= 15:
		for i in 3:
			badges[i] = true
		prompt = "damn..."
	elif is_easy and score_now >= 10:
		for i in 2:
			badges[i] = true
		prompt = "woah!!!"
	elif is_easy and score_now >= 5:
		badges[0] = true
		prompt = "good job!"
		
	# Update prompt if there's something to add.
	score_label.text += " " + prompt
	
	# Save??
	save()
	
func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	#file.store_var(badges)
	file.store_var(badges[0])
	file.store_var(badges[1])
	file.store_var(badges[2])
	file.store_var(badges[3])
	file.store_var(badges[4])

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
