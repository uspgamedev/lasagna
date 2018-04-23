extends Node

var has_played = false

func interact(unused):
	if !has_played:
		get_node("/root/Main").execute_cutscene("cupboard_get_seeds")
		get_node("/root/Main").get_inventory().give_items("FleeceSeed",1)
		get_node("/root/Main").get_inventory().give_items("XucTuSeed",1)
		get_node("/root/Main").get_inventory().give_items("RaHajSeed",1)
		has_played = true
	else:
		get_node("/root/Main").execute_cutscene("cupboard_already_got_seeds")