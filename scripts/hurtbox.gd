class_name Hurtbox extends Area2D

var player : Player = null

func _on_body_entered(body: Node2D) -> void:
	if(body is Enemy):
		var enemy : Enemy = body
		
		if (player != null && !player.shield.active && enemy.collision_triggers_attack):
			enemy.enemy_state = enemy.EnemyState.ATTACKING
		
