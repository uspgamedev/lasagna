extends Sprite

var direction
var walking
var should_begin_play

func _process(delta):
	if should_begin_play == true:
		play()
		should_begin_play = false

func set_orientation(orientation):
	if orientation != direction:
		should_begin_play = true
	direction = orientation
	
func set_is_walking(is_walking):
	if is_walking != walking:
		should_begin_play = true
	walking = is_walking
	
func play():
	var type = ""
	if walking == true:
		type = "walk"
	else:
		type = "idle"
	$AnimationPlayer.play(type+"-"+direction)