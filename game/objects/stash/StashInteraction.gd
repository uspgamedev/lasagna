extends Node

func interact():
    var hud = get_node("/root/Main").get_hud()
    var container = hud.get_node("InventoryContainer")
    container.render_inventory()
    container.show()
    
    # Abrir menu de interacao
    
    # com esse menu, ser possivel coletar itens do bau (e move-los pro inventario), colocar
    # itens do inventario no bau, e consultar o seu dinheiro(?)