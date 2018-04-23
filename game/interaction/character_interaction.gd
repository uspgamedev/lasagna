extends "res://interaction/interaction.gd"

signal finished_text

onready var Dialogue = preload("res://interaction/dialogue/dialogue.tscn")

func say(text, reference="Player"):
	var dial_box = Dialogue.instance()
	var dialogues = get_node("../Dialogues")
	var par = get_parent()
	var ref = get_node("../../" + reference)
	var ref_pos = ref.get_position()
	var this_pos = par.get_position()
	var cam_pos = par.get_node("Camera2D").get_camera_screen_center()
	var label_size = Vector2(300, 90)

	var pos = Vector2()
	if ref_pos.y < cam_pos.y:
		pos.y = 32
	else:
		pos.y = -64 - label_size.y
	if ref_pos.x < cam_pos.x:
		pos.x = 32
	else:
		pos.x = -32 - label_size.x
	dialogues.set_position(pos)

	get_node("../Dialogues").add_child(dial_box)
	dial_box.say(text)
	yield(dial_box, "finished")
	dial_box.queue_free()
	emit_signal("finished_text")

