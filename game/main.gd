extends Node2D

func _ready():
	if has_node("Play"):
		$Play._play()

func get_db():
	return get_node("/root/Database")

func get_hud():
	return get_node("HUD")

func execute_cutscene(name):
	get_node("Map/Cutscenes").execute_cutscene(name)
