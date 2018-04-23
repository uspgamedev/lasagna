extends "res://interaction/character_interaction.gd"

var lock = false

const PRODUCTS = [
	"FleeceSeed",
	"KepalaSeed"
]

func _ready():
	var main = get_node("/root/Main")
	var HAD_FINAL_DIALOG = main.get_flags().get_flag("HAD_FINAL_DIALOG")
	if HAD_FINAL_DIALOG:
		PRODUCTS = ["FleeceSeed", "KepalaSeed", "Venom"]

func _main():
	return get_node("/root/Main")

func _price(product):
	return _main().get_db().get_item_by_name(product).buy_value

func _cutscene(name):
	return _main().execute_cutscene(name)

func _popup():
	return _main().get_hud().get_node("Popup")

func _sell():
	var popup = _popup()
	popup.clear()
	var options = []
	for product in PRODUCTS:
		options.append("%s [%d $]" % [product, _price(product)])
	get_tree().paused = true
	popup.request_option(options, 256)
	var idx = yield(popup, "option_chosen")
	if idx >= 0:
		var product = PRODUCTS[idx]
		return product
	return null

func interact(item):
	if lock:
		return false
	lock = true
	var main = get_node("/root/Main")
	var YAKI = main.get_flags().get_flag("CRAFTED_YAKISOBATH")
	var BLOB = main.get_flags().get_flag("CRAFTED_BLOBSTEW")
	var MET  = main.get_flags().get_flag("MET_STRANGER")
	var HAD_FINAL_DIALOG = main.get_flags().get_flag("HAD_FINAL_DIALOG")
	if !MET:
		main.get_flags().set_flag("MET_STRANGER", true)
		yield(_cutscene("merchant_introduce"), "finished")
	elif YAKI and BLOB and !HAD_FINAL_DIALOG:
		main.get_flags().set_flag("HAD_FINAL_DIALOG", true)
		yield(_cutscene("merchant_final_dialogue"), "finished")
		PRODUCTS.append("Venom")
		
	var inv = _main().get_inventory()
	if item == null:
		yield(_cutscene("merchant_greet"), "finished")
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
		yield(_cutscene("merchant_sell"), "finished")
		var popup = _popup()
		popup.request_option(["Sell for %d" % _price(item.name), "No, thanks"])
		var option = yield(popup, "option_chosen")
		if option == 0:
			inv.consume_n_items(item.name, 1)
			inv.money += int(item.buy_value/2)
	lock = false