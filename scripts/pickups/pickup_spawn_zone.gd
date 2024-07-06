extends ColorRect

const HealPickupScene = preload("res://scenes/pickups/heal_pickup.tscn")
@onready var timer: Timer = $Timer

@export var spawn_rate: float = 15.0
var game: Game = null

func _ready() -> void:
	hide()
	game = get_tree().root.get_node("Game")
	timer.wait_time = spawn_rate

func _on_timer_timeout() -> void:
	var heal_pickup: HealPickup = HealPickupScene.instantiate()
	var rect: Rect2 = get_global_rect()
	var pickup_x: float = randf_range(rect.position.x, rect.end.x)
	var pickup_y: float = randf_range(rect.position.y, rect.end.y)
	
	heal_pickup.position = Vector2(pickup_x, pickup_y)
	game.add_child(heal_pickup)
