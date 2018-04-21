extends Node

export(String) var other

signal finished

func execute_cutscene():
	var fg = get_node("../../Foreground")
	var player = fg.get_node("Player")
	var player_inp = player.get_node("InputNode")
	
	player_inp.prevent_input(true)
	for action in get_children():
		var actor = fg.get_node(action.actor + "/Interaction")
		if action.actor == "Player":
			actor.say(action.text, other)
		else:
			actor.say(action.text)
		yield(actor, "finished_text")
	player_inp.prevent_input(false)