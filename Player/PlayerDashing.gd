extends Node


onready var SM = get_parent()
onready var player = get_node("../..")
var curTime = 1
var xVel = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(player, "ready")

func start():
	if player.velocity.x == 0:
		SM.set_state("Moving")
	elif player.velocity.x > 0:
		xVel = 1
	elif player.velocity.x < 0:
		xVel = -1
	curTime = player.dash_time
	
func process(delta):
	curTime -= delta
	player.velocity = Vector2(xVel * player.dash_speed, 0)
	player.velocity = player.move_and_slide(player.velocity)
	if(curTime <= 0):
		SM.set_state("Moving")
