extends Node

enum { STATE_IDLE, STATE_CHASE, STATE_COUNT }
var state = 0

func get_direction():
	if $Timer.is_stopped():
		$Timer.set_wait_time(randf(4, 8))
		$Timer.start()
		state = randi() % STATE_COUNT
		return Vector2()
	elif state == STATE_IDLE:
		return Vector2()
	elif state == STATE_CHASE:
		return (get_node("/root/Main").get_player().position - get_parent().position).normalized()

func _process(delta):
	for body in get_node("../AgroBox").get_overlapping_bodies():
		if body.name == "Player":
			get_parent().get_node("SFX/Attack").play()
			body.damage(get_parent().dmg, get_parent())
