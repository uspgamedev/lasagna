extends Node2D

func get_hud():
	return get_node("HUD")

func execute_cutscene(name):
	get_node("Map/Cutscenes").execute_cutscene(name)
