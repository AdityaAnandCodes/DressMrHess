extends AudioStreamPlayer

const Main_menu = preload("res://Assets/Music/upbeat-happy-fun-travel-background-music-for-videos-244590.mp3")
const LevelMusic1 = preload("res://Assets/Music/travel-upbeat-happy-fun-background-music-for-videos-244587.mp3")


func _play_music(music: AudioStream, volume=0.0):
	if stream == music:
		volume_db = volume
		return
		
	stream=music
	volume_db=volume
	play()
	
func play_music_level():
	_play_music(LevelMusic1)
	
func play_mainmenu_music():
	_play_music(Main_menu,4.0)
	
func cutscene_music():
	_play_music(Main_menu,-4.0)
	
func play_FX(stream: AudioStream, volume=0.0):
	var fx_player=AudioStreamPlayer.new()
	fx_player.stream=stream
	fx_player.name="FX_PLAYER"
	fx_player.volume_db=volume
	add_child(fx_player)
	fx_player.play()
	await fx_player.finished
	fx_player.queue_free()
