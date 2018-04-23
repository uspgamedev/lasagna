extends Node

const PATCH_NUM = 8

var patch_positions = []

var crops = [
	[
		[null, null, null, null],
		[null, null, null, null],
		[null, null, null, null],
		[null, null, null, null]
	],
	[
		[null, null, null, null],
		[null, null, null, null],
		[null, null, null, null],
		[null, null, null, null]
	],
	[
		[null, null, null, null],
		[null, null, null, null],
		[null, null, null, null],
		[null, null, null, null]
	],
	[
		[null, null, null, null],
		[null, null, null, null],
		[null, null, null, null],
		[null, null, null, null]
	],
	[
		[null, null, null, null],
		[null, null, null, null],
		[null, null, null, null],
		[null, null, null, null]
	],
	[
		[null, null, null, null],
		[null, null, null, null],
		[null, null, null, null],
		[null, null, null, null]
	],
	[
		[null, null, null, null],
		[null, null, null, null],
		[null, null, null, null],
		[null, null, null, null]
	],
	[
		[null, null, null, null],
		[null, null, null, null],
		[null, null, null, null],
		[null, null, null, null]
	],
]

func _db():
	return get_node("/root/Main").get_db()

func sow(patch, i, j, cropname):
	crops[patch][i][j] = [cropname, 0]

func grow_all():
	var db = get_node("/root/Main").get_db()
	for k in range(len(crops)):
		for i in range(len(crops[k])):
			for j in range(len(crops[k][i])):
				if crops[k][i][j] != null:
					var crop_data = db.get_crop_by_name(crops[k][i][j][0])
					var crop_grow_limit = crop_data.growth_limit
					var current_growth = crops[k][i][j][1]
					crops[k][i][j][1] = min(current_growth+1, crop_grow_limit) 

func remove(patch, i, j):
	crops[patch][i][j] = null

func get_crop(k, i, j):
	return self.crops[k][i][j]

func is_grown(k, i, j):
	var crop = get_crop(k, i, j)
	var growth_limit = _db().get_crop_by_name(crop[0]).growth_limit
	return crop[1] >= growth_limit

func crop_at(i, j):
	var k = 0
	for patch_origin in get_tree().get_nodes_in_group("patch"):
		var dx = j - patch_origin.x
		var dy = i - patch_origin.y
		if dx >= 0 and dx < 4 and dy >= 0 and dy < 4:
			var crop = crops[k][dy][dx]
			if crop != null:
				return crop.duplicate()
			else:
				return null
		k += 1
	return null

func set_day_crops():
	var cropfields = get_tree().get_nodes_in_group("fields")
	if not cropfields:
		return
	
	var db = get_node("/root/Main").get_db()
	for field in cropfields:
		var k = field.field_index
		for i in range(len(crops[k])):
			for j in range(len(crops[k][i])):
				if crops[k][i][j] != null:
					var crop_data = db.get_crop_by_name(crops[k][i][j][0])
					var crop_grow_limit = crop_data.growth_limit
					var current_growth = crops[k][i][j][1]
					if current_growth >= crop_grow_limit:
						var day_crop = crop_data.daytime_plant.instance()
						day_crop.address = [k, i, j]
						var pos = field.get_position()
						pos.x += (i * 32) + 16
						pos.y += (j * 24) + 12
						day_crop.set_position(pos)
						get_node("/root/Main/Map/Foreground").add_child(day_crop)

func set_night_crops():
	var cropfields = get_tree().get_nodes_in_group("fields")
	if not cropfields:
		return
	
	var indexes = []
	for field in cropfields:
		indexes.append(field.field_index)
	
	var db = get_node("/root/Main").get_db()
	for k in indexes:
		for i in range(len(crops[k])):
			for j in range(len(crops[k][i])):
				if crops[k][i][j] != null:
					var crop_data = db.get_crop_by_name(crops[k][i][j][0])
					var crop_grow_limit = crop_data.growth_limit
					var current_growth = crops[k][i][j][1]
					if current_growth >= crop_grow_limit:
						remove(k, i, j)
						var night_crop = crop_data.nighttime_plant.instance()
						var pos = cropfields[k].get_position()
						pos.x += (i * 32) + 16
						pos.y += (j * 24) + 12
						night_crop.set_position(pos)
						get_node("/root/Main/Map/Foreground").add_child(night_crop)