extends Node2D

class_name Game

@onready var game_manager: GameManager = %GameManager
@onready var player: Player = $Player
@onready var score_timer: Timer = $ScoreTimer

func _ready() -> void:
	game_manager.update_hp_label(player.health, player.max_health)

func _on_player_health_changed(new_health: int) -> void:
	game_manager.update_hp_label(new_health, player.max_health)
	if (new_health <= 0):
		game_manager.call_deferred("end_game")

func _on_score_timer_timeout() -> void:
	game_manager.update_score(game_manager.score_per_second)
	score_timer.start()
