extends Node3D

# on stocke une reference vers les labels dans un tableau
# inutile de créer un script par label juste pour modifier leur texte
@onready var score_labels : Array[Label] = [$Scores/playerScore0, $Scores/playerScore1]

# on utilise un Vector2 pour n'avoir qu'une seule variable,
# permet de stocker une valeur pour x et y
var screen_size : Vector2

# on utilise un tableau pour la même raison
# on evitera toujours les variable1, variable2, ...
# c'est un signe qu'il faut un tableau
var playerScore : Array = [0,0]

func _ready():
	screen_size = get_viewport().size

# on utilise un signal de la balle vers le main pour incrementer le score
# on evite les appels de fonction directe des enfants vers les parents
# le signal est connecté via l'editeur, voir onglet "Node" de la scene Main
func _on_ball_goal_scored(player : int):
	playerScore[player] += 1
	# on met directement à jour le label
	score_labels[player].text = str(playerScore[player])
