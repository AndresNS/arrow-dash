class_name Spawner extends Node2D

@onready var timer: Timer = $Timer

const SeekerEnemyScene = preload("res://scenes/enemies/seeker_enemy.tscn")
const SlowdownEnemyScene = preload("res://scenes/enemies/slowdown_enemy.tscn")

var game: Game = null
@export var spawn_rate: float = 5.0
var enemy_count: int = 1

func _ready() -> void:
	game = get_tree().root.get_node("Game")
	timer.wait_time = spawn_rate

func _on_timer_timeout() -> void:
	var enemy: Enemy = null
	
	if (enemy_count % 5 == 0):
		enemy = SlowdownEnemyScene.instantiate()
	else:
		enemy = SeekerEnemyScene.instantiate()
		
	enemy.position = position
	game.add_child(enemy)
	enemy_count += 1
