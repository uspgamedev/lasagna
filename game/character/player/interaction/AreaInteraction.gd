extends Area2D

var dirs = [Vector2(32, 0),
			Vector2(-32, 0),
			Vector2(0, 16),
			Vector2(0, -16)]

func rotate_polygon_collision(direction):
	if direction == 'up':
		set_position(dirs[3])
	elif direction == 'down':
		set_position(dirs[2])
	elif direction == 'left':
		set_position(dirs[1])
	elif direction == 'right':
		set_position(dirs[0])
