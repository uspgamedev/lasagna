extends Node

export(int) var tile_id = 0

func _interact(player, tile_pos, item):
	if item != null and item.crop_seed != "":
		var cropmatrix = get_node("/root/Main").get_cropmatrix()
		if cropmatrix.crop_at(tile_pos.y, tile_pos.x) == null:
			pass

