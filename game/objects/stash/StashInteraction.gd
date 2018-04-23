extends Node

func _input(event):
	var hud = get_node("/root/Main").get_hud()
	var container = hud.get_node("InventoryContainer")
	var inventory = hud.get_node('Status/Bottom/Inventory')
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = false
		container.hide()
		inventory.slots[inventory.focused].focus()
		if container.actual_slot >= 9:
			inventory.get_node(str('Slot' + var2str(container.actual_slot - 12) + '/Sprite')).visible = false

func interact(unused):
	var hud = get_node("/root/Main").get_hud()
	var container = hud.get_node("InventoryContainer")
	var inventory = hud.get_node('Status/Bottom/Inventory')
	container.render_inventory()
	container.show()
	inventory.slots[inventory.focused].unfocus()
	if container.actual_slot >= 9:
		inventory.get_node(str('Slot' + var2str(container.actual_slot - 12) + '/Sprite')).visible = true
	container.move_highlighted_slot(1)
	get_tree().paused = true
