extends GridContainer

onready var slots = get_children()
onready var sprite = get_node('MenuButton1/Sprite')
onready var inventory = get_node('../Status/Bottom/Inventory')
var actual_slot = 1

func _ready():
	for i in range(get_child_count()):
		var button = get_child(i)
		button.connect("pressed", self, "item_selected", [button])
	sprite.get_node("AnimationPlayer").play("cursor")
	for i in get_children():
		var sprite = Sprite.new()
		sprite.name = "Item"
		sprite.offset = Vector2(22, 19)
		i.add_child(sprite)

func item_selected(button):
	pass

func render_inventory():
	var inventory = get_node("/root/Main/Inventory")
	var stash_content = inventory.get_stash()
	var keys = stash_content.keys()
	var i = 0
	for child in self.get_children():
		if i < keys.size():
			var icon = get_node(str('/root/Database/Items/' + keys[i])).icon
			child.get_node('Item').texture = icon
			child.text = var2str(stash_content[keys[i]])
		else:
			child.get_node('Item').texture = null
			child.text = '0'
		i += 1

func move_highlighted_slot(new_slot):
	if (actual_slot <= 12 and actual_slot >= 1):
		get_node(str('MenuButton' + var2str(actual_slot))).remove_child(sprite)
	else:
		inventory.get_node(str('Slot' + var2str(actual_slot - 12))).remove_child(sprite)
	if (new_slot <= 12 and new_slot >= 1):
		sprite.offset = Vector2(22, 19)
		get_node(str('MenuButton' + var2str(new_slot))).add_child(sprite)
	else:
		sprite.offset = Vector2(16, 16)
		inventory.get_node(str('Slot' + var2str(new_slot - 12))).add_child(sprite)
	actual_slot = new_slot

func move_item():
	var moved
	var inv = get_node('/root/Main/Inventory')
	if (actual_slot <= 12 and actual_slot >= 1):
		var stash = inv.get_stash()
		if  not stash.empty() and stash.size() >= actual_slot:
			var keys = stash.keys()
			moved = inv.remove_item_from_stash(keys[actual_slot - 1], 1)
			if moved != null:
				var stash_content = inv.get_stash()
				var button = get_node(str('MenuButton' + var2str(actual_slot)))
				button.text = var2str(str2var(button.text) - 1)
				inv.give_items(moved[0], moved[1])
				var slot = inventory.get_node(str('Slot' + var2str(actual_slot)))
				slot.get_node('Counter/Label').text = var2str(str2var(slot.get_node('Counter/Label').text) + 1)
				render_inventory()
	else:
		moved = inv.remove_from_inventory(actual_slot - 13)
		var slot = inventory.get_node(str('Slot' + var2str(actual_slot - 12)))
		slot.set_icon(null)
		if moved != null:
			slot.get_node('Counter').visible = false
			slot.get_node('Counter/Label').text = '0'
			inv.add_item_to_stash(moved[0], moved[1])
			render_inventory()

func _input(event):
	if (self.is_visible_in_tree()):
		if event.is_action_pressed('ui_accept'):
			move_item()
		elif event.is_action_pressed('ui_right') and not actual_slot in [4, 8, 12, 18]:
			move_highlighted_slot(actual_slot + 1)
		elif event.is_action_pressed('ui_left') and not actual_slot in [1, 5, 9, 13]:
			move_highlighted_slot(actual_slot - 1)
		elif event.is_action_pressed('ui_up'):
			if actual_slot <= 16 and actual_slot >= 5:
				move_highlighted_slot(actual_slot - 4)
			elif actual_slot == 17 or actual_slot == 18:
				move_highlighted_slot(8)
		elif event.is_action_pressed('ui_down'):
			if actual_slot <= 12 and actual_slot >= 1:
				move_highlighted_slot(actual_slot + 4)
