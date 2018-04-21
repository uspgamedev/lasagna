extends Panel

export (int) var ingred_num = 1

func _ready():
	for x in range(6-ingred_num):
		var nodename = "HBox/Ingredient"+str(x)
		get_node(nodename).visibility = false
	pass

func _process(delta):
	var can_craft = true
	for x in range(6-ingred_num, 6):
		var nodename = "HBox/Ingredient"+str(x)
		can_craft = can_craft and get_node(nodename).has_enough()
		if !can_craft:
			break
	if can_craft:
		$CraftButton.disable = false
	else:
		$CraftButton.disable = true