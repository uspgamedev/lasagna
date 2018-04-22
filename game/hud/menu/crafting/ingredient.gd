extends Control

export (Texture) var ingred_texture
export (int)     var amount

var ingred_name = ""

func _ready():
	$Button.icon        = ingred_texture
	$Button/Amount.text = str(amount)+"x"

func has_enough():
	var inventory = get_node("/root/Main/Inventory")
	var owned = inventory.how_many_of_item(ingred_name)
	if owned != null:
		return owned >= amount
	return false

func _process(delta):
	if ingred_texture != $Button.icon:
		$Button.icon   = ingred_texture
	if has_enough():
		$Button.disabled = false
	else:
		$Button.disabled = true