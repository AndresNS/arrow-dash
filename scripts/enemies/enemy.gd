class_name Enemy extends CharacterBody2D

var attack_damage: int
var points_on_kill: int
var speed: float
var player: Player = null
var debuff_type: String
var debuff_duration: float
var collision_triggers_attack: bool
var dies_from_shield: bool = true

func _ready() -> void:
	player = get_tree().current_scene.get_node("Player")

func seek_player() -> void:
	if (GameManager.current_game_state != GameManager.GameState.PLAYING):
		return
	
	if (player && player.player_state != player.PlayerState.DEAD):
		var direction: Vector2 = (player.position - position).normalized()
		velocity = direction * speed
		move_and_slide()
		
func attack() -> void:
	pass

func self_destruct() -> void:
	queue_free()
