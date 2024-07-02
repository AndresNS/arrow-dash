extends Node2D

class_name Game

enum GameState { MAIN_MENU, PLAYING, PAUSED, GAME_OVER }

@onready var player: Player = $Player
@onready var hp_label: Label = $CanvasLayer/UI/HPLabel
@onready var score_label: Label = $CanvasLayer/UI/ScoreLabel
@onready var score_timer: Timer = $ScoreTimer

var score: int = 0
var score_per_second: int = 10
var current_game_state: GameState = GameState.PLAYING

func _ready() -> void:
	update_hp_label(player.health, player.max_health)

func update_hp_label(health: int, max_health: int) -> void:
	hp_label.text = "HP: %d/%d" % [health, max_health]

func update_score(amount: int) -> void:
	if(current_game_state != GameState.PLAYING):
		return
	score += amount
	score_label.text = "Score: %d" % score

func game_over() -> void:
	current_game_state = GameState.GAME_OVER
	player.queue_free()
	print("Game Over")

func _on_player_health_changed(new_health: int) -> void:
	update_hp_label(new_health, player.max_health)
	if (new_health <= 0):
		game_over()

func _on_score_timer_timeout() -> void:
	update_score(score_per_second)
	score_timer.start()
