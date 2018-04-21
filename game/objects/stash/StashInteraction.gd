extends Node


func _input(event):
    var hud = get_node("/root/Main").get_hud()
    var container = hud.get_node("InventoryContainer")
    if event.is_action_pressed("ui_cancel"):
        get_tree().paused = false
        container.hide()

func interact():
    var hud = get_node("/root/Main").get_hud()
    var container = hud.get_node("InventoryContainer")
    container.render_inventory()
    container.show()
    get_tree().paused = true
    
    # Abrir menu de interacao
    
    # com esse menu, ser possivel coletar itens do bau (e move-los pro inventario), colocar
    # itens do inventario no bau, e consultar o seu dinheiro(?)