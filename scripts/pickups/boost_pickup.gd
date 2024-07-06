extends BasePickup

class_name BoostPickup

var player : Player = null
var speed_boost: float = 3

func _on_body_entered(body: Node2D) -> void:
	if(body is Player):
		player = body
		player.speed_boost = speed_boost
		queue_free()
