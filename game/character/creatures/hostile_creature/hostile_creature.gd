extends "res://character/creatures/creature.gd"

export (int) var dmg = 1

func _process(delta):
	var bodies = $AgroBox.get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			body.damage(dmg, self)
