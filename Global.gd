extends Node


const SAVE_PATH = "user://savegame.sav"
const SECRET = "C220 Is the Best!"
var save_file = ConfigFile.new()

onready var coins = get_node_or_null("/root/Level/Coins")
onready var Coin = load("res://Coin.tscn")


var save_data = {
	"general": {
		"score":0,
		"coins":[],
		"level":1,
		"checkpoint":"(0,0)"
	}
}


# Called when the node enters the scene tree for the first time.
func ready():
	coins = get_node_or_null("/root/Level/Coins")
	if get_tree().get_current_scene().get_name() != "Menu":
		load_in()

func load_in():
	var coinsInLevel = coins.get_children()
	for coin in coinsInLevel:
		if coin.index in save_data["general"]["coins"]:
			coin.queue_free()
	update_score(0)
		
		
func update_score(score):
	save_data["general"]["score"] += score
	var scoreLabel = get_node_or_null("/root/Level/UI/HUD/Score")
	scoreLabel.text = str(save_data["general"]["score"])

func reset_level():
	var level = save_data["general"]["level"]
	print(level)
	if level == 1:
		get_tree().change_scene("res://Levels/Level1.tscn")
	elif level == 2:
		get_tree().change_scene("res://Levels/Level2.tscn")
	elif level == 3:
		get_tree().change_scene("res://Levels/Level3.tscn")
	
func next_level():
	save_data["general"]["level"] += 1
	save_data["general"]["coins"] = []
	save_data["general"]["checkpoint"] = "(0,0)"
	var level = save_data["general"]["level"]
	if level == 2:
		get_tree().change_scene("res://Levels/Level2.tscn")
	elif level == 3:
		get_tree().change_scene("res://Levels/Level3.tscn")
	elif level == 4:
		get_tree().change_scene("res://End.tscn")

func save_game():
	var save_game = File.new()
	save_game.open_encrypted_with_pass(SAVE_PATH, File.WRITE, SECRET)
	save_game.store_string(to_json(save_data))
	save_game.close()

func load_game():
	var save_game = File.new()
	if not save_game.file_exists(SAVE_PATH):
		return
	save_game.open_encrypted_with_pass(SAVE_PATH, File.READ, SECRET)
	var contents = save_game.get_as_text()
	var result_json = JSON.parse(contents)
	if result_json.error == OK:
		save_data = result_json.result
	else:
		print("Error: ", result_json.error)
	save_game.close()
	print(save_data)
	reset_level()
	
func new_game():
	save_data = {
	"general": {
		"score":0,
		"coins":[],
		"level":1,
		"checkpoint":"(0,0)"
	}
	}
	get_tree().change_scene("res://Levels/Level1.tscn")
	

func coin_collected(index):
	update_score(1)
	save_data["general"]["coins"].append(index)
