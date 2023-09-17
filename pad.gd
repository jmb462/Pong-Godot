extends CharacterBody3D

@export var speed = 18

# on a une seule scene pad et un seul script
# mais on peut switcher entre HUMAN et IA avec cet enum
# on appelle ensuite le bon process
# cela permet de jouer à 2 ou IA vs IA
enum {HUMAN, IA}
@export_enum("HUMAN", "IA") var type : int = 0

# on stocke une reference vers la balle pour eviter les get_node dans le process (lent)
@onready var ball = $"../Ball"

func _on_ready():
	# on adapte la vitesse en fonction du type de joueur
	match type:
		"HUMAN":
			speed = 18
		"IA":
			speed = 2

func _physics_process(_delta):
	if type == HUMAN:
		_process_human()
	else:
		_process_ia()

func _process_human():
	velocity = Vector3.ZERO
	
	# on gere les 2 players eventuellement ici
	var pad_up = (name == "Pad0" and Input.is_action_pressed("up")) || (name == "Pad1" and Input.is_action_pressed("player2up"))
	var pad_down = (name == "Pad0" and Input.is_action_pressed("down")) || (name == "Pad1" and Input.is_action_pressed("player2down"))
	
	if pad_up:
		velocity.z = -speed
	if pad_down:
		velocity.z = speed
	
	move_and_slide() #delta déjà pris en compte

func _process_ia():
	velocity.z = sign(ball.position.z - position.z) * speed
	move_and_slide()
