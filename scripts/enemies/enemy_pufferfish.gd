class_name EnemyPufferfish extends Enemy

func _ready() -> void:
	speed = 65.0
	attack_damage = 50
	points_on_kill = 5
	collision_triggers_attack = true
	enemy_state = EnemyState.MOVING
	super._ready()

func _physics_process(delta: float) -> void:
	match enemy_state:
		EnemyState.STOPPED:
			pass
			
		EnemyState.MOVING:
			enemy_sprite.play("swim")
			enemy_sprite.sprite_frames.set_animation_speed("swim", speed/8)
			enemy_sprite.flip_h = velocity.x > 0
			seek_player()
			
		EnemyState.ATTACKING:
			enemy_sprite.play("attack")
			attack()
			enemy_state = EnemyState.VANISHING
		
		EnemyState.VANISHING:
			speed = 180
			enemy_sprite.play("swim")
			enemy_sprite.sprite_frames.set_animation_speed("swim", speed/8)
			enemy_sprite.flip_h = velocity.x > 0
			vanish(delta)

func attack() -> void:
	super.attack()
	player.take_damage(attack_damage)
