extends Node

signal midnight_strikes

export (int) var minute_frames
export (int) var   hour_frames

var minute_hand_pos
var   hour_hand_pos

func _ready():
	minute_hand_pos = 0
	hour_hand_pos   = 0

func end_night():
	start()
	pass

func _process(delta):
	var ratio       = $Timer.time_left/$Timer.wait_time
	hour_hand_pos   =  int(hour_frames*ratio)
	minute_hand_pos = int(ratio*minute_frames*12)%12
	
	$MinuteHand.frame = minute_hand_pos
	$HourHand.frame   = hour_hand_pos
	
	if ratio == 1:
		emit_signal("midnight_strikes")