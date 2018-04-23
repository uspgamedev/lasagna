extends TileMap

const SOWN_DAY = 4
const SOWN_NIGHT = 16

func _cropmatrix():
	return get_node("/root/Main").get_cropmatrix()

func _db():
	return get_node("/root/Main").get_db()

func _process(delta):
	for field in get_tree().get_nodes_in_group("fields"):
		for i in range(4):
			for j in range(4):
				var crop = _cropmatrix().get_crop(field.field_index, i, j)
				if crop != null:
					var data = _db().get_crop_by_name(crop[0])
					var tile = field.origin_tile + Vector2(i,j)
					set_cellv(tile, SOWN_DAY)
				
