extends Node2D



onready var Player = load("res://Player/Player.tscn")
var starting_position = Vector2(200,200)


func _ready():
	Global.ready()


func _physics_process(_delta):
	print(Global.save_data["general"]["checkpoint"])
	if not has_node("Player"):
		print(Global.save_data["general"]["checkpoint"])
		var player = Player.instance()
		add_child(player)
		if Global.save_data["general"]["checkpoint"] != "(0,0)":
			player.position = str2var(Global.save_data["general"]["checkpoint"])
		else:
			player.position = get_node("StartingPosition").position
		

