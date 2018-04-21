extends KinematicBody2D

export(float) var friction
export(float) var push_force
export(float) var max_speed

var velocity = Vector2(0,0)

func push(direction):
	velocity = direction*push_force
	if velocity.length() >= max_speed:
		velocity = velocity.normalized()*max_speed

func _process(delta):
	if velocity.length() > 0:
		$OrientedSprite.set_state("walk")
		var angle = velocity.angle()
		if    -PI/4 < angle and angle < PI/4:
			$OrientedSprite.set_direction("right")
		elif   PI/4 < angle and angle < 3*PI/4:
			$OrientedSprite.set_direction("up")
		elif 3*PI/4 < angle and angle < 5*PI/4:
			$OrientedSprite.set_direction("left")
		elif 5*PI/4 < angle:
			$OrientedSprite.set_direction("down")
	else:
		$OrientedSprite.set_state("idle")

func _physics_process(delta):
	var mv_return = move_and_collide(velocity*delta)
	if mv_return != null:
		velocity = 	mv_return.get_remainder()
	velocity-= min(friction, velocity.length()) * velocity.normalized()  