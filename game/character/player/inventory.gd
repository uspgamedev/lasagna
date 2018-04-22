extends Node

const INVENTORY_SIZE = 6
const MAX_STACK_SIZE = 256

export(int) var money = 10000

var stash = {}
var inventory = []

func _ready():
	init_inventory()
	add_item_to_stash("BLA", 4)
	add_item_to_stash("TESTE", 3)
	add_item_to_stash("JESUS", 1)
	add_item_to_stash("EU", 9)

func get_item_at(index):
	return inventory[index].duplicate()

func how_many_of_item(item_name):
	var count = 0
	for pair in inventory:
		if pair[0] == item_name:
			count += pair[1]
	return count

func consume_n_items(item_name, amount):
	if how_many_of_item(item_name) >= amount:
		var remainder = amount
		for pair in inventory:
			if remainder == 0:
				break
			if pair[0] == item_name:
				if pair[1] > remainder:
					pair[1] -= remainder
					remainder = 0
				else:
					remainder -= pair[1]
					pair[1] = 0
					pair[0] = ""

func give_items(item_name, amount):
	for pair in inventory:
		if pair[0] == item_name:
			pair[1]+= amount
			return true
	for pair in inventory:
		if pair[0] == "":
			pair[0] = item_name
			pair[1] = amount
			return true
	return false

func add_item_to_stash(item_name, number_of_items):
	if stash.has(item_name):
		if (stash[item_name] + number_of_items) > MAX_STACK_SIZE:
			stash[item_name] = MAX_STACK_SIZE
		else:
			stash[item_name] = stash[item_name] + number_of_items
	else:
		stash[item_name] = number_of_items
		
func remove_item_from_stash(item_name, number_of_items):
	var error = false
	if stash.has(item_name):
		if number_of_items > stash[item_name]:
			return error
		elif number_of_items == stash[item_name]:
			var removed_item = [item_name, stash[item_name]]
			stash.erase(item_name)
			return removed_item
		else: 
			var removed_item = [item_name, number_of_items]
			stash[item_name] = stash[item_name] - number_of_items
			return removed_item
	else:
		return error
		
func init_inventory():
	for i in range(INVENTORY_SIZE):
		inventory.append(["", 0])

func next_empty_slot():
	for i in range(INVENTORY_SIZE):
		if self.inventory[i][0] == "":
			return i

func add_to_inventory(item_name, number_of_items, inventory_position):
	inventory[inventory_position] = [item_name, number_of_items]
	
func remove_from_inventory(inventory_position):
	var result = inventory[inventory_position]
	inventory[inventory_position] = ["", 0]
	return result
	
func get_money():
	return money

func get_stash():
	return stash
