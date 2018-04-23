extends Panel

export (String) var recipe_name

var num_of_ingreds = 1

func _ready():
	var database = get_node("/root/Main").get_db()
	var my_recipe_data = database.get_recipe_by_name(recipe_name)
	$HBox/LabelMargin/Label.text = my_recipe_data.yields
	
	var ingreds = database.get_recipe_ingreds(my_recipe_data)
	num_of_ingreds = ingreds.size()
	for i in range(num_of_ingreds):
		var ingred_data = ingreds[i]
		var nodename = "HBox/Ingredient"+str(i)
		var current_ingred = get_node(nodename)
		current_ingred.ingred_name = ingred_data.name
		current_ingred.ingred_texture = ingred_data.icon
		current_ingred.visible = true

func _process(delta):
	var can_craft = true
	var array = $HBox.get_children()
	for index in range(1,num_of_ingreds):
		var ingred_slot = array[index]
		var has_req = ingred_slot.has_enough()
		if has_req:
			ingred_slot.get_node("Button").disabled = false
		else:
			ingred_slot.get_node("Button").disabled = true
		can_craft = can_craft and has_req
	$CraftButton.disabled = !can_craft