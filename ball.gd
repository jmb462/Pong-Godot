extends CharacterBody3D

# on declare le signal qui demandera au parent de mettre à jour le score
# le parametre est l'indice du joueur qui a marqué
signal goal_scored(int)

@export var speed = 24

var dir = Vector3.ZERO
var hasBouncedThisFrame = false
var initPosition = Vector3.ZERO

func _ready():
	initPosition = position # pas convaincu que cela soit utile
	reset()

func _process(delta):
	velocity = dir.normalized() * speed # une seule ligne suffit ici
	move_and_slide()
	
func _physics_process(delta):
	for index in range(get_slide_collision_count()):
		var collision_name = get_slide_collision(index).get_collider().name
		if hasBouncedThisFrame == false:
			# On peut remplacer la série de if par un match
			match collision_name:
				"Pad0":
					if (dir.x < 0):
						bounceX()
				"Pad1":
					if (dir.x > 0):
						bounceX()
				"BottomWall", "TopWall":
					bounceY()
				"LeftWall", "RightWall":
					bounceX()
					goal(1 if position.x < 0 else 0)
				
	hasBouncedThisFrame = false
	
func reset():
	position = initPosition
	dir = Vector3(1, dir.y, 1)
	
func bounceX():
	dir.x *= -1
	hasBouncedThisFrame = true
	
func bounceY():
	dir.z *= -1
	hasBouncedThisFrame = true

func goal(player : int):
	emit_signal("goal_scored", player)
	reset()
