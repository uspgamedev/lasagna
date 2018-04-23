extends Control

signal midnight_strikes

export (int) var day_duration = 10 # duration of daytime in seconds

var flags
var stopped = false

func _ready():
	$Timer.set_wait_time(day_duration)
	$Timer.start()
	flags = get_node("/root/Main").get_flags()

func end_night():
	$Timer.start()
	stopped = false

func get_daytime():
	return 1 - $Timer.time_left/$Timer.wait_time

func get_day():
	return flags.get_day()

func _process(delta):
	update_bar()

func update_bar():
	var ratio = $Timer.time_left/$Timer.wait_time
	var moon = flags.get_moon()
	
	var rect = $DayNightBar.get_region_rect()
	rect.position.x = 256 * moon + 128 * (1 - ratio)
	$DayNightBar.set_region_rect(rect)
	
	if ratio == 0 and not stopped:
		stopped = true
		emit_signal("midnight_strikes")
		get_node("/root/Main").end_day()

func pause():
	set_process(false)
	$Timer.paused = true

func unpause():
	set_process(true)
	$Timer.paused = false
