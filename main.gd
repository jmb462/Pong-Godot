extends Node3D

var screenWidth
var screenHeight

var playerScore1
var playerScore2

func _ready():
	var viewport = get_viewport()
	screenWidth = viewport.size.x
	screenHeight = viewport.size.y
	
	playerScore1 = 0
	playerScore2 = 0

func addScore(playerNb):
	if playerNb == 1:
		playerScore1 += 1
	elif playerNb == 2:
		playerScore2 += 1
		
