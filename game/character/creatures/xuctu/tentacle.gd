extends Node2D

func _on_AnimationPlayer_animation_finished(anim_name):
	for node in $Area2D.get_overlapping_bodies():
		if node.name == "Player":
			node.damage(10, self)
	queue_free()