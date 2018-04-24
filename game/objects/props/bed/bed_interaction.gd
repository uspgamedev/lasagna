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
		hud.request_option(["Sleep & Save", "Not now"])
		var id = yield(hud, "option_chosen")
		if id == SLEEP:
			var main = get_node("/root/Main")
			main.get_player().hp = main.get_player().max_health
			get_node("/root/Main").get_flags().set_flag('hp', get_node('/root/Main').get_player().hp)
			main.sleep_and_save()
			main.end_night()
	