extends Node

enum GameState { MAIN_MENU, PLAYING, PAUSED, GAME_OVER }

signal game_over()

@onready var MainMenuScene: PackedScene = preload("res://scenes/screens/main_menu.tscn")
@onready var LeaderboardScene: PackedScene = preload("res://scenes/screens/leaderboard.tscn")
@onready var Levels: Array[PackedScene] = [
	preload("res://scenes/levels/world_1_level_1.tscn"),
	preload("res://scenes/levels/world_1_level_2.tscn")
]

var current_game_state: GameState = GameState.MAIN_MENU
var current_level: int

func go_to_main_menu() -> void:
	get_tree().change_scene_to_packed(MainMenuScene)

func go_to_leaderboard() -> void:
	get_tree().change_scene_to_packed(LeaderboardScene)

func go_to_level(level: int) -> void:
	if (level < Levels.size()):
		current_level = level
		get_tree().change_scene_to_packed(Levels[level])
		
func load_next_level() -> void:
	if current_level + 1 < Levels.size():
		current_level += 1
		get_tree().change_scene_to_packed(Levels[current_level])
	else:
		go_to_main_menu()

#func update_score(amount: int) -> void:
	#if (current_game_state != GameState.PLAYING):
		#return
	#score += round(amount * score_multiplier_factor)
	#score_label.text = "Score: %d" % score
	#
func end_game() -> void:
	current_game_state = GameState.GAME_OVER
	#game_over_score_label.text = "Score: %d" % score
	game_over.emit()

#func activate_score_multiplier(duration: float, factor: float) -> void:
	#score_multiplier_active = true
	#score_multiplier_timer.start(duration)
	#score_multiplier_factor = factor
#
#func _on_score_multiplier_timer_timeout() -> void:
	#score_multiplier_active = false
	#score_multiplier_factor = 1
