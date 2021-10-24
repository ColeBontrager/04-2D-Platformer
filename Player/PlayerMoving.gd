extends Node

onready var SM = get_parent()
onready var player = get_node("../..")
var dash_ready = false


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(player, "ready")


func process(delta):
	var xVel = 0
	player.velocity += player.gravity
	if Input.is_action_pressed("left"):
		xVel -= 1
	elif Input.is_action_pressed("right"):
		xVel += 1
	if player.is_on_floor():
		dash_ready = true
		if Input.is_action_just_pressed("jump"):
			player.velocity.y = player.jump_force
	if Input.is_action_just_pressed("dash") and dash_ready:
		dash_ready = false
		SM.set_state("Dashing")
	player.velocity.x = xVel * player.move_speed
	player.velocity = player.move_and_slide(player.velocity, Vector2(0,-1))
