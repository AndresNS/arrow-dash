class_name Shield extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var active: bool = false

func _physics_process(_delta: float) -> void:
	if (active && !visible):
		show()
	
	if (visible && !active):
		hide()

func _on_body_entered(body: Node2D) -> void:
	if(active && body is Enemy):
		var enemy : Enemy = body
		if (enemy.dies_from_shield):
			enemy.self_destruct()
			#game_manager.update_score(enemy.points_on_kill)

