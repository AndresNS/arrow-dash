extends Node

@onready var MainMenuScene: PackedScene = preload("res://scenes/screens/main_menu.tscn")
@onready var GameScene: PackedScene = preload("res://scenes/screens/game.tscn")
@onready var LeaderboardScene: PackedScene = preload("res://scenes/screens/leaderboard.tscn")
@onready var Levels: Array[PackedScene] = [
	preload("res://scenes/levels/world_1_level_1.tscn")
]

func go_to_main_menu() -> void:
	get_tree().change_scene_to_packed(MainMenuScene)

func go_to_game() -> void:
	get_tree().change_scene_to_packed(GameScene)
	
func go_to_leaderboard() -> void:
	get_tree().change_scene_to_packed(LeaderboardScene)

func go_to_level(level: int) -> void:
	get_tree().change_scene_to_packed(Levels[level - 1])
	
