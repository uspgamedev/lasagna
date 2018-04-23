extends Node

var has_played = false

func interact(unused):
	var main = get_node("/root/Main")
	if !main.get_flags().get_flag("GOT_INGREDS"):
		main.get_flags().set_flag("GOT_INGREDS", true)
		main.execute_cutscene("cupboard_get_ingreds")
		main.get_inventory().give_items("FleeceSeed",1)
		main.get_inventory().give_items("KepalaSeed",1)
	else:
		get_node("/root/Main").execute_cutscene("cupboard_already_got_ingreds")