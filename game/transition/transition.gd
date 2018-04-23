extends CanvasLayer

signal got_dark

func play(type, duration=2):
	$Timer.set_wait_time(duration)
	match type:
		"morning":
			$Scenery.set_frame(5)
		"night":
			match get_node("/root/Main").get_flags().get_moon_name():
				"Full": $Scenery.set_frame(0)
				"Crescent": $Scenery.set_frame(1)
				"Waning": $Scenery.set_frame(2)
				"New": $Scenery.set_frame(3)
				"Blood": $Scenery.set_frame(4)
		"scene":
			$Scenery.modulate = Color(0, 0, 0)
	get_node("/root/Main").pause_clock()
	$AnimationPlayer.play("transition_in")

func transition_in_ended():
	$Timer.start()
	emit_signal("got_dark")
	# Things to be changed behind the scenes should be done here
	get_node("/root/Main").update_clock()

func _on_Timer_timeout():
	$AnimationPlayer.play("transition_out")

func transition_out_ended():
	get_node("/root/Main").unpause_clock()
	queue_free()