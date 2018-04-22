extends PopupMenu

const SLEEP = 0

func _on_BedPopup_popup_hide():
	get_tree().paused = false

func _on_BedPopup_id_pressed(ID):
	if ID == SLEEP:
		# $Save.save_game()
		get_node("/root/Main").end_night()
