extends Node

enum GameState { MAIN_MENU, PLAYING, PAUSED, GAME_OVER }

signal game_over()

@onready var MainMenuScene: PackedScene = preload("res://scenes/screens/main_menu.tscn")
@onready var levels: Array[PackedScene] = [
	preload("res://scenes/levels/world_1_level_1.tscn"),
	preload("res://scenes/levels/world_1_level_2.tscn"),
]

var current_game_state: GameState = GameState.MAIN_MENU
var current_level: String
var progress: Dictionary = {
	"1-1": {
		"index": 0,
		"completed": false,
		"performance": null,
		"performance_text": ""
	},
	"1-2": {
		"index": 1,
		"completed": false,
		"performance": null,
		"performance_text": ""
	}
}
func go_to_main_menu() -> void:
	get_tree().change_scene_to_packed(MainMenuScene)

func go_to_level(level: String) -> void:
	if (level in progress.keys()):
		current_level = level
		get_tree().change_scene_to_packed(levels[progress[level].index])
		
func load_next_level() -> void:
	var current_level_index: int = progress[current_level].index
	var next_level: Dictionary = get_level_by_index(current_level_index + 1)
	
	if next_level.keys().size() > 0:
		current_level_index = next_level.index
		get_tree().change_scene_to_packed(levels[next_level.index])
	else:
		go_to_main_menu()

func get_level_by_index(index: int) -> Dictionary:
	for key: String in progress:
		if progress[key].index == index:
			return progress[key]
	return {}

func end_game() -> void:
	current_game_state = GameState.GAME_OVER
	game_over.emit()
