extends Node2D

class_name Spawner

@onready var timer: Timer = $Timer

const SeekerEnemyScene = preload("res://scenes/enemies/seeker_enemy.tscn")

@export var spawn_rate: float = 5.0
var game: Game = null

func _ready() -> void:
	game = get_tree().root.get_node("Game")
	timer.wait_time = spawn_rate

func _on_timer_timeout() -> void:
	var seeker_enemy: Enemy = SeekerEnemyScene.instantiate()
	seeker_enemy.position = position
	game.add_child(seeker_enemy)
