extends Node

export (String) var type

var current_recipe = 0
var recipies = []
var selected = false

func _input(event):
	if selected:
		if event.is_action_pressed("ui_right"):
			#ANIM BOOK FLIP
			current_recipe = (current_recipe+1)%recipies.size()
		elif event.is_action_pressed("ui_left" ):
			#ANIM BOOK FLIP
			if current_recipe == 0:
				current_recipe = recipies.size()-1
			else:
				current_recipe -= 1
		elif event.is_action_pressed("ui_cancel"):
			bye()
			return
		$CanvasLayer/Recipe.recipe_name = recipies[current_recipe].name
		$CanvasLayer/Recipe.update_recipe()

func bye():
	selected = false
	$Tween.interpolate_property($CanvasLayer/necrobook, "position",
			Vector2(0, 0), Vector2(0, 480), .4,
			Tween.TRANS_BACK, Tween.EASE_IN, 0)
	$Tween.start()
	yield($Tween, "tween_completed")
	$CanvasLayer/Recipe.visible = false
	get_tree().paused = false

func hi():
	get_tree().paused = true
	$Tween.interpolate_property($CanvasLayer/necrobook, "position",
			Vector2(0, 480), Vector2(0, 0), .4,
			Tween.TRANS_BACK, Tween.EASE_OUT, 0)
	$Tween.start()
	yield($Tween, "tween_completed")
	selected = true
	$CanvasLayer/Recipe.visible = true

func _ready():
	selected = false
	$CanvasLayer/Recipe.visible = false
	$CanvasLayer/necrobook.position = Vector2(0, 480)
	var Main = get_node("/root/Main")
	var DB = Main.get_db()
	$Sprite.texture = DB.get_station_by_name(type).texture
	for recipe_data in DB.get_node("Recipies").get_children():
		if recipe_data.craft_on == type:
			recipies.append( recipe_data )
			print(recipe_data.name)
	$CanvasLayer/Recipe.recipe_name = recipies[0].name

func interact(unused):
	hi()
