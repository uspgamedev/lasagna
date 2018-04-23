extends "res://character/character.gd"

var attacking = false
var attacked = false
var aggred = true

func _process(delta):
	if attacking and not attacked:
		for node in $Area2D.get_overlapping_bodies():
			if node.name == "Player":
				node.damage(10)
				attacked = true