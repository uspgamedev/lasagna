extends Node

func get_item_by_name(godot_name):
	return $Items.get_node(godot_name)
	
func get_recipe_by_name(godot_name):
	return $Recipies.get_node(godot_name)

func get_recipe_ingreds(recipe):
	var array = []
	for ingred_req in recipe.get_children():
		array.append(get_item_by_name(ingred_req.name))
	return array