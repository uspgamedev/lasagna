extends "res://character/character.gd"

func _ready():
	self.hp = get_node("/root/Main").get_flags().get_flag('hp')

func _process(delta):
	get_node("/root/Main").get_flags().set_flag('hp', self.hp)
	push($InputNode.current_direction())
	$Notifier.visible = has_interactive_node($AreaInteraction.get_overlapping_bodies())

func interact(item):
	var area = $AreaInteraction
	
	for body in area.get_overlapping_bodies():
		if body != self:
			for child in body.get_children():
				if child.get_name() == "Interaction":
					var ok = child.interact(item)
					var name = body.get_name()
					if name == "Object" or name == "Notes":
						$SFX/PickUp.play()
					elif (typeof(ok) != TYPE_BOOL or ok != false) and (name != "Door"):
						$SFX/Confirm.play()
					return
	
	for field in area.get_overlapping_areas():
		if field != area and field.has_method("_interact"):
			var g_pos = area.get_global_position()
			var floor_tilemap = get_parent().get_parent().get_node("Background")
			var ft_pos = floor_tilemap.world_to_map(g_pos)
			field._interact(self, ft_pos, item)
			return

	if item != null:
		var inv = get_node("/root/Main").get_inventory()
		var index = get_node("/root/Main").get_hud().get_node("Status").get_node("Bottom").get_node("Inventory").focused
		var stash_number = inv.get_item_at(index)[1]
		
		var pickable_item_scene = load("res://objects/props/pickable_item.tscn")
		var pickable_item = pickable_item_scene.instance()
		pickable_item.item_id = item.name
		pickable_item.stack = stash_number

		var tilemap = get_parent().get_parent().get_node("Foreground")
		pickable_item.position = area.get_global_position()
		tilemap.add_child(pickable_item)
		
		inv.consume_n_items(item.name, stash_number)

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
	get_node("/root/Main/Map/BGM").fade_out()
	$Animation.play("DEATH")
	$SFX/Death.play()
	yield($Animation, "animation_finished")
	var death_transition = load("res://transition/death_transition.tscn").instance()
	add_child(death_transition)
