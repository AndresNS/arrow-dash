extends CharacterBody2D

class_name Player

signal health_changed(new_health: int) 

const SPEED: float = 100.0

@onready var player_sprite: Sprite2D = $PlayerSprite
@onready var arrow_container: Node2D = $ArrowContainer
@onready var arrow_animation: AnimationPlayer = $ArrowContainer/AnimationPlayer
@onready var hurtbox_node: Area2D = $Hurtbox

var arrow_speed: float = 2.0
var max_health: int = 100
var health: int = max_health
var hurtbox: Hurtbox

func _ready() -> void:
	arrow_animation.speed_scale = arrow_speed
	hurtbox = hurtbox_node as Hurtbox
	if hurtbox:
		hurtbox.player = self

func _physics_process(delta: float) -> void:
	var arrow_angle: float = arrow_container.rotation
	
	if Input.is_action_just_pressed("ui_accept"):
		player_sprite.rotation = arrow_angle
		velocity = Vector2(cos(arrow_angle - PI/2), sin(arrow_angle - PI/2)) * SPEED
	
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		player_sprite.rotation = velocity.angle() + PI/2

func take_damage(amount: int) -> void:
	health -= amount
	health = clamp(health, 0, max_health)
	emit_signal("health_changed", health)

func heal(amount: int) -> void:
	health += amount
	health = clamp(health, 0, max_health)
	emit_signal("health_changed", health)
