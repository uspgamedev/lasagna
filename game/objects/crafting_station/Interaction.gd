extends Node

func interact(unused):
	var main = get_node("/root/Main")
	if main.get_flags().get_flag("GOT_NECRONOMICON"):
		get_parent().interact(null)
	else:
		main.execute_cutscene("cant_cook_without_recipebook")