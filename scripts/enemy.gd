extends CharacterBody2D

class_name Enemy

const SPEED: float = 65.0

var player: Player = null
var attack_damage: int = 15

func _ready() -> void:
	player = get_tree().current_scene.get_node("Player")

func _physics_process(_delta: float) -> void:
	var direction: Vector2 = (player.position - position).normalized()
	velocity = direction * SPEED
	move_and_slide()

func self_destruct()->void:
	queue_free()
