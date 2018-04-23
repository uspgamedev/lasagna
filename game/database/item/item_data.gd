extends Node

export (Texture) var icon
export (bool) var is_seed

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