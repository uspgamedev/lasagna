extends "res://interaction/interaction.gd"

var my_product = "FleeceSeed"

func interact(item):
	var main  = get_node("/root/Main")
	var inv   = main.get_inventory()
	var price = main.get_db().get_item_by_name(my_product).buy_value
	if item == null:
		yield(main.execute_cutscene("merchant_buy"), "finished")
		if inv.money >=  price:
			if inv.give_items(my_product, 1):
				inv.money -= int(price)
			else:
				print("no slots")
		else:
			print("https://www.youtube.com/watch?v=rrYnZ7ZxRe4")
	else:
		inv.consume_n_items(item.name, 1)
		inv.money += int(item.buy_value/2)