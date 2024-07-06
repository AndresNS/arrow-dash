extends Node2D

class_name Spawner

@onready var timer: Timer = $Timer

const EnemyScene = preload("res://scenes/enemies/enemy.tscn")

@export var spawn_rate: float = 5.0
var game: Game = null

func _ready() -> void:
	game = get_tree().root.get_node("Game")
	timer.wait_time = spawn_rate

func _on_timer_timeout() -> void:
	var enemy: Enemy = EnemyScene.instantiate()
	enemy.position = position
	game.add_child(enemy)
