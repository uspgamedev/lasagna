
extends Polygon2D

func _ready():
	follow_player()
	if get_node("/root/Main").is_day:
		hide()
	else:
		show()

func follow_player():
	set_global_position(get_node("/root/Main").get_player().get_global_position())

func _physics_process(dt):
	follow_player()
