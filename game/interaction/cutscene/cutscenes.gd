extends Node

var cutscene_queue = []
var current_cutscene = null

func execute_cutscene(name):
	if has_node(name):
		var cutscene = get_node(name)
		cutscene_queue.append(cutscene)
		return cutscene

func _process(delta):
	if current_cutscene == null and not cutscene_queue.empty():
		var cutscene = cutscene_queue.pop_front()
		current_cutscene = cutscene
		cutscene.execute_cutscene()
		yield(cutscene, "finished")
		if cutscene == current_cutscene:
			current_cutscene = null
