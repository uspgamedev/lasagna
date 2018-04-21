extends PopupMenu

const SLEEP = 0

func _on_BedPopup_popup_hide():
	get_tree().paused = false

func _on_BedPopup_id_pressed(ID):
	if ID == SLEEP:
		get_tree().change_scene('main.tscn')
