class_name EnemySeaUrchin extends StaticBody2D

var attack_damage: int = 70

func attack(player: Player) -> void:
	# play animation
	player.take_damage(attack_damage)


