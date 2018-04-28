extends "res://interaction/interaction.gd"

func interact(item):
	if not item:
		var inv = get_node("/root/Main").get_inventory()
		if get_parent().is_alive() and get_parent().get_node("DmgCooldown").is_stopped() and get_node("../AI").found_ham and \
			(inv.next_empty_slot() != -1 or inv.how_many_of_item("FleeceRoot") != 0):
			inv.give_items("FleeceRoot", 1)
			get_parent().damage(1)