class_name Shield extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var game_manager: GameManager = null

var active: bool = false

func _ready() -> void:
	game_manager = get_tree().current_scene.get_node("GameManager")

func _physics_process(_delta: float) -> void:
	if (active && !visible):
		show()
	
	if (visible && !active):
		hide()
	

func _on_body_entered(body: Node2D) -> void:
	if(active && body is Enemy):
		var enemy : Enemy = body
		enemy.self_destruct()
		game_manager.update_score(enemy.points_on_kill)

