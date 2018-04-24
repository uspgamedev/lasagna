extends TextureRect



func _ready():
	var tween = $Tween
	var dur = 2
	tween.interpolate_property(self, "modulate", Color(1,1,1,0), Color(1,1,1,1), dur, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
