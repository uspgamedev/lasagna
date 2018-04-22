extends Node

func _input(event):
	var hud = get_node("/root/Main").get_hud()
	var container = hud.get_node("InventoryContainer")
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = false
		container.hide()
		if container.actual_slot >= 9:
			hud.get_node(str('Status/Bottom/Inventory/Slot' + var2str(container.actual_slot - 8) + '/Sprite')).visible = false

func interact():
	var hud = get_node("/root/Main").get_hud()
	var container = hud.get_node("InventoryContainer")
	container.render_inventory()
	container.show()
	if container.actual_slot >= 9:
		hud.get_node(str('Status/Bottom/Inventory/Slot' + var2str(container.actual_slot - 8) + '/Sprite')).visible = true
	container.move_highlighted_slot(1)
	get_tree().paused = true

	# Abrir menu de interacao
	
	# com esse menu, ser possivel coletar itens do bau (e move-los pro inventario), colocar
	# itens do inventario no bau, e consultar o seu dinheiro(?)