extends CharacterBody2D

const SPEED: float = 50.0

@onready var player_sprite: Sprite2D = $PlayerSprite
@onready var arrow_container: Node2D = $ArrowContainer
@onready var arrow_animation: AnimationPlayer = $ArrowContainer/AnimationPlayer

var direction: Vector2 = Vector2.UP
var arrow_speed: float = 1.5

func _ready() -> void:
	arrow_animation.speed_scale = arrow_speed

func _physics_process(delta: float) -> void:
	var arrow_angle: float = arrow_container.rotation
	
	if Input.is_action_just_pressed("ui_accept"):
		player_sprite.rotation = arrow_angle
		direction = Vector2(cos(arrow_angle - PI/2), sin(arrow_angle - PI/2))
	
	position += SPEED * direction * delta
