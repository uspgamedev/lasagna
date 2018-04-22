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

func item_selected(button):
	pass

func render_inventory():
	var inventory = get_node("/root/Main/Inventory")
	var stash_content = inventory.get_stash()
	var keys = stash_content.keys()
	
	for i in range(keys.size()):
		var button = get_child(i)
		button.set_text(var2str(stash_content[keys[i]]))
		button.icon = load("res://test/empy-slot.png")

func move_highlighted_slot(new_slot):
	if (actual_slot <= 8 and actual_slot >= 1):
		get_node(str('MenuButton' + var2str(actual_slot))).remove_child(sprite)
	else:
		inventory.get_node(str('Slot' + var2str(actual_slot - 8))).remove_child(sprite)
	if (new_slot <= 8 and new_slot >= 1):
		sprite.offset = Vector2(22, 19)
		get_node(str('MenuButton' + var2str(new_slot))).add_child(sprite)
	else:
		sprite.offset = Vector2(16, 16)
		inventory.get_node(str('Slot' + var2str(new_slot - 8))).add_child(sprite)
	actual_slot = new_slot

func _input(event):
	if (self.is_visible_in_tree()):
		if event.is_action_pressed('ui_right') and actual_slot != 4 and actual_slot != 8 and actual_slot != 14:
			move_highlighted_slot(actual_slot + 1)
		elif event.is_action_pressed('ui_left') and actual_slot != 1 and actual_slot != 5 and actual_slot != 9:
			move_highlighted_slot(actual_slot - 1)
		elif event.is_action_pressed('ui_up'):
			if actual_slot <= 12 and actual_slot >= 5:
				move_highlighted_slot(actual_slot - 4)
			elif actual_slot == 13 or actual_slot == 14:
				move_highlighted_slot(8)
		elif event.is_action_pressed('ui_down'):
			if actual_slot <= 8 and actual_slot >= 1:
				move_highlighted_slot(actual_slot + 4)
