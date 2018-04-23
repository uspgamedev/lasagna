extends Node

func execute_cutscene(name):
	if has_node(name):
		var cutscene = get_node(name)
		cutscene.execute_cutscene()
		return cutscene
