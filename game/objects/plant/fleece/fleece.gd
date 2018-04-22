extends "res://objects/plant/plant.gd"

# onready var Fleece = preload("res://character/creatures/fleece.tscn")

# Executed when night night strikes
func spawn_creature():
	# var new_fleece = Fleece.instance()
	# new_fleece.set_position(get_position())
	# get_parent().add_child(new_fleece)
	queue_free()
