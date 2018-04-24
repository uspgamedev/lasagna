extends Node

var ham

func get_direction():
	return (get_node("/root/Main").get_player().position - get_parent().position).normalized()

func _process(delta):
	for body in get_node("../AggroBox").get_overlapping_bodies():
		if body.name == "Player":
			get_parent().get_node("SFX/Attack").play()
			body.damage(10, get_parent())
