extends CanvasLayer

@onready var GameScene: PackedScene = preload("res://scenes/screens/game.tscn")

func _on_play_button_pressed() -> void:
	SceneManager.go_to_game()

func _on_leaderboard_button_pressed() -> void:
	SceneManager.go_to_leaderboard()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
