extends KinematicBody2D

export(float) var friction
export(float) var push_force
export(float) var max_speed

var velocity = Vector2(0,0)

func push(direction):
	velocity = direction*push_force
	if velocity.length() >= max_speed:
		velocity = velocity.normalized()*max_speed

func look_at(orientation):
	if velocity.length() > 0:
		$oriented_sprite.set_state("walk")
		var angle = velocity.angle()
		if    -PI/4 < angle and angle < PI/4:
			$oriented_sprite.set_orientation("right")
		elif   PI/4 < angle and angle < 3*PI/4:
			$oriented_sprite.set_orientation("up")
		elif 3*PI/4 < angle and angle < 5*PI/4:
			$oriented_sprite.set_orientation("left")
		elif 5*PI/4 < angle:
			$oriented_sprite.set_orientation("down")
	else:
		$oriented_sprite.set_state("idle")

func _physics_process(delta):
	var mv_return = move_and_collide(velocity*delta)
	if mv_return != null:
		velocity = 	mv_return.get_remainder()
	velocity-= min(friction, velocity.length()) * velocity.normalized()  