extends CanvasLayer

signal got_dark

var sfx = null

func play(type, duration=2.5):
	$Timer.set_wait_time(duration)
	match type:
		"morning":
			sfx = load("res://transition/morning_rooster.ogg")
			$Scenery.set_frame(5)
		"night":
			sfx = load("res://transition/night_owl.ogg")
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

func play_sfx():
	if sfx != null:
		$AudioStreamPlayer.set_stream(sfx)
		$AudioStreamPlayer.play()

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