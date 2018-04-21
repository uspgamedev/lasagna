extends "res://interaction/character_interaction.gd"

func interact():
	get_node("../../../Cutscene").execute_cutscene([
		{"actor": "Basic_NPC", "text": ["hey you"]},
		{"actor": "Player", "text": ["you're a nice guy!"]},
		{"actor": "Basic_NPC", "text": ["no you"]}
	])
	#say(["the quick brown fox jumped over the lazy dog",
	#	 "second phrase that is suposely too big to fit here"])
