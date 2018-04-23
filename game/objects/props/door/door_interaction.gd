extends Node2D

export (String) var destiny

func interact(unused):
	get_node("/root/Main").change_map(destiny)
