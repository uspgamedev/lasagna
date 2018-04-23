extends Node

func _on_necronomicon_get_finished():
	$Timer.start()

func _on_Timer_timeout():
	var main = get_node("/root/Main")
	if main.get_flags().get_flag("GOT_NECRONOMICON"):	
		if !main.get_flags().get_flag("GOT_INGREDS"):
			main.get_flags().set_flag("heard_should_look_for_ingreds", true)
			main.execute_cutscene("needs_to_look_for_ingreds")