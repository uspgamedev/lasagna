extends PanelContainer

func _process(delta):
	if get_node("/root/Main").get_flags().get_flag("GOT_NECRONOMICON"):
		$Sprite.visible = true
	else:
		$Sprite.visible = false
	