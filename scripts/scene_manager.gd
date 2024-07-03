extends Node

@onready var MainMenuScene: PackedScene = preload("res://scenes/main_menu.tscn")
@onready var GameScene: PackedScene = preload("res://scenes/game.tscn")
@onready var LeaderboardScene: PackedScene = preload("res://scenes/leaderboard.tscn")

func go_to_main_menu() -> void:
	get_tree().change_scene_to_packed(MainMenuScene)

func go_to_game() -> void:
	get_tree().change_scene_to_packed(GameScene)
	
func go_to_leaderboard() -> void:
	get_tree().change_scene_to_packed(LeaderboardScene)
