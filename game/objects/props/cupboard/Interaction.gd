extends Node

var has_played = false

func interact(unused):
	if unused != null: return
	var main = get_node("/root/Main")
	if !main.get_flags().get_flag("GOT_INGRED"):
		main.get_flags().set_flag("GOT_INGRED", true)
		main.execute_cutscene("cupboard_get_ingreds")
		main.get_inventory().give_items("Frog",1)
		main.get_inventory().give_items("Milk",1)
		main.get_inventory().give_items("Ham",1)
		main.get_inventory().give_items("TomatoSauce",1)
		main.get_inventory().give_items("KepalaSeed",1)
	else:
		main.execute_cutscene("cupboard_already_got_ingreds")