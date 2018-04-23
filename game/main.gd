extends Node2D

signal ended_night

var clock
var transition_scene = preload("res://transition/Transition.tscn")
var actual_map

func _ready():
	clock = $HUD/Status/UpperRight/Clock
	actual_map = $Map
	if has_node("Play"):
		$Play._play()

func get_player():
	var players = get_tree().get_nodes_in_group("player")
	if players.empty():
		return null
	return players[0]

func get_inventory():
	return $Inventory

func get_db():
	return get_node("/root/Database")

func get_hud():
	return get_node("HUD")

func get_flags():
	return $Flags

func get_cropmatrix():
	return $CropMatrix

func get_daytime():
	clock.get_daytime()

func get_day():
	clock.get_day()

func sleep_and_save():
	if has_node("Play"):
		get_flags().spend_day()
		$Play.save_game()

func execute_cutscene(name):
	get_node("Map/Cutscenes").execute_cutscene(name)

func end_night():
	emit_signal("ended_night")
	var transition = transition_scene.instance()
	add_child(transition)
	transition.play("morning")
	yield(transition, "got_dark")
	clock.end_night()

func end_day():
	var transition = transition_scene.instance()
	var map = $Map
	add_child(transition)
	transition.play("night")
	yield(transition, "got_dark")
	if map.nighttime != null:
		var new_map = load(map.nighttime).instance()
		map.queue_free()
		yield(get_tree(), "physics_frame")
		add_child(new_map)

func pause_clock():
	clock.pause()

func unpause_clock():
	clock.unpause()

func update_clock():
	clock.update_bar()

func change_map(map_name):
	var transition = transition_scene.instance()
	add_child(transition)
	var map = $Map
	var new_map = load("res://map/" + map_name + ".tscn").instance()
	transition.play("scene", 0)
	yield(transition, "got_dark")
	map.queue_free()
	yield(get_tree(), "physics_frame")
	add_child(new_map)
	
