extends Node2D

var hud
var player

func _ready():
	hud = get_node("/root/Main").get_hud().get_node("BedPopup")
	hud.clear()
	hud.add_item(" Sleep")
	hud.add_item(" Don't Sleep")

func interact(unused):
	if $Timer.is_stopped():
		$Timer.start()
		hud.popup_centered(Vector2(128, 64))
		get_tree().paused = true
	