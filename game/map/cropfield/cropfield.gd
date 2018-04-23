extends Area2D

const UNSOWN_PATCH = 1

export(int) var field_index = 0

var origin_tile

onready var tilemap = get_parent()

func _ready():
	self.origin_tile = self.tilemap.world_to_map(self.position)

func _cropmatrix():
	return get_node("/root/Main").get_cropmatrix()

func _interact(player, tile, item):
	var cell = self.tilemap.get_cellv(tile)
	if item != null and item.crop_seed != "" and cell == UNSOWN_PATCH:
		var p = tile - self.origin_tile
		_cropmatrix().sow(self.field_index, p.x, p.y, item.crop_seed)
	#$TileInteraction.interact(self, item, ft_pos, cell)
