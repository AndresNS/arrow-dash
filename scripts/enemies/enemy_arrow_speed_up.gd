class_name EnemyArrowSlowdown extends Enemy

const ARROW_SPEED_UP_FACTOR = 2.5

func _ready() -> void:
	speed = 50.0
	attack_damage = 3
	points_on_kill = 10
	debuff_type = "arrow_speed_up"
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
	player.apply_debuff(debuff_type, debuff_duration)
	player.arrow_animation.speed_scale = player.INITIAL_ARROW_SPEED * ARROW_SPEED_UP_FACTOR

