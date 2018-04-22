extends Area2D

onready var player_sprite = get_node('../OrientedSprite')
onready var polygon = get_node('CollisionPolygon2D')

var dirs = [PoolVector2Array([Vector2(-12, 16), Vector2(-12, 48), Vector2(12, 48), Vector2(12, 16)]),
			PoolVector2Array([Vector2(-36, -16), Vector2(-36, 16), Vector2(-12, 16), Vector2(-12, -16)]),
			PoolVector2Array([Vector2(-12, -48), Vector2(-12, -16), Vector2(12, -16), Vector2(12, -48)]),
			PoolVector2Array([Vector2(36, -16), Vector2(36, 16), Vector2(12, 16), Vector2(12, -16)])]

func rotate_polygon_collision(direction):
	if direction == 'up':
		polygon.polygon = dirs[3]
	elif direction == 'down':
		polygon.polygon = dirs[1]
	elif direction == 'left':
		polygon.polygon = dirs[2]
	elif direction == 'right':
		polygon.polygon = dirs[0]
