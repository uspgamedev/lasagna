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

func sow(patch, i, j, cropname):
	crops[patch][i][j] = [cropname, 0]

func grow_all():
	for k in range(len(crops)):
		for i in range(len(crops[k])):
			for j in range(len(crops[k][i])):
				crops[k][i][j][1] += 1

func remove(patch, i, j, cropname):
	crops[patch][i][j] = null

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
