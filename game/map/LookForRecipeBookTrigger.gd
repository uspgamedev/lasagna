extends Node

func _on_cupboard_get_ingreds_finished():
	var main = get_node("/root/Main")
	var GOT_NECR   = main.get_flags().get_flag("GOT_NECRONOMICON")
	var GOT_INGRED = main.get_flags().get_flag("GOT_INGRED")
	if  GOT_INGRED and !GOT_NECR:
		yield(get_tree().create_timer(5.0), "timeout")
		if !main.get_flags().get_flag("played_needs_to_look_for_recipebook"):
			main.get_flags().set_flag("played_needs_to_look_for_recipebook", true)
			main.execute_cutscene("needs_to_look_for_recipebook")
