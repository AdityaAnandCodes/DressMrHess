extends Node2D

var selected_item
var item_in_area = {
	"hat": false,
	"shirt": false,
	"pant": false,
	"shoe": false
}

const WHOOSH_MOTION = preload("res://Assets/SoundEffect/whoosh-motion.mp3")

var item_placed = {
	"hat": false,
	"shirt": false,
	"pant": false,
	"shoe": false
}

var final_positions = {
	"hat": Vector2(752, 212),
	"shirt": Vector2(751, 438),
	"pant": Vector2(752, 514),
	"shoe": Vector2(753, 578)
}

var initial_positions = {
	"hat": Vector2(126, 334),
	"shirt": Vector2(282, 343),
	"pant": Vector2(125, 483),
	"shoe": Vector2(286, 485)
}

var initial_scales = {
	"hat": Vector2(0.3, 0.3),
	"shirt": Vector2(0.3, 0.3),
	"pant": Vector2(0.32, 0.32),
	"shoe": Vector2(0.34, 0.34)
}

var final_scale = Vector2(0.5, 0.5)

@onready var hat: Sprite2D = $Hat
@onready var shirt: Sprite2D = $Shirt
@onready var pant: Sprite2D = $Pant
@onready var shoes: Sprite2D = $Shoes

func _ready() -> void:
	AudioManager.play_music_level()

func _process(delta: float) -> void:
	if selected_item:
		var sprite = get_sprite(selected_item)
		sprite.z_index = 1
		sprite.scale = final_scale
		sprite.position = get_global_mouse_position()
		if Input.is_action_just_released("click"):
			if item_in_area[selected_item]:
				sprite.position = final_positions[selected_item]
				AudioManager.play_FX(WHOOSH_MOTION)
				item_placed[selected_item] = true
				sprite.z_index = 0
				selected_item = null
			else:
				sprite.scale = initial_scales[selected_item]
				sprite.position = initial_positions[selected_item]
				sprite.z_index = 0
				selected_item = null

	if all_items_placed():
		change_scene_to_opening()

func _on_hat_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_pressed("click") and not selected_item and not item_placed["hat"]:
		selected_item = "hat"

func _on_shirt_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_pressed("click") and not selected_item and not item_placed["shirt"]:
		selected_item = "shirt"

func _on_pant_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_pressed("click") and not selected_item and not item_placed["pant"]:
		selected_item = "pant"

func _on_shoe_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_pressed("click") and not selected_item and not item_placed["shoe"]:
		selected_item = "shoe"

func _on_hat_placement_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if selected_item == "hat" and Input.is_action_just_released("click"):
		item_in_area["hat"] = true

func _on_shirt_placement_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if selected_item == "shirt" and Input.is_action_just_released("click"):
		item_in_area["shirt"] = true

func _on_pant_placement_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if selected_item == "pant" and Input.is_action_just_released("click"):
		item_in_area["pant"] = true

func _on_shoe_placement_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if selected_item == "shoe" and Input.is_action_just_released("click"):
		item_in_area["shoe"] = true

func get_sprite(item_name: String) -> Sprite2D:
	match item_name:
		"hat":
			return hat
		"shirt":
			return shirt
		"pant":
			return pant
		"shoe":
			return shoes
		_:
			return null

func all_items_placed() -> bool:
	return item_placed.values().count(true) == 4

func change_scene_to_opening() -> void:
	get_tree().change_scene_to_file("res://Scenes/game_won.tscn")
