tool
extends StaticBody2D

export(String) var item_id = "Paper"
export(int) var stack = 1

func _picked():
	var inv = get_node("/root/Main").get_inventory()
	inv.add_to_inventory(self.item_id, self.stack, inv.next_empty_slot())
	queue_free()
