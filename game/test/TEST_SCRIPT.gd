extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_parent().get_node("Inventory").give_items("Milk", 7)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
