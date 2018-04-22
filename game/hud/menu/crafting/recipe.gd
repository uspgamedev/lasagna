extends Panel

export (String) var recipe_name

func _ready():
	for x in range(6):
		var nodename = "HBox/Ingredient"+str(x)
		get_node(nodename).visible = false
	var database = get_node("/root/Main").get_db()
	var my_recipe_data = database.get_recipe_by_name(recipe_name)
	$HBox/LabelMargin/Label.text = my_recipe_data.yields
	
	var ingreds = database.get_recipe_ingreds(my_recipe_data)
	for i in range(ingreds.size()):
		var ingred_data = ingreds[i]
		var nodename = "HBox/Ingredient"+str(i)
		var current_ingred = get_node(nodename)
		current_ingred.ingred_texture = ingred_data.icon
		if ingred_data.icon != null:
			print(ingred_data.icon.resource_name)
		current_ingred.visible = true

func _process(delta):
	var can_craft = true
	var array = $HBox.get_children()
	for index in range(1,array.size()):
		var ingred_slot = array[index]
		can_craft = can_craft and ingred_slot.has_enough()
		if !can_craft:
			break
	if can_craft:
		$CraftButton.disabled = false
	else:
		$CraftButton.disabled = true