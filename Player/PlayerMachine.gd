extends Node

onready var state_name = ""
onready var previous_state = null
onready var state = null


# Called when the node enters the scene tree for the first time.
func _ready():
	set_state(get_children()[0].name)


func _process(delta):
	if state and state.has_method("process"):
		state.process(delta)

func set_state(s):
	state_name = s
	var new_state = get_node(s)
	if state != null:
		if state.has_method("end"):
			state.end()
		previous_state = state
	if new_state != null:
		state = new_state
		if state.has_method("start"):
			state.start()
