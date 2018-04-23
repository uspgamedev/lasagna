extends "res://interaction/character_interaction.gd"

func interact(unused):
	get_node("/root/Main").execute_cutscene("Basic")
