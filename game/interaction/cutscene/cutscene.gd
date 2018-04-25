extends Node

export(String) var other

signal finished

func execute_cutscene():
	get_node("/root/Main").pause_clock()
	var fg = get_node("../../Foreground")
	var player = fg.get_node("Player")
	var player_inp = player.get_node("InputNode")
	player_inp.prevent_input(true)

	get_tree().paused = true
	for action in get_children():
		var actor = fg.get_node(action.actor + "/Interaction")
		if action.actor == "Player":
			actor.say(action.text, other)
		else:
			actor.say(action.text)
		yield(actor, "finished_text")
	get_tree().paused = false
	get_node("/root/Main").unpause_clock()
	emit_signal("finished")
	player_inp.prevent_input(false)