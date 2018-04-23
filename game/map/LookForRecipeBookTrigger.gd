extends Node

func _on_cupboard_get_ingreds_finished():
	$Timer.start()

func _on_Timer_timeout():
	var main = get_node("/root/Main")
	if !main.get_flags().get_flag("heard_should_look_for_recipebook"):	
		if !main.get_flags().get_flag("GOT_NECRONOMICON"):
			main.get_flags().set_flag("heard_should_look_for_recipebook", true)
			main.execute_cutscene("needs_to_look_for_recipebook")
