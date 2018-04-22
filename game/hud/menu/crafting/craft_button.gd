extends Button

func _pressed():
	var grandparent = get_parent().get_parent()
	var database = get_node("/root/Main").get_db()
	var my_recipe_data = database.get_recipe_by_name(recipe_name)
	var ingreds = database.get_recipe_ingreds(my_recipe_data)
	#var player = ...
	var inventory = player.get_node("Inventory")
	for ingred in ingreds:
		inventory.consume_n_items(ingred.name, 1)
	inventory.give_items(my_recipe_data.yields)