class_name ObstacleFishingNet extends Area2D

var player: Player = null
var slow_rate: float = 0.3

func _on_body_entered(body: Node2D) -> void:
	if (body is Player):
		player = body
		player.speed_multiplier = slow_rate

func _on_body_exited(body: Node2D) -> void:
	if (body is Player):
		player = body
		player.speed_multiplier = player.INITIAL_SPEED_MULTIPLIER
