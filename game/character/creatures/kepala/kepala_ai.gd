extends Node

func _on_Timer_timeout():
	get_node("../OrientedSprite/AnimationPlayer").play("attack")
	get_parent().attacking = true
	get_parent().attacked = false

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "attack":
		get_node("../OrientedSprite/AnimationPlayer").play("idle-right")
		get_parent().attacking = false
