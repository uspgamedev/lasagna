extends Node

enum MOON {
	FULL,
	CRESCENT,
	NEW,
	WANING,
	BLOOD
}

export(int) var day = 1
export(int) var moon = 1

var flags = Dictionary()
var blood_moon_prob = 0

# Blood moon probability constants
const MIN_PROB = 0
const MAX_PROB = .5
const PROB_STEP = .1

func get_flag(flag_name):
	if flags.has(flag_name):
		return flags[flag_name]
	else:
		return false

func set_flag(flag_name, value):
	flags[flag_name] = value

func spend_day():
	day += 1
	moon = day % 4
	if moon == FULL:
		try_blood_moon()

func try_blood_moon():
	randomize()
	if blood_moon_prob > randf(0, 1):
		moon = BLOOD
		blood_moon_prob = MIN_PROB
		return true
	else:
		blood_moon_prob = min(MAX_PROB, blood_moon_prob + PROB_STEP)
		return false

func get_day():
	return day

func get_moon():
	return moon

func get_blood_prob():
	return blood_moon_prob

func get_moon_name():
	match moon:
		FULL: return "Full"
		CRESCENT: return "Crescent"
		NEW: return "New"
		WANING: return "Waning"
		BLOOD: return "Blood"

func set_day(value):
	day = value

func set_moon(value):
	moon = value

func set_blood_prob(value):
	blood_moon_prob = value
