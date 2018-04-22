extends Control

var new = true

func _ready():
	var save_file = File.new()
	if save_file.file_exists("user://game.save"):
		new = false
	set_animation()

func _input(event):
	if event.is_action_pressed("ui_up") or event.is_action_pressed("ui_down"):
		new = not new
		set_animation()
	
	if event.is_action_pressed("ui_accept"):
		var save_file = File.new()
		if new and save_file.file_exists("user://game.save"):
			var dir = Directory.new()
			dir.remove("user://game.save")
		get_tree().change_scene("res://play.tscn")


func set_animation():
	var anim = get_node("Buttons/ButtonAnim")
	if new:
		anim.play("new")
	else:
		anim.play("load")