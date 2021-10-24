extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func deactivate():
	$Sprite.modulate = Color(.29, .29, .29)


func _on_Checkpoint_body_entered(body):
	Global.save_data["general"]["checkpoint"] = var2str(position)
	get_parent().newPoint(position)
	$Sprite.modulate = Color(.45, .9, .45)
