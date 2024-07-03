extends CanvasLayer

class_name GameOverHUD

@onready var game_manager: GameManager = %GameManager
@onready var score_label: Label = $ScoreLabel

signal restart_game()

func _ready() -> void:
	score_label.text =  "Score: %d" % game_manager.score

func _on_retry_button_pressed() -> void:
	print("retry")
	restart_game.emit()
	
	
