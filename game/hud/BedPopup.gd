extends PopupMenu

const SLEEP = 0

func _on_BedPopup_popup_hide():
	get_tree().paused = false

func _on_BedPopup_id_pressed(ID):
	if ID == SLEEP:
		var main = get_node("/root/Main")
		main.sleep_and_save()
		main.end_night()
