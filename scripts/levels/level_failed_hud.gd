extends CanvasLayer

func _on_retry_button_pressed() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()

func _on_main_menu_button_pressed() -> void:
	GameManager.go_to_main_menu()
