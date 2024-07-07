class_name SlowdownEnemy extends Enemy

const SLOW_FACTOR = 0.5

func _ready() -> void:
	speed = 50.0
	attack_damage = 0
	points_on_kill = 10
	debuff_type = "slow_down"
	debuff_duration = 2.0
	super._ready()

func _physics_process(_delta: float) -> void:
	seek_player()

func debuff() -> void:
	player.apply_debuff(debuff_type, debuff_duration)
	player.speed_multiplier = SLOW_FACTOR


