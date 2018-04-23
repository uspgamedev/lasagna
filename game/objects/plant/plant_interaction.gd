extends "res://interaction/interaction.gd"

func _is_grown():
	var addr = get_parent().address
	return get_node("/root/Main").get_cropmatrix().is_grown(addr[0], addr[1], addr[2])

func interact(item):
	if _is_grown():
		get_node("/root/Main").execute_cutscene("inspect_crop")
	else:
		print("tried to harvest non ripe tree")