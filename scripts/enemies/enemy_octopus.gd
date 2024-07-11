class_name EnemyOctopus extends Enemy

const SLOW_FACTOR = 0.5

func _ready() -> void:
	speed = 50.0
	attack_damage = 0
	points_on_kill = 10
	debuff_type = "slow_down"
	debuff_duration = 2.0
	collision_triggers_attack = true
	super._ready()

func _physics_process(_delta: float) -> void:
	seek_player()

func attack() -> void:
	super.attack()
	player.take_damage(attack_damage)
	debuff()
	self_destruct()

func debuff() -> void:
	# add ink animation to player
	player.apply_debuff(debuff_type, debuff_duration)
	player.speed_multiplier = SLOW_FACTOR


