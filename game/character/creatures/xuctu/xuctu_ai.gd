extends Node

onready var Tentacle = preload("res://character/creatures/xuctu/tentacle.tscn")

func _on_Timer_timeout():
	for node in get_node("../AttackArea").get_overlapping_bodies():
		if node.name == "Player":
			var new_tentacle = Tentacle.instance()
			new_tentacle.position = node.position
			get_node("../..").add_child(new_tentacle)
