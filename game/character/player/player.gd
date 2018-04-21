extends "res://character/character.gd"

var hp = 4

func _process(delta):
	push($InputNode.current_direction())

func _on_InputNode_interact():
	var area = get_node('AreaInteraction')
	for body in area.get_overlapping_bodies():
		for child in body.get_children():
			if child.get_name() == 'Interaction':
				child.interact()
				return

func damage(dmg_points):
	hp -= dmg_points
	if hp <= 0:
		death()

func death():
	get_tree().change_scene('main.tscn')
