extends "res://character/character.gd"

func _process(delta):
	get_node("/root/Main").get_flags().set_flag('hp', self.hp)
	push($InputNode.current_direction())
	$Notifier.visible = has_interactive_node($AreaInteraction.get_overlapping_bodies())

func interact(item):
	var area = get_node('AreaInteraction')
	
	for body in area.get_overlapping_bodies():
		if body != self:
			for child in body.get_children():
				if child.get_name() == 'Interaction':
					$SFX/Confirm.play()
					child.interact(item)
					return
	
	for field in area.get_overlapping_areas():
		if field != area and field.has_method("_interact"):
			var g_pos = area.get_global_position()
			var floor_tilemap = get_parent().get_parent().get_node("Background")
			var ft_pos = floor_tilemap.world_to_map(g_pos)
			field._interact(self, ft_pos, item)
			return

func _on_InputNode_interact():
	interact(null)

func has_interactive_node(vec):
	for node in vec:
		if node.has_node("Interaction") and not node.is_in_group("player"):
			return true
	return false

func death():
	if dead:
		return
	dead = true
	$Animation.play("DEATH")
	yield($Animation, "animation_finished")
	get_tree().change_scene('play.tscn')
