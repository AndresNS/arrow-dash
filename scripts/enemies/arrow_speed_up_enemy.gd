class_name ArrowSlowdownEnemy extends Enemy

const ARROW_SPEED_UP_FACTOR = 2.5

func _ready() -> void:
	speed = 50.0
	attack_damage = 3
	points_on_kill = 10
	debuff_type = "arrow_speed_up"
	debuff_duration = 2.0
	super._ready()

func _physics_process(delta: float) -> void:
	super._physics_process(delta)

func debuff() -> void:
	player.apply_debuff(debuff_type, debuff_duration)
	player.arrow_animation.speed_scale = player.INITIAL_ARROW_SPEED * ARROW_SPEED_UP_FACTOR

