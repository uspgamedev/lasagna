extends Sprite

var direction
var state
var should_play

func _process(delta):
	if should_play == true:
		play()
		should_play = false

func set_direction(new_direction):
	if new_direction != direction:
		should_play = true
	direction = new_direction
	
func set_state(new_state):
	if state != new_state:
		should_play = true
	state = new_state
	
func play():
	$AnimationPlayer.play(state+"-"+direction)