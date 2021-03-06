extends Node

const SAVE_PATH = "user://game.save"

var inventory
var flags
var cropmatrix

func _play():
	self.inventory = get_node("../Inventory")
	self.flags = get_parent().get_flags()
	self.cropmatrix = get_parent().get_cropmatrix()
	load_game()
	self.cropmatrix.grow_all()

func save_game():
	var save_file = File.new()
	save_file.open(SAVE_PATH, File.WRITE)
	
	var data = serialize()
	
	save_file.store_string(to_json(data))
	
	save_file.close()

func load_game():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_PATH):
		return false
	
	save_file.open(SAVE_PATH, File.READ)
	
	var data = parse_json(save_file.get_as_text())
	
	self.flags.set_day(int(data["day"]))
	self.flags.set_moon(int(data["moon"]))
	self.flags.set_blood_prob(int(data["blood_prob"]))
	self.flags.flags = data["flags"]
	get_parent().get_player().hp = self.flags.get_flag('hp')
	
	self.cropmatrix.crops = data["cropmatrix"]
	
	inventory.money = int(data["money"])
	inventory.stash = data["stash"]
	inventory.inventory = data["inventory"]
	
	return true

func serialize():
	# Inventory
	var data = {}
	data["day"] = flags.get_day()
	data["moon"] = flags.get_moon()
	data["blood_prob"] = flags.get_blood_prob()
	data["flags"] = flags.flags
	data["cropmatrix"] = cropmatrix.crops
	data["money"] = inventory.money
	data["stash"] = inventory.stash.duplicate()
	data["inventory"] = inventory.inventory.duplicate()
	
	
	return data
