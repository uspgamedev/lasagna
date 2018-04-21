extends "res://interaction/interaction.gd"

export (int) var growth_steps
export (int) var anim_length

var growth_level

func _process(delta):
	anim_player = get_node("../Sprite/AnimationPlayer")
	if !anim_player.is_playing():
		anim_player.play("tree-animation-"+growth_level)

func grow():
	if growth_level < growth_steps:
		growth_level += 1

func interact():
	if growth_level == growth_steps:
		growth_level-= 1
		get_node("../Sprite/AnimationPlayer").play("harvest")
		#HARVEST CODE
		#...
	else:
		print("tried to harvest non ripe tree")