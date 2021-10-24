extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _unhandled_input(event):
	if event.is_action_pressed("Menu"):
		if visible:
			hide()
			get_tree().paused = false
		else:
			show()
			get_tree().paused = true


func _on_Save_pressed():
	Global.save_game()


func _on_Load_pressed():
	get_tree().paused = false
	Global.load_game()
	


func _on_Quit_pressed():
	get_tree().quit()
