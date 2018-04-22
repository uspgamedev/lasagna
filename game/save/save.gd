extends Node

const SAVE_PATH = "user://game.save"

onready var inventory = get_node("../Inventory")

func _ready():
	pass

func save_game():
	var save_file = File.new()
	save_file.open(SAVE_PATH, File.WRITE)
	
	var data = serialize()
	
	for d in data:
		save_file.store_line(to_json(d))
	
	save_file.close()

func load_game():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_PATH):
		return # Nothing to load
	
	save_file.open(SAVE_PATH, File.READ)
	
	var inventory_data = parse_json(save_file.get_line())
	var inventory = get_node("../Inventory")
	
	inventory.money = inventory_data["money"]
	inventory.stash = inventory_data["stash"]
	inventory.inventory = inventory_data["inventory"]

func serialize():
	var data = []
	
	# Inventory
	var inventory_data = {}
	inventory_data["name"] = "inventory"
	inventory_data["money"] = inventory.money
	inventory_data["stash"] = inventory.stash
	inventory_data["inventory"] = inventory.inventory
	
	# TODO:
	# 	Flags	
	# 	Número de dias
	# 	Matriz de plantas
	
	data.push_front(inventory_data)
	
	return data
