extends CanvasLayer

@onready var LevelSelectionScene: PackedScene = preload("res://scenes/screens/level_selection.tscn")

func _on_play_button_pressed() -> void:
	GameManager.go_to_level("1-1")

func _on_level_selection_button_pressed() -> void:
	get_tree().change_scene_to_packed(LevelSelectionScene)

func _on_quit_button_pressed() -> void:
	get_tree().quit()

