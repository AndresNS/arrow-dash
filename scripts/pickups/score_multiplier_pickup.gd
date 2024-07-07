extends BasePickup

class_name ScoreMultiplierPickup

var game_manager: GameManager = null
var multiplier_factor: float = 2
var multiplier_duration: float = 5

func _ready() -> void:
	game_manager = get_tree().current_scene.get_node("GameManager")

func _on_body_entered(body: Node2D) -> void:
	if(body is Player):
		game_manager.activate_score_multiplier(multiplier_duration, multiplier_factor)
		queue_free()
