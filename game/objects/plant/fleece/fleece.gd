extends "res://objects/plant/plant.gd"

onready var Fleece = preload("res://character/creatures/fleece/fleece.tscn")

func _ready():
	get_node("/root/Main").connect("night_strikes", self, "spawn_creature")

# Executed when night night strikes
func spawn_creature():
	if growth_level == growth_steps:
		var new_fleece = Fleece.instance()
		new_fleece.set_position(get_position())
		get_parent().add_child(new_fleece)
		queue_free()
