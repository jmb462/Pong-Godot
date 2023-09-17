extends Node2D

func _draw():
	draw_line(Vector2(get_owner().screen_size.x / 2, 0), Vector2(get_owner().screen_size.x / 2, get_owner().screen_size.y), Color.WHITE)
