extends Area2D


var target = null
export var speed = 80
export var rotationSpeed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.rotation_degrees += rotationSpeed * delta
	if target != null:
		var dir = (target.position - position).normalized()
		position += dir * speed * delta
		


func _on_AggroRadius_body_entered(body):
	target = body


func _on_Seeker_body_entered(body):
	if body.has_method("die"):
		body.die()
	queue_free()
	
func die():
	queue_free()
