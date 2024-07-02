extends Node2D

class_name Game

@onready var game_manager: GameManager = %GameManager
@onready var player: Player = $Player
@onready var score_timer: Timer = $ScoreTimer

func _ready() -> void:
	game_manager.update_hp_label(player.health, player.max_health)

func end_game() -> void:
	game_manager.current_game_state = game_manager.GameState.GAME_OVER
	print("Game Over")
	
	print("Restarting...")
	get_tree().reload_current_scene()

func _on_player_health_changed(new_health: int) -> void:
	game_manager.update_hp_label(new_health, player.max_health)
	if (new_health <= 0):
		call_deferred("end_game")

func _on_score_timer_timeout() -> void:
	game_manager.update_score(game_manager.score_per_second)
	score_timer.start()
