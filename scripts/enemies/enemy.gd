class_name Enemy extends CharacterBody2D

enum EnemyState { STOPPED, MOVING, ATTACKING, VANISHING }

@onready var enemy_sprite: AnimatedSprite2D = $AnimatedSprite2D

var enemy_state: EnemyState = EnemyState.STOPPED
var attack_damage: int
var points_on_kill: int
var speed: float
var player: Player = null
var debuff_type: String
var debuff_duration: float
var collision_triggers_attack: bool
var dies_from_shield: bool = true
var vanishing_speed: float = 2.5

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

func vanish(delta: float) -> void:
	if (GameManager.current_game_state != GameManager.GameState.PLAYING):
		return
	
	if (player):
		var zigzag_amplitude := 0.5
		var zigzag_frequency := 25.0

		var direction: Vector2 = (player.position - position).normalized()
		var perpendicular: Vector2 = direction.orthogonal()
		var zigzag_offset: Vector2 = perpendicular * zigzag_amplitude * sin(zigzag_frequency * Time.get_ticks_msec() / 1000.0)
		var zigzag_direction: Vector2 = (direction + zigzag_offset).normalized()
		velocity = - zigzag_direction * speed
		
		move_and_slide()
	
	modulate.a -= vanishing_speed * delta
	if (modulate.a < 0):
		self_destruct()

func self_destruct() -> void:
	queue_free()
