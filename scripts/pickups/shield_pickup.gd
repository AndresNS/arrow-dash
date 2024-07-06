extends BasePickup

class_name ShieldPickup

var player : Player = null
var shield_duration: float = 3.0

func _on_body_entered(body: Node2D) -> void:
	if(body is Player):
		player = body
		player.call_deferred("activate_shield", shield_duration)
		queue_free()
