class_name SeekerEnemy extends Enemy

func _ready() -> void:
	speed = 65.0
	attack_damage = 5
	points_on_kill = 5
	super._ready()

func _physics_process(delta: float) -> void:
	super._physics_process(delta)



