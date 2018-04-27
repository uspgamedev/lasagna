extends Node2D

func _ready():
	pass

func consume(item):
	var main = get_node("/root/Main")
	var inv = main.get_inventory()
	inv.consume_n_items(item.name, 1)
	match item.name:
		"HealPotion":
			var player = main.get_player()
			var heal = 50 # TODO: check value
			if player.hp + heal > player.max_health:
				player.hp = player.max_health
			else:
				player.hp += heal
		"BadPotion":
			var player = main.get_player()
			var heal = -50 # TODO: check value
			if player.hp + heal < 0:
				player.hp = 0
			else:
				player.hp += heal
		"LaaZahna":
			main.get_flags().set_flag("ATE_LASAGNA", true)
			main.execute_cutscene("eating_lasagna")
		"WormRoll":
			yield(main.execute_cutscene("eating_wormroll"), "finished")
			get_tree().change_scene("res://credits/credits.tscn")
