extends Node

var found_ham = false
var ham

func get_direction():
	found_ham = false
	for body in get_node("../SmellBox").get_overlapping_bodies():
		if body.name == "Object" and body.item_id == "Ham":
			found_ham = true
			ham = body
			break
	if found_ham:
		return (ham.position - get_parent().position).normalized()
	return (get_node("/root/Main").get_player().position - get_parent().position).normalized()

func _process(delta):
	for body in get_node("../AggroBox").get_overlapping_bodies():
		if body.name == "Player" and $Timer.is_stopped():
			get_parent().get_node("SFX/Attack").play()
			body.damage(10, get_parent())
			$Timer.start()
