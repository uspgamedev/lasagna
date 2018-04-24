extends "res://interaction/interaction.gd"

func interact(item):
	var inv = get_node("/root/Main").get_inventory()
	var kin_body = get_node("../..")
	var ai = kin_body.get_node("AI")
	if not ai.pacific and item and item.name == "Frog":
		if inv.next_empty_slot() != -1 or inv.how_many_of_item("Frog") == 1 or inv.how_many_of_item("Hair") != 0:
			inv.consume_n_items("Frog", 1)
			ai.pacific = true
		else:
			print("Cannot execute action: Bag is full")
	elif ai.pacific:
		if inv.next_empty_slot() != -1 or inv.how_many_of_item("Mushroom") != 0:
			inv.give_items("Mushroom", 1)
			kin_body.damage(1)
		else:
			print("Cannot execute action: Bag is full")
