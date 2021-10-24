extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(Global.save_data)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	Global.new_game()


func _on_LoadGame_pressed():
	Global.load_game()


func _on_QuitGame_pressed():
	get_tree().quit()
