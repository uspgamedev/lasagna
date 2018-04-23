extends "res://interaction/interaction.gd"

func interact(item):
	if item and item.name == "Frog":
		var inv = get_node("/root/Main").get_inventory()
		if inv.next_empty_slot() != -1 or inv.how_many_of_item("Frog") == 1 or inv.how_many_of_item("Hair") != 0:
			inv.consume_n_items("Frog", 1)
			inv.give_items("Hair", 1)
			var kin_body = get_node("../..")
			var anim = kin_body.get_node("Animation")
			kin_body.damage(1)
			anim.play("DEATH")
			yield(anim, "animation_finished")
			kin_body.queue_free()
		else:
			print("Can't execute action: Bag is full")
