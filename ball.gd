extends CharacterBody3D

@export var speed = 16

var dir = Vector3.ZERO

var hasBouncedThisFrame = false

# Called when the node enters the scene tree for the first time.
func _ready():
	reset()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = dir
	velocity = velocity.normalized() * speed
	move_and_slide()
	
func _physics_process(delta):
	print(dir)
	
	for index in range(get_slide_collision_count()):
		var collision = get_slide_collision(index)
		if hasBouncedThisFrame == false:
			if collision.get_collider().is_in_group("pad"):
				bounceX()
			if collision.get_collider().name == "BottomWall":
				bounceY()
			if collision.get_collider().name == "TopWall":
				bounceY()
			if collision.get_collider().name == "LeftWall":
				bounceX()
			if collision.get_collider().name == "RightWall":
				bounceX()
	
	hasBouncedThisFrame = false
	
func reset():
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
	
