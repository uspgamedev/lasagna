extends Control

signal midnight_strikes

export (int) var minute_frames

var day = 0

func end_night():
	$Timer.start()
	day += 1
	$DayNightBar.get_stylebox("bg", "").region_rect.position.x = int(128 + 256*(day%4))
	
func get_daytime():
	return 1 - $Timer.time_left/$Timer.wait_time

func get_day():
	return day

func get_moon():
	match day%4:
		0: return "New"
		1: return "Crescent"
		2: return "Full"
		3: return "Waning"

func _process(delta):
	var ratio = $Timer.time_left/$Timer.wait_time
	var bar   = $DayNightBar
	var value = bar.max_value*ratio
	
	bar.get_stylebox("fg", "").region_rect.position.x = int((1 - value/100.0)*128 + 256*(day%4))
	bar.get_stylebox("fg", "").region_rect.size.x = int(128*value/100.0)
	bar.value = value
	
	if ratio == 1:
		emit_signal("midnight_strikes")