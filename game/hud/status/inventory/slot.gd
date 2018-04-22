extends PanelContainer

onready var icon = $Icon
onready var cursor = $Cursor

func set_icon(icon_tex):
	icon.texture = icon_tex

func focus():
	self.cursor.visible = true

func unfocus():
	self.cursor.visible = false
