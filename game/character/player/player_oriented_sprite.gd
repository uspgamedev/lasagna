extends "res://character/oriented_sprite.gd"

func set_direction(new_direction):
	.set_direction(new_direction)
	get_node('../AreaInteraction').rotate_polygon_collision(new_direction)
