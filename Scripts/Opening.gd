extends VideoStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioManager.play_mainmenu_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_finished() -> void:
	get_tree().change_scene_to_file("res://Scenes/mission_objective.tscn")
