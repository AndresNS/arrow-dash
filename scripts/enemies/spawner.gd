class_name Spawner extends Node2D

@onready var timer: Timer = $Timer

const EnemyPufferfishScene = preload("res://scenes/enemies/enemy_pufferfish.tscn")
const EnemyOctopusScene = preload("res://scenes/enemies/enemy_octopus.tscn")
const EnemyArrowSpeedUpScene = preload("res://scenes/enemies/enemy_arrow_speed_up.tscn")

@export var spawn_rate: float = 5.0
@export var active: bool = true
var game: Game = null
var enemy_count: int = 1


func _ready() -> void:
	game = get_tree().root.get_node("Game")
	timer.wait_time = spawn_rate

func _on_timer_timeout() -> void:
	if (active):
		var enemy: Enemy = null
		
		if (enemy_count % 5 == 0):
			enemy = EnemyOctopusScene.instantiate()
		elif (enemy_count % 7 == 0):
			enemy = EnemyArrowSpeedUpScene.instantiate()
		else:
			enemy = EnemyPufferfishScene.instantiate()
			
		enemy.position = position
		game.add_child(enemy)
		enemy_count += 1
