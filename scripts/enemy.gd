extends CharacterBody2D

class_name Enemy

@onready var game_manager: GameManager = null

const SPEED: float = 65.0

var player: Player = null
var attack_damage: int = 5

func _ready() -> void:
	game_manager = get_tree().current_scene.get_node("GameManager")
	player = get_tree().current_scene.get_node("Player")

func _physics_process(_delta: float) -> void:
	if (game_manager.current_game_state != game_manager.GameState.PLAYING):
		return
	
	if (player):
		var direction: Vector2 = (player.position - position).normalized()
		velocity = direction * SPEED
		move_and_slide()

func self_destruct() -> void:
	queue_free()
