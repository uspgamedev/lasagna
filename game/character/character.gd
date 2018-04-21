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
	#NEED TO IMPLEMENT
	pass

func _physics_process(delta):
	var mv_return = move_and_collide(velocity)
	if mv_return != null:
		velocity = 	mv_return.get_remainder()
	velocity-= min(friction, velocity.length()) * velocity.normalized()  