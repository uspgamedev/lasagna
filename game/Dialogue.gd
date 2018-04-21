extends Control

signal pressed
signal finished

var isPressed = false
var wasPressed = false

func _ready():
	display_text(["the quick brown fox jumped over the lazy dog"])

func display_text(text_vec):
	for text in text_vec:
		for i in range(len(text)):
			$Text.add_text(text[i])
			$Timer.start()
			yield($Timer, "timeout")
			if Input.is_action_pressed("ui_accept"):
				$Text.add_text(text.substr(i+1, len(text)-i-1))
				break
		yield(self, "pressed")
		$Text.clear()
	emit_signal("finished")

func _input(event):
	if (event.is_action_pressed("ui_accept")):
		isPressed = true
		if (not wasPressed) and isPressed:
			emit_signal("pressed")
		wasPressed = true
	if (event.is_action_released("ui_accept")):
		isPressed = false
		wasPressed = false