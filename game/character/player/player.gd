extends "res://character/character.gd"

func _process(delta):
	push($InputNode.current_direction())
	$Notifier.visible = has_interactive_node($AreaInteraction.get_overlapping_bodies())

func _on_InputNode_interact():
	var area = get_node('AreaInteraction')
	
	for body in area.get_overlapping_bodies():
		if body != self:
			for child in body.get_children():
				if child.get_name() == 'Interaction':
					child.interact()
					return
	
	var g_pos = area.get_global_position()
	var floor_tilemap = get_parent().get_parent().get_node("Background")
	var ft_pos = floor_tilemap.world_to_map(g_pos)
	var cell = floor_tilemap.get_cellv(ft_pos)
	
	if cell == 1:
		print("É HORA DA COLHEITA")

func has_interactive_node(vec):
	for node in vec:
		if node.has_node("Interaction") and not node.is_in_group("player"):
			return true
	return false

func death():
	get_tree().change_scene('main.tscn')
