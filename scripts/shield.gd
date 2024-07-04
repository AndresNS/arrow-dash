extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if(visible && body is Enemy):
		var enemy : Enemy = body
		
		enemy.self_destruct()

