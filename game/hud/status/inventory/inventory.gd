extends Container

var slots = []
var focused = 0

func _ready():
	for slot in get_children():
		slots.append(slot)
	get_child(0).focus()

func _process(delta):
	for i in range(get_child_count()):
		var slot = get_child(i)
		var main = get_node("/root/Main")
		var item = main.get_inventory().get_item_at(i)
		if item[0] != "": # NOT an empty slot
			var icon = main.get_db().get_item_by_name(item[0]).icon
			slot.set_icon(icon)

func _input(event):
	var n = get_child_count()
	if event.is_action_pressed("shoulder_right"):
		slots[focused].unfocus()
		focused = (focused + 1)%n
		slots[focused].focus()
	elif event.is_action_pressed("shoulder_left"):
		slots[focused].unfocus()
		focused = (focused + n - 1)%n
		slots[focused].focus()