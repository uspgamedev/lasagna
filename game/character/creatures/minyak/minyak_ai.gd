extends Node

func start_attack():
	get_parent().can_attack = false
	get_parent().attacking = true
	get_node("../OrientedSprite/AnimationPlayer").play("attack")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "attack":
		get_node("../OrientedSprite/AnimationPlayer").play("resting")
		get_parent().attacking = false
		get_node("Timer").start()

func _on_Timer_timeout():
	get_node("../OrientedSprite/AnimationPlayer").play("idle-right")
	get_parent().can_attack = true
