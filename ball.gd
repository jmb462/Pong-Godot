extends CharacterBody3D

@export var speed = 24

var dir = Vector3.ZERO

var hasBouncedThisFrame = false

var initPosition = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	initPosition = position
	reset()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = dir
	velocity = velocity.normalized() * speed
	move_and_slide()
	
func _physics_process(delta):
	for index in range(get_slide_collision_count()):
		var collision = get_slide_collision(index)
		if hasBouncedThisFrame == false:
			if collision.get_collider().is_in_group("pad"):
				bounceX()
				#un pad gauche
				if position.x < 0:
					position.x +=1
				#un pad droit
				else:
					position.x -=1
			if collision.get_collider().name == "BottomWall":
				bounceY()
			if collision.get_collider().name == "TopWall":
				bounceY()
			if collision.get_collider().name == "LeftWall":
				bounceX()
				reset()
				get_node("../").addScore(2)
			if collision.get_collider().name == "RightWall":
				bounceX()
				reset()
				get_node("../").addScore(1)
	
	hasBouncedThisFrame = false
	
func reset():
	position = initPosition
	dir.x = 1
	dir.z = 1
	
func bounceX():
	print("Rebond X")
	dir.x = -dir.x
	hasBouncedThisFrame = true
	
func bounceY():
	print("Rebond Y")
	dir.z = -dir.z
	hasBouncedThisFrame = true
	
