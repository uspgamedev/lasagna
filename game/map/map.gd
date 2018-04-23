extends Node2D

export(String, FILE) var nighttime = null
export(String, FILE) var daytime = null

func _ready():
	var cam = get_node("Foreground/Player/Camera2D")
	var lr = $Limits/LowerRight.global_position
	var ul = $Limits/UpperLeft.global_position
	cam.limit_bottom = lr.y
	cam.limit_right = lr.x
	cam.limit_top = ul.y
	cam.limit_left = ul.x
