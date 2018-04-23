extends Container

var slots = []
var focused = 0

func _ready():
	for slot in get_children():
		slots.append(slot)
	get_child(0).focus()

func _inventory():
	return get_node("/root/Main").get_inventory()

func _db():
	return get_node("/root/Main").get_db()

func get_equipped_item():
	var name = _inventory().get_item_at(self.focused)[0]
	if name != "":
		return _db().get_item_by_name(name)
	return null

func _process(delta):
	for i in range(get_child_count()):
		var slot = get_child(i)
		var main = get_node("/root/Main")
		var item = main.get_inventory().get_item_at(i)
		if item[0] != null and item[0] != "": # NOT an empty slot
			var icon = main.get_db().get_item_by_name(item[0]).icon
			slot.set_icon(icon)
			slot.get_node('Counter').visible = true
			slot.get_node('Counter/Label').text = var2str(int(item[1]))

func _input(event):
	var n = get_child_count()
	if event.is_action_pressed("use_item"):
		var player = get_node("/root/Main").get_player()
		var item = get_equipped_item()
		if item != null:
			player.interact(get_equipped_item())
	elif event.is_action_pressed("shoulder_right"):
		$SFX.play()
		slots[focused].unfocus()
		focused = (focused + 1)%n
		slots[focused].focus()
	elif event.is_action_pressed("shoulder_left"):
		$SFX.play()
		slots[focused].unfocus()
		focused = (focused + n - 1)%n
		slots[focused].focus()