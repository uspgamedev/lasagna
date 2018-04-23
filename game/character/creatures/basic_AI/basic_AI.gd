extends Node

onready var timer = get_node("../Timer")

var dir = Vector2()
const dir_vec = [Vector2(), Vector2(), Vector2(0, 1),
				 Vector2(0, -1), Vector2(1, 0), Vector2(-1, 0)]

func _ready():
	timer.wait_time = rand_range(1, 2)
	randomize()

func _on_Timer_timeout():
	dir = dir_vec[randi()%6]
	timer.get_node("../Timer").wait_time = rand_range(1, 2)
	timer.start()

func get_direction():
	return dir
