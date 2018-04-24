extends "res://character/creatures/hostile_creature/hostile_creature.gd"

func _ready():
	var Flags = get_node("/root/Main").get_flags()
	match Flags.get_moon():
		Flags.MOON.FULL:
			if randf() < .25:
				queue_free()
		Flags.MOON.BLOOD:
			pass
		_:
			queue_free()

func _exit_tree():
	print("No werewolves tonight...")
