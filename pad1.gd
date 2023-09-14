extends CharacterBody3D

@export var playerSpeed = 18

func _physics_process(_delta):
	velocity = Vector3.ZERO
	
	if Input.is_action_pressed("up"):
		velocity.z = -playerSpeed
	if Input.is_action_pressed("down"):
		velocity.z = playerSpeed
	
	move_and_slide() #delta déjà pris en compte
