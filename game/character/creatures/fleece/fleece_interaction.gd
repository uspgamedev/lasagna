extends "res://interaction/interaction.gd"

func interact(item):
	if (not get_parent().dead) and (not item) and get_node("../AI").found_ham:
		get_node("/root/Main").get_inventory().give_items("FleeceRoot", 1)
		get_parent().damage(1)