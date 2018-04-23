extends Node

func execute_cutscene(name):
	var cutscene = get_node(name)
	cutscene.execute_cutscene()
	return cutscene
