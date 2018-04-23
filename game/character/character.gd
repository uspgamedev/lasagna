extends KinematicBody2D

export(float) var friction   = 0
export(float) var push_force = 0
export(float) var max_speed  = 0
export(int)   var max_health = 100

var velocity = Vector2(0,0)
var hp = 1
var dir = Vector2(1, 0)
var dead = false

func _ready():
	$DeathSprite.hide()
	$OrientedSprite.material = null
	hp = max_health

func damage(dmg_points, from=false):
	if $DmgCooldown.is_stopped():
		if from:
			knockback(from.get_position())
		$DmgCooldown.start()
		hp -= dmg_points
		if hp <= 0 and not dead:
			death()

func death():
	dead = true

func knockback(from):
	if dead:
		return
	var pos = get_position()
	var distvec = (pos - from).normalized()
	set_position(pos + distvec * 32)

func push(direction):
	dir = direction
	velocity = direction*push_force
	if velocity.length() >= max_speed:
		velocity = velocity.normalized()*max_speed

func _process(delta):
	if dead:
		return
	if !$DmgCooldown.is_stopped():
		$OrientedSprite.blink()
	else:
		$OrientedSprite.visible = true
	if velocity.length() > 0:
		$OrientedSprite.set_state("walk")
		var angle = velocity.angle()
		if    -PI/4 < angle and angle < PI/4:
			$OrientedSprite.set_direction("right")
		elif   -3*PI/4 < angle and angle < -PI/4:
			$OrientedSprite.set_direction("up")
		elif 3*PI/4 < angle or angle < -3*PI/4:
			$OrientedSprite.set_direction("left")
		elif PI/4 < angle and angle < 3*PI/4:
			$OrientedSprite.set_direction("down")
	else:
		$OrientedSprite.set_state("idle")

func _physics_process(delta):
	if dead:
		return
	var mv_return = move_and_collide(velocity*delta)
	if mv_return != null:
		velocity = 	mv_return.get_remainder()
		var normal = mv_return.get_normal()
		move_and_slide(velocity/delta, normal)
	velocity-= min(friction, velocity.length()) * velocity.normalized()  