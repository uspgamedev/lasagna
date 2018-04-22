extends Node2D

signal interacted

func interact():
	emit_signal("interacted")
