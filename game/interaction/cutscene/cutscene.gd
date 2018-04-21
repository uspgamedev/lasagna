extends Node

signal finished

func execute_cutscene(cutscene):
	var fg = get_node("../Foreground")
	var player_inp = fg.get_node("Player/InputNode")
	player_inp.prevent_input(true)
	for action in cutscene:
		var actor = fg.get_node(action["actor"] + "/Interaction")
		actor.say(action["text"])
		yield(actor, "finished_text")
	player_inp.prevent_input(false)