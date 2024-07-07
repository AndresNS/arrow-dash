extends Node

class_name GameManager

enum GameState { MAIN_MENU, PLAYING, PAUSED, GAME_OVER }

@onready var hp_label: Label = $"../IngameHUD/HPLabel"
@onready var score_label: Label = $"../IngameHUD/ScoreLabel"
@onready var game_over_score_label: Label = $"../GameOverHUD/ScoreLabel"
@onready var score_multiplier_timer: Timer = $"../ScoreMultiplierTimer"

var score: int = 0
var score_per_second: int = 10
var score_multiplier_factor: float = 1
var score_multiplier_active: bool = false
var current_game_state: GameState = GameState.PLAYING

signal game_over()

func update_hp_label(health: int, max_health: int) -> void:
	hp_label.text = "HP: %d/%d" % [health, max_health]
	
func update_score(amount: int) -> void:
	if(current_game_state != GameState.PLAYING):
		return
	score += round(amount * score_multiplier_factor)
	score_label.text = "Score: %d" % score
	
func end_game() -> void:
	current_game_state = GameState.GAME_OVER
	game_over_score_label.text = "Score: %d" % score
	game_over.emit()

func activate_score_multiplier(duration: float, factor: float) -> void:
	score_multiplier_active = true
	score_multiplier_timer.start(duration)
	score_multiplier_factor = factor

func _on_score_multiplier_timer_timeout() -> void:
	score_multiplier_active = false
	score_multiplier_factor = 1
