extends Control

signal midnight_strikes

export (int) var minute_frames

func end_night():
	$Timer.start()
	pass

func _process(delta):
	var ratio = $Timer.time_left/$Timer.wait_time
	var bar   = $DayNightBar
	var value = bar.max_value*ratio
	
	bar.get_stylebox("fg","").region_rect.position.x = int((1 - value/100.0)*128)
	bar.get_stylebox("fg","").region_rect.size.x = int(128*value/100.0)
	bar.value = value
	
	if ratio == 1:
		emit_signal("midnight_strikes")