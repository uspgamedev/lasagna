extends PanelContainer

onready var inventory = get_node('/root/Main').get_inventory()
onready var label = get_node("Label")

func _process(delta):
	label.text = var2str(int(inventory.money))
