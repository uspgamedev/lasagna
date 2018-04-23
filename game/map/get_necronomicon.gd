extends Node

func interact(unused):
	get_node("/root/Main").get_flags().set_flag("GOT_NECRONOMICON", true)
	get_node("/root/Main").execute_cutscene("necronomicon_get")
	get_parent().queue_free()