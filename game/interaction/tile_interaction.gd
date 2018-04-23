extends Node

func _find_tile_interaction(tile_id):
	for interaction in get_children():
		if interaction.tile_id == tile_id:
			return interaction
	return null

func interact(player, item, tile_id):
	print(item)
	var interaction = _find_tile_interaction(tile_id)
	print(interaction)
	if interaction != null:
		interaction._interact(player, item)
