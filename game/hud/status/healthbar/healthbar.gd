extends ProgressBar

func change(amount):
	$Tween.interpolate_property(self, "value", self.value, self.value + amount, 1, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Tween.start()
