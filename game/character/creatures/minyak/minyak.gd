extends "res://character/character.gd"

var attacking = false
var can_attack = true

func _process(delta):
	if can_attack:
		for node in $Area2D.get_overlapping_bodies():
			if node.name == "Player":
				$AI.start_attack()
	if attacking and $OrientedSprite.get_frame() == 2:
		$SFX/Acid.play()
		for node in $Area2D.get_overlapping_bodies():
			if node.name == "Player":
				node.damage(5, self)