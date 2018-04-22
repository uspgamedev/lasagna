extends PanelContainer

onready var icon = $Icon

func set_icon(icon_tex):
	icon.texture = icon_tex
