extends ProgressBar

func change(amount):
	$Tween.interpolate_method(self, "_set_amount", self.value, self.value + amount, 3, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Tween.start()

func _set_amount(amount):
	self.value = amount
	var color = Color(.8, .1, .1).linear_interpolate(Color(.1, .8, .1), amount/100.0)
	get_stylebox("fg", "").modulate_color = color
