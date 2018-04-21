extends Node2D

var direction = Vector2(0,0)

const UP = Vector2(+0, -1)
const DW = Vector2(+0, +1)
const LF = Vector2(-1, +0)
const RT = Vector2(+1, +0)

func current_direction():
	return direction.normalized()

func _process(delta):
	direction = Vector2(0, 0)
	if Input.is_action_pressed("ui_up"):
		direction += UP
	if Input.is_action_pressed("ui_left"):
		direction += LF
	if Input.is_action_pressed("ui_down"):
		direction += DW
	if Input.is_action_pressed("ui_right"):
		direction += RT