class_name Level extends Node2D

enum LevelOutcome { SUCCESS, FAILED }

@onready var food_label: Label = $IngameHUD/FoodLabel
@onready var hp_label: Label = $IngameHUD/HPLabel
@onready var player: Player = $Player
@onready var level_completed_hud: CanvasLayer = $LevelCompletedHUD
@onready var level_failed_hud: CanvasLayer = $LevelFailedHUD
@onready var food_collected_label: Label = $LevelFailedHUD/FoodCollectedLabel
@onready var performance_rating_label: Label = $LevelCompletedHUD/PerformanceRatingLabel

var required_food: int
var food_collected: int = 0
var performance_rating: int

func _ready() -> void:
	GameManager.current_game_state = GameManager.GameState.PLAYING
	Engine.time_scale = 1
	level_completed_hud.hide()
	level_failed_hud.hide()
	
	food_label.text = "Food Collected: 0/%d" % required_food
	hp_label.text = "HP: %d/%d" % [player.health, player.max_health]
	
	player.food_collected.connect(on_food_collected)
	player.health_changed.connect(on_player_health_changed)

func get_performance_rating(hp_left: int) -> int:
	if (hp_left < 60):
		return 0
	elif (hp_left < 80):
		return 1
	elif (hp_left < 100):
		return 2
	else:
		return 3

func on_food_collected() -> void:
	food_collected += 1
	food_label.text = "Food Collected: %d/%d" % [food_collected, required_food]
	if (food_collected >= required_food):
		end_level(LevelOutcome.SUCCESS)

func update_hp_label(health: int, max_health: int) -> void:
	hp_label.text = "HP: %d/%d" % [health, max_health]

func end_level(outcome: LevelOutcome) -> void:
	Engine.time_scale = 0
	if (outcome == LevelOutcome.SUCCESS):
		performance_rating = get_performance_rating(player.health)
		performance_rating_label.text = "★".repeat(performance_rating) + "☆".repeat(3 - performance_rating)
		level_completed_hud.show()
	else:
		food_collected_label.text = "Food Collected: %d" % food_collected
		level_failed_hud.show()

func on_player_health_changed(new_health: int) -> void:
	update_hp_label(new_health, player.max_health)
	if (new_health <= 0):
		end_level(LevelOutcome.FAILED)
