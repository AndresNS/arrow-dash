class_name EnemyPufferfish extends Enemy

func _ready() -> void:
	speed = 65.0
	attack_damage = 5
	points_on_kill = 5
	collision_triggers_attack = true
	super._ready()

func _physics_process(_delta: float) -> void:
	seek_player()

func attack() -> void:
	super.attack()
	# play attack animation once
	player.take_damage(attack_damage)
	self_destruct()


