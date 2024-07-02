extends CharacterBody2D

class_name Enemy

const SPEED: float = 65.0

var game: Game = null
var player: Player = null
var attack_damage: int = 25

func _ready() -> void:
	player = get_tree().current_scene.get_node("Player")
	game = get_tree().root.get_node("Game")

func _physics_process(_delta: float) -> void:
	if (game.current_game_state != game.GameState.PLAYING):
		return
	var direction: Vector2 = (player.position - position).normalized()
	velocity = direction * SPEED
	move_and_slide()

func self_destruct()->void:
	queue_free()
