extends Area2D

export(int) var field_index = 0

var origin_tile

func _ready():
	self.origin_tile = get_parent().world_to_map(self.position)

func _interact(player, tile, item):
	print("interact crop")
	print(tile)
	print(item)
	#$TileInteraction.interact(self, item, ft_pos, cell)
