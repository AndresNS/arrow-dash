class_name Enemy extends CharacterBody2D

var speed: float
var game_manager: GameManager = null
var player: Player = null
var attack_damage: int
var points_on_kill: int
var debuff_type: String
var debuff_duration: float

func _ready() -> void:
	game_manager = get_tree().current_scene.get_node("GameManager")
	player = get_tree().current_scene.get_node("Player")

func _physics_process(_delta: float) -> void:
	seek_player()

func seek_player() -> void:
	if (game_manager.current_game_state != game_manager.GameState.PLAYING):
		return
	
	if (player):
		var direction: Vector2 = (player.position - position).normalized()
		velocity = direction * speed
		move_and_slide()

func self_destruct() -> void:
	queue_free()
