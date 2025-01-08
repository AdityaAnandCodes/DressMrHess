extends VideoStreamPlayer

@onready var appearance: VideoStreamPlayer = $"."
@onready var start_button: Button = $StartButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.visible = true
	await get_tree().create_timer(3.5).timeout
	appearance.paused = true
	start_button.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/DressingRoom.tscn")
