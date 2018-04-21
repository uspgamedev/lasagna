extends Node2D

var hud
var player

func _ready():
	hud = get_node("/root/Main").get_hud().get_node("BedPopup")
	hud.add_check_item("Sleep")
	hud.add_check_item("Don't Sleep")

func interact():
	hud.popup_centered(Vector2(100, 100))
	get_tree().paused = true
	