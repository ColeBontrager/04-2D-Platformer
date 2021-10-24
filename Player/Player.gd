extends KinematicBody2D

export var move_speed = 200
export var dash_speed = 600
export var dash_time = .2
export var jump_force = -800
export var rotation_speed = 7
export var gravity = Vector2(0,25)
var velocity = Vector2(0, 0)


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func _process(delta):
	if Input.is_action_just_pressed("NextLevel"):
		Global.next_level()

func die():
	Global.reset_level()






