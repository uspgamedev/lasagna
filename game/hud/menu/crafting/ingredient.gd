extends Control

export (Texture) var ingred_texture
export (int)     var amount

var ingred_name = ""

func _ready():
	$Button.icon        = ingred_texture
	$Button/Amount.text = str(amount)+"x"

func has_enough():
	#var player = ...
	var inventory = player.get_node("Inventory")
	var owned = inventory.how_many_of_item(ingred_name) 
	return owned >= amount

func _process(delta):
	if ingred_texture != $Button.icon:
		$Button.icon   = ingred_texture
	if has_enough() == 1:
		$Button.disabled = false
	else:
		$Button.disabled = true		