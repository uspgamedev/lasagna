extends Node

func execute_cutscene(name):
	get_node("/root/Main").pause_clock()
	get_node(name).execute_cutscene()
	get_node("/root/Main").unpause_clock()