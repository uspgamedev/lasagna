extends Control

signal midnight_strikes

enum MOON {
	FULL,
	CRESCENT,
	NEW,
	WANING,
	BLOOD
}

export (int) var day_duration = 10 # duration of daytime in seconds

var day = 1
var moon = 1

func _ready():
	$Timer.set_wait_time(day_duration)
	$Timer.start()
	moon = day % 4

func end_night():
	$Timer.start()
	day += 1
	if moon == FULL:
		# try blood moon
		pass

func get_daytime():
	return 1 - $Timer.time_left/$Timer.wait_time

func get_day():
	return day

func get_moon():
	match moon:
		NEW: return "New"
		CRESCENT: return "Crescent"
		FULL: return "Full"
		WANING: return "Waning"
		BLOOD: return "Blood"

func _process(delta):
	var ratio = $Timer.time_left/$Timer.wait_time
	
	var rect = $DayNightBar.get_region_rect()
	rect.position.x = 256 * moon + 128 * (1 - ratio)
	$DayNightBar.set_region_rect(rect)
	
	if ratio == 0:
		emit_signal("midnight_strikes")
