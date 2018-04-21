extends "res://character/character.gd"


func _process(delta):
	push($AI.get_direction())
