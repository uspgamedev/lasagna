extends Node

var inventory_size = 6
var max_stack_size = 256

export(int) var money

var stash = {}
var inventory = []

func _ready():
    init_inventory()
    pass

func add_item_to_stash(item_name, number_of_items):
    if stash.has(item_name):
        if (stash[item_name] + number_of_items) > max_stack_size:
            stash[item_name] = max_stack_size
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
    for i in range(inventory_size):
        inventory.append(["", 0])
        
func add_to_inventory(item_name, number_of_items, inventory_position):
    inventory[inventory_position] = [item_name, number_of_items]
    
func remove_from_inventory(inventory_position):
    var result = inventory[inventory_position]
    inventory[inventory_position] = ["", 0]
    return result
    
func get_money():
    return money

