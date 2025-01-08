extends VideoStreamPlayer

@onready var start_button: Button = $StartButton
@onready var game_won: VideoStreamPlayer = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.visible = false
	await get_tree().create_timer(2.0).timeout
	game_won.paused = true
	start_button.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Opening.tscn")
