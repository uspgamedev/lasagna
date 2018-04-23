extends Node

func _ready():
	var flag = get_node("/root/Main").get_flags().get_flag("GOT_NECRONOMICON")
	if flag:
		get_parent().queue_free()


func interact(unused):
	get_node("/root/Main").get_flags().set_flag("GOT_NECRONOMICON", true)
	get_node("/root/Main").execute_cutscene("necronomicon_get")

func _on_necronomicon_get_finished():
	get_parent().queue_free()

func _on_Timer_timeout():
	var flag = get_node("/root/Main").get_flags().get_flag("GOT_NECRONOMICON")
	if flag:
		get_parent().queue_free()
