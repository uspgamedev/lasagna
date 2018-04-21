extends Node2D

var direction = Vector2(0,0)
signal interact

const UP = Vector2(+0, -1)
const DW = Vector2(+0, +1)
const LF = Vector2(-1, +0)
const RT = Vector2(+1, +0)

func current_direction():
	return direction.normalized()

func _process(delta):
	direction = Vector2(0, 0)
	if Input.is_action_pressed("ui_interact"):
		emit_signal('interact')
	elif Input.is_action_pressed("ui_up"):
		direction += UP
	elif Input.is_action_pressed("ui_left"):
		direction += LF
	elif Input.is_action_pressed("ui_down"):
		direction += DW
	elif Input.is_action_pressed("ui_right"):
		direction += RT