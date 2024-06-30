extends Area2D

class_name Hurtbox

var player : Player = null

func _on_body_entered(body: Node2D) -> void:
	print("Take damage!")
	
	if(body is Enemy):
		var enemy : Enemy = body
		
		if (player != null):
			player.take_damage(enemy.attack_damage)
			
		enemy.self_destruct()
