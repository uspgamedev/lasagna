extends "res://character/character.gd"

func _process(delta):
	push($InputNode.current_direction())

func _on_InputNode_interact():
	area = get_node('AreaInteraction')
	for body in area.get_overlapping_bodies():
		for child in body.get_children():
			if child.get_name() == 'Interaction':
				child.interact()
				return
