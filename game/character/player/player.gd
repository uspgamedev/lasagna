extends "res://character/character.gd"

func _process(delta):
	push($InputNode.current_direction())