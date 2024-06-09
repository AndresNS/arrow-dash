extends CharacterBody2D

const SPEED: float = 100.0

@onready var player_sprite: Sprite2D = $PlayerSprite
@onready var arrow_container: Node2D = $ArrowContainer
@onready var arrow_animation: AnimationPlayer = $ArrowContainer/AnimationPlayer

var direction: Vector2 = Vector2.UP
var arrow_speed: float = 2.0

func _ready() -> void:
	arrow_animation.speed_scale = arrow_speed

func _physics_process(delta: float) -> void:
	var arrow_angle: float = arrow_container.rotation
	
	if Input.is_action_just_pressed("ui_accept"):
		player_sprite.rotation = arrow_angle
		velocity = Vector2(cos(arrow_angle - PI/2), sin(arrow_angle - PI/2)) * SPEED
	
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		player_sprite.rotation = velocity.angle() + PI/2
