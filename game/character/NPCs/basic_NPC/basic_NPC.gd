extends "res://interaction/interaction.gd"

onready var Dialogue = preload("res://interaction/dialogue/dialogue.tscn")

func interact():
	var dial_box = Dialogue.instance()
	
	var label_size = dial_box.get_node("Text").get_size()
	var label_rad = label_size.length()/2
	var screen_size = OS.window_size
	var screen_center = get_node("../../Player/Camera2D").get_camera_position() + screen_size/2
	print(screen_center)
	var par = get_node("..")
	var obj_size = par.get_node("OrientedSprite").get_texture().get_size()
	var obj_pos = par.get_position()
	var rad = obj_size.length()/2
	var new_pos = obj_pos + obj_size/2
	var alpha = (rad+label_rad)/new_pos.distance_to(screen_center)
	dial_box.set_position(alpha*screen_center + (1-alpha)*new_pos - label_size/2)
	print(dial_box.get_position())
	
	get_parent().add_child(dial_box)
	dial_box.display_text(["the quick brown fox jumped over the lazy dog",
						   "second phrase that is suposely too big to fit here"])
	yield(dial_box, "finished")
	dial_box.queue_free()