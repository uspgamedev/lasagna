extends Sprite

var direction   = "right"
var anim_direction = "right"
var state       = "idle"
var should_play =  true

func _process(delta):
	if should_play == true:
		play()
		should_play = false

func set_direction(new_direction):
	if new_direction != direction:
		should_play = true
		direction = new_direction
		if new_direction == "left" or new_direction == "right":
			anim_direction = new_direction
		get_node('../AreaInteraction').rotate_polygon_collision(new_direction)
	
func set_state(new_state):
	if state != new_state:
		should_play = true
	state = new_state
	
func play():
	$AnimationPlayer.stop()
	var anim = state+"-"+anim_direction
	$AnimationPlayer.play(anim)