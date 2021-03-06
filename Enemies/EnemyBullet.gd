extends Area2D


export var speed = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += Vector2(0, -speed * delta)


func _on_EnemyBullet_body_entered(body):
	if body.has_method("die"):
		body.die()
	queue_free()
