class_name Main extends Node2D

#func _ready() -> void:
	#GameManager.call_deferred("go_to_main_menu")
	#game_manager.update_hp_label(player.health, player.max_health)
	#game_manager.game_over.connect(on_game_over)
	#game_over_hud.restart_game.connect(on_game_restart)
	#player.health_changed.connect(on_player_health_changed)
	#game_over_hud.hide()
	#Engine.time_scale = 1
