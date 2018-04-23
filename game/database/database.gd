extends Node

func get_station_by_name(godot_name):
	return $Stations.get_node(godot_name)

func get_item_by_name(godot_name):
	return $Items.get_node(godot_name)

func get_recipe_by_name(godot_name):
	return $Recipies.get_node(godot_name)

func get_item_texture(name):
	return get_item_by_name(name).icon

func get_recipe_ingreds(recipe):
	var array = []
	for ingred_req in recipe.get_children():
		array.append(get_item_by_name(ingred_req.name))
	return array

func get_crop_by_name(name):
	return $Crops.get_node(name)