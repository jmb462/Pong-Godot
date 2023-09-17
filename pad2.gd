extends CharacterBody3D

@export var speed = 2

var dir = Vector3.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var ballPosition = get_node("../Ball").position.z
	
	if ballPosition > position.z:
		velocity.z = speed
	if ballPosition < position.z:
		velocity.z = -speed
		
	move_and_slide()
