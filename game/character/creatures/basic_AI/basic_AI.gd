extends Node

var dir = Vector2()
const dir_vec = [Vector2(), Vector2(), Vector2(0, 1),
				 Vector2(0, -1), Vector2(1, 0), Vector2(-1, 0)]

func _ready():
	$Timer.wait_time = rand_range(1, 2)
	randomize()
	$Timer.start()

func _on_Timer_timeout():
	dir = dir_vec[randi()%6]
	$Timer.wait_time = rand_range(1, 2)
	$Timer.start()

func get_direction():
	return dir
