extends Node2D

signal interacted(item)

func interact(item):
	emit_signal("interacted", item)
