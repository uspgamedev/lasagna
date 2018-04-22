extends "res://interaction/interaction.gd"

func interact(item):
	var par = get_parent()
	if par.growth_level == par.growth_steps:
		get_node("../Sprite/AnimationPlayer").play("harvest")
		#HARVEST CODE
		#...
	else:
		print("tried to harvest non ripe tree")