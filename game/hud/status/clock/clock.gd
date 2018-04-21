extends Node

signal midnight_strikes

export (int) var minute_frames

func end_night():
	$Timer.start()
	pass

func _process(delta):
	var ratio = $Timer.time_left/$Timer.wait_time
	var bar   = $DayNightBar
	bar.value = bar.max_value*ratio 
	
	if ratio == 1:
		emit_signal("midnight_strikes")