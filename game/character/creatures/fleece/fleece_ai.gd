extends Node

var found_ham = false
var ham

func get_direction():
	if found_ham and ham:
		return (ham.position - get_parent().position).normalized()
	return (get_node("/root/Main").get_player().position - get_parent().position).normalized()

func _process(delta):
	if not found_ham:
		for body in get_node("../AggroBox").get_overlapping_bodies():
			if body.name == "Object" and body.item_id == "Ham":
				found_ham = true
				ham = body
			if body.name == "Player" and $Timer.is_stopped():
				body.damage(10, get_parent())
				$Timer.start()
