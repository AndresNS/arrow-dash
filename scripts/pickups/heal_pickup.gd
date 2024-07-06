extends BasePickup

class_name HealPickup

var player : Player = null
var heal_amount: int = 15

func _on_body_entered(body: Node2D) -> void:
	if(body is Player):
		player = body
		player.heal(heal_amount)
		queue_free()
