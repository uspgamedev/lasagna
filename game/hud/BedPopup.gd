extends PopupMenu

func _on_BedPopup_popup_hide():
	get_tree().paused = false
