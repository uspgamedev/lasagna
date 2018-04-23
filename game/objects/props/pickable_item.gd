
extends StaticBody2D

export(String) var item_id = "Paper"
export(int) var stack = 1

func _ready():
	var tex = get_node("/root/Main").get_db().get_item_texture(self.item_id)
	$Sprite.texture = tex

func _picked(unused):
	var inv = get_node("/root/Main").get_inventory()
	var slot = inv.next_empty_slot()
	inv.give_items(self.item_id, self.stack)
	var hud_inv = get_node('/root/Main/HUD/Status/Bottom/Inventory/')
	var counter_text = hud_inv.get_node(str('Slot' + var2str(slot + 1) + '/Counter/Label')).text
	queue_free()
