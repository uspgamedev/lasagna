extends Node2D

const SLEEP = 0

var hud
var player

func _ready():
	hud = get_node("/root/Main").get_hud().get_node("Popup")
	hud.clear()
	hud.add_item(" Sleep")
	hud.add_item(" Don't Sleep")

func interact(unused):
	if $Timer.is_stopped():
		$Timer.start()
		hud.popup_centered(Vector2(128, 64))
		get_tree().paused = true
		var id = yield(hud, "id_pressed")
		if id == SLEEP:
			var main = get_node("/root/Main")
			main.get_player().hp = main.get_player().max_health
			main.sleep_and_save()
			main.end_night()
		get_tree().paused = false
	