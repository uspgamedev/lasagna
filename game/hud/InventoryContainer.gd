extends GridContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
    for i in range(get_child_count()):
        var button = get_child(i)
        button.connect("pressed", self, "item_selected", [button])


func item_selected(button):
    pass
    
func render_inventory():
    var inventory = get_node("/root/Main/Inventory")
    var stash_content = inventory.get_stash()
    var keys = stash_content.keys()
    
    for i in range(keys.size()):
        var button = get_child(i)
        button.set_text(var2str(stash_content[keys[i]]))
        button.icon = load("res://icon.png")



#func _process(delta):
#    # Called every frame. Delta is time since last frame.
#    # Update game logic here.
#    pass
