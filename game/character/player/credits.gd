extends Node2D

var can_skip = false

onready var label = get_node('Node2D')

func _ready():
	get_node('Player/AnimationPlayer').play('credits')
	get_node('Granny/AnimationPlayer').play('granny')

func _process(delta):
	label.position = Vector2(label.position.x, label.position.y - 0.5)

func _input(event):
	if (event.is_action_pressed('ui_accept') and can_skip == true):
		get_tree().change_scene('res://title/title.tscn')

func _on_Timer_timeout():
	can_skip = true
