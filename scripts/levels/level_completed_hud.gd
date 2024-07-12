extends CanvasLayer

func _on_next_level_button_pressed() -> void:
	GameManager.load_next_level()

func _on_main_menu_button_pressed() -> void:
	GameManager.go_to_main_menu()
