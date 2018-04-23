extends Node

export(String) var other

signal finished

func execute_cutscene():
	get_node("/root/Main").pause_clock()
	var fg = get_node("../../Foreground")
	var player = fg.get_node("Player")
	var player_inp = player.get_node("InputNode")

	get_tree().paused = true
	player_inp.prevent_input(true)
	fg.get_node(other).pause_mode = PAUSE_MODE_PROCESS
	fg.get_node("Player").pause_mode = PAUSE_MODE_PROCESS
	for action in get_children():
		var actor = fg.get_node(action.actor + "/Interaction")
		if action.actor == "Player":
			actor.say(action.text, other)
		else:
			actor.say(action.text)
		yield(actor, "finished_text")
	get_tree().paused = false
	fg.get_node(other).pause_mode = PAUSE_MODE_INHERIT
	fg.get_node("Player").pause_mode = PAUSE_MODE_INHERIT
	player_inp.prevent_input(false)
	get_node("/root/Main").unpause_clock()
	emit_signal("finished")