extends "res://interaction/character_interaction.gd"

var my_product = "FleeceSeed"

const PRODUCTS = [
	"FleeceSeed",
	"KepalaSeed"
]

signal product_chosen(idx)

func _main():
	return get_node("/root/Main")

func _price(product):
	return _main().get_db().get_item_by_name(product).buy_value

func _sell():
	var popup = _main().get_hud().get_node("Popup")
	popup.clear()
	for product in PRODUCTS:
		var cost
		popup.add_item(" %s [%d $]" % [product, _price(product)])
	get_tree().paused = true
	popup.popup_centered(Vector2(256, len(PRODUCTS)*32))
	popup.connect("popup_hide", self, "_on_cancel")
	popup.connect("id_pressed", self, "_on_product_chosen")
	var idx = yield(self, "product_chosen")
	print(idx)
	get_tree().paused = false
	if idx >= 0:
		var product = PRODUCTS[idx]
		return product
	return null

func _on_product_chosen(idx):
	var popup = _main().get_hud().get_node("Popup")
	if popup.is_connected("popup_hide", self, "_on_cancel"):
		popup.disconnect("popup_hide", self, "_on_cancel")
	emit_signal("product_chosen", idx)

func _on_cancel():
	var popup = _main().get_hud().get_node("Popup")
	if popup.is_connected("id_pressed", self, "_on_product_chosen"):
		popup.disconnect("id_pressed", self, "_on_product_chosen")
	emit_signal("product_chosen", -1)

func interact(item):
	var inv   = _main().get_inventory()
	if item == null:
		yield(_main().execute_cutscene("merchant_buy"), "finished")
		var product = yield(_sell(), "completed")
		if product != null:
			var price = _price(product)
			if inv.money >= price:
				if inv.give_items(product, 1):
					inv.money -= int(price)
				else:
					print("no slots")
			else:
				print("https://www.youtube.com/watch?v=rrYnZ7ZxRe4")
	else:
		inv.consume_n_items(item.name, 1)
		inv.money += int(item.buy_value/2)