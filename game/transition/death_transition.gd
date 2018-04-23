extends CanvasLayer

func _ready():
	set_process(false)
	$GrayscaleShader.material.set_shader_param("grayscale", true)
	$Tween.interpolate_property($GrayscaleShader.material, "shader_param/factor", 3, 20, 2,
								Tween.TRANS_QUAD, Tween.EASE_IN, 0)
	$Tween.start()
	get_tree().set_pause(true)

func _on_Tween_tween_completed(object, key):
	set_process(true)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and not $Fade.is_playing():
		$Fade.play("fade")
		yield($Fade, "animation_finished")
		get_tree().set_pause(false)
		get_tree().change_scene("res://title/title.tscn")
