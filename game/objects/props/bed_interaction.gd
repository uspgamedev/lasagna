extends Node2D



func interact():
	var hud = get_node("/root/Main").get_hud().get_node("popups/Popup")
	print('oi')
	hud.popup_centered(Vector2(100,100))