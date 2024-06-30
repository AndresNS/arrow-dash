extends Node2D

@onready var player: Player = $Player
@onready var hp_label: Label = $Player/Camera2D/HPLabel

func _ready() -> void:
	update_hp_label(player.health, player.max_health)

func update_hp_label(health: int, max_health: int) -> void:
	hp_label.text = "HP: %d/%d" % [health, max_health]

func _on_player_health_changed(new_health: int) -> void:
	update_hp_label(new_health, player.max_health)
