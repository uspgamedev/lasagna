extends Node

func _process(delta):
	var main = get_node("/root/Main")
	var GOT_NECR   = main.get_flags().get_flag("GOT_NECRONOMICON")
	var GOT_INGRED = main.get_flags().get_flag("GOT_INGRED")
	if  GOT_INGRED and GOT_NECR:
		if !main.get_flags().get_flag("got_oven_hint"):
			main.get_flags().set_flag("got_oven_hint", true)
			main.execute_cutscene("give_oven_hint")