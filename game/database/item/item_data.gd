extends Node

export (Texture) var icon
export (String)  var crop_seed = ""
export (int)     var buy_value = 100 

#export (String)  var unit
#export (String)  var unit_plural

#func format(amount):
#	var article = ""
#	var decor   = ""
#	
#	if amount == 1:
#		article = "a"
#		decor   = unit
#	else:
#		article = str(amount)
#		decor   = unit_plural
#	return article+" "+decor+" "+name