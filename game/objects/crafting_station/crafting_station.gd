extends Node

export (String) var type

var current_recipe = 0
var recipies = []

func _input():
	if   event.is_action_pressed("ui_right"):
		#ANIM BOOK FLIP
		current_recipe = (current_recipe+1)%recipies.size()
	elif event.is_action_pressed("ui_left" ):
		#ANIM BOOK FLIP
		if current_recipe == 0:
			current_recipe = recipies.size()-1
		else:
			current_recipe -= 1
	elif event.is_action_pressed("ui_cancel" ):
		bye()
		return
	get_tree().paused = true #Is this needed?
	$Recipe.update_recipe()
	get_tree().paused = false#Is this needed?

func bye():
	$Recipe.visible = false
	get_tree().paused = false

func hi():
	$Recipe.visible = true	
	get_tree().paused = true

func _ready():
	var Main = get_node("/root/Main")
	var DB = Main.get_db()
	$Sprite.texture = DB.get_station_by_name(type).texture
	for recipe_data in $DB/Recipes:
		if recipe_data.craft_on == type:
			recipes.append( recipe_data )

func interact(unused):
	hi()
