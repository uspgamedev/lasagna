extends PanelContainer

onready var inventory = get_node('/root/Main/Inventory')
onready var label = get_node("Label")

func _process(delta):
	label.text = var2str(inventory.money)
	inventory.money += 1
