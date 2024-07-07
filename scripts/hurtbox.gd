class_name Hurtbox extends Area2D

var player : Player = null

func _on_body_entered(body: Node2D) -> void:
	if(body is Enemy):
		var enemy : Enemy = body
		
		if (player != null && !player.shield.active):
			player.take_damage(enemy.attack_damage)
		
		if (player != null && !player.shield.active && enemy.has_method("debuff")):
			enemy.call("debuff")
		
		enemy.self_destruct()
