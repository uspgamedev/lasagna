extends Button

func _pressed():
	var greatgrandparent = get_parent().get_parent().get_parent()
	var MAIN = get_node("/root/Main")
	var database = MAIN.get_db()
	var recipe_name = greatgrandparent.recipies[greatgrandparent.current_recipe].name
	var my_recipe_data = database.get_recipe_by_name(recipe_name)
	var ingreds = database.get_recipe_ingreds(my_recipe_data)
	var inventory = MAIN.get_node("Inventory")
	for ingred in ingreds:
		inventory.consume_n_items(ingred.name, 1)
	inventory.give_items(my_recipe_data.name, 1)
	if   my_recipe_data.name == "LaaZahna":
		MAIN.get_flags().set_flag("CRAFTED_LASAGNA", true)
	elif my_recipe_data.name == "YakiSobath":
		MAIN.get_flags().set_flag("CRAFTED_YAKISOBATH", true)
	elif my_recipe_data.name == "BlobStew":
		MAIN.get_flags().set_flag("CRAFTED_BLOBSTEW", true)