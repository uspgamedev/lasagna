extends "res://interaction/interaction.gd"

func interact(item):
	if not item:
		var inv = get_node("/root/Main").get_inventory()
		if inv.next_empty_slot() != -1 or inv.how_many_of_item("Hair") != 0:
			inv.give_items("Hair", 1)
			var kin_body = get_node("../..")
			kin_body.damage(1)
		else:
			print("Can't execute action: Bag is full")
