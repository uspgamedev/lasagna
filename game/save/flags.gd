extends Node

export(int) var day = 1

func spend_day():
	self.day += 1

func get_day():
	return self.day

func set_day(value):
	self.day = value
