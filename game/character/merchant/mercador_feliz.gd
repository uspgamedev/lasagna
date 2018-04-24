extends "res://character/character.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var main = get_node("/root/Main")
	if !main.get_flags().get_flag("ATE_LASAGNA"):
		self.queue_free()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
