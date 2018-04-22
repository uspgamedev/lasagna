extends Node2D

func _ready():
	if has_node("Play"):
		$Play._play()

func get_player():
	var players = get_tree().get_nodes_in_group("player")
	if players.empty():
		return null
	return players[0]

func get_db():
	return get_node("/root/Database")

func get_hud():
	return get_node("HUD")

func execute_cutscene(name):
	get_node("Map/Cutscenes").execute_cutscene(name)

func get_daytime():
	return $HUD/Status/UpperRight/Clock.get_daytime()

func get_day():
	return $HUD/Status/UpperRight/Clock.get_day()

func end_night():
	$HUD/Status/UpperRight/Clock.end_night()
