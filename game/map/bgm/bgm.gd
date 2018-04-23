extends AudioStreamPlayer

export(String, "home_day", "home_night", "garden_day", "garden_night") var current_bgm = "home_day"
var bgm_list = {
	"home_day": "res://map/bgm/ld41_dia.ogg",
	"home_night": "res://map/bgm/ld41.ogg",
	"garden_day": "res://map/bgm/outside_day.ogg",
	"garden_night": "res://map/bgm/outside_night.ogg",
}

var fade_duration = 3

onready var fade_in_tween = get_node("fade_in")
onready var fade_out_tween = get_node("fade_out")
onready var cross_fade_out_tween = get_node("cross_fade_out")
onready var tmp_player = get_node("tmp_player")

func _ready():
	fade_out_tween.connect("tween_completed", self, "on_fade_out_complete")
	fade_in(current_bgm)

func change_bgm(audio_key):
	var playing_bgm = load(bgm_list[current_bgm])
	
	tmp_player.stream = playing_bgm
	tmp_player.seek(self.get_playback_position())
	tmp_player.play()
	
	cross_fade_out_tween.interpolate_property(tmp_player, 'volume_db',
		0, -60, fade_duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	cross_fade_out_tween.start()
	
	fade_in(audio_key)

func fade_in(audio_key):
	var bgm = load(bgm_list[audio_key])
	
	current_bgm = audio_key
	
	self.stop()
	self.stream = bgm
	self.play()
	
	fade_in_tween.interpolate_property(self, 'volume_db',
		-60.0, 0, fade_duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	fade_in_tween.start()

func fade_out():
	fade_out_tween.interpolate_property(self, 'volume_db',
		0, -60.0, fade_duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	fade_out_tween.start()

func on_fade_out_complete(object, _key):
	object.stop()