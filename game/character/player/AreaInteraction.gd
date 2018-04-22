extends Area2D

onready var player_sprite = get_node('../OrientedSprite')
onready var polygon = get_node('CollisionPolygon2D')

var dirs = [[Vector2(16, -12), Vector2(48, -12), Vector2(48, 12), Vector2(16, 12)],
			[Vector2(-16, 12), Vector2(16, 12), Vector2(16, 36), Vector2(-16, 36)],
			[Vector2(-48, -12), Vector2(-16, -12), Vector2(-16, 12), Vector2(-48, 12)],
			[Vector2(-16, 36), Vector2(16, 36), Vector2(16, 12), Vector2(-16, 12)]]

func rotate_polygon_collision(direction):
	if direction == 'up':
		for i in range(4):
			polygon.polygon.set(i, dirs[3][i])
	elif direction == 'down':
		for i in range(4):
			polygon.polygon.set(i, dirs[1][i])
	elif direction == 'left':
		for i in range(4):
			polygon.polygon.set(i, dirs[2][i])
	elif direction == 'right':
		for i in range(4):
			polygon.polygon.set(i, dirs[0][i])
