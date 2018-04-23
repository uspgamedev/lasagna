extends Node

var player_is_in_range = false
var tired = false
var update_timer = true

func get_direction():
	if not player_is_in_range or tired:
		$Timer.stop()
		update_timer = true
		return Vector2()
	if update_timer:
		$Timer.wait_time = 4
		$Timer.start()
		update_timer = false
	return (get_parent().position - get_node("/root/Main").get_player().position).normalized()

func _process(delta):
	var found_player = false
	for body in get_node("../Area2D").get_overlapping_bodies():
		if body.name == "Player":
			found_player = true
	player_is_in_range = found_player

func _on_Timer_timeout():
	if tired:
		tired = false
	else:
		tired = true
		$Timer.wait_time = 2
		$Timer.start()
