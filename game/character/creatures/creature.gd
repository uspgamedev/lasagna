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
	if dir == Vector2():
		$OrientedSprite.set_direction("up")
	else:
		var angle = dir.angle()
		if angle < PI/4 and angle >= -PI/4:
			$OrientedSprite.set_direction("right")
		elif angle < 3*PI/4 and angle >= PI/4:
			$OrientedSprite.set_direction("up")
		elif angle < -PI/4 and angle >= -3*PI/4:
			$OrientedSprite.set_direction("down")
		elif angle < -3*PI/4 or angle >= 3*PI/4:
			$OrientedSprite.set_direction("left")
