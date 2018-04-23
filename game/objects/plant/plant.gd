extends StaticBody2D

export (int) var growth_steps

var address = [-1,-1,-1]

var growth_level = 1

func _ready():
	get_node("/root/Main").connect("ended_night", self, "grow")
	$Sprite/AnimationPlayer.play("size-0")

func grow():
	if growth_level < growth_steps:
		growth_level += 1
		$Sprite/AnimationPlayer.play("size-" + str(growth_level))
