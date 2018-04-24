extends Node

onready var count = 0
onready var ini = 10
onready var fin = 30
onready var sfx_count_value = rand_range(ini, fin)

func _ready():
	var nana = $"Nanas-text"
	nana.set_visible_characters(0)
	$Timer.start()

func start_text():
	var nana = $"Nanas-text"
	var tween = $Tween
	var dur = 20
	tween.interpolate_property(nana, "visible_characters", 0, nana.get_bbcode().length(), dur, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	

func _on_Tween_tween_step( object, key, elapsed, value ):
	count = count + 1
	if count >= sfx_count_value:
		sfx_count_value = rand_range(ini, fin)
		count = 0
		var ran = randf()
		if ran < .1:
			$SFX.set_bus("Master-Pitchlow")
			$SFX2.set_bus("Master-Pitchlow")
		elif ran < .9:
			$SFX.set_bus("Master-Pitch")
			$SFX2.set_bus("Master-Pitch")
		else:
			$SFX.set_bus("Master-Pitchhigh")
			$SFX2.set_bus("Master-Pitchhigh")
		if not $SFX.is_playing():
			$SFX.play()
		else:
			$SFX2.play()


func _on_Tween_tween_completed( object, key ):
	$"Begin-Game".start()

#ignore the name plz
func _begin_game():
	var tween = $fadeout
	tween.interpolate_property($block, "color", Color(0,0,0,0), Color(0,0,0,1), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	

#Actual begin game
func _on_fadeout_tween_completed( object, key ):
	get_tree().change_scene("res://play.tscn")
