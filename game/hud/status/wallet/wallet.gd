extends PanelContainer

var money = 10000
onready var label = get_node("Label")

func _process(delta):
	label.text = var2str(money)
	money += 1