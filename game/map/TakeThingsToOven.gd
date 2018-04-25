extends Node

func _on_cupboard_get_ingreds_finished():
	var main = get_node("/root/Main")
	var GOT_NECR   = main.get_flags().get_flag("GOT_NECRONOMICON")
	var GOT_INGRED = main.get_flags().get_flag("GOT_INGRED")
	if  GOT_INGRED and GOT_NECR:
		yield(get_tree().create_timer(5.0), "timeout")
		if !main.get_flags().get_flag("got_oven_hint"):
			main.execute_cutscene("give_oven_hint")
			main.get_flags().set_flag("got_oven_hint", true)