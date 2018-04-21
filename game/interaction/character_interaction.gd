extends "res://interaction/interaction.gd"

signal finished_text

onready var Dialogue = preload("res://interaction/dialogue/dialogue.tscn")

func say(text_vec):
	var dial_box = Dialogue.instance()
	var dialogues = get_node("../Dialogues")
	var par = get_parent()
	var player = get_node("../../Player")
	var player_pos = player.get_position()
	var this_pos = par.get_position()
	var label_size = Vector2(300, 90)

	var pos = Vector2()
	if player_pos.y < this_pos.y:
		pos += Vector2(-label_size.x/2, 50)
	else:
		pos -= Vector2(label_size.x/2, label_size.y + 20)
	dialogues.set_position(pos)

	get_node("../Dialogues").add_child(dial_box)
	dial_box.display_text(text_vec)
	yield(dial_box, "finished")
	dial_box.queue_free()
	emit_signal("finished_text")

