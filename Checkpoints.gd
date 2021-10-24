extends Node2D


var activePoint = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func newPoint(point):
	for child in get_children():
		if child.has_method("deactivate"):
			child.deactivate()
	

