extends "res://character/character.gd"

var translate = {
	Vector2(0, 0):  "up",
	Vector2(0, -1): "up",
	Vector2(0, 1):  "down",
	Vector2(1, 0):  "right",
	Vector2(-1, 0): "left"
}

func _process(delta):
	var dir = $AI.get_direction()
	push(dir)
	$OrientedSprite.set_direction(translate[dir])
