class_name SeaCurrent extends Area2D


var current_direction: Vector2 = Vector2.ZERO
var player: Player = null
var speed_boost: float = 3

func _ready() -> void:
	current_direction =  Vector2(cos(rotation - PI/2), sin(rotation - PI/2))

func _on_body_entered(body: Node2D) -> void:
	if (body is Player):
		player = body
		player.velocity = current_direction * player.SPEED
		player.speed_boost = speed_boost
		
