extends Node

onready var scale = 1
onready var base_size = OS.window_size

func _input(event):
	if event.is_action_pressed("toggle_size"):
		self.scale = 3 - self.scale
		OS.window_size = self.scale * self.base_size
