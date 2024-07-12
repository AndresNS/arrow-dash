extends CanvasLayer

class_name GameOverHUD

@onready var score_label: Label = $ScoreLabel

signal restart_game()

#func _ready() -> void:
	#score_label.text =  "Score: %d" % game_manager.score

func _on_retry_button_pressed() -> void:
	restart_game.emit()
	
func _on_main_menu_button_pressed() -> void:
	SceneManager.go_to_main_menu()

func _on_leaderboard_button_pressed() -> void:
	SceneManager.go_to_leaderboard()
