extends Node2D

export (String) var destiny

func interact(unused):
	$SFX.play()
	get_node("/root/Main").change_map(destiny)
