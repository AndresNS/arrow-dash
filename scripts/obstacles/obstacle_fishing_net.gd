class_name ObstacleFishingNet extends Area2D

var player: Player = null
var slow_rate: float = 0.3

func _ready() -> void:
	player = get_tree().current_scene.get_node("Player")

func _on_body_entered(body: Node2D) -> void:
	if (player):
		player.speed_multiplier = slow_rate

func _on_body_exited(body: Node2D) -> void:
	if (player):
		player.speed_multiplier = player.INITIAL_SPEED_MULTIPLIER
