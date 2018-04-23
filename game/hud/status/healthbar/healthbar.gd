extends ProgressBar

func _ready():
	get_stylebox("fg", "").modulate_color = Color(0x88f684ff)

func change(target):
	_set_amount(target)

func _set_amount(amount):
	self.value = amount
	var color = Color(0xec5b4cff).linear_interpolate(Color(0x88f684ff), amount/100.0)
	get_stylebox("fg", "").modulate_color = color

func _process(delta):
	if has_node("/root/Main"):
		var player = get_node("/root/Main").get_player()
		if player != null:
			change(100*player.hp/player.max_health)
	get_stylebox("fg","").region_rect.position.x = int((1 - self.value/100.0)*128)
	get_stylebox("fg","").region_rect.size.x = int(128*self.value/100.0)
