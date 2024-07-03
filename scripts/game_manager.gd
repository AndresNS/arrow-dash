extends Node

class_name GameManager

enum GameState { MAIN_MENU, PLAYING, PAUSED, GAME_OVER }

@onready var hp_label: Label = $"../IngameHUD/HPLabel"
@onready var score_label: Label = $"../IngameHUD/ScoreLabel"
@onready var game_over_score_label: Label = $"../GameOverHUD/ScoreLabel"

var score: int = 0
var score_per_second: int = 10
var current_game_state: GameState = GameState.PLAYING

signal game_over()

func update_hp_label(health: int, max_health: int) -> void:
	hp_label.text = "HP: %d/%d" % [health, max_health]
	
func update_score(amount: int) -> void:
	if(current_game_state != GameState.PLAYING):
		return
	score += amount
	score_label.text = "Score: %d" % score
	
func end_game() -> void:
	current_game_state = GameState.GAME_OVER
	game_over_score_label.text = "Score: %d" % score
	game_over.emit()

