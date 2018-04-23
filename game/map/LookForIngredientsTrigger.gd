extends Node

func _on_necronomicon_get_finished():
	$Timer.start()

func _process(delta):
	if $Timer.is_stopped():
		var main = get_node("/root/Main")
		var GOT_NECR   = main.get_flags().get_flag("GOT_NECRONOMICON")
		var GOT_INGRED = main.get_flags().get_flag("GOT_INGRED")
		if  GOT_INGRED and !GOT_NECR:
			if !main.get_flags().get_flag("played_needs_to_look_for_ingreds"):
				main.get_flags().set_flag("played_needs_to_look_for_ingreds", true)
				main.execute_cutscene("needs_to_look_for_ingreds")