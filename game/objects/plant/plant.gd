extends StaticBody2D

export (int) var growth_steps
export (int) var anim_length

var birthday
var growth_level

func _ready():
	birthday = get_node("/root/Main").get_day()
	growth_level = 0
	get_node("/root/Main").connect("ended_night", self, "grow")

func grow():
	if growth_level < growth_steps:
		growth_level += 1
		$Sprite/AnimationPlayer.play("animation-" + growth_level)
