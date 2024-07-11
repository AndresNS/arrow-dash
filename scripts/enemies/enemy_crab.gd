class_name EnemyCrab extends Enemy

@onready var attack_timer: Timer = $AttackTimer
@onready var attack_range: Area2D = $AttackRange

const attack_delay: float = 1.0
var player_in_range: bool = false


func _ready() -> void:
	speed = 65.0
	attack_damage = 5
	points_on_kill = 5
	collision_triggers_attack = false
	dies_from_shield = false
	super._ready()

func attack() -> void:
	super.attack()
	# play attack animation once
	if (player_in_range && player != null && !player.shield.active):
		player.take_damage(attack_damage)

func _on_attack_range_body_entered(body: Node2D) -> void:
	if (body is Player):
		player_in_range = true
		attack_timer.start(attack_delay)
		#
		#if (!player.shield.active):
			#player.take_damage(attack_damage)
		#
		#if (player != null && !player.shield.active && enemy.has_method("debuff")):
			#enemy.call("debuff")
		#
		#enemy.self_destruct()

func _on_attack_timer_timeout() -> void:
	attack()


func _on_attack_range_body_exited(_body: Node2D) -> void:
	player_in_range = false
	attack_timer.stop()
