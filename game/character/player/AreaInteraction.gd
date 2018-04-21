extends Area2D

onready var player_sprite = get_node('../OrientedSprite')
onready var polygon = get_node('CollisionPolygon2D')

func rotate_polygon_collision(direction):
	if direction == 'up':
		polygon.rotation_degrees = 270
	elif direction == 'down':
		polygon.rotation_degrees = 90
	elif direction == 'left':
		polygon.rotation_degrees = 180
	elif direction == 'right':
		polygon.rotation_degrees = 0
