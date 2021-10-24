extends Camera2D

var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	if player == null:
		player = get_node("/root/Level/PlayerContainer/Player")
	if player != null:
		if player.position != null:
			position = player.position
