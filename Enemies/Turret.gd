extends Area2D

var Bullet = load("res://Enemies/EnemyBullet.tscn")
export var waitTime = 0.0
export var fireTime = 1.0
var curTime = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	curTime = 0.0


func _process(delta):
	if waitTime <= 0:
		curTime -= delta
		if curTime <= 0:
			var bullet = Bullet.instance()
			add_child(bullet)
			bullet.rotation = rotation
			curTime = fireTime
	else:
		waitTime -= delta


func _on_Turret_body_entered(body):
	if body.has_method("die"):
		body.die()
