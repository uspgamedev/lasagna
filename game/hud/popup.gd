extends PopupMenu

signal option_chosen(idx)

func request_option(options, width = 128):
	var popup = get_node("/root/Main").get_hud().get_node("Popup")
	clear()
	for option in options:
		popup.add_item(" " + option)
	get_tree().paused = true
	popup.popup_centered(Vector2(width, len(options)*30))
	popup.connect("popup_hide", self, "_on_cancel", [], CONNECT_ONESHOT)
	popup.connect("id_pressed", self, "_on_option_chosen", [], CONNECT_ONESHOT)
	var idx = yield(self, "option_chosen")
	get_tree().paused = false
	return idx

func _on_option_chosen(idx):
	if is_connected("popup_hide", self, "_on_cancel"):
		disconnect("popup_hide", self, "_on_cancel")
	emit_signal("option_chosen", idx)

func _on_cancel():
	if is_connected("id_pressed", self, "_on_option_chosen"):
		disconnect("id_pressed", self, "_on_option_chosen")
	emit_signal("option_chosen", -1)
