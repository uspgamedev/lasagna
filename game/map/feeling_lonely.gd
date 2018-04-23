extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _process(delta):
	var main = get_node("/root/Main")
	if !main.get_flags().get_flag("ATE_LASAGNA") and !main.get_flags().get_flag("GOT_NOTIFIED_ABOUT_EATING"):
		if main.get_flags().get_flag("CRAFTED_LASAGNA") and !main.is_daytime():
			main.execute_cutscene("should_eat_alone")
			main.get_flags().set_flag("GOT_NOTIFIED_ABOUT_EATING", true)
			