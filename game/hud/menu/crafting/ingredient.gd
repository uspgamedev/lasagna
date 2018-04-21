extends Control

export (String)  var ingred_name
export (Texture) var ingred_texture
export (int)     var amount

func _ready():
	$Button.icon        = ingred_texture
	$Button/Amount.text = str(amount)+"x"

func has_enough():
	#IF PLAYER HAS ENOUGH, TRUE; ELSE FALSE
	pass

func _process(delta):
	if has_enough() == 1:
		$Button.disabled = false
	else:
		$Button.disabled = true		