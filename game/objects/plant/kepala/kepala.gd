extends "res://objects/plant/plant.gd"

var attacking = false

func grow():
	.grow()
	if growth_level == growth_steps and $Timer.is_stopped():
		$Timer.start()

func _on_Timer_timeout():
	# $Sprite/AnimationPlayer.stop()
	# $Sprite/AnimationPlayer.play("attack")
	attacking = true


func _on_AnimationPlayer_animation_finished(anim_name):
	# if anim_name == "attack":
		# $Sprite/AnimationPlayer.play("size" + str(growth_level))
		# $Timer.start()
		# attacking = false
	pass