class_name Game extends Node2D

@onready var game_manager: GameManager = %GameManager
@onready var player: Player = $Player
@onready var score_timer: Timer = $ScoreTimer
@onready var score_multiplier_timer: Timer = $ScoreMultiplierTimer
@onready var game_over_hud: GameOverHUD = $GameOverHUD

func _ready() -> void:
	game_manager.update_hp_label(player.health, player.max_health)
	game_manager.game_over.connect(on_game_over)
	game_over_hud.restart_game.connect(on_game_restart)
	game_over_hud.hide()
	Engine.time_scale = 1

func on_game_over() -> void:
	game_over_hud.show()
	Engine.time_scale = 0
	
func on_game_restart() -> void:
	get_tree().reload_current_scene()
	Engine.time_scale = 1

func _on_player_health_changed(new_health: int) -> void:
	game_manager.update_hp_label(new_health, player.max_health)
	if (new_health <= 0):
		game_manager.call_deferred("end_game")

func _on_score_timer_timeout() -> void:
	game_manager.update_score(game_manager.score_per_second)
	score_timer.start()

