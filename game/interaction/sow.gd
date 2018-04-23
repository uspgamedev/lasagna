extends Node

export(int) var tile_id = 0

func _interact(player, item):
	if item != null and item.is_seed:
		print("it is sown")

