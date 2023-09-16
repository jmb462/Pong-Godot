extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _draw():
	draw_line(Vector2(get_owner().screenWidth/2, 0), Vector2(get_owner().screenWidth/2, get_owner().screenHeight), Color.WHITE)
