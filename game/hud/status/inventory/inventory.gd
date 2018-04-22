extends Container

var slots = []

func _ready():
	for slot in get_children():
		slots.append(slot)

func _process(delta):
	for i in range(get_child_count()):
		var main = get_node("/root/Main")
		var item = main.get_inventory().get_item_at(i)
		if item[0] != "": # NOT an empty slot
			var icon = main.get_db().get_item_by_name(item[0]).icon
			get_child(i).set_icon(icon)
