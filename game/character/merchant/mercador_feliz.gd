extends "res://character/character.gd"

func _ready():
	var main = get_node("/root/Main")
	if !main.get_flags().get_flag("ATE_LASAGNA"):
		self.queue_free()
	pass
