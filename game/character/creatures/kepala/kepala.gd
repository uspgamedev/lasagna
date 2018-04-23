extends "res://character/character.gd"

var attacking = false
var attacked = false

func _process(delta):
	if attacking and not attacked:
		for node in $Area2D.get_overlapping_bodies():
			print("LOOPPED")
			if node.name == "Player":
				print("ATTACKED")
				node.damage(10)
				attacked = true