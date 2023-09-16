extends CharacterBody3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.z = get_node("../Ball").position.z
