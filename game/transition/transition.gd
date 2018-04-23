extends CanvasLayer

export (int) var transition_duration = 2

func _ready():
	$Timer.set_wait_time(transition_duration)

func play():
	get_node("/root/Main").pause_clock()
	$AnimationPlayer.play("transition_in")

func transition_in_ended():
	$Timer.start()
	
	# Things to be changed behind the scenes should be done here
	get_node("/root/Main").update_clock()

func _on_Timer_timeout():
	$AnimationPlayer.play("transition_out")

func transition_out_ended():
	get_node("/root/Main").unpause_clock()
	queue_free()

func is_morning(morning):
	if morning:
		$Scenery.set_frame(5)
		return
	
	match get_node("/root/Main").get_flags().get_moon_name():
		"Full": $Scenery.set_frame(0)
		"Crescent": $Scenery.set_frame(1)
		"Waning": $Scenery.set_frame(2)
		"New": $Scenery.set_frame(3)
		"Blood": $Scenery.set_frame(4)