extends Node

var pacific = false

func _on_Timer_timeout():
	if not pacific:
		get_node("../OrientedSprite/AnimationPlayer").play("attack")
		get_parent().attacking = true
		get_parent().attacked = false

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "attack":
		get_node("../OrientedSprite/AnimationPlayer").play("idle-right")
		get_parent().attacking = false
