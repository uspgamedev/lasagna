extends Control

enum { OPTION_NEW, OPTION_LOAD, OPTION_QUIT, OPTION_COUNT }
const ANIMATION_NAMES = ["new", "load", "quit"]

onready var buttons = get_node("Buttons")

var selection = 0

func _ready():
	set_process_input(false)
	enter()
	yield($Timer, "timeout")
	start()

func enter():
	$logo.position = Vector2(320, -480)
	$Tween.interpolate_property($logo, "position", Vector2(320, -480), Vector2(320, 224), 1.0,
			Tween.TRANS_BACK, Tween.EASE_OUT, 0.25)
	var i = 0
	var delay = 0.1
	for item in buttons.get_children():
		var y = i * 32
		item.rect_position.x = -640
		$Tween.interpolate_property(item, "rect_position", Vector2(-640, y), Vector2(0, y), 0.5,
				Tween.TRANS_BACK, Tween.EASE_OUT, 1.25 + i * delay)
		i = i + 1
	$Timer.set_wait_time(1.75 + i * delay + 0.5)
	$Tween.start()
	$Timer.start()

func leave():
	$AnimationPlayer.stop()
	$Tween.interpolate_property($logo, "position", Vector2(320, 224), Vector2(320, -480), 0.75,
			Tween.TRANS_BACK, Tween.EASE_IN, 0.25)
	var i = 0
	var delay = 0.1
	for item in buttons.get_children():
		var y = i * 32
		$Tween.interpolate_property(item, "rect_position", Vector2(0, y), Vector2(-640, y), 0.5,
				Tween.TRANS_BACK, Tween.EASE_IN, 0.25 + i * delay)
		i = i + 1
	$Tween.interpolate_property($Fader, "color", Color(0x00000000), Color(0x000000ff), 1.0,
			Tween.TRANS_LINEAR, Tween.EASE_OUT, 0.1)
	$Timer.set_wait_time(2)
	$Tween.start()
	$Timer.start()
	

func start():
	var save_file = File.new()
	if save_file.file_exists("user://game.save"):
		set_selection(OPTION_NEW)
	else:
		set_selection(OPTION_LOAD)
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("ui_up"):
		set_selection((selection - 1  + OPTION_COUNT) % OPTION_COUNT)
	elif event.is_action_pressed("ui_down"):
		set_selection((selection + 1) % OPTION_COUNT)
	elif event.is_action_pressed("ui_accept"):
		$SFX_confirm.play()
		var new
		match selection:
			OPTION_NEW:
				new = true
			OPTION_LOAD:
				new = false
			OPTION_QUIT:
				get_tree().quit()
				return
		var save_file = File.new()
		if new and save_file.file_exists("user://game.save"):
			var dir = Directory.new()
			dir.remove("user://game.save")
		leave()
		yield($Timer, "timeout")
		get_tree().change_scene("res://play.tscn")

func set_selection(idx):
	selection = idx
	print(selection)
	var i = 0
	$AnimationPlayer.play(ANIMATION_NAMES[selection])
	for button in buttons.get_children():
		if i == selection:
			focus_item(button)
		else:
			unfocus_item(button)
		i = i + 1

func focus_item(item):
	item.modulate = Color(0xfe776dff)

func unfocus_item(item):
	item.modulate = Color(0xffffffff)
