extends Node

func _ready():
	$Timer.start()

func _on_Timer_timeout():
	var main = get_node("/root/Main")
	if !main.get_flags().get_flag("has_heard_monolog_01"):
		main.get_flags().set_flag("has_heard_monolog_01", true)
		main.execute_cutscene("monolog_01")